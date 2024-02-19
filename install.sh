#!/usr/bin/env bash
#HI, DEVELOPER DARSEC, THIS IS MY RICE FOR ARCH LINUX.

if [ $(/usr/bin/whoami) == "root" ]; then

	#install dependencies
	echo -n "Installing the dependencies"
	for i in {1..3}
	echo -n "."
	sleep 0.5
	
	#installing
	pacman -S feh && pacman -S fish && pacman -S i3 && pacman -S polybar && pacman -S rofi && pacman -S alacritty


	#moved i3 for /etc
	cp -r i3 /etc/

	#moved polybar for /root/.config
	cp -r polybar /$HOME/.config/	

	#moved .feh for /root/.config
	cp feh /$HOME/.config/.feh

	#moved rofi for /root/.config
	cp -r rofi /$HOME/.config/	

	#moved directory wallpaper for root
	cp -r wallpaper /$HOME/.config/

	#moved alacritty for /root/.config/
	cp -r alacritty /$HOME/.config/

	# RESTART I3 AND INIT POLYBAR
	i3 restart
	/$HOME/.config/polybar/launch.sh

	echo "THANKS FOR USE MY RICE!"

else

	echo "YOU ARE NOT ROOT, RUN WITH ROOT! >> sudo $0"
fi
