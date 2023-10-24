```bash
#----------------------------------------------------
# Building a Docker Image
#----------------------------------------------------

user@localhost:~$ sudo docker build -t gundenaf/nginx-dos15-mikhalenka:latest .
[+] Building 1.1s (8/8) FINISHED                                                                                                                        docker:default
 => [internal] load .dockerignore                                                                                                                                 0.0s
 => => transferring context: 2B                                                                                                                                   0.0s
 => [internal] load build definition from Dockerfile                                                                                                              0.0s
 => => transferring dockerfile: 117B                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/nginx:latest                                                                                                   0.9s
 => [auth] library/nginx:pull token for registry-1.docker.io                                                                                                      0.0s
 => [internal] load build context                                                                                                                                 0.0s
 => => transferring context: 32B                                                                                                                                  0.0s
 => [1/2] FROM docker.io/library/nginx:latest@sha256:b4af4f8b6470febf45dc10f564551af682a802eda1743055a7dfc8332dffa595                                             0.0s
 => CACHED [2/2] COPY ./index.html /usr/share/nginx/html/index.html                                                                                               0.0s
 => exporting to image                                                                                                                                            0.0s
 => => exporting layers                                                                                                                                           0.0s
 => => writing image sha256:9dce0dbc5efe466769d85b505949e87cda7e02435e5bd635ee1ba2d9caf9c140                                                                      0.0s
 => => naming to docker.io/gundenaf/nginx-dos15-mikhalenka:latest     

#----------------------------------------------------
# Pushing a Docker Image to a Container Registry
#----------------------------------------------------    

user@localhost:~$ sudo docker push gundenaf/nginx-dos15-mikhalenka:latest
The push refers to repository [docker.io/gundenaf/nginx-dos15-mikhalenka]
dd6449ffded6: Pushed 
3c7f79e64c24: Pushed 
ff24e13e73c7: Pushed 
b0b61abb5846: Pushed 
2187753852c0: Pushed 
ad5d551c7fa1: Pushed 
e53d016bbab1: Pushed 
cb4596cc1454: Pushed 
latest: digest: sha256:e0f10697ff9f4f6dafc4d5a831b5942df8885a2721a89b1212edbb52ee0f9682 size: 1985

#----------------------------------------------------
# Minikube Cluster Initialization
#----------------------------------------------------    
user@localhost:~$ minikube start
😄  minikube v1.31.2 on Debian 12.2
✨  Using the qemu2 driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🔄  Restarting existing qemu2 VM for "minikube" ...
🐳  Preparing Kubernetes v1.27.4 on Docker 24.0.4 ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🔎  Verifying Kubernetes components...
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

#----------------------------------------------------
# Creating a Kubernetes Namespace
#----------------------------------------------------
user@localhost:~$ kubectl apply -f k8s/namespaces/namespace.yml
namespace/dos-15-mikhalenka created

#----------------------------------------------------
# Creating a Kubernetes Pod
#----------------------------------------------------
user@localhost:~$ kubectl apply -f k8s/pods/pod.yml
pod/dos-15-mikhalenka-pod created

#----------------------------------------------------
# Creating a Kubernetes Deployment
#----------------------------------------------------
user@localhost:~$ kubectl apply -f k8s/deployments/deployment.yml
deployment.apps/dos-15-mikhalenka-deployment created

#----------------------------------------------------
# List Kubernetes Namespaces
#----------------------------------------------------
user@localhost:~$ kubectl get namespaces
NAME                STATUS   AGE
default             Active   41m
dos-15-mikhalenka   Active   108s
kube-node-lease     Active   41m
kube-public         Active   41m
kube-system         Active   41m

#----------------------------------------------------
# List Pods in the Namespace
#----------------------------------------------------
user@localhost:~$ kubectl get pods -n dos-15-mikhalenka
NAME                            READY   STATUS    RESTARTS   AGE
dos-15-mikhalenka-pod           1/1     Running   0          88s
dos-15-mikhalenka-deployment-85fcc5d467-p2jgs   1/1     Running   0          59s
dos-15-mikhalenka-deployment-85fcc5d467-p8wfc   1/1     Running   0          59s
dos-15-mikhalenka-deployment-85fcc5d467-q9gqh   1/1     Running   0          59s

#----------------------------------------------------
# Describe Pod in the Namespace
#----------------------------------------------------
user@localhost:~$ kubectl describe pod dos-15-mikhalenka-pod -n dos-15-mikhalenka
Name:             dos-15-mikhalenka-pod
Namespace:        dos-15-mikhalenka
Priority:         0
Service Account:  default
Node:             minikube/10.0.2.15
Start Time:       Tue, 24 Oct 2023 10:29:24 +0200
Labels:           <none>
Annotations:      <none>
Status:           Running
IP:               10.244.0.20
IPs:
  IP:  10.244.0.20
Containers:
  nginx:
    Container ID:   docker://dba3e671951fc8f1bb0707ee80955dc2ee1f1e5941d6c0c2bb3e7b84dce35eec
    Image:          gundenaf/nginx-dos15-mikhalenka:latest
    Image ID:       docker-pullable://gundenaf/nginx-dos15-mikhalenka@sha256:e0f10697ff9f4f6dafc4d5a831b5942df8885a2721a89b1212edbb52ee0f9682
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Tue, 24 Oct 2023 10:29:26 +0200
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-hxnwj (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-hxnwj:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  2m42s  default-scheduler  Successfully assigned dos-15-mikhalenka/dos-15-mikhalenka-pod to minikube
  Normal  Pulling    2m42s  kubelet            Pulling image "gundenaf/nginx-dos15-mikhalenka:latest"
  Normal  Pulled     2m40s  kubelet            Successfully pulled image "gundenaf/nginx-dos15-mikhalenka:latest" in 1.258429052s (1.258434119s including waiting)
  Normal  Created    2m40s  kubelet            Created container nginx
  Normal  Started    2m40s  kubelet            Started container nginx

#----------------------------------------------------
# View Logs for Pod in the Namespace
#----------------------------------------------------
user@localhost:~$ kubectl logs dos-15-mikhalenka-pod -n dos-15-mikhalenka
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2023/10/24 08:29:26 [notice] 1#1: using the "epoll" event method
2023/10/24 08:29:26 [notice] 1#1: nginx/1.25.2
2023/10/24 08:29:26 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
2023/10/24 08:29:26 [notice] 1#1: OS: Linux 5.10.57
2023/10/24 08:29:26 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/10/24 08:29:26 [notice] 1#1: start worker processes
2023/10/24 08:29:26 [notice] 1#1: start worker process 29
2023/10/24 08:29:26 [notice] 1#1: start worker process 30

#----------------------------------------------------
# List Deployments in the Namespace
#----------------------------------------------------
user@localhost:~$ kubectl get deployments -n dos-15-mikhalenka
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
dos-15-mikhalenka-deployment   3/3     3            3           3m36s

#----------------------------------------------------
# Scale Deployment to 5 Replicas in the Namespace
#----------------------------------------------------
user@localhost:~$ kubectl scale deployment dos-15-mikhalenka-deployment --replicas=5 -n dos-15-mikhalenka
deployment.apps/dos-15-mikhalenka-deployment scaled

#----------------------------------------------------
# Apply a Kubernetes Deployment Configuration
#----------------------------------------------------
user@localhost:~$ kubectl apply -f k8s/deployments/deployment.yml
deployment.apps/dos-15-mikhalenka-deployment configured

#----------------------------------------------------
# List Pods in the Namespace
#----------------------------------------------------
user@localhost:~$ kubectl get pods -n dos-15-mikhalenka
NAME                                            READY   STATUS    RESTARTS   AGE
dos-15-mikhalenka-pod                           1/1     Running   0          6m55s
dos-15-mikhalenka-deployment-85fcc5d467-drv66                   1/1     Running   0          2m13s
dos-15-mikhalenka-deployment-85fcc5d467-n9sqz                   1/1     Running   0          2m13s
dos-15-mikhalenka-deployment-85fcc5d467-p2jgs                   1/1     Running   0          6m26s
dos-15-mikhalenka-deployment-85fcc5d467-p8wfc                   1/1     Running   0          6m26s
dos-15-mikhalenka-deployment-85fcc5d467-q9gqh                   1/1     Running   0          6m26s

#----------------------------------------------------
# Remove All Docker Images
#----------------------------------------------------
user@localhost:~$ sudo docker rmi $(sudo docker images -q)
Untagged: gundenaf/nginx-dos15-mikhalenka:latest
Untagged: gundenaf/nginx-dos15-mikhalenka@sha256:e0f10697ff9f4f6dafc4d5a831b5942df8885a2721a89b1212edbb52ee0f9682
Deleted: sha256:9dce0dbc5efe466769d85b505949e87cda7e02435e5bd635ee1ba2d9caf9c140
Error response from daemon: conflict: unable to delete 6c5eb2a25204 (must be forced) - image is referenced in multiple repositories
Error response from daemon: conflict: unable to delete 6c5eb2a25204 (must be forced) - image is referenced in multiple repositories

#----------------------------------------------------
# Delete the Kubernetes Namespace
#----------------------------------------------------
user@localhost:~$ kubectl delete namespaces dos-15-mikhalenka
namespace "dos-15-mikhalenka" deleted

#----------------------------------------------------
# Stop the Minikube Kubernetes Cluster
#----------------------------------------------------
user@localhost:~$ minikube stop
✋  Stopping node "minikube"  ...
🛑  1 node stopped.
```