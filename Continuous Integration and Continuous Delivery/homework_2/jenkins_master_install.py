#!/usr/bin/python3

import subprocess

# Define the commands to be executed
commands = [
    "sudo apt update && sudo apt -y upgrade",
    "sudo apt -y install curl",
    "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc",
    "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list",
    "sudo apt -y install jenkins openjdk-17-jre",
    "sudo systemctl enable jenkins",
    "sudo systemctl restart jenkins"
]

# Execute the commands one by one
for command in commands:
    try:
        subprocess.run(command, shell=True, check=True)
        print(f"Command executed successfully: {command}")
    except subprocess.CalledProcessError as e:
        print(f"Error executing command {command}: {e}")
