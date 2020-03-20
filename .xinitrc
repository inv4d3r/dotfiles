#!/bin/bash

# Xresources theme
if [ -z "$THEME" ]
then
	xrdb -DTHEME_XRESOURCES="<$HOME/.config/xresources/default>" -merge ~/.Xresources
else
	xrdb -DTHEME_XRESOURCES="<$HOME/.config/xresources/$THEME>" -merge ~/.Xresources
fi

# terminal emulators theme
envsubst < ~/.config/kitty/kitty.baseconf > ~/.config/kitty/kitty.conf
envsubst < ~/.config/termite/base > ~/.config/termite/config
envsubst < ~/.config/termite/$THEME >> ~/.config/termite/config

# keyboard
setxkbmap pl &
setxkbmap -option caps:escape &

# appearance
#compton &

# sound
pulseaudio -D
pasystray &

# automount
udiskie --tray &

# gnome keyring
if [ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ]; then
	source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
fi
#dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# start window manager
exec awesome
