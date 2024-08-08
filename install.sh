#!/usr/bin/env bash
#HI, DEVELOPER NULLBYTE, THIS IS MY RICE FOR ARCH LINUX.

# VARIABLE
user=$(who i am | cut -d " " -f1)


# check executable exist
check(){
    path="/usr/bin/fc-cache"

    if [ -e "$path" ]; then
        echo "[*] Found '$path'"
	/usr/bin/fc-cache -fv
    else
        /usr/bin/echo "[!] NOT FOUND $path. PLEASE INSTALL fc-cache"
        exit 1
    fi
}

# Change shell
change_shell(){
	path="/usr/bin/chsh"

  	if [ -e "$path" ]; then 
  		/usr/bin/chsh -s /usr/bin/zsh
	else
 		/usr/bin/echo "[!] NOT FOUND PATH $path PLEASE INSTALL chsh"
		exit 1
	fi
}


# start install rice

if [ "$(whoami)" = "root" ]; then

    /usr/bin/echo "[!] NOT RUNNING WITH ROOT"
    exit 1

else

	# install dependencies
	echo -n "Installing the dependencies"
	for i in {1..3}; do
	echo -n "."
	sleep 0.5;
	done

	# clear
	/usr/bin/clear
		
	# installing
    	sudo pacman -S xorg-xrandr i3 feh fish polybar rofi alacritty picom --needed --noconfirm

	# clear screen
	/usr/bin/clear

	# moved i3 for /etc
	sudo /usr/bin/cp -r i3 /etc/

	# moved polybar for /home/user/.config
	/usr/bin/cp -r polybar /home/$user/.config/	

	# moved .feh for /home/user/.config
	/usr/bin/chmod +x feh && cp feh /home/$user/.config/.feh && chown $user:$user /home/$user/.config/.feh

	# moved rofi for /home/user/.config
	/usr/bin/cp -r rofi /home/$user/.config/	

	# moved directory wallpaper for /home/user/.config
	/usr/bin/cp -r wallpaper /home/$user/.config/

	# moved alacritty for /home/user/.config/
	/usr/bin/cp -r alacritty /home/$user/.config/

	# Moved file for /etc/xdg/picom.conf
	/usr/bin/cp picom.conf /etc/xdg/picom.conf

	# permissions directory scripts
	/usr/bin/chown $user:$user /home/darksec/.config/polybar/script
 	/usr/bin/chown $user:$user /home/darksec/.config/polybar/script/*.sh

	# zsh config file
 	/usr/bin/mv .zshrc /home/$user/
  	/usr/bin/mv zshrc.pre-oh-my-zsh /home/$user/.zshrc.pre-oh-my-zsh
	change_shell
 
     	# install fonts
    	/usr/bin/cp -r fonts/*ttf /usr/share/fonts/
    	check

	# PERMISSION EXECUTION launch.sh
	/usr/bin/chmod +x /home/$user/.config/polybar/launch.sh	
    	/usr/bin/chown $user:$user/.config/polybar/launch.sh

	# RESTART I3 AND INIT POLYBAR
	i3 restart
	/home/$user/.config/polybar/launch.sh

	# clear screen
	/usr/bin/clear

	/usr/bin/sleep 1
	
	/usr/bin/echo "THANKS FOR USE MY RICE! RESTART COMPUTER OR NOTEBOOK"

fi
