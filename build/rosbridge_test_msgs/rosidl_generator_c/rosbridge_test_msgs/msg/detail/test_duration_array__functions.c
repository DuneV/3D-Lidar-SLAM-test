// generated from rosidl_generator_c/resource/idl__functions.c.em
// with input from rosbridge_test_msgs:msg/TestDurationArray.idl
// generated code does not contain a copyright notice
#include "rosbridge_test_msgs/msg/detail/test_duration_array__functions.h"

#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "rcutils/allocator.h"


// Include directives for member types
// Member `durations`
#include "builtin_interfaces/msg/detail/duration__functions.h"

bool
rosbridge_test_msgs__msg__TestDurationArray__init(rosbridge_test_msgs__msg__TestDurationArray * msg)
{
  if (!msg) {
    return false;
  }
  // durations
  if (!builtin_interfaces__msg__Duration__Sequence__init(&msg->durations, 0)) {
    rosbridge_test_msgs__msg__TestDurationArray__fini(msg);
    return false;
  }
  return true;
}

void
rosbridge_test_msgs__msg__TestDurationArray__fini(rosbridge_test_msgs__msg__TestDurationArray * msg)
{
  if (!msg) {
    return;
  }
  // durations
  builtin_interfaces__msg__Duration__Sequence__fini(&msg->durations);
}

bool
rosbridge_test_msgs__msg__TestDurationArray__are_equal(const rosbridge_test_msgs__msg__TestDurationArray * lhs, const rosbridge_test_msgs__msg__TestDurationArray * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  // durations
  if (!builtin_interfaces__msg__Duration__Sequence__are_equal(
      &(lhs->durations), &(rhs->durations)))
  {
    return false;
  }
  return true;
}

bool
rosbridge_test_msgs__msg__TestDurationArray__copy(
  const rosbridge_test_msgs__msg__TestDurationArray * input,
  rosbridge_test_msgs__msg__TestDurationArray * output)
{
  if (!input || !output) {
    return false;
  }
  // durations
  if (!builtin_interfaces__msg__Duration__Sequence__copy(
      &(input->durations), &(output->durations)))
  {
    return false;
  }
  return true;
}

rosbridge_test_msgs__msg__TestDurationArray *
rosbridge_test_msgs__msg__TestDurationArray__create()
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  rosbridge_test_msgs__msg__TestDurationArray * msg = (rosbridge_test_msgs__msg__TestDurationArray *)allocator.allocate(sizeof(rosbridge_test_msgs__msg__TestDurationArray), allocator.state);
  if (!msg) {
    return NULL;
  }
  memset(msg, 0, sizeof(rosbridge_test_msgs__msg__TestDurationArray));
  bool success = rosbridge_test_msgs__msg__TestDurationArray__init(msg);
  if (!success) {
    allocator.deallocate(msg, allocator.state);
    return NULL;
  }
  return msg;
}

void
rosbridge_test_msgs__msg__TestDurationArray__destroy(rosbridge_test_msgs__msg__TestDurationArray * msg)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (msg) {
    rosbridge_test_msgs__msg__TestDurationArray__fini(msg);
  }
  allocator.deallocate(msg, allocator.state);
}


