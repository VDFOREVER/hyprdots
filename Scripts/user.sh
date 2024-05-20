#!/bin/bash

#install configs
cp -R ../Config/.* ~/

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
cd ~/.local/pkgs/void-packages

./xbps-src pkg hyprland
./xbps-src pkg xdg-desktop-portal-hyprland
./xbps-src pkg hyprland-protocols
./xbps-src pkg hyprlock
./xbps-src pkg hyprpaper
./xbps-src pkg hypridel
./xbps-src pkg hyprcursor

xbps-install -R hostdir/binpkgs hyprland
xbps-install -R hostdir/binpkgs hyprland-protocols
xbps-install -R hostdir/binpkgs xdg-desktop-portal-hyprland
xbps-install -R hostdir/binpkgs hyprlock
xbps-install -R hostdir/binpkgs hyprpaper
xbps-install -R hostdir/binpkgs hypridel
xbps-install -R hostdir/binpkgs hyprcursor

doas usermod -aG _seatd $USER

#vesktop
cd ~/.local/pkgs/
git clone https://github.com/CODJointOps/vesktop-void-template.git
mv vesktop-void-template/ ./void-packages/vesktop
cd void-packages
./xbps-src pkg vesktop
doas xbps-install -R hostdir/binpkgs vesktop

#libvirtd
doas usermod -aG kvm $USER
doas usermod -aG libvirt $USER

#install fish
chsh

#other settings
doas usermod -aG wheel $USER
source "$HOME/.cargo/env.fish"
sh settings.sh
