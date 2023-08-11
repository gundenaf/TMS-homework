```bash
sudo apt update
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Hit:2 http://archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [731 kB]
Get:5 http://archive.ubuntu.com/ubuntu jammy-backports InRelease [108 kB]
Get:6 http://archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [14.1 MB]
Get:7 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en [147 kB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [705 kB]
Get:9 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en [110 kB]
Get:10 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 c-n-f Metadata [576 B]
Get:11 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [716 kB]
Get:12 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en [118 kB]
Get:13 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [14.2 kB]
Get:14 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [19.4 kB]
Get:15 http://security.ubuntu.com/ubuntu jammy-security/multiverse Translation-en [4,068 B]
Get:16 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata [228 B]
Get:17 http://archive.ubuntu.com/ubuntu jammy/universe Translation-en [5,652 kB]
Get:18 http://archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata [286 kB]
Get:19 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [217 kB]
Get:20 http://archive.ubuntu.com/ubuntu jammy/multiverse Translation-en [112 kB]
Get:21 http://archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata [8,372 B]
Get:22 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [993 kB]
Get:23 http://archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [210 kB]
Get:24 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [13.9 kB]
Get:25 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [748 kB]
Get:26 http://archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en [116 kB]
Get:27 http://archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 c-n-f Metadata [576 B]
Get:28 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [899 kB]
Get:29 http://archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [180 kB]
Get:30 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [18.6 kB]
Get:31 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [24.1 kB]
Get:32 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en [6,312 B]
Get:33 http://archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata [444 B]
Get:34 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [40.6 kB]
Get:35 http://archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [9,800 B]
Get:36 http://archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [388 B]
Get:37 http://archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata [116 B]
Get:38 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [20.3 kB]
Get:39 http://archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [14.4 kB]
Get:40 http://archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [480 B]
Get:41 http://archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata [116 B]
Fetched 26.6 MB in 6s (4,166 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg
Reading package lists...
Building dependency tree...
Reading state information...
ca-certificates is already the newest version (20211016ubuntu0.22.04.1).
ca-certificates set to manually installed.
curl is already the newest version (7.81.0-1ubuntu1.10).
curl set to manually installed.
gnupg is already the newest version (2.2.27-3ubuntu2.1).
gnupg set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt update
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
Get:5 https://download.docker.com/linux/ubuntu jammy InRelease [48.9 kB]
Get:6 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages [15.5 kB]
Fetched 64.4 kB in 1s (116 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
```