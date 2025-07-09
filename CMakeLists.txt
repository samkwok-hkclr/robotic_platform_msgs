cmake_minimum_required(VERSION 3.8)
project(robotic_platform_msgs)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(std_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(rosidl_default_generators REQUIRED)

# Caution: Action files should be placed exclusively in the "action" folder.
set(action_files
  "action/ScanSku.action"
)

set(manipulation_msg_files
  "msg/manipulation/ReplenishPose.msg"
  "msg/manipulation/ReplenishQuantity.msg"
)

set(manipulation_srv_files

)

set(vision_msg_files
  "msg/vision/DetectedObject.msg"
  "msg/vision/DetectionResult.msg"
  "msg/vision/LocalizationParam.msg"
  "msg/vision/ObjectPose.msg"
)

set(vision_srv_files
  "srv/vision/GetObjectPose.srv"
  "srv/vision/GetObjectPoseTrigger.srv"
  "srv/vision/GetSlotState.srv"
  "srv/vision/GetSlotStateTrigger.srv"
  "srv/vision/InitAlgo.srv"
  "srv/vision/ProcessPointCloud.srv"
  "srv/vision/RespFailedPick.srv"
  "srv/vision/SaveCameraData.srv"
)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${action_files}
  
  ${manipulation_msg_files}
  ${manipulation_srv_files}

  ${vision_msg_files}
  ${vision_srv_files}
  DEPENDENCIES
    builtin_interfaces
    std_msgs
    geometry_msgs
    sensor_msgs
)

ament_export_dependencies(rosidl_default_runtime)

if(BUILD_TESTING)
  find_package(ament_lint_auto REQUIRED)
  # the following line skips the linter which checks for copyrights
  # comment the line when a copyright and license is added to all source files
  set(ament_cmake_copyright_FOUND TRUE)
  # the following line skips cpplint (only works in a git repo)
  # comment the line when this package is in a git repo and when
  # a copyright and license is added to all source files
  set(ament_cmake_cpplint_FOUND TRUE)
  ament_lint_auto_find_test_dependencies()
endif()

ament_package()
