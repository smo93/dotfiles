#!/bin/zsh

# set 256 colors in terminal
export TERM="xterm-256color"

# ssh and gnome-keyring
SSH_AUTH_SOCK=`ss -xl | grep -o '/run/user/1000/keyring-.*/ssh'`
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

# colorful output for 'ls'
alias ls='ls --color=auto'

# advanced tab completion
autoload -U compinit
compinit

# menu style auto-completion
zstyle ':completion:*' menu select

# prompt
# color="[38;5;{$col}m"
autoload -U colors && colors
reset="%k"
color1="236"
color2="237"
color3="238"
# PS1="%K{$color1}%@ %K{$color2}%F{$color1}⮀%f %n@%m %K{$color3}%F{$color2}⮀%f %~ ${reset}%F{$color3}⮀%f "
PS1="┌─[%F{11}%T%f]─[%F{12}%n@%m%f]─[%F{10}%~%f]
└──╼ "

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

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi


bindkey '^_' undo
