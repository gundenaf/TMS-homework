```bash
slava@phobos:~/git-projects/private/TMS-homework/Cloud Computing (AWS)/homework_1/IaC-way$ terraform init

Initializing the backend...
Initializing modules...
- aws_ec2_instance in modules/aws-ec2-instance

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
slava@phobos:~/git-projects/private/TMS-homework/Cloud Computing (AWS)/homework_1/IaC-way$ terraform apply
module.aws_ec2_instance.data.aws_ami.amazon_linux: Reading...
module.aws_ec2_instance.data.aws_ami.amazon_linux: Read complete after 1s [id=ami-0d887a308369b6881]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2 will be created
  + resource "aws_instance" "dos_15_mikhalenka_ec2" {
      + ami                                  = "ami-0d887a308369b6881"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
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
      + key_name                             = (known after apply)
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
    }

  # module.aws_ec2_instance.aws_security_group.dos_15_mikhalenka_sg will be created
  + resource "aws_security_group" "dos_15_mikhalenka_sg" {
      + arn                    = (known after apply)
      + description            = "Allow SSH traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = [
                  + "::/0",
                ]
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow SSH traffic from everywhere"
              + from_port        = 22
              + ipv6_cidr_blocks = [
                  + "::/0",
                ]
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 39853
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

  # module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig will be created
  + resource "aws_internet_gateway" "dos_15_mikhalenka_ig" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "dos_15_mikhalenka_ig"
        }
      + tags_all = {
          + "Name" = "dos_15_mikhalenka_ig"
        }
      + vpc_id   = (known after apply)
    }

  # module.aws_ec2_vpc.aws_route_table.dos_15_mikhalenka_rt will be created
  + resource "aws_route_table" "dos_15_mikhalenka_rt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "dos_15_mikhalenka_rt"
        }
      + tags_all         = {
          + "Name" = "dos_15_mikhalenka_rt"
        }
      + vpc_id           = (known after apply)
    }

  # module.aws_ec2_vpc.aws_route_table_association.dos_15_mikhalenka_rt_as will be created
  + resource "aws_route_table_association" "dos_15_mikhalenka_rt_as" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet will be created
  + resource "aws_subnet" "dos_15_mikhalenka_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.0.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "dos_15_mikhalenka_subnet"
        }
      + tags_all                                       = {
          + "Name" = "dos_15_mikhalenka_subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.aws_ec2_vpc.aws_vpc.dos_15_mikhalenka_vpc will be created
  + resource "aws_vpc" "dos_15_mikhalenka_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
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

Plan: 7 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_id        = (known after apply)
  + instance_public_ip = (known after apply)
  + vpc_id             = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.aws_ec2_vpc.aws_vpc.dos_15_mikhalenka_vpc: Creating...
module.aws_ec2_vpc.aws_vpc.dos_15_mikhalenka_vpc: Creation complete after 3s [id=vpc-013bcd1b08b88f2c8]
module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig: Creating...
module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet: Creating...
module.aws_ec2_instance.aws_security_group.dos_15_mikhalenka_sg: Creating...
module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig: Creation complete after 1s [id=igw-0b4dd66a734cb6a98]
module.aws_ec2_vpc.aws_route_table.dos_15_mikhalenka_rt: Creating...
module.aws_ec2_vpc.aws_route_table.dos_15_mikhalenka_rt: Creation complete after 2s [id=rtb-0d1a62a95f4f539b2]
module.aws_ec2_instance.aws_security_group.dos_15_mikhalenka_sg: Creation complete after 3s [id=sg-0689fe6c030336435]
module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet: Still creating... [10s elapsed]
module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet: Creation complete after 11s [id=subnet-009ed77b62c823328]
module.aws_ec2_vpc.aws_route_table_association.dos_15_mikhalenka_rt_as: Creating...
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Creating...
module.aws_ec2_vpc.aws_route_table_association.dos_15_mikhalenka_rt_as: Creation complete after 1s [id=rtbassoc-0bb7045f7a81cc847]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Still creating... [10s elapsed]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Still creating... [20s elapsed]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Still creating... [30s elapsed]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Creation complete after 34s [id=i-09ad191762e3fe5d8]

Apply complete! Resources: 7 added, 0 changed, 0 destroyed.

Outputs:

instance_id = "i-09ad191762e3fe5d8"
instance_public_ip = "**.***.**.**"
vpc_id = "vpc-013bcd1b08b88f2c8"
slava@phobos:~/git-projects/private/TMS-homework/Cloud Computing (AWS)/homework_1/IaC-way$ terraform destroy
module.aws_ec2_instance.data.aws_ami.amazon_linux: Reading...
module.aws_ec2_vpc.aws_vpc.dos_15_mikhalenka_vpc: Refreshing state... [id=vpc-013bcd1b08b88f2c8]
module.aws_ec2_instance.data.aws_ami.amazon_linux: Read complete after 1s [id=ami-0d887a308369b6881]
module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig: Refreshing state... [id=igw-0b4dd66a734cb6a98]
module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet: Refreshing state... [id=subnet-009ed77b62c823328]
module.aws_ec2_instance.aws_security_group.dos_15_mikhalenka_sg: Refreshing state... [id=sg-0689fe6c030336435]
module.aws_ec2_vpc.aws_route_table.dos_15_mikhalenka_rt: Refreshing state... [id=rtb-0d1a62a95f4f539b2]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Refreshing state... [id=i-09ad191762e3fe5d8]
module.aws_ec2_vpc.aws_route_table_association.dos_15_mikhalenka_rt_as: Refreshing state... [id=rtbassoc-0bb7045f7a81cc847]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2 will be destroyed
  - resource "aws_instance" "dos_15_mikhalenka_ec2" {
      - ami                                  = "ami-0d887a308369b6881" -> null 
      - arn                                  = "arn:aws:ec2:us-east-1:************:instance/i-09ad191762e3fe5d8" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - id                                   = "i-09ad191762e3fe5d8" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-05230a51724413070" -> null
      - private_dns                          = "ip-10-0-0-183.ec2.internal" -> null
      - private_ip                           = "10.0.0.183" -> null
      - public_ip                            = "**.***.**.**" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-009ed77b62c823328" -> null
      - tags                                 = {
          - "Name" = "dos_15_mikhalenka_ec2"
        } -> null
      - tags_all                             = {
          - "Name" = "dos_15_mikhalenka_ec2"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0689fe6c030336435",
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
          - volume_id             = "vol-06d50841ae567e5ac" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

  # module.aws_ec2_instance.aws_security_group.dos_15_mikhalenka_sg will be destroyed
  - resource "aws_security_group" "dos_15_mikhalenka_sg" {
      - arn                    = "arn:aws:ec2:us-east-1:************:security-group/sg-0689fe6c030336435" -> null
      - description            = "Allow SSH traffic" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = ""
              - from_port        = 0
              - ipv6_cidr_blocks = [
                  - "::/0",
                ]
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
            },
        ] -> null
      - id                     = "sg-0689fe6c030336435" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow SSH traffic from everywhere"
              - from_port        = 22
              - ipv6_cidr_blocks = [
                  - "::/0",
                ]
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 39853
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
      - vpc_id                 = "vpc-013bcd1b08b88f2c8" -> null
    }

  # module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig will be destroyed
  - resource "aws_internet_gateway" "dos_15_mikhalenka_ig" {
      - arn      = "arn:aws:ec2:us-east-1:************:internet-gateway/igw-0b4dd66a734cb6a98" -> null
      - id       = "igw-0b4dd66a734cb6a98" -> null
      - owner_id = "************" -> null
      - tags     = {
          - "Name" = "dos_15_mikhalenka_ig"
        } -> null
      - tags_all = {
          - "Name" = "dos_15_mikhalenka_ig"
        } -> null
      - vpc_id   = "vpc-013bcd1b08b88f2c8" -> null
    }

  # module.aws_ec2_vpc.aws_route_table.dos_15_mikhalenka_rt will be destroyed
  - resource "aws_route_table" "dos_15_mikhalenka_rt" {
      - arn              = "arn:aws:ec2:us-east-1:************:route-table/rtb-0d1a62a95f4f539b2" -> null
      - id               = "rtb-0d1a62a95f4f539b2" -> null
      - owner_id         = "************" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - carrier_gateway_id         = ""
              - cidr_block                 = "0.0.0.0/0"
              - core_network_arn           = ""
              - destination_prefix_list_id = ""
              - egress_only_gateway_id     = ""
              - gateway_id                 = "igw-0b4dd66a734cb6a98"
              - ipv6_cidr_block            = ""
              - local_gateway_id           = ""
              - nat_gateway_id             = ""
              - network_interface_id       = ""
              - transit_gateway_id         = ""
              - vpc_endpoint_id            = ""
              - vpc_peering_connection_id  = ""
            },
        ] -> null
      - tags             = {
          - "Name" = "dos_15_mikhalenka_rt"
        } -> null
      - tags_all         = {
          - "Name" = "dos_15_mikhalenka_rt"
        } -> null
      - vpc_id           = "vpc-013bcd1b08b88f2c8" -> null
    }

  # module.aws_ec2_vpc.aws_route_table_association.dos_15_mikhalenka_rt_as will be destroyed
  - resource "aws_route_table_association" "dos_15_mikhalenka_rt_as" {
      - id             = "rtbassoc-0bb7045f7a81cc847" -> null
      - route_table_id = "rtb-0d1a62a95f4f539b2" -> null
      - subnet_id      = "subnet-009ed77b62c823328" -> null
    }

  # module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet will be destroyed
  - resource "aws_subnet" "dos_15_mikhalenka_subnet" {
      - arn                                            = "arn:aws:ec2:us-east-1:************:subnet/subnet-009ed77b62c823328" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az2" -> null
      - cidr_block                                     = "10.0.0.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-009ed77b62c823328" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "************" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "dos_15_mikhalenka_subnet"
        } -> null
      - tags_all                                       = {
          - "Name" = "dos_15_mikhalenka_subnet"
        } -> null
      - vpc_id                                         = "vpc-013bcd1b08b88f2c8" -> null
    }

  # module.aws_ec2_vpc.aws_vpc.dos_15_mikhalenka_vpc will be destroyed
  - resource "aws_vpc" "dos_15_mikhalenka_vpc" {
      - arn                                  = "arn:aws:ec2:us-east-1:************:vpc/vpc-013bcd1b08b88f2c8" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-02200f14b99c60446" -> null
      - default_route_table_id               = "rtb-051d6d2f9e5c11591" -> null
      - default_security_group_id            = "sg-0bca542d93ba1e0f5" -> null
      - dhcp_options_id                      = "dopt-0d4f27337074e6c30" -> null
      - enable_dns_hostnames                 = false -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-013bcd1b08b88f2c8" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-051d6d2f9e5c11591" -> null
      - owner_id                             = "************" -> null
      - tags                                 = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
      - tags_all                             = {
          - "Name" = "dos_15_mikhalenka_vpc"
        } -> null
    }

Plan: 0 to add, 0 to change, 7 to destroy.

Changes to Outputs:
  - instance_id        = "i-09ad191762e3fe5d8" -> null
  - instance_public_ip = "**.***.**.**" -> null
  - vpc_id             = "vpc-013bcd1b08b88f2c8" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.aws_ec2_vpc.aws_route_table_association.dos_15_mikhalenka_rt_as: Destroying... [id=rtbassoc-0bb7045f7a81cc847]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Destroying... [id=i-09ad191762e3fe5d8]
module.aws_ec2_vpc.aws_route_table_association.dos_15_mikhalenka_rt_as: Destruction complete after 1s
module.aws_ec2_vpc.aws_route_table.dos_15_mikhalenka_rt: Destroying... [id=rtb-0d1a62a95f4f539b2]
module.aws_ec2_vpc.aws_route_table.dos_15_mikhalenka_rt: Destruction complete after 1s
module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig: Destroying... [id=igw-0b4dd66a734cb6a98]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Still destroying... [id=i-09ad191762e3fe5d8, 10s elapsed]
module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig: Still destroying... [id=igw-0b4dd66a734cb6a98, 10s elapsed]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Still destroying... [id=i-09ad191762e3fe5d8, 20s elapsed]
module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig: Still destroying... [id=igw-0b4dd66a734cb6a98, 20s elapsed]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Still destroying... [id=i-09ad191762e3fe5d8, 30s elapsed]
module.aws_ec2_vpc.aws_internet_gateway.dos_15_mikhalenka_ig: Destruction complete after 29s
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Still destroying... [id=i-09ad191762e3fe5d8, 40s elapsed]
module.aws_ec2_instance.aws_instance.dos_15_mikhalenka_ec2: Destruction complete after 42s
module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet: Destroying... [id=subnet-009ed77b62c823328]
module.aws_ec2_instance.aws_security_group.dos_15_mikhalenka_sg: Destroying... [id=sg-0689fe6c030336435]
module.aws_ec2_vpc.aws_subnet.dos_15_mikhalenka_subnet: Destruction complete after 1s
module.aws_ec2_instance.aws_security_group.dos_15_mikhalenka_sg: Destruction complete after 1s
module.aws_ec2_vpc.aws_vpc.dos_15_mikhalenka_vpc: Destroying... [id=vpc-013bcd1b08b88f2c8]
module.aws_ec2_vpc.aws_vpc.dos_15_mikhalenka_vpc: Destruction complete after 2s

Destroy complete! Resources: 7 destroyed.
```