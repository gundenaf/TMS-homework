```bash
docker@docker-node:~$ sudo docker-compose up
Creating network "task2_default" with the default driver
Pulling db (postgres:latest)...
latest: Pulling from library/postgres
648e0aadf75a: Pull complete
f715c8c55756: Pull complete
b11a1dc32c8c: Pull complete
f29e8ba9d17c: Pull complete
78af88a8afb0: Pull complete
b74279c188d9: Pull complete
6e3e5bf64fd2: Pull complete
b62a2c2d2ce5: Pull complete
eba91ca3c7a3: Pull complete
d4a24cdf2433: Pull complete
b20f8a8dfd5c: Pull complete
e0731dd084c3: Pull complete
0361da6a228e: Pull complete
Digest: sha256:8775adb39f0db45cf4cdb3601380312ee5e9c4f53af0f89b7dc5cd4c9a78e4e8
Status: Downloaded newer image for postgres:latest
Pulling web (nginx:latest)...
latest: Pulling from library/nginx
648e0aadf75a: Already exists
262696647b70: Pull complete
e66d0270d23f: Pull complete
55ac49bd649c: Pull complete
cbf42f5a00d2: Pull complete
8015f365966b: Pull complete
4cadff8bc2aa: Pull complete
Digest: sha256:67f9a4f10d147a6e04629340e6493c9703300ca23a2f7f3aa56fe615d75d31ca
Status: Downloaded newer image for nginx:latest
Creating task2_db_1 ... done
Creating task2_web_1 ... done
Attaching to task2_db_1, task2_web_1
db_1   | The files belonging to this database system will be owned by user "postgres".
db_1   | This user must also own the server process.
db_1   | 
db_1   | The database cluster will be initialized with locale "en_US.utf8".
db_1   | The default database encoding has accordingly been set to "UTF8".
db_1   | The default text search configuration will be set to "english".
db_1   | 
db_1   | Data page checksums are disabled.
db_1   | 
db_1   | fixing permissions on existing directory /var/lib/postgresql/data ... ok
db_1   | creating subdirectories ... ok
db_1   | selecting dynamic shared memory implementation ... posix
db_1   | selecting default max_connections ... 100
db_1   | selecting default shared_buffers ... 128MB
db_1   | selecting default time zone ... Etc/UTC
db_1   | creating configuration files ... ok
db_1   | running bootstrap script ... ok
web_1  | /docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
web_1  | /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
web_1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
web_1  | 10-listen-on-ipv6-by-default.sh: info: /etc/nginx/conf.d/default.conf is not a file or does not exist
web_1  | /docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
web_1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
web_1  | /docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
web_1  | /docker-entrypoint.sh: Configuration complete; ready for start up
web_1  | 2023/08/04 11:11:57 [notice] 1#1: using the "epoll" event method
web_1  | 2023/08/04 11:11:57 [notice] 1#1: nginx/1.25.1
web_1  | 2023/08/04 11:11:57 [notice] 1#1: built by gcc 12.2.0 (Debian 12.2.0-14) 
web_1  | 2023/08/04 11:11:57 [notice] 1#1: OS: Linux 6.1.0-10-amd64
web_1  | 2023/08/04 11:11:57 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
web_1  | 2023/08/04 11:11:57 [notice] 1#1: start worker processes
web_1  | 2023/08/04 11:11:57 [notice] 1#1: start worker process 20
web_1  | 2023/08/04 11:11:57 [notice] 1#1: start worker process 21
db_1   | performing post-bootstrap initialization ... ok
db_1   | syncing data to disk ... ok
db_1   | 
db_1   | 
db_1   | Success. You can now start the database server using:
db_1   | 
db_1   |     pg_ctl -D /var/lib/postgresql/data -l logfile start
db_1   | 
db_1   | initdb: warning: enabling "trust" authentication for local connections
db_1   | initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.
db_1   | waiting for server to start....2023-08-04 11:11:58.123 UTC [47] LOG:  starting PostgreSQL 15.3 (Debian 15.3-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
db_1   | 2023-08-04 11:11:58.124 UTC [47] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2023-08-04 11:11:58.127 UTC [50] LOG:  database system was shut down at 2023-08-04 11:11:58 UTC
db_1   | 2023-08-04 11:11:58.130 UTC [47] LOG:  database system is ready to accept connections
db_1   |  done
db_1   | server started
db_1   | CREATE DATABASE
db_1   | 
db_1   | 
db_1   | /usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*
db_1   | 
db_1   | 2023-08-04 11:11:58.303 UTC [47] LOG:  received fast shutdown request
db_1   | waiting for server to shut down....2023-08-04 11:11:58.303 UTC [47] LOG:  aborting any active transactions
db_1   | 2023-08-04 11:11:58.306 UTC [47] LOG:  background worker "logical replication launcher" (PID 53) exited with exit code 1
db_1   | 2023-08-04 11:11:58.307 UTC [48] LOG:  shutting down
db_1   | 2023-08-04 11:11:58.307 UTC [48] LOG:  checkpoint starting: shutdown immediate
db_1   | 2023-08-04 11:11:58.324 UTC [48] LOG:  checkpoint complete: wrote 918 buffers (5.6%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.014 s, sync=0.001 s, total=0.017 s; sync files=250, longest=0.001 s, average=0.001 s; distance=4223 kB, estimate=4223 kB
db_1   | 2023-08-04 11:11:58.328 UTC [47] LOG:  database system is shut down
db_1   |  done
db_1   | server stopped
db_1   | 
db_1   | PostgreSQL init process complete; ready for start up.
db_1   | 
db_1   | 2023-08-04 11:11:58.435 UTC [1] LOG:  starting PostgreSQL 15.3 (Debian 15.3-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
db_1   | 2023-08-04 11:11:58.435 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2023-08-04 11:11:58.435 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2023-08-04 11:11:58.436 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2023-08-04 11:11:58.439 UTC [63] LOG:  database system was shut down at 2023-08-04 11:11:58 UTC
db_1   | 2023-08-04 11:11:58.442 UTC [1] LOG:  database system is ready to accept connections
db_1   | 2023-08-04 11:16:58.498 UTC [61] LOG:  checkpoint starting: time
db_1   | 2023-08-04 11:17:02.628 UTC [61] LOG:  checkpoint complete: wrote 44 buffers (0.3%); 0 WAL file(s) added, 0 removed, 0 recycled; write=4.125 s, sync=0.002 s, total=4.130 s; sync files=12, longest=0.001 s, average=0.001 s; distance=252 kB, estimate=252 kB
```