#!/bin/sh
ibus-daemon -drxR &
feh --bg-scale /home/raca/.xmonad/desktop.jpg &
picom -b --config /home/raca/.xmonad/picom &
killall -q polybar &
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done 
polybar -q main -c /home/raca/.xmonad/polybar/config.ini&
