// generated from rosidl_generator_c/resource/idl__functions.h.em
// with input from rosapi_msgs:srv/ActionFeedbackDetails.idl
// generated code does not contain a copyright notice

#ifndef ROSAPI_MSGS__SRV__DETAIL__ACTION_FEEDBACK_DETAILS__FUNCTIONS_H_
#define ROSAPI_MSGS__SRV__DETAIL__ACTION_FEEDBACK_DETAILS__FUNCTIONS_H_

#ifdef __cplusplus
extern "C"
{
#endif

#include <stdbool.h>
#include <stdlib.h>

#include "rosidl_runtime_c/visibility_control.h"
#include "rosapi_msgs/msg/rosidl_generator_c__visibility_control.h"

#include "rosapi_msgs/srv/detail/action_feedback_details__struct.h"

/// Initialize srv/ActionFeedbackDetails message.
/**
 * If the init function is called twice for the same message without
 * calling fini inbetween previously allocated memory will be leaked.
 * \param[in,out] msg The previously allocated message pointer.
 * Fields without a default value will not be initialized by this function.
 * You might want to call memset(msg, 0, sizeof(
 * rosapi_msgs__srv__ActionFeedbackDetails_Request
 * )) before or use
 * rosapi_msgs__srv__ActionFeedbackDetails_Request__create()
 * to allocate and initialize the message.
 * \return true if initialization was successful, otherwise false
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Request__init(rosapi_msgs__srv__ActionFeedbackDetails_Request * msg);

/// Finalize srv/ActionFeedbackDetails message.
/**
 * \param[in,out] msg The allocated message pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Request__fini(rosapi_msgs__srv__ActionFeedbackDetails_Request * msg);

/// Create srv/ActionFeedbackDetails message.
/**
 * It allocates the memory for the message, sets the memory to zero, and
 * calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Request__init().
 * \return The pointer to the initialized message if successful,
 * otherwise NULL
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
rosapi_msgs__srv__ActionFeedbackDetails_Request *
rosapi_msgs__srv__ActionFeedbackDetails_Request__create();

/// Destroy srv/ActionFeedbackDetails message.
/**
 * It calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Request__fini()
 * and frees the memory of the message.
 * \param[in,out] msg The allocated message pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Request__destroy(rosapi_msgs__srv__ActionFeedbackDetails_Request * msg);

/// Check for srv/ActionFeedbackDetails message equality.
/**
 * \param[in] lhs The message on the left hand size of the equality operator.
 * \param[in] rhs The message on the right hand size of the equality operator.
 * \return true if messages are equal, otherwise false.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Request__are_equal(const rosapi_msgs__srv__ActionFeedbackDetails_Request * lhs, const rosapi_msgs__srv__ActionFeedbackDetails_Request * rhs);

/// Copy a srv/ActionFeedbackDetails message.
/**
 * This functions performs a deep copy, as opposed to the shallow copy that
 * plain assignment yields.
 *
 * \param[in] input The source message pointer.
 * \param[out] output The target message pointer, which must
 *   have been initialized before calling this function.
 * \return true if successful, or false if either pointer is null
 *   or memory allocation fails.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Request__copy(
  const rosapi_msgs__srv__ActionFeedbackDetails_Request * input,
  rosapi_msgs__srv__ActionFeedbackDetails_Request * output);

/// Initialize array of srv/ActionFeedbackDetails messages.
/**
 * It allocates the memory for the number of elements and calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Request__init()
 * for each element of the array.
 * \param[in,out] array The allocated array pointer.
 * \param[in] size The size / capacity of the array.
 * \return true if initialization was successful, otherwise false
 * If the array pointer is valid and the size is zero it is guaranteed
 # to return true.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__init(rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence * array, size_t size);

/// Finalize array of srv/ActionFeedbackDetails messages.
/**
 * It calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Request__fini()
 * for each element of the array and frees the memory for the number of
 * elements.
 * \param[in,out] array The initialized array pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__fini(rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence * array);

/// Create array of srv/ActionFeedbackDetails messages.
/**
 * It allocates the memory for the array and calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__init().
 * \param[in] size The size / capacity of the array.
 * \return The pointer to the initialized array if successful, otherwise NULL
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence *
rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__create(size_t size);

/// Destroy array of srv/ActionFeedbackDetails messages.
/**
 * It calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__fini()
 * on the array,
 * and frees the memory of the array.
 * \param[in,out] array The initialized array pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__destroy(rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence * array);

/// Check for srv/ActionFeedbackDetails message array equality.
/**
 * \param[in] lhs The message array on the left hand size of the equality operator.
 * \param[in] rhs The message array on the right hand size of the equality operator.
 * \return true if message arrays are equal in size and content, otherwise false.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__are_equal(const rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence * lhs, const rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence * rhs);

/// Copy an array of srv/ActionFeedbackDetails messages.
/**
 * This functions performs a deep copy, as opposed to the shallow copy that
 * plain assignment yields.
 *
 * \param[in] input The source array pointer.
 * \param[out] output The target array pointer, which must
 *   have been initialized before calling this function.
 * \return true if successful, or false if either pointer
 *   is null or memory allocation fails.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence__copy(
  const rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence * input,
  rosapi_msgs__srv__ActionFeedbackDetails_Request__Sequence * output);

/// Initialize srv/ActionFeedbackDetails message.
/**
 * If the init function is called twice for the same message without
 * calling fini inbetween previously allocated memory will be leaked.
 * \param[in,out] msg The previously allocated message pointer.
 * Fields without a default value will not be initialized by this function.
 * You might want to call memset(msg, 0, sizeof(
 * rosapi_msgs__srv__ActionFeedbackDetails_Response
 * )) before or use
 * rosapi_msgs__srv__ActionFeedbackDetails_Response__create()
 * to allocate and initialize the message.
 * \return true if initialization was successful, otherwise false
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Response__init(rosapi_msgs__srv__ActionFeedbackDetails_Response * msg);

/// Finalize srv/ActionFeedbackDetails message.
/**
 * \param[in,out] msg The allocated message pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Response__fini(rosapi_msgs__srv__ActionFeedbackDetails_Response * msg);

/// Create srv/ActionFeedbackDetails message.
/**
 * It allocates the memory for the message, sets the memory to zero, and
 * calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Response__init().
 * \return The pointer to the initialized message if successful,
 * otherwise NULL
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
rosapi_msgs__srv__ActionFeedbackDetails_Response *
rosapi_msgs__srv__ActionFeedbackDetails_Response__create();

/// Destroy srv/ActionFeedbackDetails message.
/**
 * It calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Response__fini()
 * and frees the memory of the message.
 * \param[in,out] msg The allocated message pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Response__destroy(rosapi_msgs__srv__ActionFeedbackDetails_Response * msg);

/// Check for srv/ActionFeedbackDetails message equality.
/**
 * \param[in] lhs The message on the left hand size of the equality operator.
 * \param[in] rhs The message on the right hand size of the equality operator.
 * \return true if messages are equal, otherwise false.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Response__are_equal(const rosapi_msgs__srv__ActionFeedbackDetails_Response * lhs, const rosapi_msgs__srv__ActionFeedbackDetails_Response * rhs);

/// Copy a srv/ActionFeedbackDetails message.
/**
 * This functions performs a deep copy, as opposed to the shallow copy that
 * plain assignment yields.
 *
 * \param[in] input The source message pointer.
 * \param[out] output The target message pointer, which must
 *   have been initialized before calling this function.
 * \return true if successful, or false if either pointer is null
 *   or memory allocation fails.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Response__copy(
  const rosapi_msgs__srv__ActionFeedbackDetails_Response * input,
  rosapi_msgs__srv__ActionFeedbackDetails_Response * output);

/// Initialize array of srv/ActionFeedbackDetails messages.
/**
 * It allocates the memory for the number of elements and calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Response__init()
 * for each element of the array.
 * \param[in,out] array The allocated array pointer.
 * \param[in] size The size / capacity of the array.
 * \return true if initialization was successful, otherwise false
 * If the array pointer is valid and the size is zero it is guaranteed
 # to return true.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__init(rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence * array, size_t size);

/// Finalize array of srv/ActionFeedbackDetails messages.
/**
 * It calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Response__fini()
 * for each element of the array and frees the memory for the number of
 * elements.
 * \param[in,out] array The initialized array pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__fini(rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence * array);

/// Create array of srv/ActionFeedbackDetails messages.
/**
 * It allocates the memory for the array and calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__init().
 * \param[in] size The size / capacity of the array.
 * \return The pointer to the initialized array if successful, otherwise NULL
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence *
rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__create(size_t size);

/// Destroy array of srv/ActionFeedbackDetails messages.
/**
 * It calls
 * rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__fini()
 * on the array,
 * and frees the memory of the array.
 * \param[in,out] array The initialized array pointer.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
void
rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__destroy(rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence * array);

/// Check for srv/ActionFeedbackDetails message array equality.
/**
 * \param[in] lhs The message array on the left hand size of the equality operator.
 * \param[in] rhs The message array on the right hand size of the equality operator.
 * \return true if message arrays are equal in size and content, otherwise false.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__are_equal(const rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence * lhs, const rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence * rhs);

/// Copy an array of srv/ActionFeedbackDetails messages.
/**
 * This functions performs a deep copy, as opposed to the shallow copy that
 * plain assignment yields.
 *
 * \param[in] input The source array pointer.
 * \param[out] output The target array pointer, which must
 *   have been initialized before calling this function.
 * \return true if successful, or false if either pointer
 *   is null or memory allocation fails.
 */
ROSIDL_GENERATOR_C_PUBLIC_rosapi_msgs
bool
rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence__copy(
  const rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence * input,
  rosapi_msgs__srv__ActionFeedbackDetails_Response__Sequence * output);

#ifdef __cplusplus
}
#endif

#endif  // ROSAPI_MSGS__SRV__DETAIL__ACTION_FEEDBACK_DETAILS__FUNCTIONS_H_
