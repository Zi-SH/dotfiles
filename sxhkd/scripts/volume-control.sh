#!/bin/sh


SINK="alsa_output.usb-FiiO_DigiHug_USB_Audio-01.analog-stereo"
#SINK="alsa_output.usb-FiiO_DigiHug_USB_Audio-01.output_analog-stereo"
TITLE="Volume"
DURATION="2000"
PRIORITY="low"


# Clear out notifs to prevent a full screen of notifs
dunstctl close-all


case "$1" in
    modify)
	pactl set-sink-volume "$SINK" "$2"
	LEVEL="$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p' | head -n 1)"
	notify-send -a "$TITLE" "$LEVEL%" -t "$DURATION" -u "$PRIORITY" -h "int:value:$LEVEL"
	;;
    toggle)
	pactl set-sink-mute "$SINK" toggle
	LEVEL="$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p' | head -n 1)"
	STATE="$(amixer get Master | sed -n 's/^.*\[\(o[nf]\+\)]$/\1/p' | head -n 1)"
	notify-send -a "$TITLE" "$STATE - $LEVEL" -t "$DURATION" -u "$PRIORITY" -h "int:value:$LEVEL"
	;;
esac
