# Aliases

alias p="sudo pacman -Syu --needed"
alias darktoggle="pkill -USR1 zsh"  # update darktheme on all terminals

open () {  # open like on macos (with no error printing)
	xdg-open "$@" 2> /dev/null &;
}
