# original file: clr_common::DetectedObject.hpp

uint64 uuid # unique identifier to this object instance

geometry_msgs/Pose camera_pose
geometry_msgs/Pose robot_pose
geometry_msgs/Point size

int32 object_id  # indicate object type

uint8 gripper # maybe unused