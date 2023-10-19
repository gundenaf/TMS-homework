# AWS Infrastructure Lab - High Availability Web Application Deployment

## Introduction

This repository contains Terraform code and configuration files for deploying a highly available web application infrastructure on Amazon Web Services (AWS). This lab is designed to demonstrate how to set up a reliable and scalable architecture for hosting web applications in the AWS cloud environment.

## Modules

The infrastructure is organized into three main modules:

1. **Network Module**: This module sets up the Virtual Private Cloud (VPC), public subnets, and Internet Gateway. It provides the foundational networking infrastructure for the web application.

2. **Security Module**: The security module handles the creation of security groups, load balancers, and target groups. It defines rules for ingress and egress traffic and ensures the application's security.

3. **Compute Module**: The compute module deploys Amazon EC2 instances using an Auto Scaling Group. It includes launch templates and scaling policies to manage the application's compute resources based on demand.