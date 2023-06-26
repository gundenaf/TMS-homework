#!/bin/bash

/usr/sbin/ntpdate 195.13.23.5 && /sbin/hwclock --systohc

while true
do
tar -zcvf "/etc/backups/$(date '+%Y-%m-%d').tar.gz" /home/vagrant/
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> /var/log/my_backup
echo "backup is stored here $(ls) +'-lah' /etc/backups/" >> /var/log/my_backup
find /etc/backups/ -type f -name '*.tar.gz' -mindepth 1 -mtime +2 -delete
sleep 3600
done