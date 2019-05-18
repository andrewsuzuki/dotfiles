#!/bin/sh

# Get the current PulseAudio sink to be controlled
# Prefer Axe-fx; otherwise use default sink

if pactl list sinks | grep -qi 'axe-fx'
then
	SINK="alsa_output.usb-Fractal_Audio_Systems_AXE-FX_II-00.analog-stereo"
else
	#SINK="alsa_output.pci-0000_00_1b.0.analog-stereo"
	SINK="@DEFAULT_SINK@"
fi
