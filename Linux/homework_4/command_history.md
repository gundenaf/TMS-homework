```bash
vagrant@ubuntu-jammy:/backups$ ls -l
total 12
-rw-r--r-- 1 root root 4522 Apr 17 08:06 2023-04-17.tar.gz
-rw-r--r-- 1 root root  381 Apr 17 08:11 backup.sh
vagrant@ubuntu-jammy:/backups$ sudo chmod +x backup.sh 
vagrant@ubuntu-jammy:/backups$ cd ..
vagrant@ubuntu-jammy:/$ sudo mkdir /etc/scripts
vagrant@ubuntu-jammy:/$ sudo mv /backups/backup.sh /etc/scripts/
vagrant@ubuntu-jammy:/$ sudo mv backups/ /etc/
vagrant@ubuntu-jammy:/etc$ cd scripts/
vagrant@ubuntu-jammy:/etc/scripts$ ls -l
total 4
-rwxr-xr-x 1 root root 381 Apr 17 08:11 backup.sh
vagrant@ubuntu-jammy:/etc/scripts$ sudo chmod +x backup.sh 
vagrant@ubuntu-jammy:/etc/scripts$ sudo nano backup.sh 
vagrant@ubuntu-jammy:/etc/scripts$ sudo ./backup.sh 
17 Apr 08:13:43 ntpdate[1303]: adjust time server 195.13.23.5 offset -0.016650 sec
tar: Removing leading `/' from member names
/home/vagrant/
/home/vagrant/script.sh
/home/vagrant/.bashrc
/home/vagrant/.bash_history
/home/vagrant/ubuntu_repo.md
/home/vagrant/.ssh/
/home/vagrant/.ssh/authorized_keys
/home/vagrant/.profile
/home/vagrant/.cache/
/home/vagrant/.cache/motd.legal-displayed
/home/vagrant/.local/
/home/vagrant/.local/share/
/home/vagrant/.local/share/nano/
/home/vagrant/.bash_logout
find: warning: you have specified the global option -mindepth after the argument -type, but global options are not positional, i.e., -mindepth affects tests specified before it as well as those specified after it.  Please specify global options before other arguments.
vagrant@ubuntu-jammy:/etc/scripts$ ls -l /etc/backups/
total 16
-rw-r--r-- 1 root root 4522 Apr 17 08:06  2023-04-17.tar.gz
vagrant@ubuntu-jammy:/etc/scripts$ cd /etc/backups/
vagrant@ubuntu-jammy:/etc/backups$ sudo nano /etc/systemd/system/homebackup.service
vagrant@ubuntu-jammy:/etc/backups$ sudo systemctl daemon-reload
vagrant@ubuntu-jammy:/etc/backups$ sudo systemctl enable homebackup.service 
Created symlink /etc/systemd/system/multi-user.target.wants/homebackup.service → /etc/systemd/system/homebackup.service.
vagrant@ubuntu-jammy:/etc/scripts$ sudo systemctl start homebackup.service
vagrant@ubuntu-jammy:/etc/scripts$ sudo systemctl status homebackup.service
● homebackup.service - Home Backup Script
     Loaded: loaded (/etc/systemd/system/homebackup.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-04-17 08:24:38 UTC; 1min 0s ago
   Main PID: 2067 (backup.sh)
      Tasks: 2 (limit: 1115)
     Memory: 592.0K
        CPU: 959ms
     CGroup: /system.slice/homebackup.service
             ├─2067 /bin/bash /etc/scripts/backup.sh
             └─2076 sleep 3600

Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.ssh/authorized_keys
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.profile
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.cache/
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.cache/motd.legal-displayed
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.local/
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.local/share/
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.local/share/nano/
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.lesshst
Apr 17 08:24:45 ubuntu-jammy backup.sh[2071]: /home/vagrant/.bash_logout
Apr 17 08:25:34 ubuntu-jammy systemd[1]: homebackup.service: Current command vanished from the unit file, execution of the comman>
```
