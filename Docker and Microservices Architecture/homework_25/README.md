# Homework No25

## Task 1: Creating a Dockerfile for a Web Server Application

The goal of this task is to gain practical experience in writing a Dockerfile to create a container with a web server application based on the Ubuntu 20.04 image. The application should run on port 8080 and serve static files from the /app/static directory.

**Steps:**
1. Create a new file named `Dockerfile` in an empty directory on your local computer.
2. Write a `FROM` instruction specifying the base image as Ubuntu 20.04.
3. Use the `RUN` instruction to install the required dependencies. Install the `nginx` and `curl` packages, and create the directory `/app/static`.
4. Copy the nginx configuration file from your local directory into the container using the `COPY` instruction.
5. Copy static files from the `/app/static` directory on your local computer into the container using the `COPY` instruction.
6. Use the `EXPOSE` instruction to open port 8080.
7. Use the `CMD` instruction to launch the `nginx` command with the path to the configuration file copied in step 4.
8. Save the `Dockerfile` and build the image using the `docker build` command.
9. Run a container from the built image using the `docker run` command and verify that the web server serves static files from the `/app/static` directory on port 8080.

## Task 2: Deploying the Application using Docker-compose

**Steps:**
1. Create a new file named `docker-compose.yml` in an empty directory on your local computer.
2. Write the `version` instruction with version 3.
3. Define a service for the PostgreSQL database named "db." Use the `postgres:latest` image and set the `POSTGRES_USER`, `POSTGRES_PASSWORD`, and `POSTGRES_DB` environment variables to specify the username, password, and database name respectively.
4. Define a service for the web server based on the NGINX image. Name it "web." Use the `nginx:latest` image. Specify the port on which the server should operate using the `ports` instruction. Set the path to the NGINX configuration files inside the container using the `volumes` instruction.
5. Establish a link from the web server service to the database service using the `links` instruction.
6. Save the `docker-compose.yml` file and launch the application using the `docker-compose up` command.
7. Verify that the application is working by accessing `localhost:80` in your web browser.