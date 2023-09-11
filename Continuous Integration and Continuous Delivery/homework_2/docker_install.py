#!/usr/bin/python3

import subprocess

def docker_install():
    # Update packages and install curl
    subprocess.run(["sudo", "apt", "update"])
    subprocess.run(["sudo", "apt", "-y", "upgrade"])
    subprocess.run(["sudo", "apt", "-y", "install", "curl"])

    # Install Docker using the script
    subprocess.run("curl -fsSL https://get.docker.com | sudo sh", shell=True)

def modify_docker_service():
    # Command to modify the Docker service
    modify_command = [
        "sudo", "sed", "-i", "s#ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock#ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock#g",
        "/lib/systemd/system/docker.service"
    ]
    # Reload Docker service configuration
    subprocess.run(modify_command)
    subprocess.run(["sudo", "systemctl", "daemon-reload"])
    subprocess.run(["sudo", "systemctl", "restart", "docker"])

def install_jenkins_agent():
    command = [
        "sudo", "docker", "pull", "chinnareddaiah/my-jenkins-slave"
    ]
    subprocess.run(command)

if __name__ == "__main__":

    docker_install()

    modify_docker_service()

    install_jenkins_agent()
