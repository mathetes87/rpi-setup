#!/bin/sh

curl -sSL https://install.pi-hole.net | bash
sudo apt install unbound -y
sudo cp -f ./utils/pihole/pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf