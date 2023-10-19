```bash
#----------------------------------------------------
# kubectl Installation
#----------------------------------------------------
user@localhost:~$ sudo apt update && sudo apt install -y apt-transport-https
Hit:1 http://deb.debian.org/debian bookworm InRelease
Hit:2 http://packages.microsoft.com/repos/code stable InRelease                                                                                                       
Hit:3 http://security.debian.org/debian-security bookworm-security InRelease                                                                                          
Hit:4 http://deb.debian.org/debian bookworm-updates InRelease                                                                                                         
Hit:5 http://deb.debian.org/debian bookworm-backports InRelease                                                                                                               
Hit:6 https://download.docker.com/linux/debian bookworm InRelease                                                                                                     
Hit:7 https://packages.microsoft.com/repos/edge stable InRelease                                                             
Hit:8 https://apt.releases.hashicorp.com bookworm InRelease                                            
Hit:9 https://packages.microsoft.com/repos/ms-teams stable InRelease                                  
Hit:10 https://repo.skype.com/deb stable InRelease
Reading package lists... Done
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
apt-transport-https is already the newest version (2.6.1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
user@localhost:~$ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
OK
user@localhost:~$ echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
user@localhost:~$ sudo apt update
Hit:1 http://deb.debian.org/debian bookworm InRelease
Hit:2 http://packages.microsoft.com/repos/code stable InRelease                                                                                                       
Hit:3 http://security.debian.org/debian-security bookworm-security InRelease                                                                                          
Hit:4 http://deb.debian.org/debian bookworm-updates InRelease                                                                                                         
Hit:5 http://deb.debian.org/debian bookworm-backports InRelease                                                                                                               
Hit:6 https://download.docker.com/linux/debian bookworm InRelease                                                                                                     
Hit:7 https://packages.microsoft.com/repos/edge stable InRelease                                                             
Hit:8 https://apt.releases.hashicorp.com bookworm InRelease                                            
Hit:9 https://packages.microsoft.com/repos/ms-teams stable InRelease                                  
Hit:10 https://repo.skype.com/deb stable InRelease
Get:11 https://packages.cloud.google.com/apt kubernetes-xenial InRelease [8,993 B]
Get:12 https://packages.cloud.google.com/apt kubernetes-xenial/main amd64 Packages [69.9 kB]
Fetched 78.9 kB in 1s (79.0 kB/s)   
Reading package lists... Done
W: https://apt.kubernetes.io/dists/kubernetes-xenial/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
user@localhost:~$ sudo apt-get install -y kubectl
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  kubectl
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 10.3 MB of archives.
After this operation, 49.9 MB of additional disk space will be used.
Get:1 https://packages.cloud.google.com/apt kubernetes-xenial/main amd64 kubectl amd64 1.28.2-00 [10.3 MB]
Fetched 10.3 MB in 1s (13.1 MB/s)
Retrieving bug reports... Done
Parsing Found/Fixed information... Done
Selecting previously unselected package kubectl.
(Reading database ... 285193 files and directories currently installed.)
Preparing to unpack .../kubectl_1.28.2-00_amd64.deb ...
Unpacking kubectl (1.28.2-00) ...
Setting up kubectl (1.28.2-00) ...
user@localhost:~$ echo 'source <(kubectl completion bash)' >>~/.bashrc
user@localhost:~$ kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl
#----------------------------------------------------
# minikube Installation
#----------------------------------------------------
user@localhost:~$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 28.5M  100 28.5M    0     0  14.1M      0  0:00:02  0:00:02 --:--:-- 14.1M
user@localhost:~$ sudo dpkg -i minikube_latest_amd64.deb
Selecting previously unselected package minikube.
(Reading database ... 285194 files and directories currently installed.)
Preparing to unpack minikube_latest_amd64.deb ...
Unpacking minikube (1.31.2-0) ...
Setting up minikube (1.31.2-0) ...
#----------------------------------------------------
# Start your cluster
#----------------------------------------------------
user@localhost:~$ minikube start
😄  minikube v1.31.2 on Debian 12.2
✨  Automatically selected the qemu2 driver. Other choices: vmware, ssh
🌐  Automatically selected the builtin network
❗  You are using the QEMU driver without a dedicated network, which doesn't support `minikube service` & `minikube tunnel` commands.
💿  Downloading VM boot image ...
E1019 22:22:13.288230    8764 iso.go:90] Unable to download https://storage.googleapis.com/minikube-builds/iso/16971/minikube-v1.31.0-amd64.iso: getter: &{Ctx:context.Background Src:https://storage.googleapis.com/minikube-builds/iso/16971/minikube-v1.31.0-amd64.iso?checksum=file:https://storage.googleapis.com/minikube-builds/iso/16971/minikube-v1.31.0-amd64.iso.sha256 Dst:/home/slava/.minikube/cache/iso/amd64/minikube-v1.31.0-amd64.iso.download Pwd: Mode:2 Umask:---------- Detectors:[0x3f9c8a8 0x3f9c8a8 0x3f9c8a8 0x3f9c8a8 0x3f9c8a8 0x3f9c8a8 0x3f9c8a8] Decompressors:map[bz2:0xc00012df68 gz:0xc00012dfc0 tar:0xc00012df70 tar.bz2:0xc00012df80 tar.gz:0xc00012df90 tar.xz:0xc00012dfa0 tar.zst:0xc00012dfb0 tbz2:0xc00012df80 tgz:0xc00012df90 txz:0xc00012dfa0 tzst:0xc00012dfb0 xz:0xc00012dfc8 zip:0xc00012dfd0 zst:0xc00012dfe0] Getters:map[file:0xc000b4ece0 http:0xc000b6e640 https:0xc000b6e690] Dir:false ProgressListener:0x3f579a0 Insecure:false DisableSymlinks:false Options:[0x12d0880]}: invalid checksum: Error downloading checksum file: bad response code: 404
💿  Downloading VM boot image ...
    > minikube-v1.31.0-amd64.iso....:  65 B / 65 B [---------] 100.00% ? p/s 0s
    > minikube-v1.31.0-amd64.iso:  289.20 MiB / 289.20 MiB  100.00% 18.55 MiB p
👍  Starting control plane node minikube in cluster minikube
💾  Downloading Kubernetes v1.27.4 preload ...
    > preloaded-images-k8s-v18-v1...:  393.21 MiB / 393.21 MiB  100.00% 21.79 M
🔥  Creating qemu2 VM (CPUs=2, Memory=3900MB, Disk=20000MB) ...
🐳  Preparing Kubernetes v1.27.4 on Docker 24.0.4 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🔎  Verifying Kubernetes components...
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
user@localhost:~$ kubectl get po -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   etcd-minikube                      0/1     Running   0          3s
kube-system   kube-apiserver-minikube            0/1     Running   0          5s
kube-system   kube-controller-manager-minikube   0/1     Running   0          3s
kube-system   kube-scheduler-minikube            0/1     Running   0          5s
kube-system   storage-provisioner                0/1     Pending   0          2s
#----------------------------------------------------
# Deploy applications
#----------------------------------------------------
user@localhost:~$ kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
deployment.apps/hello-minikube created
user@localhost:~$ kubectl expose deployment hello-minikube --type=NodePort --port=8080
service/hello-minikube exposed
user@localhost:~$ kubectl get services hello-minikube
NAME             TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
hello-minikube   NodePort   10.107.180.8   <none>        8080:31209/TCP   3s
user@localhost:~$ kubectl port-forward service/hello-minikube 7080:8080
Forwarding from 127.0.0.1:7080 -> 8080
Forwarding from [::1]:7080 -> 8080
Handling connection for 7080
#----------------------------------------------------
# Manage your cluster
#----------------------------------------------------
user@localhost:~$ minikube pause
⏸  Pausing node minikube ... 
⏯  Paused 18 containers in: kube-system, kubernetes-dashboard, storage-gluster, istio-operator
user@localhost:~$ minikube stop
✋  Stopping node "minikube"  ...
🛑  1 node stopped.
user@localhost:~$ minikube delete --all
🔥  Deleting "minikube" in qemu2 ...
💀  Removed all traces of the "minikube" cluster.
🔥  Successfully deleted all profiles
```