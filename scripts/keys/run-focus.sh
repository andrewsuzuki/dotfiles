#!/bin/sh

# If not running, open. Then focus using i3-msg.
# Usage: run-focus.sh X_CLASSNAME I3_SELECTOR SLEEP

if ! xdotool search --classname $1 > /dev/null
then
	# Launch
	gtk-launch $2 > /dev/null 2>&1&
	# Sleep
	sleep $4
fi

# Focus
i3-msg "$3"' focus'
