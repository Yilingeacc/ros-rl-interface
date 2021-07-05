#!/usr/bin/env python3
from torch._C import dtype
import rospy
from rl_msgs.msg import EnvDescription
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry
from ackermann_msgs.msg import AckermannDriveStamped
from vesc_msgs.msg import VescCtrlStamped
from geometry_msgs.msg import Pose
from rl_msgs.msg import Goal

import sys
import numpy as np
from scipy.spatial.transform import Rotation as R

from env import Env
from ppo import RL_algo

norm = lambda arr, min, max: (arr - min) / (max - min)
inv_norm = lambda arr, min, max: arr * (max - min) + min


class Interface:
    def __init__(self, mode, init_pose, goal):
        print("waiting for environment description")
        # rostopic pub -1 /env_description ...
        self.env_description_sub = rospy.Subscriber('/env_description', EnvDescription, self.init, queue_size=1)
        # 重置当前位置，用于reset
        self.reset_pose_pub = rospy.Publisher('/pose', Pose, queue_size=1)
        # 改变下次的目标 rostopic pub -1 /goal_pose ...
        self.goal_pose_sub = rospy.Subscriber('/goal_pose', Goal, self.set_goal, queue_size=1)
        
        self.init_pose = Pose()
        self.init_pose.position.x = init_pose[0]
        self.init_pose.position.y = init_pose[1]
        self.init_pose.position.z = init_pose[2]

        self.mode = mode
        # goal绝对坐标
        self.goal = goal
        self.new_goal = None

        self.state = None
        self.action = None
        self.noise = None

    def init(self, msg):
        print("get the description of the environment, start initialize...")
        self.state_dim = msg.state_dims
        self.action_dim = msg.action_dims
        self.min_state_range = np.array(msg.min_state_range, dtype=np.float32)
        self.max_state_range = np.array(msg.max_state_range, dtype=np.float32)
        self.min_action_range = np.array(msg.min_action_range, dtype=np.float32)
        self.max_action_range = np.array(msg.max_action_range, dtype=np.float32)
        self.reward_range = np.array(msg.reward_range, dtype=np.float32)
        self.max_episode_len = msg.max_episode_len

        self.bound = self.max_state_range[0] / 2
        self.env = Env(max_episode_len=self.max_episode_len, bound=self.bound)
        self.algorithm = RL_algo(state_dim=self.state_dim, action_dim=self.action_dim)

        if mode == 'sim':
            self.state_sub = rospy.Subscriber('/odom', Odometry, self.odom_callback, queue_size=1)
            self.action_pub = rospy.Publisher('/drive', AckermannDriveStamped, queue_size=1)
            self.ctrl = AckermannDriveStamped()
        elif mode == 'car':
            self.state_sub = rospy.Subscriber('/vrpn_client_node/racecar/pose', PoseStamped, self.pose_callback, queue_size=1)
            self.action_pub = rospy.Publisher('/vesc/ctrl', VescCtrlStamped, queue_size=1)
            self.ctrl = VescCtrlStamped()
        
        print("Initialize Complete!")

    def set_goal(self, msg):
        goal = np.array([msg.x, msg.y], dtype=np.float32)
        if any(abs(goal) > self.bound):
            print('invalid goal position, initialize failed.')
        else:
            self.new_goal = goal

    def odom_callback(self, msg):
        return self.pose_callback(msg.pose)

    def pose_callback(self, msg):
        x = msg.pose.position.x
        y = msg.pose.position.y
        ori = msg.pose.orientation
        q = [ori.x, ori.y, ori.z, ori.w]
        r = R.from_quat(q)
        psi, _, _ = r.as_euler('zyx')

        # state是归一化的相对goal位置[x, y] + 偏航角psi
        self.state = np.concatenate(((self.goal - np.array([x, y], dtype=np.float32)) , [psi]))
        self.state = norm(self.state, self.min_state_range, self.max_state_range)

        if self.env.state is not None:
            _, reward, done, _ = self.env.step(self.action)
            print('\rstate: ' + str(self.state) + ' reward: ' + str(reward), end='')
            self.algorithm.store_transition(self.state, self.action, reward, done, self.noise)
            if done:
                self.algorithm.learn_if_buffer_is_full(self.max_episode_len)
                print('\rreset environment...', end='')
                self.reset_pose_pub.publish(self.init_pose)
                self.env.update_state(None, None, None)
                print('done')
                if self.new_goal is not None:
                    print('change the goal point to: ' + str(self.new_goal))
                    self.goal = self.new_goal
                    self.new_goal = None
                return
        else:
            self.env.reset(self.state, x, y)
        
        self.env.update_state(self.state, x, y)
        self.update_control()

    def update_control(self):
        self.action, self.noise = self.algorithm.choose_action(self.state)
        delta, v = inv_norm(self.action, self.min_action_range, self.max_action_range)
        if self.mode == "sim":
            self.ctrl.drive.steering_angle = delta
            self.ctrl.drive.speed = v
        elif self.mode == "car":
            self.ctrl.control.mode = 3
            self.ctrl.control.servo = delta
            self.ctrl.control.speed = v
        self.action_pub.publish(self.ctrl)


if __name__ == '__main__':
    rospy.init_node("RL_Interface")
    mode = "sim"
    # mode = sys.argv[-1]
    print("mode = " + mode)
    init_pose = np.array([-3.5, -2.5, 0.0], dtype=np.float32)
    goal = np.array([0.05, 0.25], dtype=np.float32)
    interface = Interface(mode=mode, init_pose=init_pose, goal=goal)
    rospy.spin()
