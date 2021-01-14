#!/bin/sh

# Adapted from this AskUbuntu answer:
# https://askubuntu.com/a/869676

# move backlight brightness (0-100) along custom ~exponential scale

current=$(light -s sysfs/backlight/acpi_video0)

scale="0 1 2 5 10 15 25 40 60 100"

case $1 in
    "down")
        # translate space to newline so tac will reverse order of lines (values)
        for val in $(tr ' ' '\n' <<< $scale | tac) ; do
            # scale = 3 to preserve some decimal values
            if (( $(bc <<< "scale=3 ; $val < $current/1.1") )) ; then
                newval=$val
                break
            fi
        done
        ;;
    "up")
        for val in $scale ; do
            # scale = 3 to preserve some decimal values
            if (( $(bc <<< "scale=3 ; $val > $current*1.1") )) ; then
                newval=$val
                break
            fi
        done
        ;;
    *)
        echo "Usage: $0 [up, down]"
        exit 1
esac

if [ "x$newval" == "x" ] ; then
    echo "Already at min/max."
else
    echo "Setting backlight to $newval."

    light -s sysfs/backlight/acpi_video0 -S $newval
fi

exit 0
