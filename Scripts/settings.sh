#!/bin/bash

#setup zram
sudo sh -c 'cat << EOF >> /etc/systemd/zram-generator.conf 
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
swap-priority = 100
fs-type = swap
EOF'

systemctl daemon-reload
systemctl start systemd-zram-setup@zram0.service
systemctl enable --now dhcpcd

gsettings set org.gnome.desktop.interface icon-theme Tela-circle-grey
gsettings set org.gnome.desktop.interface gtk-theme Flat-Remix-GTK-Grey-Dark
gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors-light
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono 10'

#other
chmod +x ~/.config/waybar/weather.sh
chmod +x ~/.config/hypr/script/screenshot.sh
chmod +x ~/.config/hypr/script/dontkillsteam.sh
