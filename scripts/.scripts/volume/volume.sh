#!/usr/bin/env zsh

amount=5
if [[ "$2" =~ "^[0-9]+$" ]] ; then
	amount="$2"
fi

if test "$1" = up; then
	wpctl set-volume @DEFAULT_AUDIO_SINK@ $amount%+ -l 1
elif test "$1" = down; then
	wpctl set-volume @DEFAULT_AUDIO_SINK@ $amount%- -l 1
elif test "$1" = mute; then
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
elif test "$1" = get; then
	echo $(printf %d $(($(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oP "\d{1}.\d{2}") * 100)))
	exit 0
else
	echo "$0 [option] [value in %]"
	echo "\toption: up|down|mute"
	exit 0
fi

volume=$(printf %d $(($(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oP "\d{1}.\d{2}") * 100)))

if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oqP MUTED; then
	text="Volume [mute]"
else
	text="Volume"
fi

dunstify "$text" -h "int:value:$volume"
