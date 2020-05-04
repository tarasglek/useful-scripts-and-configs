#!/bin/sh
set -x
cmd=$1
class=$2
i3-msg "[class=$class] focus" || $cmd