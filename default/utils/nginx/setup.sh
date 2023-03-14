# sudo apt-get remove apache2 -y
# sudo apt-get install nginx -y
# sudo systemctl start nginx

cp -f ./utils/nginx/rpi.conf /etc/nginx/sites-enabled/default

sudo systemctl reload nginx
