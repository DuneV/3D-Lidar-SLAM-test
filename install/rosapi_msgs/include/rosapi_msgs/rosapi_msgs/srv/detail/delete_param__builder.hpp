// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from rosapi_msgs:srv/DeleteParam.idl
// generated code does not contain a copyright notice

#ifndef ROSAPI_MSGS__SRV__DETAIL__DELETE_PARAM__BUILDER_HPP_
#define ROSAPI_MSGS__SRV__DETAIL__DELETE_PARAM__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "rosapi_msgs/srv/detail/delete_param__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace rosapi_msgs
{

namespace srv
{

namespace builder
{

class Init_DeleteParam_Request_name
{
public:
  Init_DeleteParam_Request_name()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::rosapi_msgs::srv::DeleteParam_Request name(::rosapi_msgs::srv::DeleteParam_Request::_name_type arg)
  {
    msg_.name = std::move(arg);
    return std::move(msg_);
  }

private:
  ::rosapi_msgs::srv::DeleteParam_Request msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::rosapi_msgs::srv::DeleteParam_Request>()
{
  return rosapi_msgs::srv::builder::Init_DeleteParam_Request_name();
}

}  // namespace rosapi_msgs


namespace rosapi_msgs
{

namespace srv
{

namespace builder
{

class Init_DeleteParam_Response_reason
{
public:
  explicit Init_DeleteParam_Response_reason(::rosapi_msgs::srv::DeleteParam_Response & msg)
  : msg_(msg)
  {}
  ::rosapi_msgs::srv::DeleteParam_Response reason(::rosapi_msgs::srv::DeleteParam_Response::_reason_type arg)
  {
    msg_.reason = std::move(arg);
    return std::move(msg_);
  }

private:
  ::rosapi_msgs::srv::DeleteParam_Response msg_;
};

class Init_DeleteParam_Response_successful
{
public:
  Init_DeleteParam_Response_successful()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  Init_DeleteParam_Response_reason successful(::rosapi_msgs::srv::DeleteParam_Response::_successful_type arg)
  {
    msg_.successful = std::move(arg);
    return Init_DeleteParam_Response_reason(msg_);
  }

private:
  ::rosapi_msgs::srv::DeleteParam_Response msg_;
};

}  // namespace builder

}  // namespace srv

template<typename MessageType>
auto build();

template<>
inline
auto build<::rosapi_msgs::srv::DeleteParam_Response>()
{
  return rosapi_msgs::srv::builder::Init_DeleteParam_Response_successful();
}

}  // namespace rosapi_msgs

#endif  // ROSAPI_MSGS__SRV__DETAIL__DELETE_PARAM__BUILDER_HPP_
