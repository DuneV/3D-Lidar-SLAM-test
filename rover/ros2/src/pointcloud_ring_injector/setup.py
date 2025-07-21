from setuptools import find_packages, setup

package_name = 'pointcloud_ring_injector'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='developer',
    maintainer_email='da.alvarezv@uniandes.edu.co',
    description='Injects ring field into PointCloud2',
    license='MIT',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'ring_injector = pointcloud_ring_injector.ring_injector:main'
        ],
    },
)
