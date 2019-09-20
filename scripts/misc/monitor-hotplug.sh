#!/bin/sh

# Called as udev rule from /etc/udev/rules.d/95-monitor-hotplug.rules
# Taken from https://ruedigergad.com/2012/01/28/hotplug-an-external-screen-to-your-laptop-on-linux/

sleep 2

su andrew -c "/bin/zsh /home/andrew/scripts/keys/autorandr-conditional-load.sh"

sleep 1
# also reload xkb
source /home/andrew/scripts/misc/reload-xkb-config.sh
