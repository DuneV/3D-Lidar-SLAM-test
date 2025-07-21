import rclpy
from rclpy.node import Node
from sensor_msgs.msg import PointCloud2, PointField
import sensor_msgs_py.point_cloud2 as pc2

class RingInjector(Node):
    def __init__(self):
        super().__init__('ring_injector')
        self.sub = self.create_subscription(PointCloud2, '/livox/lidar', self.callback, 10)
        self.pub = self.create_publisher(PointCloud2, '/points', 10)

    def callback(self, msg):
        original_fields = [f.name for f in msg.fields]
        cloud_points = list(pc2.read_points(msg, skip_nans=True, field_names=original_fields))

        new_points = [list(p) + [0] for p in cloud_points]

        new_fields = msg.fields + [
            PointField(name='ring', offset=msg.point_step, datatype=PointField.UINT16, count=1)
        ]

        new_msg = pc2.create_cloud(msg.header, new_fields, new_points)
        self.pub.publish(new_msg)

def main():
    rclpy.init()
    node = RingInjector()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
