;; Auto-generated. Do not edit!


(when (boundp 'vesc_msgs::VescCtrl)
  (if (not (find-package "VESC_MSGS"))
    (make-package "VESC_MSGS"))
  (shadow 'VescCtrl (find-package "VESC_MSGS")))
(unless (find-package "VESC_MSGS::VESCCTRL")
  (make-package "VESC_MSGS::VESCCTRL"))

(in-package "ROS")
;;//! \htmlinclude VescCtrl.msg.html


(defclass vesc_msgs::VescCtrl
  :super ros::object
  :slots (_mode _duty_cycle _current _brake _speed _position _servo ))

(defmethod vesc_msgs::VescCtrl
  (:init
   (&key
    ((:mode __mode) 0)
    ((:duty_cycle __duty_cycle) 0.0)
    ((:current __current) 0.0)
    ((:brake __brake) 0.0)
    ((:speed __speed) 0.0)
    ((:position __position) 0.0)
    ((:servo __servo) 0.0)
    )
   (send-super :init)
   (setq _mode (round __mode))
   (setq _duty_cycle (float __duty_cycle))
   (setq _current (float __current))
   (setq _brake (float __brake))
   (setq _speed (float __speed))
   (setq _position (float __position))
   (setq _servo (float __servo))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:duty_cycle
   (&optional __duty_cycle)
   (if __duty_cycle (setq _duty_cycle __duty_cycle)) _duty_cycle)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:brake
   (&optional __brake)
   (if __brake (setq _brake __brake)) _brake)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:servo
   (&optional __servo)
   (if __servo (setq _servo __servo)) _servo)
  (:serialization-length
   ()
   (+
    ;; int64 _mode
    8
    ;; float64 _duty_cycle
    8
    ;; float64 _current
    8
    ;; float64 _brake
    8
    ;; float64 _speed
    8
    ;; float64 _position
    8
    ;; float64 _servo
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _mode
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _mode (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _mode) (= (length (_mode . bv)) 2)) ;; bignum
              (write-long (ash (elt (_mode . bv) 0) 0) s)
              (write-long (ash (elt (_mode . bv) 1) -1) s))
             ((and (class _mode) (= (length (_mode . bv)) 1)) ;; big1
              (write-long (elt (_mode . bv) 0) s)
              (write-long (if (>= _mode 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _mode s)(write-long (if (>= _mode 0) 0 #xffffffff) s)))
     ;; float64 _duty_cycle
       (sys::poke _duty_cycle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _current
       (sys::poke _current (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake
       (sys::poke _brake (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _servo
       (sys::poke _servo (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _mode
#+(or :alpha :irix6 :x86_64)
      (setf _mode (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _mode (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _duty_cycle
     (setq _duty_cycle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _current
     (setq _current (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake
     (setq _brake (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _servo
     (setq _servo (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get vesc_msgs::VescCtrl :md5sum-) "034ba36ad2a5637b06f87a196fb8b3a2")
(setf (get vesc_msgs::VescCtrl :datatype-) "vesc_msgs/VescCtrl")
(setf (get vesc_msgs::VescCtrl :definition-)
      "#commanded VESC duty cycle, current, brake current, speed, motor position, servo position

int64 mode  #control mode 1-brake mode,2-current mode,3-speed mode,4-duty_cycle mode,5-position mode
float64 duty_cycle #vesc control mode
float64 current    #vesc control mode
float64 brake
float64 speed      #vesc control mode
float64 position
float64 servo

")



(provide :vesc_msgs/VescCtrl "034ba36ad2a5637b06f87a196fb8b3a2")


