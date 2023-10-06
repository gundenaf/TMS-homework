```bash
user@localhost:~$ terraform init

Initializing the backend...
Initializing modules...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v5.19.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
user@localhost:~$ terraform plan
module.compute.data.aws_ami.latest_amazon_linux: Reading...
module.compute.data.aws_ami.latest_amazon_linux: Read complete after 0s [id=ami-0d887a308369b6881]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.compute.aws_instance.ec2 will be created
  + resource "aws_instance" "ec2" {
      + ami                                  = "ami-0d887a308369b6881"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "DOS_15_Mikhalenka"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "dos_15_mikhalenka_ec2"
        }
      + tags_all                             = {
          + "Name" = "dos_15_mikhalenka_ec2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 8
          + volume_type           = "gp2"
        }
    }

  # module.network.aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + tags_all = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + vpc_id   = (known after apply)
    }

  # module.network.aws_route_table.main will be created
  + resource "aws_route_table" "main" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + tags_all         = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + vpc_id           = (known after apply)
    }

  # module.network.aws_subnet.private will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "dos_15_mikhalenka_vpc-private"
        }
      + tags_all                                       = {
          + "Name" = "dos_15_mikhalenka_vpc-private"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.network.aws_subnet.public will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "dos_15_mikhalenka_vpc-public"
        }
      + tags_all                                       = {
          + "Name" = "dos_15_mikhalenka_vpc-public"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.network.aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + tags_all                             = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
    }

  # module.security.aws_security_group.sg will be created
  + resource "aws_security_group" "sg" {
      + arn                    = (known after apply)
      + description            = "This is my security group"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 57385
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 57385
            },
        ]
      + name                   = "dos_15_mikhalenka_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "dos_15_mikhalenka_sg"
        }
      + tags_all               = {
          + "Name" = "dos_15_mikhalenka_sg"
        }
      + vpc_id                 = (known after apply)
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_id         = (known after apply)
  + internet_gateway_id = (known after apply)
  + private_subnet_id   = (known after apply)
  + public_subnet_id    = (known after apply)
  + route_table_id      = (known after apply)
  + security_group_id   = (known after apply)
  + vpc_id              = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform
apply" now.
user@localhost:~$ terraform apply
module.compute.data.aws_ami.latest_amazon_linux: Reading...
module.compute.data.aws_ami.latest_amazon_linux: Read complete after 0s [id=ami-0d887a308369b6881]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.compute.aws_instance.ec2 will be created
  + resource "aws_instance" "ec2" {
      + ami                                  = "ami-0d887a308369b6881"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = true
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "DOS_15_Mikhalenka"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "dos_15_mikhalenka_ec2"
        }
      + tags_all                             = {
          + "Name" = "dos_15_mikhalenka_ec2"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 8
          + volume_type           = "gp2"
        }
    }

  # module.network.aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + tags_all = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + vpc_id   = (known after apply)
    }

  # module.network.aws_route_table.main will be created
  + resource "aws_route_table" "main" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + tags_all         = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + vpc_id           = (known after apply)
    }

  # module.network.aws_subnet.private will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "dos_15_mikhalenka_vpc-private"
        }
      + tags_all                                       = {
          + "Name" = "dos_15_mikhalenka_vpc-private"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.network.aws_subnet.public will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "dos_15_mikhalenka_vpc-public"
        }
      + tags_all                                       = {
          + "Name" = "dos_15_mikhalenka_vpc-public"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.network.aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
      + tags_all                             = {
          + "Name" = "dos_15_mikhalenka_vpc"
        }
    }

  # module.security.aws_security_group.sg will be created
  + resource "aws_security_group" "sg" {
      + arn                    = (known after apply)
      + description            = "This is my security group"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 57385
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 57385
            },
        ]
      + name                   = "dos_15_mikhalenka_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "dos_15_mikhalenka_sg"
        }
      + tags_all               = {
          + "Name" = "dos_15_mikhalenka_sg"
        }
      + vpc_id                 = (known after apply)
    }

Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_id         = (known after apply)
  + internet_gateway_id = (known after apply)
  + private_subnet_id   = (known after apply)
  + public_subnet_id    = (known after apply)
  + route_table_id      = (known after apply)
  + security_group_id   = (known after apply)
  + vpc_id              = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.network.aws_vpc.main: Creating...
module.network.aws_vpc.main: Still creating... [10s elapsed]
module.network.aws_vpc.main: Creation complete after 13s [id=vpc-01719189e92c914e4]
module.network.aws_internet_gateway.igw: Creating...
module.network.aws_route_table.main: Creating...
module.network.aws_subnet.private: Creating...
module.network.aws_subnet.public: Creating...
module.security.aws_security_group.sg: Creating...
module.network.aws_subnet.public: Creation complete after 2s [id=subnet-06c876de34a5f36bd]
module.network.aws_internet_gateway.igw: Creation complete after 2s [id=igw-0cbe93f12f207a55d]
module.network.aws_subnet.private: Creation complete after 2s [id=subnet-0dc178fdda74ead29]
module.network.aws_route_table.main: Creation complete after 2s [id=rtb-0da21bef203c3645c]
module.security.aws_security_group.sg: Creation complete after 4s [id=sg-0979ae79e5f999d24]
module.compute.aws_instance.ec2: Creating...
module.compute.aws_instance.ec2: Still creating... [10s elapsed]
module.compute.aws_instance.ec2: Still creating... [20s elapsed]
module.compute.aws_instance.ec2: Still creating... [30s elapsed]
module.compute.aws_instance.ec2: Creation complete after 34s [id=i-0036eddb2fa01cb01]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

instance_id = "i-0036eddb2fa01cb01"
internet_gateway_id = "igw-0cbe93f12f207a55d"
private_subnet_id = "subnet-0dc178fdda74ead29"
public_subnet_id = "subnet-06c876de34a5f36bd"
route_table_id = "rtb-0da21bef203c3645c"
security_group_id = "sg-0979ae79e5f999d24"
vpc_id = "vpc-01719189e92c914e4"
user@localhost:~$ terraform destroy
module.compute.data.aws_ami.latest_amazon_linux: Reading...
module.network.aws_vpc.main: Refreshing state... [id=vpc-01719189e92c914e4]
module.compute.data.aws_ami.latest_amazon_linux: Read complete after 1s [id=ami-0d887a308369b6881]
module.network.aws_internet_gateway.igw: Refreshing state... [id=igw-0cbe93f12f207a55d]
module.network.aws_route_table.main: Refreshing state... [id=rtb-0da21bef203c3645c]
module.network.aws_subnet.public: Refreshing state... [id=subnet-06c876de34a5f36bd]
module.network.aws_subnet.private: Refreshing state... [id=subnet-0dc178fdda74ead29]
module.security.aws_security_group.sg: Refreshing state... [id=sg-0979ae79e5f999d24]
module.compute.aws_instance.ec2: Refreshing state... [id=i-0036eddb2fa01cb01]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.compute.aws_instance.ec2 will be destroyed
  - resource "aws_instance" "ec2" {
      - ami                                  = "ami-0d887a308369b6881" -> null
      - arn                                  = "arn:aws:ec2:us-east-1:************:instance/i-0036eddb2fa01cb01" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-0036eddb2fa01cb01" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "DOS_15_Mikhalenka" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-02643b92e4b37a539" -> null
      - private_dns                          = "ip-10-0-1-75.ec2.internal" -> null
      - private_ip                           = "10.0.1.75" -> null
      - public_dns                           = "ec2-3-83-2-90.compute-1.amazonaws.com" -> null
      - public_ip                            = "***.***.***.***" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-06c876de34a5f36bd" -> null
      - tags                                 = {
          - "Name" = "dos_15_mikhalenka_ec2"
        } -> null
      - tags_all                             = {
          - "Name" = "dos_15_mikhalenka_ec2"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0979ae79e5f999d24",
        ] -> null

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/xvda" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - tags                  = {} -> null
          - throughput            = 0 -> null
          - volume_id             = "vol-0b3d82ca8b4c67b0e" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

  # module.network.aws_internet_gateway.igw will be destroyed
  - resource "aws_internet_gateway" "igw" {
      - arn      = "arn:aws:ec2:us-east-1:************:internet-gateway/igw-0cbe93f12f207a55d" -> null
      - id       = "igw-0cbe93f12f207a55d" -> null
      - owner_id = "************" -> null
      - tags     = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
      - tags_all = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
      - vpc_id   = "vpc-01719189e92c914e4" -> null
    }

  # module.network.aws_route_table.main will be destroyed
  - resource "aws_route_table" "main" {
      - arn              = "arn:aws:ec2:us-east-1:************:route-table/rtb-0da21bef203c3645c" -> null
      - id               = "rtb-0da21bef203c3645c" -> null
      - owner_id         = "************" -> null
      - propagating_vgws = [] -> null
      - route            = [] -> null
      - tags             = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
      - tags_all         = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
      - vpc_id           = "vpc-01719189e92c914e4" -> null
    }

  # module.network.aws_subnet.private will be destroyed
  - resource "aws_subnet" "private" {
      - arn                                            = "arn:aws:ec2:us-east-1:************:subnet/subnet-0dc178fdda74ead29" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.0.2.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0dc178fdda74ead29" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "************" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "dos_15_mikhalenka_vpc-private"
        } -> null
      - tags_all                                       = {
          - "Name" = "dos_15_mikhalenka_vpc-private"
        } -> null
      - vpc_id                                         = "vpc-01719189e92c914e4" -> null
    }

  # module.network.aws_subnet.public will be destroyed
  - resource "aws_subnet" "public" {
      - arn                                            = "arn:aws:ec2:us-east-1:************:subnet/subnet-06c876de34a5f36bd" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-06c876de34a5f36bd" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "************" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "dos_15_mikhalenka_vpc-public"
        } -> null
      - tags_all                                       = {
          - "Name" = "dos_15_mikhalenka_vpc-public"
        } -> null
      - vpc_id                                         = "vpc-01719189e92c914e4" -> null
    }

  # module.network.aws_vpc.main will be destroyed
  - resource "aws_vpc" "main" {
      - arn                                  = "arn:aws:ec2:us-east-1:************:vpc/vpc-01719189e92c914e4" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-0e84a4f793817d614" -> null
      - default_route_table_id               = "rtb-0e746c9171abfb26a" -> null
      - default_security_group_id            = "sg-0bd28c36e6e023407" -> null
      - dhcp_options_id                      = "dopt-0d4f27337074e6c30" -> null
      - enable_dns_hostnames                 = true -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-01719189e92c914e4" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-0e746c9171abfb26a" -> null
      - owner_id                             = "************" -> null
      - tags                                 = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
      - tags_all                             = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
    }

  # module.security.aws_security_group.sg will be destroyed
  - resource "aws_security_group" "sg" {
      - arn                    = "arn:aws:ec2:us-east-1:************:security-group/sg-0979ae79e5f999d24" -> null
      - description            = "This is my security group" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 57385
            },
        ] -> null
      - id                     = "sg-0979ae79e5f999d24" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 57385
            },
        ] -> null
      - name                   = "dos_15_mikhalenka_sg" -> null
      - owner_id               = "************" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {
          - "Name" = "dos_15_mikhalenka_sg"
        } -> null
      - tags_all               = {
          - "Name" = "dos_15_mikhalenka_sg"
        } -> null
      - vpc_id                 = "vpc-01719189e92c914e4" -> null
    }

Plan: 0 to add, 0 to change, 7 to destroy.

Changes to Outputs:
  - instance_id         = "i-0036eddb2fa01cb01" -> null
  - internet_gateway_id = "igw-0cbe93f12f207a55d" -> null
  - private_subnet_id   = "subnet-0dc178fdda74ead29" -> null
  - public_subnet_id    = "subnet-06c876de34a5f36bd" -> null
  - route_table_id      = "rtb-0da21bef203c3645c" -> null
  - security_group_id   = "sg-0979ae79e5f999d24" -> null
  - vpc_id              = "vpc-01719189e92c914e4" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.network.aws_internet_gateway.igw: Destroying... [id=igw-0cbe93f12f207a55d]
module.network.aws_route_table.main: Destroying... [id=rtb-0da21bef203c3645c]
module.network.aws_subnet.private: Destroying... [id=subnet-0dc178fdda74ead29]
module.compute.aws_instance.ec2: Destroying... [id=i-0036eddb2fa01cb01]
module.network.aws_subnet.private: Destruction complete after 1s
module.network.aws_route_table.main: Destruction complete after 2s
module.network.aws_internet_gateway.igw: Still destroying... [id=igw-0cbe93f12f207a55d, 10s elapsed]
module.compute.aws_instance.ec2: Still destroying... [id=i-0036eddb2fa01cb01, 10s elapsed]
module.network.aws_internet_gateway.igw: Still destroying... [id=igw-0cbe93f12f207a55d, 20s elapsed]
module.compute.aws_instance.ec2: Still destroying... [id=i-0036eddb2fa01cb01, 20s elapsed]
module.network.aws_internet_gateway.igw: Still destroying... [id=igw-0cbe93f12f207a55d, 30s elapsed]
module.compute.aws_instance.ec2: Still destroying... [id=i-0036eddb2fa01cb01, 30s elapsed]
module.network.aws_internet_gateway.igw: Destruction complete after 39s
module.compute.aws_instance.ec2: Still destroying... [id=i-0036eddb2fa01cb01, 40s elapsed]
module.compute.aws_instance.ec2: Destruction complete after 42s
module.network.aws_subnet.public: Destroying... [id=subnet-06c876de34a5f36bd]
module.security.aws_security_group.sg: Destroying... [id=sg-0979ae79e5f999d24]
module.network.aws_subnet.public: Destruction complete after 1s
module.security.aws_security_group.sg: Destruction complete after 1s
module.network.aws_vpc.main: Destroying... [id=vpc-01719189e92c914e4]
module.network.aws_vpc.main: Destruction complete after 1s

Destroy complete! Resources: 7 destroyed.
```