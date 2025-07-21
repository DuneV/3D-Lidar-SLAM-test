from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='lio_sam',
            executable='lio_sam_featureExtraction',
            name='feature_extraction',
            output='screen'
        ),
        Node(
            package='lio_sam',
            executable='lio_sam_imageProjection',
            name='image_projection',
            output='screen'
        ),
        Node(
            package='lio_sam',
            executable='lio_sam_imuPreintegration',
            name='imu_preintegration',
            output='screen'
        ),
        Node(
            package='lio_sam',
            executable='lio_sam_mapOptimization',
            name='map_optimization',
            output='screen'
        )
    ])

