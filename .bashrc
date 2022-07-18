#!/bin/bash 

# ~/.bashrc 21062022

# prompt set system wide in /etc/bash.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# source fzf keybindings
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash


# History options
HISTFILESIZE=10000
HISTSIZE=5000
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE='q:ls:c:cd:cl:h:alias'

# shell options
set -o noclobber
shopt -s autocd

# set PATH so that it includes users private bin/
PATH="${PATH:+${PATH}:}$HOME/bin"
PATH="${PATH:+${PATH}:}$HOME/.local/bin"

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORM=wayland
export MOZ_USE_XINPUT2=1
export XDG_CURRENT_DESKTOP=sway

# aliases
alias ....='cd ../../..'
alias la='ls -A'
alias ll='ls -l'
alias ls='ls --color=auto'
alias c='clear'
alias q='exit'
alias pacu='pacman -Syu'
alias yayu='yay -Sua'
alias df='df -kh'
alias cl='c;ls -lA'
alias h='history'
alias hg='history | grep'
alias off='shutdown -P now'
alias dmesg='dmesg -eHL'
alias journal='journalctl -p 3'
alias grep='grep -sI --color=auto' # Colorful (auto) 'grep' output
alias rm='rm -v'
alias mv='mv -v'
alias mkdir='mkdir -v'
alias cp='cp -v'
alias chown='chown -v'
alias chmod='chmod -v'
alias rmdir='rmdir -v'
alias bashrc='nvim ~/.bashrc' # .bashrc shell config file
alias vimrc='nvim ~/.config/nvim/init.vim' # init.vim for neovim
alias swayconf='nvim .config/sway/config' # sway config file
alias tmuxrc='nvim ~/.tmux.conf' # tmux config file
alias packages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias orphans='pacman -Rns $(pacman -Qtdq)'
alias sudo='sudo '
alias service='systemctl list-unit-files --state=enabled --no-pager'
alias check='checkupdates'
alias tree='tree -Csuh'
alias syssus='systemctl suspend'
alias syshib='systemctl hibernate'
alias syssth='systemctl suspend-then-hibernate'
alias syshsl='systemctl hybrid-sleep'
alias tb='nc termbin.com 9999' # file posting $ cat ~/some_file.txt | tb
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vimdiff='nvim -d'
