#!/usr/bin/env bash

status=$(xset -q | grep 'DPMS is' | awk '{ print $3 }')
if [ $status == 'Enabled' ]; then
	xset -dpms &&
		notify-send 'caffeine' 'Screen suspend is disabled.'
else
	xset +dpms &&
		notify-send 'caffeine' 'Screen suspend is enabled.'
fi
