#!/bin/bash
#Funtion to get total CPU usage
cpu_usage() {
  echo "Total CPU Usage:"
  top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \ awk '{print 100 - $1"%"}'
}

#Function to get total memory usage
memory_usage() {
  echo "\Total Memory Usage:"
  free -m | awk 'NR==2{prinf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
}

#Function to get disk usage
disk_usage() {
  echo "\Total Disk Usage:"
  df -h --total | awk '$1 == "total" {printf "Used: %sB / Total: %sB (%.2f%%)\n", $3, $2, $5}'
}
