#!/bin/bash

#install configs
cp -R ../Config/.* ~/

#install all app
doas xbps-install -S $(cat app.lst) $(cat hypr.lst)
doas xbps-remove sudo

#install HYPRLAND
mkdir .local
mkdir .local/pkgs
cd .local/pkgs

git clone https://github.com/void-linux/void-packages.git
git clone https://github.com/Makrennel/hyprland-void.git

cd void-packages
./xbps-src binary-bootstrap

cd..
cd hyprland-void
cat common/shlibs >> ~/.local/pkgs/void-packages/common/shlibs
cp -r srcpkgs/* ~/.local/pkgs/void-packages/srcpkgs
cd
cd ~/.local/pkgs/void-packages

./xbps-src pkg hyprland
./xbps-src pkg xdg-desktop-portal-hyprland
./xbps-src pkg hyprland-protocols
./xbps-src pkg hyprlock
./xbps-src pkg hyprpaper
./xbps-src pkg hypridel
./xbps-src pkg hyprcursor

sudo xbps-install -R hostdir/binpkgs hyprland
sudo xbps-install -R hostdir/binpkgs hyprland-protocols
sudo xbps-install -R hostdir/binpkgs xdg-desktop-portal-hyprland
sudo xbps-install -R hostdir/binpkgs hyprlock
sudo xbps-install -R hostdir/binpkgs hyprpaper
sudo xbps-install -R hostdir/binpkgs hypridel
sudo xbps-install -R hostdir/binpkgs hyprcursor

sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/seatd /var/service
sudo ln -s /etc/sv/elogind /var/service

sudo usermod -aG _seatd $USER

#libvirtd
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER

#install fish
chsh

#other settings
sudo ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
source "$HOME/.cargo/env.fish"
sh settings.sh
