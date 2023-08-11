```bash
docker@docker-node:~$ sudo ./docker_setup.sh 
======================================
[INFO] Installing Docker
Hit:1 http://security.debian.org/debian-security bookworm-security InRelease
Hit:2 http://deb.debian.org/debian bookworm InRelease
Hit:3 http://deb.debian.org/debian bookworm-updates InRelease
Reading package lists... Done
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ca-certificates is already the newest version (20230311).
curl is already the newest version (7.88.1-10+deb12u1).
gnupg is already the newest version (2.2.40-1.1).
The following packages were automatically installed and are no longer required:
  docker-ce-rootless-extras git git-man iptables liberror-perl libip6tc2 libltdl7 libnetfilter-conntrack3 libnfnetlink0 libslirp0 patch pigz slirp4netns
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 27 not upgraded.
Hit:1 http://security.debian.org/debian-security bookworm-security InRelease
Hit:2 http://deb.debian.org/debian bookworm InRelease                                              
Hit:3 http://deb.debian.org/debian bookworm-updates InRelease                                      
Get:4 https://download.docker.com/linux/debian bookworm InRelease [43.3 kB]                        
Get:5 https://download.docker.com/linux/debian bookworm/stable amd64 Packages [11.8 kB]
Fetched 55.1 kB in 0s (143 kB/s)     
Reading package lists... Done
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Suggested packages:
  aufs-tools cgroupfs-mount | cgroup-lite
The following NEW packages will be installed:
  containerd.io docker-buildx-plugin docker-ce docker-ce-cli docker-compose-plugin
0 upgraded, 5 newly installed, 0 to remove and 27 not upgraded.
Need to get 105 MB of archives.
After this operation, 393 MB of additional disk space will be used.
Get:1 https://download.docker.com/linux/debian bookworm/stable amd64 containerd.io amd64 1.6.21-1 [28.3 MB]
Get:2 https://download.docker.com/linux/debian bookworm/stable amd64 docker-buildx-plugin amd64 0.11.2-1~debian.12~bookworm [28.2 MB]
Get:3 https://download.docker.com/linux/debian bookworm/stable amd64 docker-ce-cli amd64 5:24.0.5-1~debian.12~bookworm [13.3 MB]
Get:4 https://download.docker.com/linux/debian bookworm/stable amd64 docker-ce amd64 5:24.0.5-1~debian.12~bookworm [22.9 MB]
Get:5 https://download.docker.com/linux/debian bookworm/stable amd64 docker-compose-plugin amd64 2.20.2-1~debian.12~bookworm [11.9 MB]
Fetched 105 MB in 2s (51.9 MB/s)               
apt-listchanges: Can't set locale; make sure $LC_* and $LANG are correct!
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
        LANGUAGE = "en_US:en",
        LC_ALL = (unset),
        LC_TIME = "en_US.UTF-8",
        LC_MONETARY = "pl_PL.UTF-8",
        LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to a fallback locale ("en_US.UTF-8").
locale: Cannot set LC_ALL to default locale: No such file or directory
Selecting previously unselected package containerd.io.
(Reading database ... 35411 files and directories currently installed.)
Preparing to unpack .../containerd.io_1.6.21-1_amd64.deb ...
Unpacking containerd.io (1.6.21-1) ...
Selecting previously unselected package docker-buildx-plugin.
Preparing to unpack .../docker-buildx-plugin_0.11.2-1~debian.12~bookworm_amd64.deb ...
Unpacking docker-buildx-plugin (0.11.2-1~debian.12~bookworm) ...
Selecting previously unselected package docker-ce-cli.
Preparing to unpack .../docker-ce-cli_5%3a24.0.5-1~debian.12~bookworm_amd64.deb ...
Unpacking docker-ce-cli (5:24.0.5-1~debian.12~bookworm) ...
Selecting previously unselected package docker-ce.
Preparing to unpack .../docker-ce_5%3a24.0.5-1~debian.12~bookworm_amd64.deb ...
Unpacking docker-ce (5:24.0.5-1~debian.12~bookworm) ...
Selecting previously unselected package docker-compose-plugin.
Preparing to unpack .../docker-compose-plugin_2.20.2-1~debian.12~bookworm_amd64.deb ...
Unpacking docker-compose-plugin (2.20.2-1~debian.12~bookworm) ...
Setting up docker-buildx-plugin (0.11.2-1~debian.12~bookworm) ...
Setting up containerd.io (1.6.21-1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Setting up docker-compose-plugin (2.20.2-1~debian.12~bookworm) ...
Setting up docker-ce-cli (5:24.0.5-1~debian.12~bookworm) ...
Setting up docker-ce (5:24.0.5-1~debian.12~bookworm) ...
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /lib/systemd/system/docker.socket.
Processing triggers for man-db (2.11.2-2) ...
======================================
======================================
[INFO] Pulling debian:latest image from DockerHub
latest: Pulling from library/debian
785ef8b9b236: Pull complete 
Digest: sha256:9f76a008888da28c6490bedf7bdaa919bac9b2be827afd58d6eb1b916e1e5918
Status: Downloaded newer image for debian:latest
docker.io/library/debian:latest
======================================
======================================
[INFO] Pulling alpine:latest image from DockerHub
latest: Pulling from library/alpine
Digest: sha256:82d1e9d7ed48a7523bdebc18cf6290bdb97b82302a8a9c27d4fe885949ea94d1
Status: Image is up to date for alpine:latest
docker.io/library/alpine:latest
======================================
======================================
[INFO] Starting the container dos-debian
ad5cb1f9c17dc0b3f7fb971522af4d25c5330167efe80e88a812b4a117995232
======================================
======================================
[INFO] Running containers:
CONTAINER ID   IMAGE           COMMAND   CREATED                  STATUS                  PORTS                                   NAMES
ad5cb1f9c17d   debian:latest   "bash"    Less than a second ago   Up Less than a second   0.0.0.0:2222->22/tcp, :::2222->22/tcp   dos-debian
======================================
======================================
[INFO] Starting the container dos-alpine
52bf2f060ba16a9e1cc4e84517d3bcde87182fb75f5c0a3a7159c66b9eb345a7
======================================
======================================
[INFO] Running containers:
CONTAINER ID   IMAGE           COMMAND     CREATED                  STATUS                  PORTS                                   NAMES
52bf2f060ba1   alpine:latest   "/bin/sh"   Less than a second ago   Up Less than a second   0.0.0.0:2222->22/tcp, :::2222->22/tcp   dos-alpine
======================================
======================================
[INFO] Stopping containers
dos-debian
dos-alpine
======================================
======================================
[INFO] Removing containers
dos-debian
dos-alpine
======================================
======================================
[INFO] Show system space
Filesystem      Size  Used Avail Use% Mounted on
udev            945M     0  945M   0% /dev
tmpfs           194M  740K  193M   1% /run
/dev/sda1       6.8G  2.4G  4.1G  37% /
tmpfs           967M     0  967M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/sda6        12G   80K   12G   1% /home
tmpfs           194M     0  194M   0% /run/user/1000
======================================
======================================
[INFO] List of all Docker images:
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
debian       latest    278727474c29   32 hours ago   116MB
alpine       latest    c1aabb73d233   6 weeks ago    7.33MB
======================================
======================================
[INFO] Inspecting debian:latest image:
[
    {
        "Id": "sha256:278727474c2935fca471835f8e09a78631bf93d6a414979f038abebc315fb8da",
        "RepoTags": [
            "debian:latest"
        ],
        "RepoDigests": [
            "debian@sha256:9f76a008888da28c6490bedf7bdaa919bac9b2be827afd58d6eb1b916e1e5918"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2023-07-27T23:24:30.369627115Z",
        "Container": "b12e54fd028db7c1760a0576e46bbd1dd5a52e4a6e070fd41b4fda947817a4e6",
        "ContainerConfig": {
            "Hostname": "b12e54fd028d",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"bash\"]"
            ],
            "Image": "sha256:277341568f63275cc28e1ab1b80f7d69be7b32fc3bc302ce42ea5ec35379a3fc",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "20.10.23",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "bash"
            ],
            "Image": "sha256:277341568f63275cc28e1ab1b80f7d69be7b32fc3bc302ce42ea5ec35379a3fc",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 116490258,
        "VirtualSize": 116490258,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/dbed74b234dc644944d11fb7f57e9d684e8a5fe2cae1cb59cf46fe5b7618418f/merged",
                "UpperDir": "/var/lib/docker/overlay2/dbed74b234dc644944d11fb7f57e9d684e8a5fe2cae1cb59cf46fe5b7618418f/diff",
                "WorkDir": "/var/lib/docker/overlay2/dbed74b234dc644944d11fb7f57e9d684e8a5fe2cae1cb59cf46fe5b7618418f/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:c94dc8fa3d891058c327966e2daabbb468a8a3adf0774064677e0fdf30d88d71"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
======================================
======================================
[INFO] Inspecting alpine:latest image:
[
    {
        "Id": "sha256:c1aabb73d2339c5ebaa3681de2e9d9c18d57485045a4e311d9f8004bec208d67",
        "RepoTags": [
            "alpine:latest"
        ],
        "RepoDigests": [
            "alpine@sha256:82d1e9d7ed48a7523bdebc18cf6290bdb97b82302a8a9c27d4fe885949ea94d1"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2023-06-14T20:41:59.079795125Z",
        "Container": "bfc8078c169637d70e40ce591b5c2fe8d26329918dafcb96ebc9304ddff162ea",
        "ContainerConfig": {
            "Hostname": "bfc8078c1696",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/bin/sh\"]"
            ],
            "Image": "sha256:5b8658701c96acefe1cd3a21b2a80220badf9124891ad440d95a7fa500d48765",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "20.10.23",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh"
            ],
            "Image": "sha256:5b8658701c96acefe1cd3a21b2a80220badf9124891ad440d95a7fa500d48765",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 7331611,
        "VirtualSize": 7331611,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/3d02c2ba79db8d94c095570f1500eeb9f561a9b0891aa4a8159dd2e8c5af7133/merged",
                "UpperDir": "/var/lib/docker/overlay2/3d02c2ba79db8d94c095570f1500eeb9f561a9b0891aa4a8159dd2e8c5af7133/diff",
                "WorkDir": "/var/lib/docker/overlay2/3d02c2ba79db8d94c095570f1500eeb9f561a9b0891aa4a8159dd2e8c5af7133/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:78a822fe2a2d2c84f3de4a403188c45f623017d6a4521d23047c9fbb0801794c"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
======================================
======================================
[INFO] Removing the largest image:
Untagged: debian:latest
Untagged: debian@sha256:9f76a008888da28c6490bedf7bdaa919bac9b2be827afd58d6eb1b916e1e5918
Deleted: sha256:278727474c2935fca471835f8e09a78631bf93d6a414979f038abebc315fb8da
Deleted: sha256:c94dc8fa3d891058c327966e2daabbb468a8a3adf0774064677e0fdf30d88d71
======================================
======================================
[INFO] Running 'docker system prune' to clean up unused data...
Total reclaimed space: 0B
======================================
======================================
[INFO] Show system space
Filesystem      Size  Used Avail Use% Mounted on
udev            945M     0  945M   0% /dev
tmpfs           194M  740K  193M   1% /run
/dev/sda1       6.8G  2.3G  4.2G  35% /
tmpfs           967M     0  967M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/sda6        12G   80K   12G   1% /home
tmpfs           194M     0  194M   0% /run/user/1000
======================================
======================================
[INFO] Script execution completed.
======================================
docker@docker-node:~$ 
```