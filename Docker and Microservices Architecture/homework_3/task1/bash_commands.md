```bash
docker@docker-node:~$ sudo docker build -t my-web-server .
[+] Building 0.6s (11/11) FINISHED                                                                                                                      docker:default
 => [internal] load .dockerignore                                                                                                                                 0.0s
 => => transferring context: 2B                                                                                                                                   0.0s
 => [internal] load build definition from Dockerfile                                                                                                              0.0s
 => => transferring dockerfile: 340B                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/ubuntu:focal                                                                                                   0.4s
 => [1/6] FROM docker.io/library/ubuntu:focal@sha256:33a5cc25d22c45900796a1aca487ad7a7cb09f09ea00b779e3b2026b4fc2faba                                             0.0s
 => [internal] load build context                                                                                                                                 0.0s
 => => transferring context: 7.43kB                                                                                                                               0.0s
 => CACHED [2/6] RUN apt update && apt -y upgrade && apt -y install nginx curl                                                                                    0.0s
 => CACHED [3/6] RUN mkdir -p /app/static                                                                                                                         0.0s
 => CACHED [4/6] COPY nginx.conf /etc/nginx/nginx.conf                                                                                                            0.0s
 => CACHED [5/6] COPY ./app/static/ /app/static                                                                                                                   0.0s
 => [6/6] RUN chown -R www-data:www-data /app/static     && chmod -R 755 /app/static                                                                              0.2s
 => exporting to image                                                                                                                                            0.0s
 => => exporting layers                                                                                                                                           0.0s
 => => writing image sha256:f8a5e0faf6b81fc2049fe18d16926dcd6f1e11418834e55d32c112d2d61230ad                                                                      0.0s
 => => naming to docker.io/library/my-web-server                                                                                                                  0.0s
docker@docker-node:~$ sudo docker run -d -p 8080:8080 my-web-server
2cf42c1c6b2d90f3aa40416bc370194635a11e20e80fe851f34f8372bb0a5bc6
docker@docker-node:~$ sudo docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS         PORTS                                       NAMES
2cf42c1c6b2d   my-web-server   "nginx -g 'daemon of…"   3 seconds ago   Up 2 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   trusting_galois
```