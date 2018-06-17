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

cat ~/.config/termite/base > ~/.config/termite/config
cat ~/.config/termite/$THEME >> ~/.config/termite/config

exec awesome
