#!/bin/sh

# Play/pause

# If spotify is not open, open it.
# Then tell spotify to play or pause.

if ! playerctl -l 2>/dev/null | grep -q "spotify"; then
	# Open spotify
	nohup spotify > /dev/null 2>&1&

	# Wait for it to start
	sleep 1
fi

# Play or pause
playerctl -p spotify play-pause &> /dev/null
