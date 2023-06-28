#!/bin/bash

echo "Update packages"
sudo apt update

echo "Install nginx"
sudo apt install nginx -y

echo "Create tms.by site directory"
sudo mkdir -p /var/www/tms.by/html

echo "Create file index.html for site tms.by"
sudo tee /var/www/tms.by/html/index.html > /dev/null <<EOT
<html>
    <head>
        <title>Mikhalenka. Web Servers. Part I</title>
    </head>
    <body>
        <p>Mikhalenka. Web Servers, Part I</p>
    </body>
</html>
EOT

echo "Create nginx config for site tms.by"
sudo tee /etc/nginx/sites-available/tms.by > /dev/null <<EOT
server {
        listen 80;
        listen [::]:80;

        root /var/www/tms.by/html;
        index index.html index.htm index.nginx-debian.html;

        server_name tms.by www.tms.by;

        location / {
                try_files $uri $uri/ =404;
        }
}
EOT

echo "Create symlink"
sudo ln -s /etc/nginx/sites-available/tms.by /etc/nginx/sites-enabled/

echo "Restart Nginx"
sudo systemctl restart nginx

echo "Add tms.by in hosts"
echo "127.0.0.1 tms.by www.tms.by" | sudo tee -a /etc/hosts

echo "Check if site works"
curl -H "Host:tms.by" 127.0.0.1

echo "Show netstat input"
sudo netstat -tlpn