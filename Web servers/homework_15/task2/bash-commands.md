```bash
lvmtest@lvmtest:~$ sudo apt -y install apache2 php-fpm
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap liblua5.3-0 libsodium23 php-common php7.4-cli php7.4-common
  php7.4-fpm php7.4-json php7.4-opcache php7.4-readline psmisc ssl-cert
Suggested packages:
  apache2-doc apache2-suexec-pristine | apache2-suexec-custom www-browser php-pear
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap liblua5.3-0 libsodium23 php-common php-fpm php7.4-cli
  php7.4-common php7.4-fpm php7.4-json php7.4-opcache php7.4-readline psmisc ssl-cert
0 upgraded, 20 newly installed, 0 to remove and 0 not upgraded.
Need to get 7,009 kB of archives.
After this operation, 27.8 MB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bullseye/main amd64 libapr1 amd64 1.7.0-6+deb11u2 [106 kB]
Get:2 http://security.debian.org/debian-security bullseye-security/main amd64 php7.4-common amd64 7.4.33-1+deb11u4 [1,024 kB]
Get:3 http://deb.debian.org/debian bullseye/main amd64 libaprutil1 amd64 1.6.1-5+deb11u1 [92.3 kB]
Get:4 http://deb.debian.org/debian bullseye/main amd64 libaprutil1-dbd-sqlite3 amd64 1.6.1-5+deb11u1 [19.0 kB]
Get:5 http://deb.debian.org/debian bullseye/main amd64 libaprutil1-ldap amd64 1.6.1-5+deb11u1 [17.2 kB]
Get:6 http://deb.debian.org/debian bullseye/main amd64 liblua5.3-0 amd64 5.3.3-1.1+b1 [120 kB]
Get:7 http://deb.debian.org/debian bullseye/main amd64 apache2-bin amd64 2.4.56-1~deb11u2 [1,431 kB]
Get:8 http://security.debian.org/debian-security bullseye-security/main amd64 php7.4-json amd64 7.4.33-1+deb11u4 [19.3 kB]
Get:9 http://security.debian.org/debian-security bullseye-security/main amd64 php7.4-opcache amd64 7.4.33-1+deb11u4 [198 kB]
Get:10 http://security.debian.org/debian-security bullseye-security/main amd64 php7.4-readline amd64 7.4.33-1+deb11u4 [12.3 kB]
Get:11 http://security.debian.org/debian-security bullseye-security/main amd64 php7.4-cli amd64 7.4.33-1+deb11u4 [1,427 kB]
Get:12 http://deb.debian.org/debian bullseye/main amd64 apache2-data all 2.4.56-1~deb11u2 [160 kB]
Get:13 http://deb.debian.org/debian bullseye/main amd64 apache2-utils amd64 2.4.56-1~deb11u2 [265 kB]
Get:14 http://security.debian.org/debian-security bullseye-security/main amd64 php7.4-fpm amd64 7.4.33-1+deb11u4 [1,439 kB]
Get:15 http://deb.debian.org/debian bullseye/main amd64 apache2 amd64 2.4.56-1~deb11u2 [278 kB]
Get:16 http://deb.debian.org/debian bullseye/main amd64 libsodium23 amd64 1.0.18-1 [161 kB]
Get:17 http://deb.debian.org/debian bullseye/main amd64 psmisc amd64 23.4-2 [198 kB]
Get:18 http://deb.debian.org/debian bullseye/main amd64 php-common all 2:76 [15.6 kB]
Get:19 http://deb.debian.org/debian bullseye/main amd64 php-fpm all 2:7.4+76 [6,424 B]
Get:20 http://deb.debian.org/debian bullseye/main amd64 ssl-cert all 1.1.0+nmu1 [21.0 kB]
Fetched 7,009 kB in 1s (9,832 kB/s)                                      
Preconfiguring packages ...
Selecting previously unselected package libapr1:amd64.
(Reading database ... 33596 files and directories currently installed.)
Preparing to unpack .../00-libapr1_1.7.0-6+deb11u2_amd64.deb ...
Unpacking libapr1:amd64 (1.7.0-6+deb11u2) ...
Selecting previously unselected package libaprutil1:amd64.
Preparing to unpack .../01-libaprutil1_1.6.1-5+deb11u1_amd64.deb ...
Unpacking libaprutil1:amd64 (1.6.1-5+deb11u1) ...
Selecting previously unselected package libaprutil1-dbd-sqlite3:amd64.
Preparing to unpack .../02-libaprutil1-dbd-sqlite3_1.6.1-5+deb11u1_amd64.deb ...
Unpacking libaprutil1-dbd-sqlite3:amd64 (1.6.1-5+deb11u1) ...
Selecting previously unselected package libaprutil1-ldap:amd64.
Preparing to unpack .../03-libaprutil1-ldap_1.6.1-5+deb11u1_amd64.deb ...
Unpacking libaprutil1-ldap:amd64 (1.6.1-5+deb11u1) ...
Selecting previously unselected package liblua5.3-0:amd64.
Preparing to unpack .../04-liblua5.3-0_5.3.3-1.1+b1_amd64.deb ...
Unpacking liblua5.3-0:amd64 (5.3.3-1.1+b1) ...
Selecting previously unselected package apache2-bin.
Preparing to unpack .../05-apache2-bin_2.4.56-1~deb11u2_amd64.deb ...
Unpacking apache2-bin (2.4.56-1~deb11u2) ...
Selecting previously unselected package apache2-data.
Preparing to unpack .../06-apache2-data_2.4.56-1~deb11u2_all.deb ...
Unpacking apache2-data (2.4.56-1~deb11u2) ...
Selecting previously unselected package apache2-utils.
Preparing to unpack .../07-apache2-utils_2.4.56-1~deb11u2_amd64.deb ...
Unpacking apache2-utils (2.4.56-1~deb11u2) ...
Selecting previously unselected package apache2.
Preparing to unpack .../08-apache2_2.4.56-1~deb11u2_amd64.deb ...
Unpacking apache2 (2.4.56-1~deb11u2) ...
Selecting previously unselected package libsodium23:amd64.
Preparing to unpack .../09-libsodium23_1.0.18-1_amd64.deb ...
Unpacking libsodium23:amd64 (1.0.18-1) ...
Selecting previously unselected package psmisc.
Preparing to unpack .../10-psmisc_23.4-2_amd64.deb ...
Unpacking psmisc (23.4-2) ...
Selecting previously unselected package php-common.
Preparing to unpack .../11-php-common_2%3a76_all.deb ...
Unpacking php-common (2:76) ...
Selecting previously unselected package php7.4-common.
Preparing to unpack .../12-php7.4-common_7.4.33-1+deb11u4_amd64.deb ...
Unpacking php7.4-common (7.4.33-1+deb11u4) ...
Selecting previously unselected package php7.4-json.
Preparing to unpack .../13-php7.4-json_7.4.33-1+deb11u4_amd64.deb ...
Unpacking php7.4-json (7.4.33-1+deb11u4) ...
Selecting previously unselected package php7.4-opcache.
Preparing to unpack .../14-php7.4-opcache_7.4.33-1+deb11u4_amd64.deb ...
Unpacking php7.4-opcache (7.4.33-1+deb11u4) ...
Selecting previously unselected package php7.4-readline.
Preparing to unpack .../15-php7.4-readline_7.4.33-1+deb11u4_amd64.deb ...
Unpacking php7.4-readline (7.4.33-1+deb11u4) ...
Selecting previously unselected package php7.4-cli.
Preparing to unpack .../16-php7.4-cli_7.4.33-1+deb11u4_amd64.deb ...
Unpacking php7.4-cli (7.4.33-1+deb11u4) ...
Selecting previously unselected package php7.4-fpm.
Preparing to unpack .../17-php7.4-fpm_7.4.33-1+deb11u4_amd64.deb ...
Unpacking php7.4-fpm (7.4.33-1+deb11u4) ...
Selecting previously unselected package php-fpm.
Preparing to unpack .../18-php-fpm_2%3a7.4+76_all.deb ...
Unpacking php-fpm (2:7.4+76) ...
Selecting previously unselected package ssl-cert.
Preparing to unpack .../19-ssl-cert_1.1.0+nmu1_all.deb ...
Unpacking ssl-cert (1.1.0+nmu1) ...
Setting up libsodium23:amd64 (1.0.18-1) ...
Setting up psmisc (23.4-2) ...
Setting up libapr1:amd64 (1.7.0-6+deb11u2) ...
Setting up ssl-cert (1.1.0+nmu1) ...
Setting up liblua5.3-0:amd64 (5.3.3-1.1+b1) ...
Setting up apache2-data (2.4.56-1~deb11u2) ...
Setting up libaprutil1:amd64 (1.6.1-5+deb11u1) ...
Setting up php-common (2:76) ...
Created symlink /etc/systemd/system/timers.target.wants/phpsessionclean.timer → /lib/systemd/system/phpsessionclean.timer.
Setting up php7.4-common (7.4.33-1+deb11u4) ...

Creating config file /etc/php/7.4/mods-available/calendar.ini with new version

Creating config file /etc/php/7.4/mods-available/ctype.ini with new version

Creating config file /etc/php/7.4/mods-available/exif.ini with new version

Creating config file /etc/php/7.4/mods-available/fileinfo.ini with new version

Creating config file /etc/php/7.4/mods-available/ffi.ini with new version

Creating config file /etc/php/7.4/mods-available/ftp.ini with new version

Creating config file /etc/php/7.4/mods-available/gettext.ini with new version

Creating config file /etc/php/7.4/mods-available/iconv.ini with new version

Creating config file /etc/php/7.4/mods-available/pdo.ini with new version

Creating config file /etc/php/7.4/mods-available/phar.ini with new version

Creating config file /etc/php/7.4/mods-available/posix.ini with new version

Creating config file /etc/php/7.4/mods-available/shmop.ini with new version

Creating config file /etc/php/7.4/mods-available/sockets.ini with new version

Creating config file /etc/php/7.4/mods-available/sysvmsg.ini with new version

Creating config file /etc/php/7.4/mods-available/sysvsem.ini with new version

Creating config file /etc/php/7.4/mods-available/sysvshm.ini with new version

Creating config file /etc/php/7.4/mods-available/tokenizer.ini with new version
Setting up php7.4-readline (7.4.33-1+deb11u4) ...

Creating config file /etc/php/7.4/mods-available/readline.ini with new version
Setting up libaprutil1-ldap:amd64 (1.6.1-5+deb11u1) ...
Setting up libaprutil1-dbd-sqlite3:amd64 (1.6.1-5+deb11u1) ...
Setting up php7.4-opcache (7.4.33-1+deb11u4) ...

Creating config file /etc/php/7.4/mods-available/opcache.ini with new version
Setting up apache2-utils (2.4.56-1~deb11u2) ...
Setting up php7.4-json (7.4.33-1+deb11u4) ...

Creating config file /etc/php/7.4/mods-available/json.ini with new version
Setting up php7.4-cli (7.4.33-1+deb11u4) ...
update-alternatives: using /usr/bin/php7.4 to provide /usr/bin/php (php) in auto mode
update-alternatives: using /usr/bin/phar7.4 to provide /usr/bin/phar (phar) in auto mode
update-alternatives: using /usr/bin/phar.phar7.4 to provide /usr/bin/phar.phar (phar.phar) in auto mode

Creating config file /etc/php/7.4/cli/php.ini with new version
Setting up apache2-bin (2.4.56-1~deb11u2) ...
Setting up php7.4-fpm (7.4.33-1+deb11u4) ...
Package apache2 is not configured yet. Will defer actions by package php7.4-fpm.

Creating config file /etc/php/7.4/fpm/php.ini with new version
NOTICE: Not enabling PHP 7.4 FPM by default.
NOTICE: To enable PHP 7.4 FPM in Apache2 do:
NOTICE: a2enmod proxy_fcgi setenvif
NOTICE: a2enconf php7.4-fpm
NOTICE: You are seeing this message because you have apache2 package installed.
Created symlink /etc/systemd/system/multi-user.target.wants/php7.4-fpm.service → /lib/systemd/system/php7.4-fpm.service.
Setting up apache2 (2.4.56-1~deb11u2) ...
Enabling module mpm_event.
Enabling module authz_core.
Enabling module authz_host.
Enabling module authn_core.
Enabling module auth_basic.
Enabling module access_compat.
Enabling module authn_file.
Enabling module authz_user.
Enabling module alias.
Enabling module dir.
Enabling module autoindex.
Enabling module env.
Enabling module mime.
Enabling module negotiation.
Enabling module setenvif.
Enabling module filter.
Enabling module deflate.
Enabling module status.
Enabling module reqtimeout.
Enabling conf charset.
Enabling conf localized-error-pages.
Enabling conf other-vhosts-access-log.
Enabling conf security.
Enabling conf serve-cgi-bin.
Enabling site 000-default.
Created symlink /etc/systemd/system/multi-user.target.wants/apache2.service → /lib/systemd/system/apache2.service.
Job for apache2.service failed because the control process exited with error code.
See "systemctl status apache2.service" and "journalctl -xe" for details.
Created symlink /etc/systemd/system/multi-user.target.wants/apache-htcacheclean.service → /lib/systemd/system/apache-htcacheclean.service.
Setting up php-fpm (2:7.4+76) ...
Processing triggers for man-db (2.9.4-2) ...
Processing triggers for libc-bin (2.31-13+deb11u6) ...
Processing triggers for php7.4-cli (7.4.33-1+deb11u4) ...
Processing triggers for php7.4-fpm (7.4.33-1+deb11u4) ...
NOTICE: Not enabling PHP 7.4 FPM by default.
NOTICE: To enable PHP 7.4 FPM in Apache2 do:
NOTICE: a2enmod proxy_fcgi setenvif
NOTICE: a2enconf php7.4-fpm
NOTICE: You are seeing this message because you have apache2 package installed.
lvmtest@lvmtest:~$ sudo nano /etc/apache2/ports.conf
lvmtest@lvmtest:~$ sudo nano /etc/apache2/sites-available/tms.by.conf
lvmtest@lvmtest:~$ sudo a2ensite tms.by
Enabling site tms.by.
To activate the new configuration, you need to run:
  systemctl reload apache2
lvmtest@lvmtest:~$ sudo nano /etc/nginx/sites-available/tms.by 
lvmtest@lvmtest:~$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
lvmtest@lvmtest:~$ sudo systemctl restart nginx
lvmtest@lvmtest:~$ sudo systemctl restart apache2   
lvmtest@lvmtest:~$ curl -H "Host:tms.by" 127.0.0.1:8080
<html>
    <head>
        <title>Mikhalenka. Web Servers. Part I</title>
    </head>
    <body>
        <p>Mikhalenka. Web Servers, Part I</p>
    </body>
</html>
sudo netstat -tlpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      484/sshd: /usr/sbin 
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      10425/nginx: master 
tcp6       0      0 :::22                   :::*                    LISTEN      484/sshd: /usr/sbin 
tcp6       0      0 :::8080                 :::*                    LISTEN      10553/apache2       
tcp6       0      0 :::80                   :::*                    LISTEN      10425/nginx: master 
```