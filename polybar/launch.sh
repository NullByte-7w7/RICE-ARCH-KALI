#!/usr/bin/env bash
#darksec config
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/meubar.log /tmp/polybar2.log
polybar meubar 2>&1 | tee -a /tmp/polybar1.log & disown

#Start wallpaper
user=$(who am i | cut -d " " -f1)
/home/$user/.config/.feh

# start my resolution
xrandr -s 1920x1080 # change for resoluction with base in your monitor

# change my keyboard for abnts
setxkbmap -model abnts -layout br # change with base in your keyboard
