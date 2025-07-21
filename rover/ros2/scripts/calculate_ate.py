import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from geopy.distance import geodesic
import os

odom_file = '../results/odom.csv'
gps_file = '../results/gps.csv'
output_dir = 'results/metrics'
os.makedirs(output_dir, exist_ok=True)

odom = pd.read_csv(odom_file)
gps = pd.read_csv(gps_file)

odom = odom.sort_values('timestamp')
gps = gps.sort_values('timestamp')
merged = pd.merge_asof(odom, gps, on='timestamp', direction='nearest', tolerance=0.05)
merged.dropna(inplace=True)

slam_pos = merged[['x', 'y', 'z']].values
gps_pos = merged[['latitude', 'longitude', 'altitude']].values

errors = np.linalg.norm(slam_pos - slam_pos, axis=1)
ate_rmse = np.sqrt(np.mean(errors ** 2))

frame_times = odom['timestamp'].diff().dropna()
avg_frame_time = frame_times.mean()
frame_freq = 1 / avg_frame_time

loop_error = np.linalg.norm(slam_pos[0] - slam_pos[-1])

metrics = {
    'ATE (RMSE) [m]': round(ate_rmse, 4),
    'Frame rate [Hz]': round(frame_freq, 2),
    'Loop closure error [m]': round(loop_error, 4),
    'Frame count': len(odom)
}
pd.Series(metrics).to_csv(os.path.join(output_dir, 'metrics_summary.csv'))

merged['error'] = errors
plt.figure()
plt.plot(merged['timestamp'], merged['error'], label='ATE')
plt.xlabel('Timestamp')
plt.ylabel('Error (m)')
plt.title('Absolute Trajectory Error')
plt.grid()
plt.savefig(os.path.join(output_dir, 'ate_plot.png'))
plt.close()

plt.figure()
plt.plot(odom['timestamp'][1:], frame_times, label='Δt')
plt.xlabel('Timestamp')
plt.ylabel('Frame time [s]')
plt.title('Processing time per frame')
plt.grid()
plt.savefig(os.path.join(output_dir, 'frame_time_plot.png'))
plt.close()

print("Métricas generadas en:", output_dir)
