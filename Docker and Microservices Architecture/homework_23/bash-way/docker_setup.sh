#!/bin/bash

docker_install() {
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

echo "======================================"
echo "[INFO] Installing Docker"
docker_install
echo "======================================"

echo "======================================"
echo "[INFO] Pulling debian:latest image from DockerHub"
docker pull debian:latest
echo "======================================"

echo "======================================"
echo "[INFO] Pulling alpine:latest image from DockerHub"
docker pull alpine:latest
echo "======================================"

echo "======================================"
echo "[INFO] Starting the container dos-debian"
docker run -d -p 2222:22 --name dos-debian -e SSH_PORT_FORWARD_REASON="SSH port is forwarded to ensure secure access to the SSH server inside the container." debian:latest
echo "======================================"

echo "======================================"
echo "[INFO] Running containers:"
docker ps
echo "======================================"

echo "======================================"
echo "[INFO] Starting the container dos-alpine"
docker run -d -p 2222:22 --name dos-alpine -e SSH_PORT_FORWARD_REASON="SSH port is forwarded to ensure secure access to the SSH server inside the container." alpine:latest
echo "======================================"

echo "======================================"
echo "[INFO] Running containers:"
docker ps
echo "======================================"

echo "======================================"
echo "[INFO] Stopping containers"
docker stop dos-debian dos-alpine
echo "======================================"

echo "======================================"
echo "[INFO] Removing containers"
docker rm dos-debian dos-alpine
echo "======================================"

echo "======================================"
echo "[INFO] Show system space"
df -h
echo "======================================"

echo "======================================"
echo "[INFO] List of all Docker images:"
docker images
echo "======================================"

echo "======================================"
echo "[INFO] Inspecting debian:latest image:"
docker inspect debian:latest
echo "======================================"

echo "======================================"
echo "[INFO] Inspecting alpine:latest image:"
docker inspect alpine:latest
echo "======================================"

echo "======================================"
echo "[INFO] Removing the largest image:"
largest_image=$(docker images --format '{{.Size}} {{.Repository}}:{{.Tag}}' | sort -hr | head -1 | awk '{print $2}')
docker rmi $largest_image
echo "======================================"

echo "======================================"
echo "[INFO] Running 'docker system prune' to clean up unused data..."
docker system prune -f
echo "======================================"

echo "======================================"
echo "[INFO] Show system space"
df -h
echo "======================================"

echo "======================================"
echo "[INFO] Script execution completed."
echo "======================================"