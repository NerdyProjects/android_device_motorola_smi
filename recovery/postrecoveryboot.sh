#!/sbin/sh
/sbin/watchdogd &
echo "Y" > /sys/module/intel_mid/parameters/force_cold_boot
echo "1200000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "1200000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
exit 0
