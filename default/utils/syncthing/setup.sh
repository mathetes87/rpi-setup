#!/bin/sh

sudo apt install apt-transport-https
curl -s https://syncthing.net/release-key.txt | gpg --dearmor | sudo tee /usr/share/keyrings/syncthing-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install syncthing -y

# generate config files
# syncthing
cp -f ./utils/syncthing/config.xml /home/mathetes/.config/syncthing/config.xml
sudo cp -f ./utils/syncthing/syncthing.service /lib/systemd/system/syncthing.service
sudo systemctl enable syncthing
sudo systemctl start syncthing
