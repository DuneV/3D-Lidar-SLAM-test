// generated from rosidl_generator_c/resource/idl__struct.h.em
// with input from rosapi_msgs:srv/ActionType.idl
// generated code does not contain a copyright notice

#ifndef ROSAPI_MSGS__SRV__DETAIL__ACTION_TYPE__STRUCT_H_
#define ROSAPI_MSGS__SRV__DETAIL__ACTION_TYPE__STRUCT_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>


// Constants defined in the message

// Include directives for member types
// Member 'action'
#include "rosidl_runtime_c/string.h"

/// Struct defined in srv/ActionType in the package rosapi_msgs.
typedef struct rosapi_msgs__srv__ActionType_Request
{
  rosidl_runtime_c__String action;
} rosapi_msgs__srv__ActionType_Request;

// Struct for a sequence of rosapi_msgs__srv__ActionType_Request.
typedef struct rosapi_msgs__srv__ActionType_Request__Sequence
{
  rosapi_msgs__srv__ActionType_Request * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} rosapi_msgs__srv__ActionType_Request__Sequence;


// Constants defined in the message

// Include directives for member types
// Member 'type'
// already included above
// #include "rosidl_runtime_c/string.h"

/// Struct defined in srv/ActionType in the package rosapi_msgs.
typedef struct rosapi_msgs__srv__ActionType_Response
{
  rosidl_runtime_c__String type;
} rosapi_msgs__srv__ActionType_Response;

// Struct for a sequence of rosapi_msgs__srv__ActionType_Response.
typedef struct rosapi_msgs__srv__ActionType_Response__Sequence
{
  rosapi_msgs__srv__ActionType_Response * data;
  /// The number of valid items in data
  size_t size;
  /// The number of allocated items in data
  size_t capacity;
} rosapi_msgs__srv__ActionType_Response__Sequence;

#ifdef __cplusplus
}
#endif

#endif  // ROSAPI_MSGS__SRV__DETAIL__ACTION_TYPE__STRUCT_H_
