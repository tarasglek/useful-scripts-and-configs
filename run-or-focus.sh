#!/bin/sh
set -x
cmd=$1
class=$2
running_cmd=`[ ! -z "$3" ] && echo $3 || echo $cmd`
pid=`pidof $running_cmd`
if [ -z "$pid" ]; then
    $cmd
else
    i3-msg "[class=$class] focus"
fi