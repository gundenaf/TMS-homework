# Practical Experience with Docker Commands

## Task 1: Launching a Container using `docker run`

The goal of this task is to launch a container using the `docker run` command and become familiar with its main parameters.

**Steps:**
1. Find a Docker Hub image that you want to run on your machine.
2. Use the `docker run` command to start a container based on this image. Add flags to set the container name, redirect ports, set environment variables, etc. Use the `docker ps` command to confirm that the container is running.
3. Stop the container using the `docker stop` command and remove it using the `docker rm` command.

## Task 2: Optimizing Disk Space Usage

The goal of this task is to use the `docker inspect`, `docker images`, and `docker system prune` commands to optimize disk space usage on your host.

**Steps:**
1. Use the `docker images` command to list all images installed on your host.
2. Use the `docker inspect` command to display information about the size of each image and its layers. Identify images that consume a significant amount of disk space and determine which layers of the image occupy the most space.
3. If you find images that are no longer needed, delete them using the `docker rmi` command.
4. Use the `docker system prune` command to remove unused images, containers, volumes, and networks that are no longer used by your applications.
5. After completing these actions, check the disk space usage on your host and ensure that you have freed up enough space.