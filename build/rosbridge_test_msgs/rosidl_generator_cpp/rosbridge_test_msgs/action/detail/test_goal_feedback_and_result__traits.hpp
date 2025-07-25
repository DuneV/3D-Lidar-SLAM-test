// generated from rosidl_generator_cpp/resource/idl__traits.hpp.em
// with input from rosbridge_test_msgs:action/TestGoalFeedbackAndResult.idl
// generated code does not contain a copyright notice

#ifndef ROSBRIDGE_TEST_MSGS__ACTION__DETAIL__TEST_GOAL_FEEDBACK_AND_RESULT__TRAITS_HPP_
#define ROSBRIDGE_TEST_MSGS__ACTION__DETAIL__TEST_GOAL_FEEDBACK_AND_RESULT__TRAITS_HPP_

#include <stdint.h>

#include <sstream>
#include <string>
#include <type_traits>

#include "rosbridge_test_msgs/action/detail/test_goal_feedback_and_result__struct.hpp"
#include "rosidl_runtime_cpp/traits.hpp"

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_Goal & msg,
  std::ostream & out)
{
  out << "{";
  // member: data
  {
    out << "data: ";
    rosidl_generator_traits::value_to_yaml(msg.data, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_Goal & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: data
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "data: ";
    rosidl_generator_traits::value_to_yaml(msg.data, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_Goal & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_Goal";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_Result & msg,
  std::ostream & out)
{
  out << "{";
  // member: data
  {
    out << "data: ";
    rosidl_generator_traits::value_to_yaml(msg.data, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_Result & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: data
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "data: ";
    rosidl_generator_traits::value_to_yaml(msg.data, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_Result & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_Result";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_Feedback & msg,
  std::ostream & out)
{
  out << "{";
  // member: data
  {
    out << "data: ";
    rosidl_generator_traits::value_to_yaml(msg.data, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_Feedback & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: data
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "data: ";
    rosidl_generator_traits::value_to_yaml(msg.data, out);
    out << "\n";
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_Feedback & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_Feedback";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>
  : std::integral_constant<bool, true> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>
  : std::integral_constant<bool, true> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>
  : std::true_type {};

}  // namespace rosidl_generator_traits

// Include directives for member types
// Member 'goal_id'
#include "unique_identifier_msgs/msg/detail/uuid__traits.hpp"
// Member 'goal'
#include "rosbridge_test_msgs/action/detail/test_goal_feedback_and_result__traits.hpp"

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_SendGoal_Request & msg,
  std::ostream & out)
{
  out << "{";
  // member: goal_id
  {
    out << "goal_id: ";
    to_flow_style_yaml(msg.goal_id, out);
    out << ", ";
  }

  // member: goal
  {
    out << "goal: ";
    to_flow_style_yaml(msg.goal, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_SendGoal_Request & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: goal_id
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "goal_id:\n";
    to_block_style_yaml(msg.goal_id, out, indentation + 2);
  }

  // member: goal
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "goal:\n";
    to_block_style_yaml(msg.goal, out, indentation + 2);
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_SendGoal_Request & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_SendGoal_Request";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>
  : std::integral_constant<bool, has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>::value && has_fixed_size<unique_identifier_msgs::msg::UUID>::value> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>
  : std::integral_constant<bool, has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>::value && has_bounded_size<unique_identifier_msgs::msg::UUID>::value> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>
  : std::true_type {};

}  // namespace rosidl_generator_traits

// Include directives for member types
// Member 'stamp'
#include "builtin_interfaces/msg/detail/time__traits.hpp"

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_SendGoal_Response & msg,
  std::ostream & out)
{
  out << "{";
  // member: accepted
  {
    out << "accepted: ";
    rosidl_generator_traits::value_to_yaml(msg.accepted, out);
    out << ", ";
  }

  // member: stamp
  {
    out << "stamp: ";
    to_flow_style_yaml(msg.stamp, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_SendGoal_Response & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: accepted
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "accepted: ";
    rosidl_generator_traits::value_to_yaml(msg.accepted, out);
    out << "\n";
  }

  // member: stamp
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "stamp:\n";
    to_block_style_yaml(msg.stamp, out, indentation + 2);
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_SendGoal_Response & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_SendGoal_Response";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>
  : std::integral_constant<bool, has_fixed_size<builtin_interfaces::msg::Time>::value> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>
  : std::integral_constant<bool, has_bounded_size<builtin_interfaces::msg::Time>::value> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_SendGoal";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal>
  : std::integral_constant<
    bool,
    has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>::value &&
    has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>::value
  >
{
};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal>
  : std::integral_constant<
    bool,
    has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>::value &&
    has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>::value
  >
{
};

template<>
struct is_service<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal>
  : std::true_type
{
};

template<>
struct is_service_request<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Request>
  : std::true_type
{
};

template<>
struct is_service_response<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_SendGoal_Response>
  : std::true_type
{
};

}  // namespace rosidl_generator_traits

// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__traits.hpp"

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_GetResult_Request & msg,
  std::ostream & out)
{
  out << "{";
  // member: goal_id
  {
    out << "goal_id: ";
    to_flow_style_yaml(msg.goal_id, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_GetResult_Request & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: goal_id
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "goal_id:\n";
    to_block_style_yaml(msg.goal_id, out, indentation + 2);
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_GetResult_Request & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_GetResult_Request";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>
  : std::integral_constant<bool, has_fixed_size<unique_identifier_msgs::msg::UUID>::value> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>
  : std::integral_constant<bool, has_bounded_size<unique_identifier_msgs::msg::UUID>::value> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>
  : std::true_type {};

}  // namespace rosidl_generator_traits

// Include directives for member types
// Member 'result'
// already included above
// #include "rosbridge_test_msgs/action/detail/test_goal_feedback_and_result__traits.hpp"

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_GetResult_Response & msg,
  std::ostream & out)
{
  out << "{";
  // member: status
  {
    out << "status: ";
    rosidl_generator_traits::value_to_yaml(msg.status, out);
    out << ", ";
  }

  // member: result
  {
    out << "result: ";
    to_flow_style_yaml(msg.result, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_GetResult_Response & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: status
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "status: ";
    rosidl_generator_traits::value_to_yaml(msg.status, out);
    out << "\n";
  }

  // member: result
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "result:\n";
    to_block_style_yaml(msg.result, out, indentation + 2);
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_GetResult_Response & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_GetResult_Response";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>
  : std::integral_constant<bool, has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>::value> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>
  : std::integral_constant<bool, has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>::value> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>
  : std::true_type {};

}  // namespace rosidl_generator_traits

namespace rosidl_generator_traits
{

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_GetResult";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult>
  : std::integral_constant<
    bool,
    has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>::value &&
    has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>::value
  >
{
};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult>
  : std::integral_constant<
    bool,
    has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>::value &&
    has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>::value
  >
{
};

template<>
struct is_service<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult>
  : std::true_type
{
};

template<>
struct is_service_request<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Request>
  : std::true_type
{
};

template<>
struct is_service_response<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_GetResult_Response>
  : std::true_type
{
};

}  // namespace rosidl_generator_traits

// Include directives for member types
// Member 'goal_id'
// already included above
// #include "unique_identifier_msgs/msg/detail/uuid__traits.hpp"
// Member 'feedback'
// already included above
// #include "rosbridge_test_msgs/action/detail/test_goal_feedback_and_result__traits.hpp"

namespace rosbridge_test_msgs
{

namespace action
{

inline void to_flow_style_yaml(
  const TestGoalFeedbackAndResult_FeedbackMessage & msg,
  std::ostream & out)
{
  out << "{";
  // member: goal_id
  {
    out << "goal_id: ";
    to_flow_style_yaml(msg.goal_id, out);
    out << ", ";
  }

  // member: feedback
  {
    out << "feedback: ";
    to_flow_style_yaml(msg.feedback, out);
  }
  out << "}";
}  // NOLINT(readability/fn_size)

inline void to_block_style_yaml(
  const TestGoalFeedbackAndResult_FeedbackMessage & msg,
  std::ostream & out, size_t indentation = 0)
{
  // member: goal_id
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "goal_id:\n";
    to_block_style_yaml(msg.goal_id, out, indentation + 2);
  }

  // member: feedback
  {
    if (indentation > 0) {
      out << std::string(indentation, ' ');
    }
    out << "feedback:\n";
    to_block_style_yaml(msg.feedback, out, indentation + 2);
  }
}  // NOLINT(readability/fn_size)

inline std::string to_yaml(const TestGoalFeedbackAndResult_FeedbackMessage & msg, bool use_flow_style = false)
{
  std::ostringstream out;
  if (use_flow_style) {
    to_flow_style_yaml(msg, out);
  } else {
    to_block_style_yaml(msg, out);
  }
  return out.str();
}

}  // namespace action

}  // namespace rosbridge_test_msgs

namespace rosidl_generator_traits
{

[[deprecated("use rosbridge_test_msgs::action::to_block_style_yaml() instead")]]
inline void to_yaml(
  const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage & msg,
  std::ostream & out, size_t indentation = 0)
{
  rosbridge_test_msgs::action::to_block_style_yaml(msg, out, indentation);
}

[[deprecated("use rosbridge_test_msgs::action::to_yaml() instead")]]
inline std::string to_yaml(const rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage & msg)
{
  return rosbridge_test_msgs::action::to_yaml(msg);
}

template<>
inline const char * data_type<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage>()
{
  return "rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage";
}

template<>
inline const char * name<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage>()
{
  return "rosbridge_test_msgs/action/TestGoalFeedbackAndResult_FeedbackMessage";
}

template<>
struct has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage>
  : std::integral_constant<bool, has_fixed_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>::value && has_fixed_size<unique_identifier_msgs::msg::UUID>::value> {};

template<>
struct has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage>
  : std::integral_constant<bool, has_bounded_size<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>::value && has_bounded_size<unique_identifier_msgs::msg::UUID>::value> {};

template<>
struct is_message<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_FeedbackMessage>
  : std::true_type {};

}  // namespace rosidl_generator_traits


namespace rosidl_generator_traits
{

template<>
struct is_action<rosbridge_test_msgs::action::TestGoalFeedbackAndResult>
  : std::true_type
{
};

template<>
struct is_action_goal<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Goal>
  : std::true_type
{
};

template<>
struct is_action_result<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Result>
  : std::true_type
{
};

template<>
struct is_action_feedback<rosbridge_test_msgs::action::TestGoalFeedbackAndResult_Feedback>
  : std::true_type
{
};

}  // namespace rosidl_generator_traits


#endif  // ROSBRIDGE_TEST_MSGS__ACTION__DETAIL__TEST_GOAL_FEEDBACK_AND_RESULT__TRAITS_HPP_