bool
rosbridge_test_msgs__msg__TestDurationArray__Sequence__init(rosbridge_test_msgs__msg__TestDurationArray__Sequence * array, size_t size)
{
  if (!array) {
    return false;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  rosbridge_test_msgs__msg__TestDurationArray * data = NULL;

  if (size) {
    data = (rosbridge_test_msgs__msg__TestDurationArray *)allocator.zero_allocate(size, sizeof(rosbridge_test_msgs__msg__TestDurationArray), allocator.state);
    if (!data) {
      return false;
    }
    // initialize all array elements
    size_t i;
    for (i = 0; i < size; ++i) {
      bool success = rosbridge_test_msgs__msg__TestDurationArray__init(&data[i]);
      if (!success) {
        break;
      }
    }
    if (i < size) {
      // if initialization failed finalize the already initialized array elements
      for (; i > 0; --i) {
        rosbridge_test_msgs__msg__TestDurationArray__fini(&data[i - 1]);
      }
      allocator.deallocate(data, allocator.state);
      return false;
    }
  }
  array->data = data;
  array->size = size;
  array->capacity = size;
  return true;
}

void
rosbridge_test_msgs__msg__TestDurationArray__Sequence__fini(rosbridge_test_msgs__msg__TestDurationArray__Sequence * array)
{
  if (!array) {
    return;
  }
  rcutils_allocator_t allocator = rcutils_get_default_allocator();

  if (array->data) {
    // ensure that data and capacity values are consistent
    assert(array->capacity > 0);
    // finalize all array elements
    for (size_t i = 0; i < array->capacity; ++i) {
      rosbridge_test_msgs__msg__TestDurationArray__fini(&array->data[i]);
    }
    allocator.deallocate(array->data, allocator.state);
    array->data = NULL;
    array->size = 0;
    array->capacity = 0;
  } else {
    // ensure that data, size, and capacity values are consistent
    assert(0 == array->size);
    assert(0 == array->capacity);
  }
}

rosbridge_test_msgs__msg__TestDurationArray__Sequence *
rosbridge_test_msgs__msg__TestDurationArray__Sequence__create(size_t size)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  rosbridge_test_msgs__msg__TestDurationArray__Sequence * array = (rosbridge_test_msgs__msg__TestDurationArray__Sequence *)allocator.allocate(sizeof(rosbridge_test_msgs__msg__TestDurationArray__Sequence), allocator.state);
  if (!array) {
    return NULL;
  }
  bool success = rosbridge_test_msgs__msg__TestDurationArray__Sequence__init(array, size);
  if (!success) {
    allocator.deallocate(array, allocator.state);
    return NULL;
  }
  return array;
}

void
rosbridge_test_msgs__msg__TestDurationArray__Sequence__destroy(rosbridge_test_msgs__msg__TestDurationArray__Sequence * array)
{
  rcutils_allocator_t allocator = rcutils_get_default_allocator();
  if (array) {
    rosbridge_test_msgs__msg__TestDurationArray__Sequence__fini(array);
  }
  allocator.deallocate(array, allocator.state);
}

bool
rosbridge_test_msgs__msg__TestDurationArray__Sequence__are_equal(const rosbridge_test_msgs__msg__TestDurationArray__Sequence * lhs, const rosbridge_test_msgs__msg__TestDurationArray__Sequence * rhs)
{
  if (!lhs || !rhs) {
    return false;
  }
  if (lhs->size != rhs->size) {
    return false;
  }
  for (size_t i = 0; i < lhs->size; ++i) {
    if (!rosbridge_test_msgs__msg__TestDurationArray__are_equal(&(lhs->data[i]), &(rhs->data[i]))) {
      return false;
    }
  }
  return true;
}

bool
rosbridge_test_msgs__msg__TestDurationArray__Sequence__copy(
  const rosbridge_test_msgs__msg__TestDurationArray__Sequence * input,
  rosbridge_test_msgs__msg__TestDurationArray__Sequence * output)
{
  if (!input || !output) {
    return false;
  }
  if (output->capacity < input->size) {
    const size_t allocation_size =
      input->size * sizeof(rosbridge_test_msgs__msg__TestDurationArray);
    rcutils_allocator_t allocator = rcutils_get_default_allocator();
    rosbridge_test_msgs__msg__TestDurationArray * data =
      (rosbridge_test_msgs__msg__TestDurationArray *)allocator.reallocate(
      output->data, allocation_size, allocator.state);
    if (!data) {
      return false;
    }
    // If reallocation succeeded, memory may or may not have been moved
    // to fulfill the allocation request, invalidating output->data.
    output->data = data;
    for (size_t i = output->capacity; i < input->size; ++i) {
      if (!rosbridge_test_msgs__msg__TestDurationArray__init(&output->data[i])) {
        // If initialization of any new item fails, roll back
        // all previously initialized items. Existing items
        // in output are to be left unmodified.
        for (; i-- > output->capacity; ) {
          rosbridge_test_msgs__msg__TestDurationArray__fini(&output->data[i]);
        }
        return false;
      }
    }
    output->capacity = input->size;
  }
  output->size = input->size;
  for (size_t i = 0; i < input->size; ++i) {
    if (!rosbridge_test_msgs__msg__TestDurationArray__copy(
        &(input->data[i]), &(output->data[i])))
    {
      return false;
    }
  }
  return true;
}
