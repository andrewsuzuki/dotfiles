#!/bin/bash
#
# Shell script to run axefx2setup.sh with the uninstall option -u passing the appropriate path to the udev rules file.
# Note: This script needs to be in the same path as axefx2setup.sh!
#
# (C) Joachim Gahl - 29.12.2011

./axefx2setup.sh -u /etc/udev/rules.d
