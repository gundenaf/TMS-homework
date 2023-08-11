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
sudo docker pull debian:latest
echo "======================================"

echo "======================================"
echo "[INFO] Starting the container dos-debian"
sudo docker run -d -p 2222:22 --name dos-debian -e SSH_PORT_FORWARD_REASON="SSH port is forwarded to ensure secure access to the SSH server inside the container." debian:latest
echo "======================================"

echo "======================================"
echo "[INFO] Running containers:"
sudo docker ps
echo "======================================"

echo "======================================"
echo "[INFO] Create volume"
sudo docker volume create dos-debian-volume
echo "======================================"

echo "======================================"
echo "[INFO] Create network"
sudo docker network create dos-debian-network
echo "======================================"

echo "======================================"
echo "[INFO] Starting the container dos-debian1 with new parameters"
sudo docker run -d -t -p 2222:22 --name dos-debian1 -e SSH_PORT_FORWARD_REASON="SSH port is forwarded to ensure secure access to the SSH server inside the container." -v dos-debian-volume:/data --network dos-debian-network debian:latest
echo "======================================"

echo "======================================"
echo "[INFO] Starting the container dos-debian2"
sudo docker run -d -t -p 2223:22 --name dos-debian2 -e SSH_PORT_FORWARD_REASON="SSH port is forwarded to ensure secure access to the SSH server inside the container." -v dos-debian-volume:/data --network dos-debian-network debian:latest
echo "======================================"

echo "======================================"
echo "[INFO] Creating a text file in dos-debian1"
sudo docker exec -it dos-debian1 sh -c "echo 'Hello, Docker Volume!' > /data/text_file.txt"
sudo docker exec -it dos-debian1 sh -c "cat /data/text_file.txt"
echo "======================================"

echo "======================================"
echo "[INFO] Adding log messages"
sudo docker exec -it dos-debian1 sh -c "logger 'Message 1'; logger 'Message 2'"
echo "======================================"

#echo "======================================"
#echo "[INFO] Show log messages"
#sudo docker logs dos-debian1
#echo "======================================"

echo "======================================"
echo "[INFO] Show content of file on dos-debian2"
sudo docker exec -it dos-debian2 sh -c "cat /data/text_file.txt"
echo "======================================"

echo "======================================"
echo "[INFO] Stopping containers"
sudo docker stop dos-debian1 dos-debian2
echo "======================================"

echo "======================================"
echo "[INFO] Removing containers"
sudo docker rm dos-debian dos-debian1 dos-debian2
echo "======================================"

echo "======================================"
echo "[INFO] Removing volume"
sudo docker volume rm dos-debian-volume
echo "======================================"

echo "======================================"
echo "[INFO] Removing network"
sudo docker network rm dos-debian-network
echo "======================================"

echo "======================================"
echo "[INFO] Removing images"
sudo docker rmi $(docker images -a -q)
echo "======================================"

echo "======================================"
echo "[INFO] Script execution completed."
echo "======================================"