```bash
lvmtest@lvmtest:~$ sudo nano /var/users
lvmtest@lvmtest:~$ sudo ./myscript
Username: user22 Group: it
lvmtest@lvmtest:~$ tail -1 /etc/passwd
user22:x:1002:1002::/home/it/user22:/bin/bash
lvmtest@lvmtest:~$ sudo nano /var/users
lvmtest@lvmtest:~$ cut -d' ' -f1 /var/users
user30
user31
user32
user33
user34
user35
lvmtest@lvmtest:~$ sudo nano /var/users
lvmtest@lvmtest:~$ nano for
lvmtest@lvmtest:~$ chmod +x for 
lvmtest@lvmtest:~$ ./for 
This is 1
This is two
This is line #3
lvmtest@lvmtest:~$ nano for
lvmtest@lvmtest:~$ sudo ./for 
In this line: user30
In this line: it
In this line: user31
In this line: users
In this line: user32
In this line: it
In this line: user33
In this line: group33
In this line: user34
In this line: it
In this line: user35
In this line: users
lvmtest@lvmtest:~$ sudo cut -d' ' -f1 /var/users
user30
user31
user32
user33
user34
user35
lvmtest@lvmtest:~$ nano for
lvmtest@lvmtest:~$ ./for 
This is line: user30 it
This is line: user31 users
This is line: user32 it
This is line: user33 group33
This is line: user34 it
This is line: user35 users
lvmtest@lvmtest:~$ nano for
lvmtest@lvmtest:~$ nano for
lvmtest@lvmtest:~$ ./for 
Username: user30 Group: it
Username: user31 Group: users
Username: user32 Group: it
Username: user33 Group: group33
Username: user34 Group: it
Username: user35 Group: users
lvmtest@lvmtest:~$ nano myscript 
lvmtest@lvmtest:~$ sudo ./myscript 
Username: user30 Group: line
Username: user31 Group: line
Username: user32 Group: line
Username: user33 Group: line
Username: user34 Group: line
Username: user35 Group: line
lvmtest@lvmtest:~$ nano myscript 
lvmtest@lvmtest:~$ sudo ./myscript 
Username: user30 Group: it
Username: user31 Group: users
Username: user32 Group: it
Username: user33 Group: group33
Username: user34 Group: it
Username: user35 Group: users
groupadd: group 'users' already exists
useradd: user 'user35' already exists
lvmtest@lvmtest:~$ tail -5 /etc/passwd
lvmtest:x:1000:1000:lvmtest,,,:/home/lvmtest:/bin/bash
systemd-coredump:x:999:999:systemd Core Dumper:/:/usr/sbin/nologin
test:x:1001:1001::/home/test/test:/sbin/nologin
user22:x:1002:1002::/home/it/user22:/bin/bash
user35:x:1003:1003::/home/line/user35:/sbin/nologin
lvmtest@lvmtest:~$ nano myscript 
lvmtest@lvmtest:~$ nano myscript 
lvmtest@lvmtest:~$ sudo ./myscript 
Username: user30 Group: it
groupadd: group 'it' already exists
%it ALL=(ALL) ALL
mkdir: cannot create directory ‘/home/it’: File exists
Username: user31 Group: users
groupadd: group 'users' already exists
mkdir: cannot create directory ‘/home/users’: File exists
Username: user32 Group: it
groupadd: group 'it' already exists
%it ALL=(ALL) ALL
mkdir: cannot create directory ‘/home/it’: File exists
Username: user33 Group: group33
Username: user34 Group: it
groupadd: group 'it' already exists
%it ALL=(ALL) ALL
mkdir: cannot create directory ‘/home/it’: File exists
Username: user35 Group: users
groupadd: group 'users' already exists
mkdir: cannot create directory ‘/home/users’: File exists
useradd: user 'user35' already exists
lvmtest@lvmtest:~$ tail /etc/passwd
lvmtest:x:1000:1000:lvmtest,,,:/home/lvmtest:/bin/bash
systemd-coredump:x:999:999:systemd Core Dumper:/:/usr/sbin/nologin
test:x:1001:1001::/home/test/test:/sbin/nologin
user22:x:1002:1002::/home/it/user22:/bin/bash
user35:x:1003:1003::/home/line/user35:/sbin/nologin
user30:x:1004:1002::/home/it/user30:/bin/bash
user31:x:1005:100::/home/users/user31:/bin/bash
user32:x:1006:1002::/home/it/user32:/bin/bash
user33:x:1007:1004::/home/group33/user33:/bin/bash
user34:x:1008:1002::/home/it/user34:/bin/bash
lvmtest@lvmtest:~$ nano myscript 
lvmtest@lvmtest:~$ nano select
lvmtest@lvmtest:~$ chmod +x s
chmod: cannot access 's': No such file or directory
lvmtest@lvmtest:~$ chmod +x select 
lvmtest@lvmtest:~$ ./select 
1) One
2) Two
3) Three
#? 1
One
#? 2
Two
#? 3
Three
#? 2
Two
#? 3
Three
#? 1
One
#? ^Clvmtest@lvmtest:~$ nano case
lvmtest@lvmtest:~$ chmod +x case 
lvmtest@lvmtest:~$ ./case 
1) one
2) two
3) three
#? 2
2
#? 3
Wrong option
#? ^Clvmtest@lvmtest:~$ nano case
lvmtest@lvmtest:~$ nano case
lvmtest@lvmtest:~$ ./case 
1) one
2) two
3) stop
#? 1
1
#? 2
2
#? 4
Wrong option
#? 3  
lvmtest@lvmtest:~$ nano myscript 
lvmtest@lvmtest:~$ sudo rm /var/users 
lvmtest@lvmtest:~$ sudo ./myscript 
Welcome!
1) Add user
2) Show users
3) Exit
#? 1
Print username: user40
Print groupname: group40
#? 2
root
daemon
bin
sys
sync
games
man
lp
mail
news
uucp
proxy
www-data
backup
list
irc
gnats
nobody
_apt
systemd-network
systemd-resolve
messagebus
systemd-timesync
sshd
lvmtest
systemd-coredump
test
user22
user35
user30
user31
user32
user33
user34
user40
#? 3
```