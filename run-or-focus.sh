#!/bin/sh
set -x
cmd=$1
class=$2
workspace=$3
if i3-msg "[con_mark=$class] focus"| jq '.[0]'.success|grep false ; then
    i3-msg "workspace $workspace"
    $cmd &
    xdotool search --sync --onlyvisible --class $class
    i3-msg mark $class
fi