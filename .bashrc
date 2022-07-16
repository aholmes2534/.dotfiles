# ~/.bashrc 21062022
#
# prompt set system wide in /etc/bash.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source aliases from .alias
source ~/.alias

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

# Force GTK to use wayland
GDK_BACKEND=wayland
CLUTTER_BACKEND=wayland
