#!/bin/sh

# Get currently-running sink
source "${BASH_SOURCE%/*}/_current-sink.sh"

pactl set-sink-mute $SINK toggle
