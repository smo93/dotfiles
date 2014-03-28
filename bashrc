#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

SSH_AUTH_SOCK=`ss -xl | grep -o '/run/user/1000/keyring-.*/ssh'`
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

shopt -s checkwinsize
export TERM="xterm-256color"

end_color=$'\033[m'
blue=$'\033[38;5;39m'

alias ls='ls --color=auto'
PS1='$blue[\A][\u@\h - \W] \$$end_color '
