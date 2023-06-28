#!/bin/bash

echo "Update packages"
sudo apt update

echo "Install nginx, Apache2"
sudo apt install -y nginx apache2 libapache2-mod-fcgid php-fpm

echo "Changing port from 80 to 8080 in Apache2"
sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf

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

echo "Create Apache2 config for site tms.by"
sudo tee /etc/apache2/sites-available/tms.by.conf > /dev/null <<EOT
<VirtualHost *:8080>
    ServerName tms.by
    ServerAlias www.tms.by
    DocumentRoot /var/www/tms.by/html
    <Directory /var/www/tms.by/html>
        AllowOverride All
    </Directory>
</VirtualHost>
EOT

echo "Enable site tms.by in Apache2"
sudo a2ensite tms.by.conf

echo "Create nginx config for site tms.by"
sudo tee /etc/nginx/sites-available/tms.by > /dev/null <<EOT
server {
    listen 80;
    server_name tms.by www.tms.by;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOT

echo "Restart Nginx"
sudo systemctl restart nginx

echo "Restart Apache2"
sudo systemctl restart apache2

echo "Add tms.by in hosts"
echo "127.0.0.1 tms.by www.tms.by" | sudo tee -a /etc/hosts

echo "Check if site works"
curl -H "Host:tms.by" 127.0.0.1:8080

echo "Show netstat input"
sudo netstat -tlpn