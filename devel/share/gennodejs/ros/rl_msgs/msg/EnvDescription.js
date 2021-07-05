// Auto-generated. Do not edit!

// (in-package rl_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class EnvDescription {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.title = null;
      this.action_dims = null;
      this.state_dims = null;
      this.min_state_range = null;
      this.max_state_range = null;
      this.min_action_range = null;
      this.max_action_range = null;
      this.reward_range = null;
      this.max_episode_len = null;
    }
    else {
      if (initObj.hasOwnProperty('title')) {
        this.title = initObj.title
      }
      else {
        this.title = '';
      }
      if (initObj.hasOwnProperty('action_dims')) {
        this.action_dims = initObj.action_dims
      }
      else {
        this.action_dims = 0;
      }
      if (initObj.hasOwnProperty('state_dims')) {
        this.state_dims = initObj.state_dims
      }
      else {
        this.state_dims = 0;
      }
      if (initObj.hasOwnProperty('min_state_range')) {
        this.min_state_range = initObj.min_state_range
      }
      else {
        this.min_state_range = [];
      }
      if (initObj.hasOwnProperty('max_state_range')) {
        this.max_state_range = initObj.max_state_range
      }
      else {
        this.max_state_range = [];
      }
      if (initObj.hasOwnProperty('min_action_range')) {
        this.min_action_range = initObj.min_action_range
      }
      else {
        this.min_action_range = [];
      }
      if (initObj.hasOwnProperty('max_action_range')) {
        this.max_action_range = initObj.max_action_range
      }
      else {
        this.max_action_range = [];
      }
      if (initObj.hasOwnProperty('reward_range')) {
        this.reward_range = initObj.reward_range
      }
      else {
        this.reward_range = [];
      }
      if (initObj.hasOwnProperty('max_episode_len')) {
        this.max_episode_len = initObj.max_episode_len
      }
      else {
        this.max_episode_len = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EnvDescription
    // Serialize message field [title]
    bufferOffset = _serializer.string(obj.title, buffer, bufferOffset);
    // Serialize message field [action_dims]
    bufferOffset = _serializer.int32(obj.action_dims, buffer, bufferOffset);
    // Serialize message field [state_dims]
    bufferOffset = _serializer.int32(obj.state_dims, buffer, bufferOffset);
    // Serialize message field [min_state_range]
    bufferOffset = _arraySerializer.float32(obj.min_state_range, buffer, bufferOffset, null);
    // Serialize message field [max_state_range]
    bufferOffset = _arraySerializer.float32(obj.max_state_range, buffer, bufferOffset, null);
    // Serialize message field [min_action_range]
    bufferOffset = _arraySerializer.float32(obj.min_action_range, buffer, bufferOffset, null);
    // Serialize message field [max_action_range]
    bufferOffset = _arraySerializer.float32(obj.max_action_range, buffer, bufferOffset, null);
    // Serialize message field [reward_range]
    bufferOffset = _arraySerializer.float32(obj.reward_range, buffer, bufferOffset, null);
    // Serialize message field [max_episode_len]
    bufferOffset = _serializer.int32(obj.max_episode_len, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EnvDescription
    let len;
    let data = new EnvDescription(null);
    // Deserialize message field [title]
    data.title = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [action_dims]
    data.action_dims = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [state_dims]
    data.state_dims = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [min_state_range]
    data.min_state_range = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [max_state_range]
    data.max_state_range = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [min_action_range]
    data.min_action_range = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [max_action_range]
    data.max_action_range = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [reward_range]
    data.reward_range = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [max_episode_len]
    data.max_episode_len = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.title);
    length += 4 * object.min_state_range.length;
    length += 4 * object.max_state_range.length;
    length += 4 * object.min_action_range.length;
    length += 4 * object.max_action_range.length;
    length += 4 * object.reward_range.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rl_msgs/EnvDescription';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '15ba7d726cacbbdff2204ab5bdfdf816';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EnvDescription(null);
    if (msg.title !== undefined) {
      resolved.title = msg.title;
    }
    else {
      resolved.title = ''
    }

    if (msg.action_dims !== undefined) {
      resolved.action_dims = msg.action_dims;
    }
    else {
      resolved.action_dims = 0
    }

    if (msg.state_dims !== undefined) {
      resolved.state_dims = msg.state_dims;
    }
    else {
      resolved.state_dims = 0
    }

    if (msg.min_state_range !== undefined) {
      resolved.min_state_range = msg.min_state_range;
    }
    else {
      resolved.min_state_range = []
    }

    if (msg.max_state_range !== undefined) {
      resolved.max_state_range = msg.max_state_range;
    }
    else {
      resolved.max_state_range = []
    }

    if (msg.min_action_range !== undefined) {
      resolved.min_action_range = msg.min_action_range;
    }
    else {
      resolved.min_action_range = []
    }

    if (msg.max_action_range !== undefined) {
      resolved.max_action_range = msg.max_action_range;
    }
    else {
      resolved.max_action_range = []
    }

    if (msg.reward_range !== undefined) {
      resolved.reward_range = msg.reward_range;
    }
    else {
      resolved.reward_range = []
    }

    if (msg.max_episode_len !== undefined) {
      resolved.max_episode_len = msg.max_episode_len;
    }
    else {
      resolved.max_episode_len = 0
    }

    return resolved;
    }
};

module.exports = EnvDescription;
