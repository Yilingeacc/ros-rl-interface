;; Auto-generated. Do not edit!


(when (boundp 'rl_msgs::EnvDescription)
  (if (not (find-package "RL_MSGS"))
    (make-package "RL_MSGS"))
  (shadow 'EnvDescription (find-package "RL_MSGS")))
(unless (find-package "RL_MSGS::ENVDESCRIPTION")
  (make-package "RL_MSGS::ENVDESCRIPTION"))

(in-package "ROS")
;;//! \htmlinclude EnvDescription.msg.html


(defclass rl_msgs::EnvDescription
  :super ros::object
  :slots (_title _action_dims _state_dims _min_state_range _max_state_range _min_action_range _max_action_range _reward_range _max_episode_len ))

(defmethod rl_msgs::EnvDescription
  (:init
   (&key
    ((:title __title) "")
    ((:action_dims __action_dims) 0)
    ((:state_dims __state_dims) 0)
    ((:min_state_range __min_state_range) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:max_state_range __max_state_range) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:min_action_range __min_action_range) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:max_action_range __max_action_range) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:reward_range __reward_range) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:max_episode_len __max_episode_len) 0)
    )
   (send-super :init)
   (setq _title (string __title))
   (setq _action_dims (round __action_dims))
   (setq _state_dims (round __state_dims))
   (setq _min_state_range __min_state_range)
   (setq _max_state_range __max_state_range)
   (setq _min_action_range __min_action_range)
   (setq _max_action_range __max_action_range)
   (setq _reward_range __reward_range)
   (setq _max_episode_len (round __max_episode_len))
   self)
  (:title
   (&optional __title)
   (if __title (setq _title __title)) _title)
  (:action_dims
   (&optional __action_dims)
   (if __action_dims (setq _action_dims __action_dims)) _action_dims)
  (:state_dims
   (&optional __state_dims)
   (if __state_dims (setq _state_dims __state_dims)) _state_dims)
  (:min_state_range
   (&optional __min_state_range)
   (if __min_state_range (setq _min_state_range __min_state_range)) _min_state_range)
  (:max_state_range
   (&optional __max_state_range)
   (if __max_state_range (setq _max_state_range __max_state_range)) _max_state_range)
  (:min_action_range
   (&optional __min_action_range)
   (if __min_action_range (setq _min_action_range __min_action_range)) _min_action_range)
  (:max_action_range
   (&optional __max_action_range)
   (if __max_action_range (setq _max_action_range __max_action_range)) _max_action_range)
  (:reward_range
   (&optional __reward_range)
   (if __reward_range (setq _reward_range __reward_range)) _reward_range)
  (:max_episode_len
   (&optional __max_episode_len)
   (if __max_episode_len (setq _max_episode_len __max_episode_len)) _max_episode_len)
  (:serialization-length
   ()
   (+
    ;; string _title
    4 (length _title)
    ;; int32 _action_dims
    4
    ;; int32 _state_dims
    4
    ;; float32[] _min_state_range
    (* 4    (length _min_state_range)) 4
    ;; float32[] _max_state_range
    (* 4    (length _max_state_range)) 4
    ;; float32[] _min_action_range
    (* 4    (length _min_action_range)) 4
    ;; float32[] _max_action_range
    (* 4    (length _max_action_range)) 4
    ;; float32[] _reward_range
    (* 4    (length _reward_range)) 4
    ;; int32 _max_episode_len
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _title
       (write-long (length _title) s) (princ _title s)
     ;; int32 _action_dims
       (write-long _action_dims s)
     ;; int32 _state_dims
       (write-long _state_dims s)
     ;; float32[] _min_state_range
     (write-long (length _min_state_range) s)
     (dotimes (i (length _min_state_range))
       (sys::poke (elt _min_state_range i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _max_state_range
     (write-long (length _max_state_range) s)
     (dotimes (i (length _max_state_range))
       (sys::poke (elt _max_state_range i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _min_action_range
     (write-long (length _min_action_range) s)
     (dotimes (i (length _min_action_range))
       (sys::poke (elt _min_action_range i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _max_action_range
     (write-long (length _max_action_range) s)
     (dotimes (i (length _max_action_range))
       (sys::poke (elt _max_action_range i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _reward_range
     (write-long (length _reward_range) s)
     (dotimes (i (length _reward_range))
       (sys::poke (elt _reward_range i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _max_episode_len
       (write-long _max_episode_len s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _title
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _title (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _action_dims
     (setq _action_dims (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _state_dims
     (setq _state_dims (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _min_state_range
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _min_state_range (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _min_state_range i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _max_state_range
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _max_state_range (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _max_state_range i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _min_action_range
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _min_action_range (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _min_action_range i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _max_action_range
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _max_action_range (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _max_action_range i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _reward_range
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _reward_range (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _reward_range i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _max_episode_len
     (setq _max_episode_len (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rl_msgs::EnvDescription :md5sum-) "15ba7d726cacbbdff2204ab5bdfdf816")
(setf (get rl_msgs::EnvDescription :datatype-) "rl_msgs/EnvDescription")
(setf (get rl_msgs::EnvDescription :definition-)
      "# describes the environment with a title
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

")



(provide :rl_msgs/EnvDescription "15ba7d726cacbbdff2204ab5bdfdf816")


