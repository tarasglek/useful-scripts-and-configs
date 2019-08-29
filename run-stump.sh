#!/bin/sh
export WM=`dirname $0`"/window-manager"
echo launching $WM
while true; do
	$WM
	sleep 1
done
