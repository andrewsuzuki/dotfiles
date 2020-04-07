#!/bin/sh

# Load autorandr profile depending on the home monitor being connected.

# Parse connected-monitor EDID data (list monitor names)
# Taken from: https://stackoverflow.com/a/24933353
MONITORNAMES=$( xrandr --verbose | awk '
/[:.]/ && hex {
    sub(/.*000000fc00/, "", hex)
    hex = substr(hex, 0, 26) "0a"
    sub(/0a.*/, "0a", hex)
    print hex
    hex=""
}
hex {
    gsub(/[ \t]+/, "")
    hex = hex $0
}
/EDID.*:/ {
    hex=" "
}' | xxd -r -p )

PRE_AUTORANDR_PROFILE=$( autorandr --current )

# If home Asus monitor is connected, load home profile.
# If HP 22cwa monitor is connected, load kitchen-hp profile.
# Otherwise, just use mb-only profile (no monitor, just macbook display)
if echo $MONITORNAMES | grep -qi "ASUS PB278"
then
	autorandr --load home
elif echo $MONITORNAMES | grep -qi "HP 22cwa"
then
	autorandr --load kitchen-hp
else
	autorandr --load mb-only
fi

POST_AUTORANDR_PROFILE=$( autorandr --current )

# If autorandr profile actually changed...
if [ "$PRE_AUTORANDR_PROFILE" != "$POST_AUTORANDR_PROFILE" ]; then
	# Restart i3 (really just for the polybar redraw...) if it's running
	pgrep -x i3 >/dev/null && i3-msg restart
fi

# Reset background
~/scripts/misc/desktop-background.sh
