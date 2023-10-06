## Terraform AWS Infrastructure Setup

# This project sets up an AWS infrastructure using Terraform. The infrastructure includes a VPC, Security Group, and an EC2 instance. Here’s a step-by-step breakdown of what we did:

1. Set up the Network Module

We created a network module to set up the VPC and related networking components. This includes:

    A VPC with a specified CIDR block.
    A public and a private subnet within the VPC.
    DNS hostname and DNS support enabled for the VPC.

2. Set up the Security Module

We created a security module to set up the security group. This includes:

    A security group associated with the VPC created in the network module.
    Ingress and egress rules for the security group, allowing traffic from specified CIDR blocks.

3. Set up the Compute Module

We created a compute module to set up an EC2 instance. This includes:

    An EC2 instance using the latest Amazon Linux AMI.
    The instance is associated with the security group created in the security module.
    The instance is launched within the public subnet of the VPC created in the network module.
    The instance has a specified volume size and type.

4. Root Module

In the root directory, we used these modules to create an infrastructure with specified values.
5. Providers Setup

We set up AWS as our provider in providers.tf. We specified the region, access key, and secret key for AWS.

Please note that this is a basic setup and can be expanded based on specific use cases or requirements. Always ensure to follow best practices for managing secrets and sensitive information, especially when working in a production environment.

6. Destroying Infrastructure

After you’re done with your infrastructure, it’s important to destroy it to avoid incurring unnecessary costs. You can do this by running:

terraform destroy

This command will destroy all resources that were created by Terraform.

