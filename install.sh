#!/usr/bin/env bash
#HI, DEVELOPER DARSEC, THIS IS MY RICE FOR ARCH LINUX.

# VARIABLE
user=$(who i am | cut -d " " -f1)


	#install dependencies
	echo -n "Installing the dependencies"
	for i in {1..3}; do
	echo -n "."
	sleep 0.5;
	done

	#clear
	clear
		
	#installing
	sudo pacman -S xorg-xrandr && pacman -S i3 && pacman -S feh && pacman -S fish && pacman -S i3 && pacman -S polybar && pacman -S rofi && pacman -S alacritty

	#clear screen
	clear

	#moved i3 for /etc
	sudo cp -r i3 /etc/

	#moved polybar for /home/user/.config
	cp -r polybar /home/$user/.config/	

	#moved .feh for /home/user/.config
	chmod +x feh && cp feh /home/$user/.config/.feh && chown $user:$user $HOME/.config/.feh

	#moved rofi for /home/user/.config
	cp -r rofi /home/$user/.config/	

	#moved directory wallpaper for /home/user/.config
	cp -r wallpaper /home/$user/.config/

	#moved alacritty for /home/user/.config/
	cp -r alacritty /home/$user/.config/

	#PERMISSION EXECUTION launch.sh
	chmod +x /home/$user/.config/polybar/launch.sh	
	
	# RESTART I3 AND INIT POLYBAR
	i3 restart
	/home/$user/.config/polybar/launch.sh

	#clear screen
	clear

	sleep 1
	
	echo "THANKS FOR USE MY RICE!"
