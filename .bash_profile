# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

## Autologin to sway

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
	  exec sway
fi
