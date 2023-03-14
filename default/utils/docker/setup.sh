# mount HDD in /mnt/media with new line in /etc/fstab

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $USER
sudo docker pull portainer/portainer:linux-arm

sudo cp rc.local /etc/rc.local
sudo chmod +x /etc/rc.local