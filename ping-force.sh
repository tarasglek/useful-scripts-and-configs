#!/bin/sh -x
ping -f `ip --json route |jq -r .[].gateway |grep -v null`

