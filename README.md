script
======

shell script utility

# Usage

## showprocmem.sh

This script enables you to show memory usage of certain process.

```sh
# run script on Linux (2.6 or later)
$ sudo showprocmem.sh httpd

# and you can see like this
# in kB unit
PID	VmPeak	VmSize	VmHWM	VmRSS
13390	277292	274728	64412	62588
13977	267008	263760	52644	52644
25793	263768	263768	51440	51440
```

## showprocshmem.sh

This script enables you to show shared memory usage and its shared percentage of certain process.

```sh
# run script on Linux (2.6 or later)
$ sudo showprocshmem.sh httpd

# and you can see like this
# in kB unit
PID	RSS	SHARED
13390	62588	39296 (62%)
13977	52644	40588 (77%)
25793	51656	39692 (76%)
```
