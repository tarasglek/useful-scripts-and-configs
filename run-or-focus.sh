#!/bin/sh
set -x
cmd=$1
class=$2
workspace=$3
running_cmd=`[ ! -z "$4" ] && echo $4 || echo $cmd`
pid=`pidof $running_cmd`
if [ -z "$pid" ]; then
    i3-msg "workspace $workspace"
    $cmd
else
    i3-msg "[class=$class tiling] focus"
fi
