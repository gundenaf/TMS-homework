## AWS CLI Usage

## Goal: Familiarize yourself with key AWS services, such as Elastic Load Balancer, Auto Scaling. This task will help you understand how to configure and utilize AWS services to ensure high availability and scalability of your application. 

## Tasks:

1. Create a Load Balancer in Amazon Web Services using AWS CLI.
2. Configure traffic routing for your application using Elastic Load Balancer and Auto Scaling.
3. Implement automatic scaling for your application using Amazon EC2 Auto Scaling and Elastic Load Balancer.

## Steps:

1. Install AWS CLI on your computer if you haven't already.
2. Define the parameters for your Load Balancer, such as type, protocols, ports, and region.
3. Create a Load Balancer using the "aws elbv2 create-load-balancer" command.
4. Create an Auto Scaling group containing your Amazon EC2 instances.
5. Create a target group containing the Amazon EC2 instances to which traffic will be routed.
6. Configure instance ranking and weights in your Auto Scaling group.
7. Create routing rules in Elastic Load Balancer to determine how traffic should be directed to the target group.
