```bash
sudo apt update
Hit:1 http://deb.debian.org/debian bullseye InRelease
Hit:2 http://security.debian.org/debian-security bullseye-security InRelease
Hit:3 http://deb.debian.org/debian bullseye-updates InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.

sudo fdisk -l

Disk /dev/sda: 8 GiB, 8589934592 bytes, 16777216 sectors
Disk model: VMware Virtual S
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sdb: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: VMware Virtual S
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xa05f0737

Device     Boot    Start      End  Sectors  Size Id Type
/dev/sdb1  *        2048  1953791  1951744  953M 83 Linux
/dev/sdb2        1953792 21485567 19531776  9.3G 83 Linux
/dev/sdb3       21485568 23439359  1953792  954M 82 Linux swap / Solaris

<!-- /dev/sdb - system drive, /dev/sda - drive, which will be used for LVM homework-->

sudo apt -y install lvm2
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  dmeventd libaio1 libdevmapper-event1.02.1 liblvm2cmd2.03 thin-provisioning-tools
The following NEW packages will be installed:
  dmeventd libaio1 libdevmapper-event1.02.1 liblvm2cmd2.03 lvm2 thin-provisioning-tools
0 upgraded, 6 newly installed, 0 to remove and 0 not upgraded.
Need to get 2,403 kB of archives.
After this operation, 8,760 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bullseye/main amd64 libaio1 amd64 0.3.112-9 [12.5 kB]
Get:2 http://deb.debian.org/debian bullseye/main amd64 libdevmapper-event1.02.1 amd64 2:1.02.175-2.1 [23.2 kB]
Get:3 http://deb.debian.org/debian bullseye/main amd64 liblvm2cmd2.03 amd64 2.03.11-2.1 [711 kB]
Get:4 http://deb.debian.org/debian bullseye/main amd64 dmeventd amd64 2:1.02.175-2.1 [69.4 kB]
Get:5 http://deb.debian.org/debian bullseye/main amd64 lvm2 amd64 2.03.11-2.1 [1,194 kB]
Get:6 http://deb.debian.org/debian bullseye/main amd64 thin-provisioning-tools amd64 0.9.0-1 [393 kB]
Fetched 2,403 kB in 0s (7,184 kB/s)          
Selecting previously unselected package libaio1:amd64.
(Reading database ... 33063 files and directories currently installed.)
Preparing to unpack .../0-libaio1_0.3.112-9_amd64.deb ...
Unpacking libaio1:amd64 (0.3.112-9) ...
Selecting previously unselected package libdevmapper-event1.02.1:amd64.
Preparing to unpack .../1-libdevmapper-event1.02.1_2%3a1.02.175-2.1_amd64.deb ...
Unpacking libdevmapper-event1.02.1:amd64 (2:1.02.175-2.1) ...
Selecting previously unselected package liblvm2cmd2.03:amd64.
Preparing to unpack .../2-liblvm2cmd2.03_2.03.11-2.1_amd64.deb ...
Unpacking liblvm2cmd2.03:amd64 (2.03.11-2.1) ...
Selecting previously unselected package dmeventd.
Preparing to unpack .../3-dmeventd_2%3a1.02.175-2.1_amd64.deb ...
Unpacking dmeventd (2:1.02.175-2.1) ...
Selecting previously unselected package lvm2.
Preparing to unpack .../4-lvm2_2.03.11-2.1_amd64.deb ...
Unpacking lvm2 (2.03.11-2.1) ...
Selecting previously unselected package thin-provisioning-tools.
Preparing to unpack .../5-thin-provisioning-tools_0.9.0-1_amd64.deb ...
Unpacking thin-provisioning-tools (0.9.0-1) ...
Setting up libdevmapper-event1.02.1:amd64 (2:1.02.175-2.1) ...
Setting up libaio1:amd64 (0.3.112-9) ...
Setting up thin-provisioning-tools (0.9.0-1) ...
Setting up liblvm2cmd2.03:amd64 (2.03.11-2.1) ...
Setting up dmeventd (2:1.02.175-2.1) ...
Created symlink /etc/systemd/system/sockets.target.wants/dm-event.socket → /lib/systemd/system/dm-event.socket.
dm-event.service is a disabled or a static unit, not starting it.
Setting up lvm2 (2.03.11-2.1) ...
update-initramfs: deferring update (trigger activated)
Created symlink /etc/systemd/system/sysinit.target.wants/blk-availability.service → /lib/systemd/system/blk-availability.service.
Created symlink /etc/systemd/system/sysinit.target.wants/lvm2-monitor.service → /lib/systemd/system/lvm2-monitor.service.
Created symlink /etc/systemd/system/sysinit.target.wants/lvm2-lvmpolld.socket → /lib/systemd/system/lvm2-lvmpolld.socket.
Processing triggers for initramfs-tools (0.140) ...
update-initramfs: Generating /boot/initrd.img-5.10.0-23-amd64
Processing triggers for libc-bin (2.31-13+deb11u6) ...
Processing triggers for man-db (2.9.4-2) ...

sudo pvcreate /dev/sda1
  Physical volume "/dev/sda1" successfully created.

sudo pvcreate /dev/sda2
  Physical volume "/dev/sda2" successfully created.

sudo vgcreate vg1 /dev/sda1 /dev/sda2
  Volume group "vg1" successfully created

sudo lvcreate -n lv1 -L 2G vg1
  Logical volume "lv1" created.

sudo lvcreate -n lv2 -L 2G vg1
  Logical volume "lv2" created.

sudo mkfs.ext4 /dev/vg1/lv1
mke2fs 1.46.2 (28-Feb-2021)
Creating filesystem with 524288 4k blocks and 131072 inodes
Filesystem UUID: 33eb282f-1244-4d9d-9e06-8e532af2e24f
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done 

sudo mkfs.ext4 /dev/vg1/lv2
mke2fs 1.46.2 (28-Feb-2021)
Creating filesystem with 524288 4k blocks and 131072 inodes
Filesystem UUID: 2a0a1f89-0ff4-48b0-8c2d-1c12b38d0f75
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done 

sudo fdisk -l


Disk /dev/sda: 8 GiB, 8589934592 bytes, 16777216 sectors
Disk model: VMware Virtual S
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x3cf22881

Device     Boot   Start      End Sectors Size Id Type
/dev/sda1          2048  8388607 8386560   4G 83 Linux
/dev/sda2       8388608 16777215 8388608   4G 83 Linux


Disk /dev/sdb: 20 GiB, 21474836480 bytes, 41943040 sectors
Disk model: VMware Virtual S
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xa05f0737

Device     Boot    Start      End  Sectors  Size Id Type
/dev/sdb1  *        2048  1953791  1951744  953M 83 Linux
/dev/sdb2        1953792 21485567 19531776  9.3G 83 Linux
/dev/sdb3       21485568 23439359  1953792  954M 82 Linux swap / Solaris


Disk /dev/mapper/vg1-lv1: 2 GiB, 2147483648 bytes, 4194304 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/vg1-lv2: 2 GiB, 2147483648 bytes, 4194304 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```
