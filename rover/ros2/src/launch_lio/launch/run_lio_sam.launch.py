from launch import LaunchDescription
from launch_ros.actions import Node
from launch.substitutions import PathJoinSubstitution
from launch_ros.substitutions import FindPackageShare
from launch_ros.parameter_descriptions import ParameterFile

def generate_launch_description():
    config_path = PathJoinSubstitution([
        FindPackageShare('launch_lio'),
        'config',
        'params.yaml'
    ])
    
    return LaunchDescription([
        Node(
            package='tf2_ros',
            executable='static_transform_publisher',
            name='tf_pub_livox',
            arguments=[
                '0', '0', '0',  # x, y, z
                '0', '0', '0',  # roll, pitch, yaw
                'livox_frame', 'livox_link'  # parent_frame, child_frame
            ],
            output='screen'
        ),
        Node(
            package='lio_sam',
            executable='lio_sam_featureExtraction',
            name='feature_extraction',
            output='screen',
            parameters=[ParameterFile(config_path, allow_substs=True), {'use_sim_time': True}]
        ),
        Node(
            package='lio_sam',
            executable='lio_sam_imageProjection',
            name='image_projection',
            output='screen',
            parameters=[ParameterFile(config_path, allow_substs=True), {'use_sim_time': True}]
        ),
        Node(
            package='lio_sam',
            executable='lio_sam_imuPreintegration',
            name='imu_preintegration',
            output='screen',
            parameters=[ParameterFile(config_path, allow_substs=True), {'use_sim_time': True}]
        ),
        Node(
            package='lio_sam',
            executable='lio_sam_mapOptimization',
            name='map_optimization',
            output='screen',
            parameters=[ParameterFile(config_path, allow_substs=True), {'use_sim_time': True}]
        ),
    ])