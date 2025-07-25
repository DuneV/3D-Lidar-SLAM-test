// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from rosapi_msgs:srv/ActionGoalDetails.idl
// generated code does not contain a copyright notice

#ifndef ROSAPI_MSGS__SRV__DETAIL__ACTION_GOAL_DETAILS__STRUCT_H_
#define ROSAPI_MSGS__SRV__DETAIL__ACTION_GOAL_DETAILS__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'type'
#include "rosidl_runtime_c/string.h"

/// Struct defined in srv/ActionGoalDetails in the package rosapi_msgs.
typedef struct rosapi_msgs__srv__ActionGoalDetails_Request
{
  rosidl_runtime_c__String type;
} rosapi_msgs__srv__ActionGoalDetails_Request;

// Struct for a sequence of rosapi_msgs__srv__ActionGoalDetails_Request.
typedef struct rosapi_msgs__srv__ActionGoalDetails_Request__Sequence
{
  rosapi_msgs__srv__ActionGoalDetails_Request * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} rosapi_msgs__srv__ActionGoalDetails_Request__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'typedefs'
#include "rosapi_msgs/msg/detail/type_def__struct.h"

/// Struct defined in srv/ActionGoalDetails in the package rosapi_msgs.
typedef struct rosapi_msgs__srv__ActionGoalDetails_Response
{
  rosapi_msgs__msg__TypeDef__Sequence typedefs;
} rosapi_msgs__srv__ActionGoalDetails_Response;

// Struct for a sequence of rosapi_msgs__srv__ActionGoalDetails_Response.
typedef struct rosapi_msgs__srv__ActionGoalDetails_Response__Sequence
{
  rosapi_msgs__srv__ActionGoalDetails_Response * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} rosapi_msgs__srv__ActionGoalDetails_Response__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // ROSAPI_MSGS__SRV__DETAIL__ACTION_GOAL_DETAILS__STRUCT_H_
