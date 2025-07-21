#!/bin/bash

# Activa ROS2
source /opt/ros/humble/setup.bash
source /workspace/install/setup.bash

echo "[INFO] Reproduciendo rosbag..."
ros2 bag play /workspace/rover/ros2/data/med_split.mcap --clock --loop --rate 1.0 &
BAG_PID=$!

sleep 1

echo "[INFO] Lanzando ring_injector..."
ros2 run pointcloud_ring_injector ring_injector &
INJECTOR_PID=$!

sleep 1

echo "[INFO] Lanzando LIO-SAM..."
ros2 launch lio_sam run.launch.py &
LIOSAM_PID=$!

# Espera a que termine el bag
wait $BAG_PID

# Termina los otros procesos después del rosbag
echo "[INFO] Finalizando ring_injector y LIO-SAM..."
kill $INJECTOR_PID $LIOSAM_PID
