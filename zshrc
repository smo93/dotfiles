#!/bin/zsh

export TERM="xterm-256color"

SSH_AUTH_SOCK=`ss -xl | grep -o '/run/user/1000/keyring-.*/ssh'`
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

alias ls='ls --color=auto'

# advanced tab completion
autoload -U compinit
compinit

# menu style auto-completion
zstyle ':completion:*' menu select

# enable auto-correction on the commands typed
setopt correctall

# prompt
# color="[38;5;{$col}m"
autoload -U colors && colors
reset="%k"
color1="%K{236}"
color2="%K{238}"
color3="%K{240}"
PS1="${color1}%@ ${color2}%F{236}⮀%f %n@%m ${color3}%F{238}⮀%f %~ ${reset}%F{240}⮀%f "

# set command history size and save file
HISTSIZE=2000
HISTFILE="$HOME/.history"
SAVEHIST=$HISTSIZE

# ignore duplicate entries in history
setopt hist_ignore_all_dups

# prevent entries from being recorded in history by preceding them with space
setopt hist_ignore_space

# append history
setopt APPEND_HISTORY

# write after each command
setopt INC_APPEND_HISTORY

# change directory without cd
setopt autocd

# extended globing???
setopt extended_glob
