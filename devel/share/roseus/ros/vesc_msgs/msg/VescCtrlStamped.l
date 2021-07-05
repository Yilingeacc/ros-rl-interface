;; Auto-generated. Do not edit!


(when (boundp 'vesc_msgs::VescCtrlStamped)
  (if (not (find-package "VESC_MSGS"))
    (make-package "VESC_MSGS"))
  (shadow 'VescCtrlStamped (find-package "VESC_MSGS")))
(unless (find-package "VESC_MSGS::VESCCTRLSTAMPED")
  (make-package "VESC_MSGS::VESCCTRLSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude VescCtrlStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass vesc_msgs::VescCtrlStamped
  :super ros::object
  :slots (_header _control ))

(defmethod vesc_msgs::VescCtrlStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:control __control) (instance vesc_msgs::VescCtrl :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _control __control)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:control
   (&rest __control)
   (if (keywordp (car __control))
       (send* _control __control)
     (progn
       (if __control (setq _control (car __control)))
       _control)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; vesc_msgs/VescCtrl _control
    (send _control :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; vesc_msgs/VescCtrl _control
       (send _control :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; vesc_msgs/VescCtrl _control
     (send _control :deserialize buf ptr-) (incf ptr- (send _control :serialization-length))
   ;;
   self)
  )

(setf (get vesc_msgs::VescCtrlStamped :md5sum-) "e17fcb1950b5483f670eede40f4b03a7")
(setf (get vesc_msgs::VescCtrlStamped :datatype-) "vesc_msgs/VescCtrlStamped")
(setf (get vesc_msgs::VescCtrlStamped :definition-)
      "Header  header
VescCtrl control

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: vesc_msgs/VescCtrl
#commanded VESC duty cycle, current, brake current, speed, motor position, servo position

int64 mode  #control mode 1-brake mode,2-current mode,3-speed mode,4-duty_cycle mode,5-position mode
float64 duty_cycle #vesc control mode
float64 current    #vesc control mode
float64 brake
float64 speed      #vesc control mode
float64 position
float64 servo

")



(provide :vesc_msgs/VescCtrlStamped "e17fcb1950b5483f670eede40f4b03a7")


