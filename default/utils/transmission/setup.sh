sudo apt install transmission-daemon -y
sudo systemctl stop transmission-daemon
cp -f ./utils/transmission/settings.json /etc/transmission-daemon/settings.json
cp -f ./utils/transmission/transmission-daemon /etc/init.d/transmission-daemon
cp -f ./utils/transmission/transmission-daemon.service /etc/systemd/system/multi-user.target.wants/transmission-daemon.service
echo "Replaced Transmission configuration files"
sudo systemctl daemon-reload
sudo chown -R mathetes:mathetes /etc/transmission-daemon
# symbolic link
sudo mkdir -p /home/mathetes/.config/transmission-daemon/
sudo ln -s /etc/transmission-daemon/settings.json /home/mathetes/.config/transmission-daemon/
sudo chown -R mathetes:mathetes /home/mathetes/.config/transmission-daemon/

sudo systemctl start transmission-daemon