#!/bin/bash

nginx_setup() {
    echo "Update packages"
    sudo apt update
    echo "======================================"

    echo "Install nginx, curl, netstat"
    sudo apt install nginx curl net-tools -y
    echo "======================================"

    echo "Create tms.by site directory"
    sudo mkdir -p /var/www/tms.by/html
    echo "======================================"

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
    echo "======================================"

    echo "Create nginx config for site tms.by"
    sudo tee /etc/nginx/sites-available/tms.by > /dev/null <<EOT
server {
    listen       80;
    server_name  www.tms.by;

    location / {
        root   /var/www/tms.by/html;
        index  index.html index.htm;
    }
}
EOT
    echo "======================================"

    echo "Create symlink"
    sudo ln -s /etc/nginx/sites-available/tms.by /etc/nginx/sites-enabled/
    echo "======================================"

    echo "Add current user to www-data group"
    sudo usermod -aG www-data $USER
    echo "======================================"

    echo "Set proper permissions to /var/www directory"
    sudo chown -R www-data:www-data /var/www
    echo "======================================"

    echo "Restart Nginx"
    sudo systemctl restart nginx
    echo "======================================"

    echo "Add tms.by in hosts"
    echo "127.0.0.1 tms.by www.tms.by" | sudo tee -a /etc/hosts
    echo "======================================"

    echo "Check if site works"
    curl -H "Host:tms.by" 127.0.0.1
    echo "======================================"

    echo "Show netstat input"
    sudo netstat -tlpn
    echo "======================================"
}

nginx_apache_setup() {
    echo "Update packages"
    sudo apt update
    echo "======================================"

    echo "Install nginx, Apache2, curl, netstat"
    sudo apt install -y nginx apache2 libapache2-mod-fcgid php-fpm curl net-tools
    echo "======================================"

    echo "Changing port from 80 to 8080 in Apache2"
    sudo sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
    echo "======================================"

    echo "Create tms.by site directory"
    sudo mkdir -p /var/www/tms.by/html
    echo "======================================"

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
    echo "======================================"

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
    echo "======================================"

    echo "Enable site tms.by in Apache2"
    sudo a2ensite tms.by.conf
    echo "======================================"

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
    echo "======================================"

    echo "Create symlink"
    sudo ln -s /etc/nginx/sites-available/tms.by /etc/nginx/sites-enabled/
    echo "======================================"

    echo "Add current user to www-data group"
    sudo usermod -aG www-data $USER
    echo "======================================"

    echo "Set proper permissions to /var/www directory"
    sudo chown -R www-data:www-data /var/www
    echo "======================================"

    echo "Restart Nginx"
    sudo systemctl restart nginx
    echo "======================================"

    echo "Restart Apache2"
    sudo systemctl restart apache2
    echo "======================================"

    echo "Add tms.by in hosts"
    echo "127.0.0.1 tms.by www.tms.by" | sudo tee -a /etc/hosts
    echo "======================================"

    echo "Check if site works"
    curl -H "Host:tms.by" 127.0.0.1:8080
    echo "======================================"

    echo "Show netstat input"
    sudo netstat -tlpn
    echo "======================================"
}

read -p "Type 1 for nginx setup, type 2 for nginx with Apache setup: " input

case $input in
    1)
        nginx_setup
        ;;
    2)
        nginx_apache_setup
        ;;
    *)
        echo "ERROR: value is entered incorrectly."
        ;;
esac