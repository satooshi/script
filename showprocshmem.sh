#!/bin/sh

# $1 process name
if [ $# -ne 1 ]; then
  exit
fi

# print header
printf "PID\tRSS\tSHARED\n"

# get shared memory size
pid=`pgrep $1`

for p in $pid
do
  if [ -f /proc/$p/smaps ]; then
    vm=`grep -e '^Rss:\|^Shared_Clean:\|^Shared_Dirty:' /proc/$p/smaps | 
    awk '
      BEGIN {
        rss = 0;
        clean = 0;
        dirty = 0;
      }
      {
        if($1 == "Rss:") {
          rss += $2;
        }
        else if($1 == "Shared_Clean:") {
          clean += $2;
        }
        else if($1 == "Shared_Dirty:") {
          dirty += $2;
        }
      }
      END {
        per = (rss == 0) ? 0 : (clean+dirty)*100/rss;
        printf("%d\t%d\t%d\n", rss, clean+dirty, per);
      }
    '`

    printf "%d\t%d\t%d (%d%%)\n" $p $vm
  fi
done

