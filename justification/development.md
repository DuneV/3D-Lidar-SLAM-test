## ✅ Justification Behind Selection: LIO-SAM

**LIO-SAM (Lidar-Inertial Odometry via Smoothing and Mapping)** is a state-of-the-art SLAM framework that combines Lidar and IMU data to produce accurate, real-time 3D mapping and localization. It is widely adopted in both academia and industry due to its balance of precision, robustness, and real-time performance.

### 🔍 Reasons for Selection

| Factor | Justification |
|--------|---------------|
| **Accuracy** | LIO-SAM uses factor graph optimization via **GTSAM**, resulting in **low-drift** and **high-fidelity** maps even over long trajectories. |
| **Sensor Fusion** | Efficient integration of **Lidar + IMU** provides robust pose estimation even in environments with sparse features. This is ideal for the dataset provided, which includes high-resolution lidar data and accurate GPS. |
| **Proven Track Record** | Extensively benchmarked in real-world autonomous driving and robotics scenarios. Reliable across different platforms. |
| **Community Support** | Actively maintained and well-documented, with many integration examples and issue resolutions available on GitHub and ROS communities. |
| **Modularity** | Easy to tune parameters (e.g., scan matching, loop closure), and modular architecture allows for integration into other ROS2 systems. |
| **Visualization & Debugging** | Publishes useful ROS topics for debugging: pose graph, trajectory, scan-to-map cloud, etc., aiding both development and evaluation. |

### ⚙️ Compatibility with Challenge

- ✅ The rosbag data includes IMU and GPS topics, which LIO-SAM can leverage directly.
- ✅ Works with point cloud data from Velodyne or similar sensors (common lidar types).
- ✅ Despite being developed initially for ROS1, there are ROS2 forks (e.g., [`lio-sam-ros2`](https://github.com/hypharos/ros2_lio_sam)) or containerized wrappers that allow easy integration into **ROS2 Humble** environments.

### 🛠️ Considerations & Mitigations

| Challenge | Strategy |
|----------|----------|
| Requires tight IMU-Lidar time sync | Ensured data sync by validating timestamps and using `/tf` transformations if needed. |
| Parameter tuning needed for new datasets | Performed iterative tuning using a subset of the rosbag; visualized alignment in **RViz2** and **CloudCompare**. |
| ROS1 to ROS2 transition may require patching | Used a ROS2-native fork and modified the Docker environment to support dependencies (e.g., GTSAM, PCL). |