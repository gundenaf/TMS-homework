```bash
### AWS CLI Configuration
slava@phobos:~$ aws configure
AWS Access Key ID [****************IY4P]: 
AWS Secret Access Key [****************UUQQ]:
Default region name [us-east-1]: 
Default output format [json]: 
### Creation of new Virtual Private Cloud
slava@phobos:~$ aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=DOS-15-Mikhalenka}]"
{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-0d4f27337074e6c30",
        "State": "pending",
        "VpcId": "vpc-01062200bc59b3189",
        "OwnerId": "335809563306",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-05c12054a1d6db492",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false,
        "Tags": [
            {
                "Key": "Name",
                "Value": "DOS-15-Mikhalenka"
            }
        ]
    }
}
### Creation of first subnet in the specified VPC
slava@phobos:~$ aws ec2 create-subnet --vpc-id vpc-01062200bc59b3189 --cidr-block 10.0.1.0/24 --availability-zone us-east-1a
{
    "Subnet": {
        "AvailabilityZone": "us-east-1a",
        "AvailabilityZoneId": "use1-az2",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-06ad715e32e5d9299",
        "VpcId": "vpc-01062200bc59b3189",
        "OwnerId": "335809563306",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:us-east-1:335809563306:subnet/subnet-06ad715e32e5d9299",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
### Creation of second subnet in the specified VPC
slava@phobos:~$ aws ec2 create-subnet --vpc-id vpc-01062200bc59b3189 --cidr-block 10.0.2.0/24 --availability-zone us-east-1b
{
    "Subnet": {
        "AvailabilityZone": "us-east-1b",
        "AvailabilityZoneId": "use1-az4",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.0.2.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0d76b32dc45c72bdc",
        "VpcId": "vpc-01062200bc59b3189",
        "OwnerId": "335809563306",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:us-east-1:335809563306:subnet/subnet-0d76b32dc45c72bdc",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}
### Creation of Internet Gateway
slava@phobos:~$ aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0ee92196d1aa3646c",
        "OwnerId": "335809563306",
        "Tags": []
    }
}
### Attaching the internet gateway to the specified VPC
slava@phobos:~$ aws ec2 attach-internet-gateway --internet-gateway-id igw-0ee92196d1aa3646c --vpc-id vpc-01062200bc59b3189
### Creating a security group in the specified VPC
slava@phobos:~$ aws ec2 create-security-group \
    --group-name dos-15-mikhalenka-sg \
    --description "My Security Group" \
    --vpc-id vpc-01062200bc59b3189
{
    "GroupId": "sg-054e8bfe4339aa44f"
}
### Creation of ELB
slava@phobos:~$ aws elbv2 create-load-balancer \
    --name dos15-mikhalenka-loadbalancer \
    --subnets subnet-06ad715e32e5d9299 subnet-0d76b32dc45c72bdc \
    --scheme internet-facing \
    --security-groups sg-054e8bfe4339aa44f \
    --region us-east-1
{
    "LoadBalancers": [
        {
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:us-east-1:335809563306:loadbalancer/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060",
            "DNSName": "dos15-mikhalenka-loadbalancer-730593033.us-east-1.elb.amazonaws.com",
            "CanonicalHostedZoneId": "Z35SXDOTRQ7X7K",
            "CreatedTime": "2023-09-22T10:43:14.710000+00:00",
            "LoadBalancerName": "dos15-mikhalenka-loadbalancer",
            "Scheme": "internet-facing",
            "VpcId": "vpc-01062200bc59b3189",
            "State": {
                "Code": "provisioning"
            },
            "Type": "application",
            "AvailabilityZones": [
                {
                    "ZoneName": "us-east-1a",
                    "SubnetId": "subnet-06ad715e32e5d9299",
                    "LoadBalancerAddresses": []
                },
                {
                    "ZoneName": "us-east-1b",
                    "SubnetId": "subnet-0d76b32dc45c72bdc",
                    "LoadBalancerAddresses": []
                }
            ],
            "SecurityGroups": [
                "sg-054e8bfe4339aa44f"
            ],
            "IpAddressType": "ipv4"
        }
    ]
}
### Creation of Launch Configuration
slava@phobos:~$ aws autoscaling create-launch-configuration \
    --launch-configuration-name dos15-mikhalenka-lcn \
    --image-id ami-03a6eaae9938c858c \
    --instance-type t2.micro \
    --key-name DOS_15_Mikhalenka \
    --security-groups sg-054e8bfe4339aa44f \
    --instance-monitoring Enabled=true
### Creation of Launch Template
slava@phobos:~$ aws ec2 create-launch-template \
    --launch-template-name dos-15-mikhalenka-lt \
    --version-description "Initial version" \
    --cli-input-json '{
        "LaunchTemplateName": "dos-15-mikhalenka-lt",
        "VersionDescription": "Initial version",
        "LaunchTemplateData": {
            "InstanceType": "t2.micro",
            "KeyName": "DOS_15_Mikhalenka",
            "NetworkInterfaces": [
                {
                    "SubnetId": "subnet-0d76b32dc45c72bdc",
                    "Groups": ["sg-054e8bfe4339aa44f"],
                    "DeviceIndex": 0
                },
                {
                    "SubnetId": "subnet-06ad715e32e5d9299",
                    "Groups": ["sg-054e8bfe4339aa44f"],
                    "DeviceIndex": 1
                }
            ],
            "ImageId": "ami-03a6eaae9938c858c"
        }
    }'
{
    "LaunchTemplate": {
        "LaunchTemplateId": "lt-0181e89a7e4a474c4",
        "LaunchTemplateName": "dos-15-mikhalenka-lt",
        "CreateTime": "2023-09-22T10:53:58+00:00",
        "CreatedBy": "arn:aws:iam::335809563306:user/DOS-15-student",
        "DefaultVersionNumber": 1,
        "LatestVersionNumber": 1
    }
}
### Creation of Amazon EC2 Auto Scaling Group
slava@phobos:~$ aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name dos15-mikhalenka-asg \
    --launch-template LaunchTemplateName=dos-15-mikhalenka-lt \
    --min-size 2 \
    --max-size 5 \
    --desired-capacity 2 \
    --availability-zones us-east-1a us-east-1b
### Creation of Target Group
slava@phobos:~$ aws elbv2 create-target-group \
    --name dos15-mikhalenka-target-group \
    --protocol HTTP \
    --port 80 \
    --vpc-id vpc-01062200bc59b3189
{
    "TargetGroups": [
        {
            "TargetGroupArn": "arn:aws:elasticloadbalancing:us-east-1:335809563306:targetgroup/dos15-mikhalenka-target-group/946cfd10fd004eb0",
            "TargetGroupName": "dos15-mikhalenka-target-group",
            "Protocol": "HTTP",
            "Port": 80,
            "VpcId": "vpc-01062200bc59b3189",
            "HealthCheckProtocol": "HTTP",
            "HealthCheckPort": "traffic-port",
            "HealthCheckEnabled": true,
            "HealthCheckIntervalSeconds": 30,
            "HealthCheckTimeoutSeconds": 5,
            "HealthyThresholdCount": 5,
            "UnhealthyThresholdCount": 2,
            "HealthCheckPath": "/",
            "Matcher": {
                "HttpCode": "200"
            },
            "TargetType": "instance",
            "ProtocolVersion": "HTTP1",
            "IpAddressType": "ipv4"
        }
    ]
}
### Creation of scaling policy
slava@phobos:~$ aws autoscaling put-scaling-policy \
    --policy-name dos15-mikhalenka-scaling-policy \
    --auto-scaling-group-name dos15-mikhalenka-asg \
    --adjustment-type ChangeInCapacity \
    --scaling-adjustment 1
{
    "PolicyARN": "arn:aws:autoscaling:us-east-1:335809563306:scalingPolicy:08eddef3-1b19-41ae-a26a-227bd80aafe6:autoScalingGroupName/dos15-mikhalenka-asg:policyName/dos15-mikhalenka-scaling-policy",
    "Alarms": []
}
### Creation of Listener
slava@phobos:~$ aws elbv2 create-listener \
    --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:335809563306:loadbalancer/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060 \
    --protocol HTTP \
    --port 80 \
    --default-actions '[
        {
            "Type": "fixed-response",
            "FixedResponseConfig": {
                "StatusCode": "200",
                "ContentType": "text/plain",
                "MessageBody": "OK"
            }
        }
    ]'
{
    "Listeners": [
        {
            "ListenerArn": "arn:aws:elasticloadbalancing:us-east-1:335809563306:listener/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060/44386e8f1b8fb9f8",
            "LoadBalancerArn": "arn:aws:elasticloadbalancing:us-east-1:335809563306:loadbalancer/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060",
            "Port": 80,
            "Protocol": "HTTP",
            "DefaultActions": [
                {
                    "Type": "fixed-response",
                    "FixedResponseConfig": {
                        "MessageBody": "OK",
                        "StatusCode": "200",
                        "ContentType": "text/plain"
                    }
                }
            ]
        }
    ]
}
### Creation of Listener Rule
slava@phobos:~$ aws elbv2 create-rule \
    --listener-arn arn:aws:elasticloadbalancing:us-east-1:335809563306:listener/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060/44386e8f1b8fb9f8 \
    --priority 5 \
    --conditions '[
      {
          "Field": "host-header",
          "HostHeaderConfig": {
              "Values": ["*.example.com"]
          }
      }
    ]' \
    --actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:us-east-1:335809563306:targetgroup/dos15-mikhalenka-target-group/946cfd10fd004eb0
{
    "Rules": [
        {
            "RuleArn": "arn:aws:elasticloadbalancing:us-east-1:335809563306:listener-rule/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060/44386e8f1b8fb9f8/686a370e065961d1",
            "Priority": "5",
            "Conditions": [
                {
                    "Field": "host-header",
                    "Values": [
                        "*.example.com"
                    ],
                    "HostHeaderConfig": {
                        "Values": [
                            "*.example.com"
                        ]
                    }
                }
            ],
            "Actions": [
                {
                    "Type": "forward",
                    "TargetGroupArn": "arn:aws:elasticloadbalancing:us-east-1:335809563306:targetgroup/dos15-mikhalenka-target-group/946cfd10fd004eb0",
                    "ForwardConfig": {
                        "TargetGroups": [
                            {
                                "TargetGroupArn": "arn:aws:elasticloadbalancing:us-east-1:335809563306:targetgroup/dos15-mikhalenka-target-group/946cfd10fd004eb0",
                                "Weight": 1
                            }
                        ],
                        "TargetGroupStickinessConfig": {
                            "Enabled": false
                        }
                    }
                }
            ],
            "IsDefault": false
        }
    ]
}
### Deleting a rule
slava@phobos:~$ aws elbv2 delete-rule --rule-arn arn:aws:elasticloadbalancing:us-east-1:335809563306:listener-rule/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060/44386e8f1b8fb9f8/686a370e065961d1
### Deleting a listener
slava@phobos:~$ aws elbv2 delete-listener --listener-arn arn:aws:elasticloadbalancing:us-east-1:335809563306:listener/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060/44386e8f1b8fb9f8
### Deleting Load Balancer
slava@phobos:~$ aws elbv2 delete-load-balancer --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:335809563306:loadbalancer/app/dos15-mikhalenka-loadbalancer/87615ef381ddc060
### Detaching Internet Gateway
slava@phobos:~$ aws ec2 detach-internet-gateway --internet-gateway-id igw-0ee92196d1aa3646c --vpc-id vpc-01062200bc59b3189
### Deleting Internet Gateway
slava@phobos:~$ aws ec2 delete-internet-gateway --internet-gateway-id igw-0ee92196d1aa3646c
### Deleting a policy
slava@phobos:~$ aws autoscaling delete-policy --policy-name dos15-mikhalenka-scaling-policy --auto-scaling-group-name dos15-mikhalenka-asg
### Deleting Target Group
slava@phobos:~$ aws elbv2 delete-target-group --target-group-arn arn:aws:elasticloadbalancing:us-east-1:335809563306:targetgroup/dos15-mikhalenka-target-group/946cfd10fd004eb0
### Deleting Launch Template
slava@phobos:~$ aws ec2 delete-launch-template --launch-template-name dos-15-mikhalenka-lt
{
    "LaunchTemplate": {
        "LaunchTemplateId": "lt-0181e89a7e4a474c4",
        "LaunchTemplateName": "dos-15-mikhalenka-lt",
        "CreateTime": "2023-09-22T10:53:58+00:00",
        "CreatedBy": "arn:aws:iam::335809563306:user/DOS-15-student",
        "DefaultVersionNumber": 1,
        "LatestVersionNumber": 1
    }
}
### Deleting Launch Configuration
slava@phobos:~$ aws autoscaling delete-launch-configuration --launch-configuration-name dos15-mikhalenka-lcn
### Terminating all instances fro Auto Scaling Group
slava@phobos:~$ aws autoscaling terminate-instance-in-auto-scaling-group --instance-id i-07a1de1a6a67511ae --should-decrement-desired-capacity
{
    "Activity": {
        "ActivityId": "ee746f9d-3ee6-49a2-b999-f8298e03929a",
        "AutoScalingGroupName": "dos15-mikhalenka-asg",
        "Description": "Terminating EC2 instance: i-07a1de1a6a67511ae",
        "Cause": "",
        "StartTime": "2023-09-22T12:02:41.933000+00:00",
        "StatusCode": "InProgress",
        "Progress": 0,
        "Details": "{\"Subnet ID\":\"subnet-0d76b32dc45c72bdc\",\"Availability Zone\":\"us-east-1b\"}"
    }
}
### Deleting Auto Scaling Group
slava@phobos:~$ aws autoscaling delete-auto-scaling-group --auto-scaling-group-name dos15-mikhalenka-asg
### Deleting Subnets
slava@phobos:~$ aws ec2 delete-subnet --subnet-id subnet-06ad715e32e5d9299
slava@phobos:~$ aws ec2 delete-subnet --subnet-id subnet-0d76b32dc45c72bdc
### Deleting Security Group
slava@phobos:~$ aws ec2 delete-security-group --group-id sg-054e8bfe4339aa44f
### Deleting VPC
slava@phobos:~$ aws ec2 delete-vpc --vpc-id vpc-01062200bc59b3189
```