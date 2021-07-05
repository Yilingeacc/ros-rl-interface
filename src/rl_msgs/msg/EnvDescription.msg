# describes the environment with a title
# the number of actions
# the number of states
# the range of each state feature
# the range of rewards

string title
int32 action_dims
int32 state_dims
float32[] min_state_range
float32[] max_state_range
float32[] min_action_range
float32[] max_action_range
float32[] reward_range
int32 max_episode_len
