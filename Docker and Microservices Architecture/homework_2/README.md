## Task 1: Launching Application Instances with Volume and Network Attachment

The goal of this task is to gain practical experience with Docker commands by launching application instances with volume and network attachment. You will also learn how to use the `docker logs` command.

**Steps:**
1. Find a Docker Hub image that you want to run on your machine.
2. Use the `docker run` command to start a container based on this image. Add flags to set the container name, redirect ports, set environment variables, etc. Use the `docker ps` command to confirm that the container is running.
3. Create a Docker volume using the `docker volume create` command.
4. Launch a container using the `docker run` command and attach the created Docker volume to the container.
5. Use the `docker network create` command to create a new Docker network.

Optional:
6. Create a second container from the same image using the `docker run` command and attach it to the created Docker network.
7. Inside the first container, use the `nano` utility to create a text file in the attached Docker volume.
8. Inside the first container, use the `logger` utility to write a few messages to the created text file.
9. Use the `docker logs` command to view the logs of the first container and ensure that the messages were successfully written to the log file.
10. Use the `docker exec` command to execute a command in the second container and verify that the created text file is accessible from the second container.
11. Use the `docker stop` command to stop both containers.
12. Use the `docker rm` command to remove the containers, and the `docker rmi` command to remove the image.
13. Use the `docker volume rm` command to remove the Docker volume, and the `docker network rm` command to remove the Docker network.