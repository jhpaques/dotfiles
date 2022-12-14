echo ""  # newline
fastfetch

# Auto theme update
TRAPUSR1() {
	alias sunset="~/.scripts/sunset/sunset.sh"
    # if vim is running
    vimpid="$(ps | grep -P "(vim|less)" | grep -oP "^ *[0-9]*" | xargs)"
    if [[ -n $vimpid ]]; then
        kill -TSTP ${vimpid##* };
    fi

    if [[ "$(date +%H)" -gt "$(sunset sunset)" || "$(date +%H)" -lt "$(sunset sunrise)" || ( "$(date +%H)" -eq "$(sunset sunset)" &&  "$(date +%M)" -gt "$(sunset sunset minutes)" ) || ( "$(date +%H)" -eq "$(sunset sunrise)" &&  "$(date +%M)" -lt "$(sunset sunrise minutes)" ) ]]; then
		/usr/bin/theme.sh gruvbox-dark
    else
		/usr/bin/theme.sh gruvbox
    fi
    fg > /dev/null 2>&1;
}
TRAPUSR1

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/jhpaques/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# enable OSC-7
function osc7 {
	local LC_ALL=C
	export LC_ALL

	setopt localoptions extendedglob
	input=( ${(s::)PWD} )
	uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
	print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}
add-zsh-hook -Uz chpwd osc7

# set window title to last command
function preexec {
	print -Pn "\e]0;${(q)1} - foot\e\\"
}


# Environment variables

export EDITOR=vim
export PATH="$PATH:$HOME/.local/bin"

alias ls="ls --color=auto"

source ~/.zsh/aliases.zsh
source ~/.zsh/aliases-private.zsh

