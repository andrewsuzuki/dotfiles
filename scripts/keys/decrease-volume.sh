#!/bin/sh

# Get currently-running sink
source "${BASH_SOURCE%/*}/_current-sink.sh"

pactl set-sink-volume $SINK -10%
