; Auto-generated. Do not edit!


(cl:in-package vesc_msgs-msg)


;//! \htmlinclude VescCtrlStamped.msg.html

(cl:defclass <VescCtrlStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (control
    :reader control
    :initarg :control
    :type vesc_msgs-msg:VescCtrl
    :initform (cl:make-instance 'vesc_msgs-msg:VescCtrl)))
)

(cl:defclass VescCtrlStamped (<VescCtrlStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VescCtrlStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VescCtrlStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vesc_msgs-msg:<VescCtrlStamped> is deprecated: use vesc_msgs-msg:VescCtrlStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <VescCtrlStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vesc_msgs-msg:header-val is deprecated.  Use vesc_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'control-val :lambda-list '(m))
(cl:defmethod control-val ((m <VescCtrlStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vesc_msgs-msg:control-val is deprecated.  Use vesc_msgs-msg:control instead.")
  (control m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VescCtrlStamped>) ostream)
  "Serializes a message object of type '<VescCtrlStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'control) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VescCtrlStamped>) istream)
  "Deserializes a message object of type '<VescCtrlStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'control) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VescCtrlStamped>)))
  "Returns string type for a message object of type '<VescCtrlStamped>"
  "vesc_msgs/VescCtrlStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VescCtrlStamped)))
  "Returns string type for a message object of type 'VescCtrlStamped"
  "vesc_msgs/VescCtrlStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VescCtrlStamped>)))
  "Returns md5sum for a message object of type '<VescCtrlStamped>"
  "e17fcb1950b5483f670eede40f4b03a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VescCtrlStamped)))
  "Returns md5sum for a message object of type 'VescCtrlStamped"
  "e17fcb1950b5483f670eede40f4b03a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VescCtrlStamped>)))
  "Returns full string definition for message of type '<VescCtrlStamped>"
  (cl:format cl:nil "Header  header~%VescCtrl control~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vesc_msgs/VescCtrl~%#commanded VESC duty cycle, current, brake current, speed, motor position, servo position~%~%int64 mode  #control mode 1-brake mode,2-current mode,3-speed mode,4-duty_cycle mode,5-position mode~%float64 duty_cycle #vesc control mode~%float64 current    #vesc control mode~%float64 brake~%float64 speed      #vesc control mode~%float64 position~%float64 servo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VescCtrlStamped)))
  "Returns full string definition for message of type 'VescCtrlStamped"
  (cl:format cl:nil "Header  header~%VescCtrl control~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vesc_msgs/VescCtrl~%#commanded VESC duty cycle, current, brake current, speed, motor position, servo position~%~%int64 mode  #control mode 1-brake mode,2-current mode,3-speed mode,4-duty_cycle mode,5-position mode~%float64 duty_cycle #vesc control mode~%float64 current    #vesc control mode~%float64 brake~%float64 speed      #vesc control mode~%float64 position~%float64 servo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VescCtrlStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'control))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VescCtrlStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'VescCtrlStamped
    (cl:cons ':header (header msg))
    (cl:cons ':control (control msg))
))
