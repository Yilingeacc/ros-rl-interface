# ros-rl-interface

### ROS-RL Interface
This is a light-weight interface for communicating between ros and your reinforcement learning algorithm

### Dependencies
If you have ros-<< distro >>-desktop-full installed, the additional dependencies you must install are:

- tf2_geometry_msgs
- ackermann_msgs
- joy
- map_server
- serial

you can install them by running:

```
$ sudo apt-get install ros-<<distro>>-tf2-geometry-msgs ros-<<distro>>-ackermann-msgs ros-<<distro>>-joy ros-<<distro>>-map-server ros-<<distro>>-serial
```

If your OS is ubuntu20.04 LTS and your ros distro is ros-noetic, you may fail when you install package 'serial' and the solution below:

```
$ cd $ros-rl-interface$
$ cd src/serial
$ make
$ make test # build and run the tests
$ make doc # build the documentation
$ make install # install
```

reference:

Website: http://wjwwood.github.io/serial/

Github:https://github.com/wjwwood/serial.git

### Installation
To install the simulator package, clone it into your catkin workspace:

```
$ cd ~/catkin_ws/src
$ git clone https://github.com/yaqishi/ros-rl-interface.git
```

Then run 'catkin_make' to build it:

```
$ cd ~/catkin_ws
$ catkin_make
$ source ./devel/setup.bash
```

### Quick Start
To run the simulation on its own, run:

```
$ roslaunch racecar_simulator rl_simulate.launch
```

This will launch everything you need for a full simulation; roscore, the simulator, a preselected map, a model of the racecar and the joystick server.

You can change the map by modifying racecar_simulator/launch/rl_simulate.launch@line 6:

  <arg name="map" default="YOUR_MAP_PATH"/>
  
you must publish a topic to provide essential description of the environment to initialize the gym-based Env and your RL algorithm:

open a new terminal and run:

```
$ rostopic pub -1 /env_description rl_msgs/EnvDescription "title: ''
action_dims: 0
state_dims: 0
min_state_range: [0]
max_state_range: [0]
min_action_range: [0]
max_action_range: [0]
reward_range: [0]
max_episode_len: 0" 
```

Your algorithm will be running automatically after initializing.

### RVIZ Visualization
With the simulator running, open rviz:

```
$ rosrun rviz rviz
```

In the left panel at the bottom click the "Add" button, then in the "By topic" tab add the `/map` topic and the `/scan` topic.

Then in the "By display type" tab add the RobotModel type.

In the left panel under the newly added LaserScan section, change the size to 0.1 meters for a clearer visualization of the lidar (shown in rainbow).

### Joystick
You may see an error when roslaunch such as below:

[ERROR] [1625465742.456218650]: Couldn't open joystick /dev/input/js0. Will retry every second.

but that's ok. The error occurs when there's no joystick connected.

You can use a USB joystick to drive the car around, or you can place the car manually by clicking the "2D Pose Estimate button" on the top of the screen and dragging your mouse on the desired pose.
