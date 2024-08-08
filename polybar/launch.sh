#!/usr/bin/env bash

user=$(who am i | cut -d " " -f1)
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/meubar.log /tmp/polybar2.log
polybar meubar 2>&1 | tee -a /tmp/polybar1.log & disown

#start picom
/usr/bin/picom &

# change my keyboard for abnts
/usr/bin/setxkbmap us

echo "Bars launched..."
