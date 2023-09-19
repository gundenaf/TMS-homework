```bash
slava@phobos:~$ aws ec2 create-volume --availability-zone us-east-1a --size 1 --volume-type gp2
{
    "AvailabilityZone": "us-east-1a",
    "CreateTime": "2023-09-19T08:35:56+00:00",
    "Encrypted": false,
    "Size": 1,
    "SnapshotId": "",
    "State": "creating",
    "VolumeId": "vol-0258d6f216da86905",
    "Iops": 100,
    "Tags": [],
    "VolumeType": "gp2",
    "MultiAttachEnabled": false
}
slava@phobos:~$ aws ec2 describe-subnets
{
    "Subnets": [
        {
            "AvailabilityZone": "us-east-1a",
            "AvailabilityZoneId": "use1-az2",
            "AvailableIpAddressCount": 4091,
            "CidrBlock": "172.31.48.0/20",
            "DefaultForAz": true,
            "MapPublicIpOnLaunch": true,
            "MapCustomerOwnedIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-0f3036538c81def25",
            "VpcId": "vpc-042884a1f4f1e3b08",
            "OwnerId": "335809563306",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "SubnetArn": "arn:aws:ec2:us-east-1:335809563306:subnet/subnet-0f3036538c81def25",
            "EnableDns64": false,
            "Ipv6Native": false,
            "PrivateDnsNameOptionsOnLaunch": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            }
        }
slava@phobos:~$ aws ec2 run-instances \
  --image-id ami-04cb4ca688797756f \
  --instance-type t2.micro \
  --key-name DOS_15_Mikhalenka \
  --subnet-id subnet-0f3036538c81def25
{
    "Groups": [],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-04cb4ca688797756f",
            "InstanceId": "i-0d06d6ec8a82ee7d7",
            "InstanceType": "t2.micro",
            "KeyName": "DOS_15_Mikhalenka",
            "LaunchTime": "2023-09-19T08:36:15+00:00",
            "Monitoring": {
                "State": "disabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "PrivateDnsName": "ip-172-31-57-124.ec2.internal",
            "PrivateIpAddress": "172.31.57.124",
            "ProductCodes": [],
            "PublicDnsName": "",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-0f3036538c81def25",
            "VpcId": "vpc-042884a1f4f1e3b08",
            "Architecture": "x86_64",
            "BlockDeviceMappings": [],
            "ClientToken": "8322102e-e347-4784-9d22-04ea82540202",
            "EbsOptimized": false,
            "EnaSupport": true,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "AttachTime": "2023-09-19T08:36:15+00:00",
                        "AttachmentId": "eni-attach-0bdf3344f49f581ad",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attaching",
                        "NetworkCardIndex": 0
                    },
                    "Description": "",
                    "Groups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-033c4440749c7e3cd"
                        }
                    ],
                    "Ipv6Addresses": [],
                    "MacAddress": "12:00:95:ad:2a:ef",
                    "NetworkInterfaceId": "eni-033168a23b4a4d4b4",
                    "OwnerId": "335809563306",
                    "PrivateDnsName": "ip-172-31-57-124.ec2.internal",
                    "PrivateIpAddress": "172.31.57.124",
                    "PrivateIpAddresses": [
                        {
                            "Primary": true,
                            "PrivateDnsName": "ip-172-31-57-124.ec2.internal",
                            "PrivateIpAddress": "172.31.57.124"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-0f3036538c81def25",
                    "VpcId": "vpc-042884a1f4f1e3b08",
                    "InterfaceType": "interface"
                }
            ],
            "RootDeviceName": "/dev/xvda",
            "RootDeviceType": "ebs",
            "SecurityGroups": [
                {
                    "GroupName": "default",
                    "GroupId": "sg-033c4440749c7e3cd"
                }
            ],
            "SourceDestCheck": true,
            "StateReason": {
                "Code": "pending",
                "Message": "pending"
            },
            "VirtualizationType": "hvm",
            "CpuOptions": {
                "CoreCount": 1,
                "ThreadsPerCore": 1
            },
            "CapacityReservationSpecification": {
                "CapacityReservationPreference": "open"
            },
            "MetadataOptions": {
                "State": "pending",
                "HttpTokens": "required",
                "HttpPutResponseHopLimit": 2,
                "HttpEndpoint": "enabled",
                "HttpProtocolIpv6": "disabled",
                "InstanceMetadataTags": "disabled"
            },
            "EnclaveOptions": {
                "Enabled": false
            },
            "BootMode": "uefi-preferred",
            "PrivateDnsNameOptions": {
                "HostnameType": "ip-name",
                "EnableResourceNameDnsARecord": false,
                "EnableResourceNameDnsAAAARecord": false
            },
            "MaintenanceOptions": {
                "AutoRecovery": "default"
            },
            "CurrentInstanceBootMode": "legacy-bios"
        }
    ],
    "OwnerId": "335809563306",
    "ReservationId": "r-0c71eb0cbf993d0b7"
}
slava@phobos:~$ aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[0].Instances[0].InstanceId" --output text
i-0d06d6ec8a82ee7d7
slava@phobos:~$ aws ec2 attach-volume --volume-id vol-0258d6f216da86905 --instance-id i-0d06d6ec8a82ee7d7 --device /dev/sdf
{
    "AttachTime": "2023-09-19T08:38:19.099000+00:00",
    "Device": "/dev/sdf",
    "InstanceId": "i-0d06d6ec8a82ee7d7",
    "State": "attaching",
    "VolumeId": "vol-0258d6f216da86905"
}
slava@phobos:~$ aws s3api create-bucket --bucket dos-15-mikhalenka-s3 --region us-east-1
{
    "Location": "/dos-15-mikhalenka-s3"
}
slava@phobos:~$ aws s3 cp test1.txt s3://dos-15-mikhalenka-s3/
upload: ./test1.txt to s3://dos-15-mikhalenka-s3/test1.txt
slava@phobos:~$ aws s3 cp test2.txt s3://dos-15-mikhalenka-s3/
upload: ./test2.txt to s3://dos-15-mikhalenka-s3/test2.txt
slava@phobos:~$ VPC_ID=$(aws ec2 describe-vpcs --query 'Vpcs[0].VpcId' --output text)
slava@phobos:~$ IGW_ID=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text)
slava@phobos:~$ aws ec2 attach-internet-gateway --internet-gateway-id $IGW_ID --vpc-id $VPC_ID
slava@phobos:~$ ROUTE_TABLE_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID --query 'RouteTable.RouteTableId' --output text)
slava@phobos:~$ aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
{
    "Return": true
}
slava@phobos:~$ aws rds create-db-instance \
  --db-instance-identifier dos-15-mikhalenka-rds \
  --db-instance-class db.t2.micro \
  --engine MySQL \
  --master-username dos15mikhalenka \
  --master-user-password dos-15-student \
  --publicly-accessible \
  --allocated-storage 20
{
    "DBInstance": {
        "DBInstanceIdentifier": "dos-15-mikhalenka-rds",
        "DBInstanceClass": "db.t2.micro",
        "Engine": "mysql",
        "DBInstanceStatus": "creating",
        "MasterUsername": "dos15mikhalenka",
        "AllocatedStorage": 20,
        "PreferredBackupWindow": "10:25-10:55",
        "BackupRetentionPeriod": 1,
        "DBSecurityGroups": [],
        "VpcSecurityGroups": [
            {
                "VpcSecurityGroupId": "sg-033c4440749c7e3cd",
                "Status": "active"
            }
        ],
        "DBParameterGroups": [
            {
                "DBParameterGroupName": "default.mysql8.0",
                "ParameterApplyStatus": "in-sync"
            }
        ],
        "DBSubnetGroup": {
            "DBSubnetGroupName": "default",
            "DBSubnetGroupDescription": "default",
            "VpcId": "vpc-042884a1f4f1e3b08",
            "SubnetGroupStatus": "Complete",
            "Subnets": [
                {
                    "SubnetIdentifier": "subnet-0f3036538c81def25",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1a"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                },
                {
                    "SubnetIdentifier": "subnet-09d39c0fc26215511",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1b"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                }
            ]
        },
        "PreferredMaintenanceWindow": "fri:07:46-fri:08:16",
        "PendingModifiedValues": {
            "MasterUserPassword": "****"
        },
        "MultiAZ": false,
        "EngineVersion": "8.0.33",
        "AutoMinorVersionUpgrade": true,
        "ReadReplicaDBInstanceIdentifiers": [],
        "LicenseModel": "general-public-license",
        "OptionGroupMemberships": [
            {
                "OptionGroupName": "default:mysql-8-0",
                "Status": "in-sync"
            }
        ],
        "PubliclyAccessible": true,
        "StorageType": "gp2",
        "DbInstancePort": 0,
        "StorageEncrypted": false,
        "DbiResourceId": "db-UHJNDO5IMCK2HCY5KACOAHRFKI",
        "CACertificateIdentifier": "rds-ca-2019",
        "DomainMemberships": [],
        "CopyTagsToSnapshot": false,
        "MonitoringInterval": 0,
        "DBInstanceArn": "arn:aws:rds:us-east-1:335809563306:db:dos-15-mikhalenka-rds",
        "IAMDatabaseAuthenticationEnabled": false,
        "PerformanceInsightsEnabled": false,
        "DeletionProtection": false,
        "AssociatedRoles": [],
        "TagList": [],
        "CustomerOwnedIpEnabled": false,
        "BackupTarget": "region",
        "NetworkType": "IPV4",
        "StorageThroughput": 0,
        "CertificateDetails": {
            "CAIdentifier": "rds-ca-2019"
        }
    }
}
slava@phobos:~$ aws rds create-db-snapshot --db-instance-identifier dos-15-mikhalenka-rds --db-snapshot-identifier dos-15-mikhalenka-rds-snapshot
{
    "DBSnapshot": {
        "DBSnapshotIdentifier": "dos-15-mikhalenka-rds-snapshot",
        "DBInstanceIdentifier": "dos-15-mikhalenka-rds",
        "Engine": "mysql",
        "AllocatedStorage": 20,
        "Status": "creating",
        "Port": 3306,
        "AvailabilityZone": "us-east-1b",
        "VpcId": "vpc-042884a1f4f1e3b08",
        "InstanceCreateTime": "2023-09-19T08:55:18.093000+00:00",
        "MasterUsername": "dos15mikhalenka",
        "EngineVersion": "8.0.33",
        "LicenseModel": "general-public-license",
        "SnapshotType": "manual",
        "OptionGroupName": "default:mysql-8-0",
        "PercentProgress": 0,
        "StorageType": "gp2",
        "Encrypted": false,
        "DBSnapshotArn": "arn:aws:rds:us-east-1:335809563306:snapshot:dos-15-mikhalenka-rds-snapshot",
        "IAMDatabaseAuthenticationEnabled": false,
        "ProcessorFeatures": [],
        "DbiResourceId": "db-UHJNDO5IMCK2HCY5KACOAHRFKI",
        "TagList": [],
        "SnapshotTarget": "region",
        "StorageThroughput": 0
    }
}
slava@phobos:~$ aws rds restore-db-instance-from-db-snapshot --db-instance-identifier dos-15-mikhalenka-rds-new --db-snapshot-identifier dos-15-mikhalenka-rds-snapshot{
    "DBInstance": {
        "DBInstanceIdentifier": "dos-15-mikhalenka-rds-new",
        "DBInstanceClass": "db.t2.micro",
        "Engine": "mysql",
        "DBInstanceStatus": "creating",
        "MasterUsername": "dos15mikhalenka",
        "AllocatedStorage": 20,
        "PreferredBackupWindow": "10:25-10:55",
        "BackupRetentionPeriod": 1,
        "DBSecurityGroups": [],
        "VpcSecurityGroups": [
            {
                "VpcSecurityGroupId": "sg-033c4440749c7e3cd",
                "Status": "active"
            }
        ],
        "DBParameterGroups": [
            {
                "DBParameterGroupName": "default.mysql8.0",
                "ParameterApplyStatus": "in-sync"
            }
        ],
        "DBSubnetGroup": {
            "DBSubnetGroupName": "default",
            "DBSubnetGroupDescription": "default",
            "VpcId": "vpc-042884a1f4f1e3b08",
            "SubnetGroupStatus": "Complete",
            "Subnets": [
                {
                    "SubnetIdentifier": "subnet-0f3036538c81def25",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1a"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                },
                {
                    "SubnetIdentifier": "subnet-09d39c0fc26215511",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1b"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                }
            ]
        },
        "PreferredMaintenanceWindow": "fri:07:46-fri:08:16",
        "PendingModifiedValues": {},
        "MultiAZ": false,
        "EngineVersion": "8.0.33",
        "AutoMinorVersionUpgrade": true,
        "ReadReplicaDBInstanceIdentifiers": [],
        "LicenseModel": "general-public-license",
        "OptionGroupMemberships": [
            {
                "OptionGroupName": "default:mysql-8-0",
                "Status": "pending-apply"
            }
        ],
        "PubliclyAccessible": true,
        "StorageType": "gp2",
        "DbInstancePort": 0,
        "StorageEncrypted": false,
        "DbiResourceId": "db-ZTYBOPCCCQUCUMVFND675C2KCQ",
        "CACertificateIdentifier": "rds-ca-2019",
        "DomainMemberships": [],
        "CopyTagsToSnapshot": false,
        "MonitoringInterval": 0,
        "DBInstanceArn": "arn:aws:rds:us-east-1:335809563306:db:dos-15-mikhalenka-rds-new",
        "IAMDatabaseAuthenticationEnabled": false,
        "PerformanceInsightsEnabled": false,
        "DeletionProtection": false,
        "AssociatedRoles": [],
        "TagList": [],
        "CustomerOwnedIpEnabled": false,
        "BackupTarget": "region",
        "NetworkType": "IPV4",
        "StorageThroughput": 0,
        "CertificateDetails": {
            "CAIdentifier": "rds-ca-2019"
        }
    }
}
slava@phobos:~$ aws ec2 terminate-instances --instance-ids i-0d06d6ec8a82ee7d7
{
    "TerminatingInstances": [
        {
            "CurrentState": {
                "Code": 32,
                "Name": "shutting-down"
            },
            "InstanceId": "i-0d06d6ec8a82ee7d7",
            "PreviousState": {
                "Code": 16,
                "Name": "running"
            }
        }
    ]
}
slava@phobos:~$ aws rds delete-db-instance --db-instance-identifier dos-15-mikhalenka-rds --skip-final-snapshot
{
    "DBInstance": {
        "DBInstanceIdentifier": "dos-15-mikhalenka-rds",
        "DBInstanceClass": "db.t2.micro",
        "Engine": "mysql",
        "DBInstanceStatus": "deleting",
        "MasterUsername": "dos15mikhalenka",
        "Endpoint": {
            "Address": "dos-15-mikhalenka-rds.cwnwavacp3w4.us-east-1.rds.amazonaws.com",
            "Port": 3306,
            "HostedZoneId": "Z2R2ITUGPM61AM"
        },
        "AllocatedStorage": 20,
        "InstanceCreateTime": "2023-09-19T08:55:18.093000+00:00",
        "PreferredBackupWindow": "10:25-10:55",
        "BackupRetentionPeriod": 1,
        "DBSecurityGroups": [],
        "VpcSecurityGroups": [
            {
                "VpcSecurityGroupId": "sg-033c4440749c7e3cd",
                "Status": "active"
            }
        ],
        "DBParameterGroups": [
            {
                "DBParameterGroupName": "default.mysql8.0",
                "ParameterApplyStatus": "in-sync"
            }
        ],
        "AvailabilityZone": "us-east-1b",
        "DBSubnetGroup": {
            "DBSubnetGroupName": "default",
            "DBSubnetGroupDescription": "default",
            "VpcId": "vpc-042884a1f4f1e3b08",
            "SubnetGroupStatus": "Complete",
            "Subnets": [
                {
                    "SubnetIdentifier": "subnet-0f3036538c81def25",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1a"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                },
                {
                    "SubnetIdentifier": "subnet-09d39c0fc26215511",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1b"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                }
            ]
        },
        "PreferredMaintenanceWindow": "fri:07:46-fri:08:16",
        "PendingModifiedValues": {},
        "LatestRestorableTime": "2023-09-19T09:00:01+00:00",
        "MultiAZ": false,
        "EngineVersion": "8.0.33",
        "AutoMinorVersionUpgrade": true,
        "ReadReplicaDBInstanceIdentifiers": [],
        "LicenseModel": "general-public-license",
        "OptionGroupMemberships": [
            {
                "OptionGroupName": "default:mysql-8-0",
                "Status": "in-sync"
            }
        ],
        "PubliclyAccessible": true,
        "StorageType": "gp2",
        "DbInstancePort": 0,
        "StorageEncrypted": false,
        "DbiResourceId": "db-UHJNDO5IMCK2HCY5KACOAHRFKI",
        "CACertificateIdentifier": "",
        "DomainMemberships": [],
        "CopyTagsToSnapshot": false,
        "MonitoringInterval": 0,
        "DBInstanceArn": "arn:aws:rds:us-east-1:335809563306:db:dos-15-mikhalenka-rds",
        "IAMDatabaseAuthenticationEnabled": false,
        "PerformanceInsightsEnabled": false,
        "DeletionProtection": false,
        "AssociatedRoles": [],
        "TagList": [],
        "CustomerOwnedIpEnabled": false,
        "BackupTarget": "region",
        "NetworkType": "IPV4",
        "StorageThroughput": 0
    }
}
slava@phobos:~$ aws rds delete-db-instance --db-instance-identifier dos-15-mikhalenka-rds-new --skip-final-snapshot
{
    "DBInstance": {
        "DBInstanceIdentifier": "dos-15-mikhalenka-rds-new",
        "DBInstanceClass": "db.t2.micro",
        "Engine": "mysql",
        "DBInstanceStatus": "deleting",
        "MasterUsername": "dos15mikhalenka",
        "Endpoint": {
            "Address": "dos-15-mikhalenka-rds-new.cwnwavacp3w4.us-east-1.rds.amazonaws.com",
            "Port": 3306,
            "HostedZoneId": "Z2R2ITUGPM61AM"
        },
        "AllocatedStorage": 20,
        "InstanceCreateTime": "2023-09-19T09:03:03.604000+00:00",
        "PreferredBackupWindow": "10:25-10:55",
        "BackupRetentionPeriod": 1,
        "DBSecurityGroups": [],
        "VpcSecurityGroups": [
            {
                "VpcSecurityGroupId": "sg-033c4440749c7e3cd",
                "Status": "active"
            }
        ],
        "DBParameterGroups": [
            {
                "DBParameterGroupName": "default.mysql8.0",
                "ParameterApplyStatus": "in-sync"
            }
        ],
        "AvailabilityZone": "us-east-1b",
        "DBSubnetGroup": {
            "DBSubnetGroupName": "default",
            "DBSubnetGroupDescription": "default",
            "VpcId": "vpc-042884a1f4f1e3b08",
            "SubnetGroupStatus": "Complete",
            "Subnets": [
                {
                    "SubnetIdentifier": "subnet-0f3036538c81def25",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1a"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                },
                {
                    "SubnetIdentifier": "subnet-09d39c0fc26215511",
                    "SubnetAvailabilityZone": {
                        "Name": "us-east-1b"
                    },
                    "SubnetOutpost": {},
                    "SubnetStatus": "Active"
                }
            ]
        },
        "PreferredMaintenanceWindow": "fri:07:46-fri:08:16",
        "PendingModifiedValues": {},
        "MultiAZ": false,
        "EngineVersion": "8.0.33",
        "AutoMinorVersionUpgrade": true,
        "ReadReplicaDBInstanceIdentifiers": [],
        "LicenseModel": "general-public-license",
        "OptionGroupMemberships": [
            {
                "OptionGroupName": "default:mysql-8-0",
                "Status": "pending-apply"
            }
        ],
        "PubliclyAccessible": true,
        "StorageType": "gp2",
        "DbInstancePort": 0,
        "StorageEncrypted": false,
        "DbiResourceId": "db-ZTYBOPCCCQUCUMVFND675C2KCQ",
        "CACertificateIdentifier": "",
        "DomainMemberships": [],
        "CopyTagsToSnapshot": false,
        "MonitoringInterval": 0,
        "DBInstanceArn": "arn:aws:rds:us-east-1:335809563306:db:dos-15-mikhalenka-rds-new",
        "IAMDatabaseAuthenticationEnabled": false,
        "PerformanceInsightsEnabled": false,
        "DeletionProtection": false,
        "AssociatedRoles": [],
        "TagList": [],
        "CustomerOwnedIpEnabled": false,
        "BackupTarget": "region",
        "NetworkType": "IPV4",
        "StorageThroughput": 0
    }
}
slava@phobos:~$ aws s3 rb s3://dos-15-mikhalenka-s3 --force
delete: s3://dos-15-mikhalenka-s3/test1.txt
delete: s3://dos-15-mikhalenka-s3/test2.txt
remove_bucket: dos-15-mikhalenka-s3
slava@phobos:~$ aws ec2 delete-volume --volume-id vol-0258d6f216da86905
slava@phobos:~$ aws ec2 describe-internet-gateways --query "InternetGateways[0].InternetGatewayId" --output text
igw-015afb8f2df38f0f7
slava@phobos:~$ aws ec2 describe-vpcs --query "Vpcs[0].VpcId" --output text
vpc-042884a1f4f1e3b08
slava@phobos:~$ aws ec2 detach-internet-gateway --internet-gateway-id igw-015afb8f2df38f0f7 --vpc-id vpc-042884a1f4f1e3b08
slava@phobos:~$ aws ec2 delete-internet-gateway --internet-gateway-id igw-015afb8f2df38f0f7
slava@phobos:~$ aws ec2 describe-route-tables --query "RouteTables[*].{ID:RouteTableId}"
[
    {
        "ID": "rtb-0ef7e278413a4f533"
    },
    {
        "ID": "rtb-069b4f12addefb145"
    }
]
slava@phobos:~$ aws ec2 delete-route-table --route-table-id rtb-0ef7e278413a4f533
slava@phobos:~$ aws rds delete-db-snapshot --db-snapshot-identifier dos-15-mikhalenka-rds-snapshot
{
    "DBSnapshot": {
        "DBSnapshotIdentifier": "dos-15-mikhalenka-rds-snapshot",
        "DBInstanceIdentifier": "dos-15-mikhalenka-rds",
        "SnapshotCreateTime": "2023-09-19T08:58:48.838000+00:00",
        "Engine": "mysql",
        "AllocatedStorage": 20,
        "Status": "deleted",
        "Port": 3306,
        "AvailabilityZone": "us-east-1b",
        "VpcId": "vpc-042884a1f4f1e3b08",
        "InstanceCreateTime": "2023-09-19T08:55:18.093000+00:00",
        "MasterUsername": "dos15mikhalenka",
        "EngineVersion": "8.0.33",
        "LicenseModel": "general-public-license",
        "SnapshotType": "manual",
        "OptionGroupName": "default:mysql-8-0",
        "PercentProgress": 100,
        "StorageType": "gp2",
        "Encrypted": false,
        "DBSnapshotArn": "arn:aws:rds:us-east-1:335809563306:snapshot:dos-15-mikhalenka-rds-snapshot",
        "IAMDatabaseAuthenticationEnabled": false,
        "ProcessorFeatures": [],
        "DbiResourceId": "db-UHJNDO5IMCK2HCY5KACOAHRFKI",
        "TagList": [],
        "OriginalSnapshotCreateTime": "2023-09-19T08:58:48.838000+00:00",
        "SnapshotTarget": "region",
        "StorageThroughput": 0
    }
}
```