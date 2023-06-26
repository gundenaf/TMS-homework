```bash
sudo dnf update
CentOS Linux 8 - AppStream                       34 kB/s | 4.3 kB     00:00
CentOS Linux 8 - BaseOS                          30 kB/s | 3.9 kB     00:00
CentOS Linux 8 - Extras                         9.7 kB/s | 1.5 kB     00:00
Extra Packages for Enterprise Linux 8 - x86_64   49 kB/s |  27 kB     00:00
Dependencies resolved.
Nothing to do.
Complete!

sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
Adding repo from: https://download.docker.com/linux/centos/docker-ce.repo

sudo dnf update
CentOS Linux 8 - AppStream                                                                         52 kB/s | 4.3 kB     00:00
CentOS Linux 8 - BaseOS                                                                            45 kB/s | 3.9 kB     00:00
CentOS Linux 8 - Extras                                                                            19 kB/s | 1.5 kB     00:00
Docker CE Stable - x86_64                                                                          35 kB/s | 3.5 kB     00:00
Extra Packages for Enterprise Linux 8 - x86_64                                                     40 kB/s |  27 kB     00:00
Dependencies resolved.
Nothing to do.
Complete!
```