# sudo apt install -y deluged deluge-web deluge-console python3-mako
# start and kill for it to create configs
deluged
sleep 10 && echo "Deluged run, now killing it"
sudo pkill -i deluged

echo "mathetes:2112:10" >> ~/.config/deluge/auth

# mkdir /media/HDD/downloads

