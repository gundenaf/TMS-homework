```bash
user@localhost:~$ sudo docker run --name hashicorp-learn --detach --publish "0.0.0.0:8080:80" nginx:latest
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
a378f10b3218: Pull complete 
4dfff0708538: Pull complete 
2135e49ace4b: Pull complete 
c843f6b280ce: Pull complete 
6f35ab6f1400: Pull complete 
6c538b49fa4a: Pull complete 
d57731fb9008: Pull complete 
Digest: sha256:b4af4f8b6470febf45dc10f564551af682a802eda1743055a7dfc8332dffa595
Status: Downloaded newer image for nginx:latest
bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f
user@localhost:~$ sudo docker ps --filter="name=hashicorp-learn"
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
bd10a9a8f366   nginx:latest   "/docker-entrypoint.…"   14 seconds ago   Up 13 seconds   0.0.0.0:8080->80/tcp   hashicorp-learn
user@localhost:~$ git clone https://github.com/hashicorp/learn-terraform-import.git
Cloning into 'learn-terraform-import'...
remote: Enumerating objects: 121, done.
remote: Counting objects: 100% (48/48), done.
remote: Compressing objects: 100% (31/31), done.
remote: Total 121 (delta 25), reused 27 (delta 17), pack-reused 73
Receiving objects: 100% (121/121), 39.74 KiB | 865.00 KiB/s, done.
Resolving deltas: 100% (50/50), done.
user@localhost:~$ cd learn-terraform-import
user@localhost:~/learn-terraform-import$ terraform init
user@localhost:~/learn-terraform-import$ sudo docker ps --filter "name=hashicorp-learn"
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
bd10a9a8f366   nginx:latest   "/docker-entrypoint.…"   3 minutes ago   Up 3 minutes   0.0.0.0:8080->80/tcp   hashicorp-learn
user@localhost:~/learn-terraform-import$ sudo terraform import docker_container.web $(sudo docker inspect -f {{.ID}} hashicorp-learn)
docker_container.web: Importing from ID "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f"...
docker_container.web: Import prepared!
  Prepared docker_container for import
docker_container.web: Refreshing state... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
user@localhost:~/learn-terraform-import$ terraform show
# docker_container.web:
resource "docker_container" "web" {
    command           = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    cpu_shares        = 0
    dns               = []
    dns_opts          = []
    dns_search        = []
    entrypoint        = [
        "/docker-entrypoint.sh",
    ]
    group_add         = []
    hostname          = "bd10a9a8f366"
    id                = "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f"
    image             = "sha256:bc649bab30d150c10a84031a7f54c99a8c31069c7bc324a7899d7125d59cc973"
    init              = false
    ipc_mode          = "private"
    log_driver        = "json-file"
    log_opts          = {}
    max_retry_count   = 0
    memory            = 0
    memory_swap       = 0
    name              = "hashicorp-learn"
    network_data      = [
        {
            gateway                   = "172.18.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.18.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            mac_address               = "02:42:ac:12:00:02"
            network_name              = "bridge"
        },
    ]
    network_mode      = "default"
    privileged        = false
    publish_all_ports = false
    read_only         = false
    restart           = "no"
    rm                = false
    runtime           = "runc"
    security_opts     = []
    shm_size          = 64
    stdin_open        = false
    stop_signal       = "SIGQUIT"
    stop_timeout      = 0
    storage_opts      = {}
    sysctls           = {}
    tmpfs             = {}
    tty               = false

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
user@localhost:~/learn-terraform-import$ sudo terraform plan
docker_container.web: Refreshing state... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.web must be replaced
-/+ resource "docker_container" "web" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      ~ command                                     = [
          - "nginx",
          - "-g",
          - "daemon off;",
        ] -> (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      ~ entrypoint                                  = [
          - "/docker-entrypoint.sh",
        ] -> (known after apply)
      + env                                         = (known after apply) # forces replacement
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ hostname                                    = "bd10a9a8f366" -> (known after apply)
      ~ id                                          = "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f" -> (known after apply)
      ~ image                                       = "sha256:bc649bab30d150c10a84031a7f54c99a8c31069c7bc324a7899d7125d59cc973" -> "nginx:latest" # forces replacement
      ~ init                                        = false -> (known after apply)
      ~ ipc_mode                                    = "private" -> (known after apply)
      ~ log_driver                                  = "json-file" -> (known after apply)
      - log_opts                                    = {} -> null
      + logs                                        = false
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      + must_run                                    = true
        name                                        = "hashicorp-learn"
      ~ network_data                                = [
          - {
              - gateway                   = "172.18.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.18.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - mac_address               = "02:42:ac:12:00:02"
              - network_name              = "bridge"
            },
        ] -> (known after apply)
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      + remove_volumes                              = true
      ~ runtime                                     = "runc" -> (known after apply)
      ~ security_opts                               = [] -> (known after apply)
      ~ shm_size                                    = 64 -> (known after apply)
      + start                                       = true
      ~ stop_signal                                 = "SIGQUIT" -> (known after apply)
      ~ stop_timeout                                = 0 -> (known after apply)
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      + wait                                        = false
      + wait_timeout                                = 60
        # (5 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
user@localhost:~/learn-terraform-import$ terraform show -no-color > docker.tf
user@localhost:~/learn-terraform-import$ cat docker.tf 
# docker_container.web:
resource "docker_container" "web" {
    command           = [
        "nginx",
        "-g",
        "daemon off;",
    ]
    cpu_shares        = 0
    dns               = []
    dns_opts          = []
    dns_search        = []
    entrypoint        = [
        "/docker-entrypoint.sh",
    ]
    group_add         = []
    hostname          = "bd10a9a8f366"
    id                = "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f"
    image             = "sha256:bc649bab30d150c10a84031a7f54c99a8c31069c7bc324a7899d7125d59cc973"
    init              = false
    ipc_mode          = "private"
    log_driver        = "json-file"
    log_opts          = {}
    max_retry_count   = 0
    memory            = 0
    memory_swap       = 0
    name              = "hashicorp-learn"
    network_data      = [
        {
            gateway                   = "172.18.0.1"
            global_ipv6_address       = ""
            global_ipv6_prefix_length = 0
            ip_address                = "172.18.0.2"
            ip_prefix_length          = 16
            ipv6_gateway              = ""
            mac_address               = "02:42:ac:12:00:02"
            network_name              = "bridge"
        },
    ]
    network_mode      = "default"
    privileged        = false
    publish_all_ports = false
    read_only         = false
    restart           = "no"
    rm                = false
    runtime           = "runc"
    security_opts     = []
    shm_size          = 64
    stdin_open        = false
    stop_signal       = "SIGQUIT"
    stop_timeout      = 0
    storage_opts      = {}
    sysctls           = {}
    tmpfs             = {}
    tty               = false

    ports {
        external = 8080
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
user@localhost:~/learn-terraform-import$ sudo terraform plan
╷
│ Error: Invalid or unknown key
│ 
│   with docker_container.web,
│   on docker.tf line 17, in resource "docker_container" "web":
│   17:     id                = "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f"
│ 
╵
╷
│ Error: Value for unconfigurable attribute
│ 
│   with docker_container.web,
│   on docker.tf line 27, in resource "docker_container" "web":
│   27:     network_data      = [
│   28:         {
│   29:             gateway                   = "172.18.0.1"
│   30:             global_ipv6_address       = ""
│   31:             global_ipv6_prefix_length = 0
│   32:             ip_address                = "172.18.0.2"
│   33:             ip_prefix_length          = 16
│   34:             ipv6_gateway              = ""
│   35:             mac_address               = "02:42:ac:12:00:02"
│   36:             network_name              = "bridge"
│   37:         },
│   38:     ]
│ 
│ Can't configure a value for "network_data": its value will be decided automatically based on the result of applying this configuration.
user@localhost:~/learn-terraform-import$ sudo terraform plan
docker_container.web: Refreshing state... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # docker_container.web must be replaced
-/+ resource "docker_container" "web" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      + env                                         = (known after apply) # forces replacement
      + exit_code                                   = (known after apply)
      - group_add                                   = [] -> null
      ~ id                                          = "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f" -> (known after apply)
      - log_opts                                    = {} -> null
      + logs                                        = false
      + must_run                                    = true
        name                                        = "hashicorp-learn"
      ~ network_data                                = [
          - {
              - gateway                   = "172.18.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.18.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - mac_address               = "02:42:ac:12:00:02"
              - network_name              = "bridge"
            },
        ] -> (known after apply)
      - network_mode                                = "default" -> null
      + remove_volumes                              = true
      ~ security_opts                               = [] -> (known after apply)
      + start                                       = true
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      + wait                                        = false
      + wait_timeout                                = 60
        # (22 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
user@localhost:~/learn-terraform-import$ sudo terraform plan
docker_container.web: Refreshing state... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # docker_container.web will be updated in-place
  ~ resource "docker_container" "web" {
      + attach                                      = false
      + container_read_refresh_timeout_milliseconds = 15000
        id                                          = "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f"
      + logs                                        = false
      + must_run                                    = true
        name                                        = "hashicorp-learn"
      + remove_volumes                              = true
      + start                                       = true
      + wait                                        = false
      + wait_timeout                                = 60
        # (33 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
user@localhost:~/learn-terraform-import$ sudo terraform apply
docker_container.web: Refreshing state... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # docker_container.web will be updated in-place
  ~ resource "docker_container" "web" {
      + attach                                      = false
      + container_read_refresh_timeout_milliseconds = 15000
        id                                          = "bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f"
      + logs                                        = false
      + must_run                                    = true
        name                                        = "hashicorp-learn"
      + remove_volumes                              = true
      + start                                       = true
      + wait                                        = false
      + wait_timeout                                = 60
        # (33 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.web: Modifying... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]
docker_container.web: Modifications complete after 0s [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
user@localhost:~/learn-terraform-import$ sudo docker ps --filter "name=hashicorp-learn"
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
bd10a9a8f366   nginx:latest   "/docker-entrypoint.…"   6 minutes ago   Up 6 minutes   0.0.0.0:8080->80/tcp   hashicorp-learn
user@localhost:~/learn-terraform-import$ sudo docker image inspect -f '{{.ID}}' nginx:latest
sha256:bc649bab30d150c10a84031a7f54c99a8c31069c7bc324a7899d7125d59cc973
user@localhost:~/learn-terraform-import$ sudo docker image inspect -f {{.RepoTags}} sha256:bc649bab30d150c10a84031a7f54c99a8c31069c7bc324a7899d7125d59cc973
[nginx:latest]
user@localhost:~/learn-terraform-import$ sudo terraform apply
docker_container.web: Refreshing state... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # docker_image.nginx will be created
  + resource "docker_image" "nginx" {
      + id          = (known after apply)
      + image_id    = (known after apply)
      + name        = "nginx:latest"
      + repo_digest = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_image.nginx: Creating...
docker_image.nginx: Creation complete after 0s [id=sha256:bc649bab30d150c10a84031a7f54c99a8c31069c7bc324a7899d7125d59cc973nginx:latest]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
user@localhost:~/learn-terraform-import$ sudo terraform apply
docker_image.nginx: Refreshing state... [id=sha256:bc649bab30d150c10a84031a7f54c99a8c31069c7bc324a7899d7125d59cc973nginx:latest]
docker_container.web: Refreshing state... [id=bd10a9a8f3669ed865a12168661a34b7f32459968acf7ba265141f64e84e984f]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```