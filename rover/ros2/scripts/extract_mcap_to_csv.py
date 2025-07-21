import os
import csv
import argparse

import rosbag2_py
from rclpy.serialization import deserialize_message
from rosidl_runtime_py.utilities import get_message

output_dir = "extracted_csv"
os.makedirs(output_dir, exist_ok=True)

topics_to_extract = {
    "/fix": "sensor_msgs/msg/NavSatFix",
    "/livox/imu": "sensor_msgs/msg/Imu",
    "/wheel_odometry/global_odometry": "nav_msgs/msg/Odometry",
}


def flatten_msg(topic, msg):
    if topic == "/fix":
        return {
            "latitude": msg.latitude,
            "longitude": msg.longitude,
            "altitude": msg.altitude,
            "position_covariance": list(msg.position_covariance),
            "status.status": msg.status.status,
            "status.service": msg.status.service,
        }
    elif topic == "/livox/imu":
        return {
            "orientation.x": msg.orientation.x,
            "orientation.y": msg.orientation.y,
            "orientation.z": msg.orientation.z,
            "orientation.w": msg.orientation.w,
            "angular_velocity.x": msg.angular_velocity.x,
            "angular_velocity.y": msg.angular_velocity.y,
            "angular_velocity.z": msg.angular_velocity.z,
            "linear_acceleration.x": msg.linear_acceleration.x,
            "linear_acceleration.y": msg.linear_acceleration.y,
            "linear_acceleration.z": msg.linear_acceleration.z,
        }
    elif topic == "/wheel_odometry/global_odometry":
        return {
            "pose.position.x": msg.pose.pose.position.x,
            "pose.position.y": msg.pose.pose.position.y,
            "pose.position.z": msg.pose.pose.position.z,
            "pose.orientation.x": msg.pose.pose.orientation.x,
            "pose.orientation.y": msg.pose.pose.orientation.y,
            "pose.orientation.z": msg.pose.pose.orientation.z,
            "pose.orientation.w": msg.pose.pose.orientation.w,
            "twist.linear.x": msg.twist.twist.linear.x,
            "twist.linear.y": msg.twist.twist.linear.y,
            "twist.linear.z": msg.twist.twist.linear.z,
            "twist.angular.x": msg.twist.twist.angular.x,
            "twist.angular.y": msg.twist.twist.angular.y,
            "twist.angular.z": msg.twist.twist.angular.z,
        }
    else:
        return {}  # default


def extract_to_csv(input_bag):
    reader = rosbag2_py.SequentialReader()
    reader.open(
        rosbag2_py.StorageOptions(uri=input_bag, storage_id="mcap"),
        rosbag2_py.ConverterOptions(input_serialization_format="cdr", output_serialization_format="cdr"),
    )

    topic_types = {t.name: t.type for t in reader.get_all_topics_and_types()}

    writers = {}
    headers = {}

    while reader.has_next():
        topic, data, timestamp = reader.read_next()

        if topic not in topics_to_extract:
            continue

        msg_type = get_message(topic_types[topic])
        msg = deserialize_message(data, msg_type)

        flat_msg = flatten_msg(topic, msg)

        if not flat_msg:
            continue  # Skip if empty

        out_path = os.path.join(output_dir, topic.replace("/", "_") + ".csv")

        if topic not in writers:
            csvfile = open(out_path, "w", newline="")
            writer = csv.writer(csvfile)
            writers[topic] = (csvfile, writer)
            headers[topic] = ["timestamp"] + list(flat_msg.keys())
            writer.writerow(headers[topic])

        _, writer = writers[topic]
        writer.writerow([timestamp] + list(flat_msg.values()))

    # Close all files
    for f, _ in writers.values():
        f.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="Path to MCAP file")
    args = parser.parse_args()
    extract_to_csv(args.input)
