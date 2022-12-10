# Aliases

alias p="sudo pacman -Syu --needed --color auto"
alias pss="pacman -Ss"
alias darktoggle="pkill -USR1 zsh"  # update darktheme on all terminals

open () {  # open like on macos (with no error printing)
	xdg-open "$@" 2> /dev/null & disown;
}

alias pipes="cpipes -p5 -f15 -C═║╗╝╚╔"
