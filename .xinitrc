#!/bin/bash

# monitor(s) setup
~/scripts/setup-screen.sh

# Xresources theme
if [ -z "$THEME" ]
then
	xrdb -DTHEME_XRESOURCES="<$HOME/.config/xresources/default>" -merge ~/.Xresources
else
	xrdb -DTHEME_XRESOURCES="<$HOME/.config/xresources/$THEME>" -merge ~/.Xresources
fi

# keyboard
#setxkbmap -layout pl,ua,us -variant ,,altgr-intl -option caps:escape grp:rctrl_toggle

# sound
#pulseaudio -D
#pasystray &

# automount
#udiskie --tray &

# network tray
#nm-applet &

# gnome keyring
if [ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ]; then
	source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
fi
#dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# terminal emulators theme
envsubst < ~/.config/kitty/kitty.baseconf > ~/.config/kitty/kitty.conf
envsubst < ~/.config/termite/base > ~/.config/termite/config
envsubst < ~/.config/termite/$THEME >> ~/.config/termite/config

# i3 theme
cat ~/.config/i3/themes/$THEME/config ~/.config/i3/config.base > ~/.config/i3/config

# start window manager
#exec awesome
exec i3
