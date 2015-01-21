#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

pasystray &
compton --config ~/.compton.conf -b
/home/invader/scripts/external.sh &
unclutter &
exec awesome 
#exec dwm 
