import gym
import numpy as np

class Env(gym.Env):
    def __init__(self, max_episode_len, bound):
        super().__init__()
        self.state = None
        self.max_episode_len = max_episode_len
        self.pose = np.empty((2, ), dtype=np.float32)
        self.bound = bound
        self.steps = 0
    
    def update_state(self, state, x, y):
        self.state = state
        self.pose[0] = x
        self.pose[1] = y

    def reset(self, state, x, y):
        self.update_state(state, x, y)
        self.steps = 0
    
    # 根据state, action等信息计算reward与done并返回
    # 对不同的任务需要定制奖励
    def step(self, action):
        # return None, reward, done, info
        self.steps += 1
        if self.steps > self.max_episode_len or any(abs(self.pose) > self.bound):
            if self.steps > self.max_episode_len: print('\nreach max episode length, game over!')
            else: print('\nout of ground, game over!')
            reward = -1.
            done = True
        else:
            x, y = self.state[:2]
            dis = np.hypot(x, y)
            done = dis < 0.1
            if done:
                print('\nreach the goal, Congratulations!')
                reward = 10.
            else:
                reward = np.sqrt(2) - dis if dis > 0.15 else -0.1
            # 倒退惩罚
            if action[1] < 0:
                reward -= 0.1
        return None, reward, done, None
