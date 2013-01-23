#!/bin/sh

#1 process name
if [ $# -ne 1 ]; then
  exit
fi

# print header
printf "PID\tVmPeak\tVmSize\tVmHWM\tVmRSS\n"

# get memory size
pid=`pgrep $1`

for p in $pid
do
  if [ -f /proc/$p/status ]; then
    vm=`grep -e '^VmPeak:\|VmSize:\|VmHWM:\|VmRSS:' /proc/$p/status | awk '{print $2}'`
    printf "%d\t%d\t%d\t%d\t%d\n" $p $vm
  fi
done

