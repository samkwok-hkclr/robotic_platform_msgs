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
  "action/Pick.action"
  "action/Place.action"
  "action/ScanSku.action"
  "action/Replenish.action"
)

set(common_msg_files
  "msg/GripperStatus.msg"
)

set(manipulation_msg_files
  "msg/manipulation/PickPlanResult.msg"

  "msg/manipulation/PickResult.msg"
  "msg/manipulation/PickTask.msg"
  
  "msg/manipulation/PlaceResult.msg"
  "msg/manipulation/PlaceTask.msg"

  "msg/manipulation/PlacePlanResult.msg"
  "msg/manipulation/RackInfo.msg"
  "msg/manipulation/ReplenishPose.msg"
  "msg/manipulation/ReplenishQuantity.msg"
  "msg/manipulation/RobotStatus.msg"
  "msg/manipulation/SkuDimension.msg"
  "msg/manipulation/TableInfo.msg"
)

set(common_srv_files
  "srv/ControlGripper.srv"
)

set(elevation_srv_files
  "srv/elevation/Elevate.srv"
  "srv/elevation/Rotate.srv"
)

set(manipulation_srv_files
  "srv/manipulation/PickPlan.srv"
  "srv/manipulation/PlacePlan.srv"
  "srv/manipulation/SimplePick.srv"
  "srv/manipulation/SimplePlace.srv"
)

set(vision_msg_files
  "msg/vision/CameraDataType.msg"
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

  ${common_msg_files}
  ${common_srv_files}

  ${elevation_srv_files}

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
