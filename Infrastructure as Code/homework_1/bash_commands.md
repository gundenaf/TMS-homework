```bash
#----------------------------------------------------
# Terraform Installation
#----------------------------------------------------
slava@phobos:~$ wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
--2023-10-03 09:26:43--  https://apt.releases.hashicorp.com/gpg
[sudo] password for slava: Resolving apt.releases.hashicorp.com (apt.releases.hashicorp.com)... 52.222.214.125, 52.222.214.58, 52.222.214.123, ...
Connecting to apt.releases.hashicorp.com (apt.releases.hashicorp.com)|52.222.214.125|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3980 (3.9K) [binary/octet-stream]
Saving to: ‘STDOUT’

-                                         100%[====================================================================================>]   3.89K  --.-KB/s    in 0s      

2023-10-03 09:26:43 (200 MB/s) - written to stdout [3980/3980]


slava@phobos:~$  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com bookworm main
slava@phobos:~$  sudo apt update && sudo apt -y install terraform
Hit:1 http://security.debian.org/debian-security bookworm-security InRelease
Hit:2 http://packages.microsoft.com/repos/code stable InRelease                                                                                                               
Hit:3 http://deb.debian.org/debian bookworm InRelease                                                                                                               
Hit:4 http://deb.debian.org/debian bookworm-updates InRelease                                                                                                         
Hit:5 http://deb.debian.org/debian bookworm-backports InRelease                                                                                                       
Get:6 https://apt.releases.hashicorp.com bookworm InRelease [12.9 kB]                                                       
Hit:7 https://packages.microsoft.com/repos/edge stable InRelease                                    
Hit:8 https://packages.microsoft.com/repos/ms-teams stable InRelease
Hit:9 https://repo.skype.com/deb stable InRelease
Get:10 https://apt.releases.hashicorp.com bookworm/main amd64 Packages [100.0 kB]
Get:11 https://apt.releases.hashicorp.com bookworm/main i386 Packages [41.6 kB]
Fetched 154 kB in 2s (102 kB/s) 
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  terraform
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 21.8 MB of archives.
After this operation, 65.2 MB of additional disk space will be used.
Get:1 https://apt.releases.hashicorp.com bookworm/main amd64 terraform amd64 1.5.7-1 [21.8 MB]
Fetched 21.8 MB in 2s (10.6 MB/s)     
Retrieving bug reports... Done
Parsing Found/Fixed information... Done
Selecting previously unselected package terraform.
(Reading database ... 268301 files and directories currently installed.)
Preparing to unpack .../terraform_1.5.7-1_amd64.deb ...
Unpacking terraform (1.5.7-1) ...
Setting up terraform (1.5.7-1) ...
slava@phobos:~$ terraform --version
Terraform v1.5.7
on linux_amd64
```