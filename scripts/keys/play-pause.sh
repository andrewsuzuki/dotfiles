#!/bin/sh

# Play/pause

# If a player is open, run `playerctl play-pause`.
# If not, open Spotify first.

if playerctl -l 2>&1 >/dev/null | grep -q "No players" > /dev/null; then
	# Open spotify
	nohup spotify > /dev/null 2>&1&

	# Wait for it to start
	sleep 1
fi

# Play or pause
playerctl -a play-pause &> /dev/null
