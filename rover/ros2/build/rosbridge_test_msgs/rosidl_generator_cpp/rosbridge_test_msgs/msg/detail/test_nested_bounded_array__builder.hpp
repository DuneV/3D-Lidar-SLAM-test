// generated from rosidl_generator_cpp/resource/idl__builder.hpp.em
// with input from rosbridge_test_msgs:msg/TestNestedBoundedArray.idl
// generated code does not contain a copyright notice

#ifndef ROSBRIDGE_TEST_MSGS__MSG__DETAIL__TEST_NESTED_BOUNDED_ARRAY__BUILDER_HPP_
#define ROSBRIDGE_TEST_MSGS__MSG__DETAIL__TEST_NESTED_BOUNDED_ARRAY__BUILDER_HPP_

#include <algorithm>
#include <utility>

#include "rosbridge_test_msgs/msg/detail/test_nested_bounded_array__struct.hpp"
#include "rosidl_runtime_cpp/message_initialization.hpp"


namespace rosbridge_test_msgs
{

namespace msg
{

namespace builder
{

class Init_TestNestedBoundedArray_data
{
public:
  Init_TestNestedBoundedArray_data()
  : msg_(::rosidl_runtime_cpp::MessageInitialization::SKIP)
  {}
  ::rosbridge_test_msgs::msg::TestNestedBoundedArray data(::rosbridge_test_msgs::msg::TestNestedBoundedArray::_data_type arg)
  {
    msg_.data = std::move(arg);
    return std::move(msg_);
  }

private:
  ::rosbridge_test_msgs::msg::TestNestedBoundedArray msg_;
};

}  // namespace builder

}  // namespace msg

template<typename MessageType>
auto build();

template<>
inline
auto build<::rosbridge_test_msgs::msg::TestNestedBoundedArray>()
{
  return rosbridge_test_msgs::msg::builder::Init_TestNestedBoundedArray_data();
}

}  // namespace rosbridge_test_msgs

#endif  // ROSBRIDGE_TEST_MSGS__MSG__DETAIL__TEST_NESTED_BOUNDED_ARRAY__BUILDER_HPP_
