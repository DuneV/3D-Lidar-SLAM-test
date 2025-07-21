from setuptools import find_packages, setup

package_name = 'launch_lio'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/' + package_name + '/launch', ['launch/run_lio_sam.launch.py']),    
        ('share/' + package_name + '/config', ['config/params.yaml']),
        ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Daniel Alejandro Alvarez (DuneV)',
    maintainer_email='da.alvarezv@uniandes.edu.co',
    description='Launcher for LIO-SAM',
    license='MIT',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
        ],
    },
)
