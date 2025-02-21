#!/bin/bash
set -euo pipefail
LOG_FILE=~/Documents/code/logs/system_monitor.log
while true; do
    echo "$(date '+%Y-%m-%d %H:%M:%S.%3N') - Memory Usage:" >> "$LOG_FILE"
    vm_stat | awk '/Pages active/ {print $3*4096/1024/1024 " MB"}' >> "$LOG_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S.%3N') - CPU Usage:" >> "$LOG_FILE"
    top -l 1 | grep "CPU usage:" | awk '{print $3"%"}' >> "$LOG_FILE"
    sleep 60
done
