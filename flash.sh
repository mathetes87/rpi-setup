#!/bin/bash
sudo apt-get install -y pv curl python-pip unzip hdparm
curl -LO https://github.com/hypriot/flash/releases/download/2.7.2/flash
chmod +x flash
sudo mv flash /usr/local/bin/flash

export HYPRIOT_URI="https://github.com/hypriot/image-builder-rpi/releases/download/v1.12.3/hypriotos-rpi-v1.12.3.img.zip"

flash \
  --userdata ./flash-configs/userdata.yml \
  --bootconf ./flash-configs/config.txt \
  --device /dev/mmcblk0 \
  --force \
  ${HYPRIOT_URI}