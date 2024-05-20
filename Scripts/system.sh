#!/bin/bash

#ignoreokgs.conf
echo "
ignorepkg=sudo
ignorepkg=linux-firmware-nvidia
ignorepkg=linux-firmware-intel
" >> /etc/xbps.d/ignorepkgs.conf

#install all app
xbps-install -S $(cat app.lst) $(cat hypr.lst)
xbps-remove sudo
xbps-remove linux-firmware-nvidia
xbps-remove linux-firmware-intel

#doas settings
echo "permit persist :wheel" >> /etc/doas.conf

#other settings
ln -s /etc/sv/dbus /var/service
ln -s /etc/sv/polkitd /var/service
ln -s /etc/sv/seatd /var/service
ln -s /etc/sv/elogind /var/service
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime