#!/bin/bash

setxkbmap pl &
compton &
pulseaudio -D
pasystray & 
udiskie --tray &
setxkbmap -option caps:escape &
exec awesome
