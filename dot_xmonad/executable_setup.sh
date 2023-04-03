#!/bin/zsh
ibus-daemon -drxR
feh --bg-fill /home/raca/.xmonad/desktop.jpg
picom -b --config /home/raca/.xmonad/picom
killall -q polybar &
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q main -c /home/raca/.xmonad/polybar/config.ini&
kmonad $HOME/.kmonad.kbd
xset -dpms
setterm -blank 0 -powerdown 0
xset s off
