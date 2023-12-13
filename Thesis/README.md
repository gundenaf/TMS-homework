# Junior DevOps Engineer Courses Thesis

## Overview

This thesis project aims to demonstrate the seamless assembly and deployment of a React + NodeJS application interacting with PostgreSQL. Leveraging Terraform on AWS, a network infrastructure was configured, comprising two EC2 instances designated for Jenkins Master and Jenkins Agent. Additionally, Security Groups were established to secure the instances. The project includes the development of a Jenkins Pipeline, orchestrating the build and deployment processes of the application into a K8s minikube cluster.

## Infrastructure

The Terraform script included in this project sets up the following infrastructure components:

    Virtual Private Cloud (VPC)
    EC2 instances for Jenkins Master and Jenkins Agent
    Security Groups to control inbound and outbound traffic for the EC2 instances

## CI/CD Pipeline

Jenkins is configured to manage the CI/CD process. The pipeline involves:

    Source Code Management (SCM): Jenkins fetches the source code from the repository.
    Build: The web application is built using the configured build tools and push the artifacts to DockerHub.
    Deploy: The application is deployed to the Kubernetes cluster (minikube).

## Application Stack

The web application is developed using React and Node.js, providing a modern and scalable architecture. It communicates with a PostgreSQL database for data storage and retrieval.

## Kubernetes

The Kubernetes (K8s) configuration for minikube includes manifests for deploying the database, backend, and frontend components, along with a custom namespace and network settings.

![Alt text](https://i.imgur.com/TYmDrXp.jpeg "Thesis scheme")