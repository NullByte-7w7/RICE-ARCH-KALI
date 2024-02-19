#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/meubar.log /tmp/polybar2.log
polybar meubar 2>&1 | tee -a /tmp/polybar1.log & disown

#Start wallpaper
/root/.feh

# start my resolution
xrandr -s 1440x900

# change my keyboard for abnts
setxkbmap -model abnts -layout br

echo "Bars launched..."
