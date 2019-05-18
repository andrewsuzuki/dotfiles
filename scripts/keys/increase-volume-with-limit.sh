#!/bin/sh

MAX=100

# Get currently-running sink volume
source "${BASH_SOURCE%/*}/_current-sink.sh"
NOW=$( pamixer --sink $SINK --get-volume )

NEW=$((NOW + 10))

if [ "$NEW" -gt "$MAX" ]; then
	NEW=$MAX
fi

pactl set-sink-volume $SINK "$NEW"%
