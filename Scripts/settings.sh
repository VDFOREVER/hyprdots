#!/bin/bash

gsettings set org.gnome.desktop.interface icon-theme Tela-circle-grey
gsettings set org.gnome.desktop.interface gtk-theme Flat-Remix-GTK-Grey-Dark
gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors-light
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono 10'

#other
chmod +x ~/.config/waybar/weather.sh
chmod +x ~/.config/hypr/script/screenshot.sh
chmod +x ~/.config/hypr/script/dontkillsteam.sh
chmod +x ~/.config/hypr/script/grimblast