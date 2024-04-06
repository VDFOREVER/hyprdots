#!/bin/bash

#install configs
cp -R ../Config/.* ~/

#install paru
sudo pacman -S git
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd ..
rm -rf paru-bin

#install all app
paru -S $(cat app.lst) $(cat hypr.lst)
paru -R base-devel sudo

#install fish
chsh

#other settings
sh settings.sh
