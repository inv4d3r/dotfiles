#!/bin/bash

if [ -z "$THEME" ]
then
	xrdb -DTHEME_XRESOURCES="<$HOME/.config/xresources/default>" -merge ~/.Xresources
else
	xrdb -DTHEME_XRESOURCES="<$HOME/.config/xresources/$THEME>" -merge ~/.Xresources
fi

setxkbmap pl &
compton &
pulseaudio -D
pasystray &
udiskie --tray &
setxkbmap -option caps:escape &

envsubst < ~/.config/kitty/kitty.baseconf > ~/.config/kitty/kitty.conf
envsubst < ~/.config/termite/base > ~/.config/termite/config
envsubst < ~/.config/termite/$THEME >> ~/.config/termite/config

exec awesome
