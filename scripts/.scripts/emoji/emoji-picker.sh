emoji=$(cat ~/.scripts/emoji/emoji.txt| \
	bemenu -p "Pick an emoji" -l 30 -H 20) \
	&& echo -n ${emoji%% *} | wl-copy
