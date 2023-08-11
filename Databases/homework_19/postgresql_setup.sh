#!/bin/bash

master="master@172.16.24.36"
slave="slave@172.16.24.77"
master_ip="172.16.24.36"
slave_ip="172.16.24.77"
ssh_key="/home/slava/.ssh/id_ed25519"

install_postgresql() {
    echo "Installing PostgreSQL on master and slave"
    ssh -i "$ssh_key" "$master" 'sudo apt-get update && sudo apt-get install -y postgresql'
    ssh -i "$ssh_key" "$slave" 'sudo apt-get update && sudo apt-get install -y postgresql'
    echo "======================================"
}

configure_postgresql() {
    local server=$1
    local ip_address=$2
    echo "Configuring PostgreSQL parameters on the server: $server"
    ssh -i "$ssh_key" "$server" "sudo sed -i \"\$ a listen_addresses = '*'\" /etc/postgresql/15/main/postgresql.conf"
    ssh -i "$ssh_key" "$server" "echo 'host    replication    postgres    $ip_address/22    md5' | sudo tee -a /etc/postgresql/15/main/pg_hba.conf > /dev/null"
    ssh -i "$ssh_key" "$server" 'sudo systemctl restart postgresql'
    ssh -i "$ssh_key" "$server" 'sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '\''postgres_password'\'';"'
    ssh -i "$ssh_key" "$server" 'sudo systemctl restart postgresql'
    echo "======================================"
}

create_database_and_table() {
    echo "Creating a database and table on the server: $master"
    ssh -i "$ssh_key" "$master" 'sudo -u postgres psql -c "CREATE DATABASE mydatabase;"'
    ssh -i "$ssh_key" "$master" 'sudo -u postgres psql -d mydatabase -c "CREATE TABLE IF NOT EXISTS teachmeskills (name VARCHAR(255));"'
    ssh -i "$ssh_key" "$master" 'sudo -u postgres psql -d mydatabase -c "INSERT INTO teachmeskills (name) VALUES ('\''Slava Mikhalenka'\'');"'
    ssh -i "$ssh_key" "$master" 'sudo chmod 700 -R /var/lib/postgresql/15/main/'
    ssh -i "$ssh_key" "$master" 'sudo systemctl restart postgresql'
    echo "======================================"
}

start_replication() {
    local password=$1
    echo "Configuring replication on the slave server"
    ssh -i "$ssh_key" "$slave" 'sudo systemctl stop postgresql'
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres PGPASSWORD='$password' rm -rf /var/lib/postgresql/15/main'
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres PGPASSWORD='$password' mkdir /var/lib/postgresql/15/main'
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres PGPASSWORD='$password' pg_basebackup -h '"$master_ip"' -D /var/lib/postgresql/15/main -U postgres -P -R -X stream -c fast'
    ssh -i "$ssh_key" "$slave" 'sudo chmod 700 -R /var/lib/postgresql/15/main/'
    ssh -i "$ssh_key" "$slave" 'sudo systemctl start postgresql'
    echo "======================================"
}

check_replication() {
    local password=$1
    echo "Checking replication"
    ssh -i "$ssh_key" "$master" "sudo -u postgres PGPASSWORD='$password' psql -d mydatabase -c 'INSERT INTO teachmeskills (name) VALUES ('\''Artsiom Kepets'\'');'"
    sleep 10
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres PGPASSWORD='$password' psql -d mydatabase -c "SELECT * FROM teachmeskills;"'
    echo "======================================"
}

check_master_shutdown() {
    local password=$1
    echo "Checking master server shutdown and performing actions on the slave server"
    ssh -i "$ssh_key" "$master" 'sudo systemctl stop postgresql'
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres PGPASSWORD='$password' /usr/lib/postgresql/15/bin/pg_ctl promote -D /var/lib/postgresql/15/main'
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres PGPASSWORD='$password' psql -d mydatabase -c "CREATE TABLE IF NOT EXISTS devops (name VARCHAR(255));"'
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres psql -d mydatabase -c "INSERT INTO devops (name) VALUES ('\''PostgreSQL'\'');"'
    ssh -i "$ssh_key" "$slave" 'sudo -u postgres PGPASSWORD='$password' psql -d mydatabase -c "SELECT * FROM devops;"'
    ssh -i "$ssh_key" "$master" 'sudo systemctl start postgresql'
    echo "======================================"
}

# Main function
main() {
    install_postgresql
    configure_postgresql "$master" "$slave_ip"
    configure_postgresql "$slave" "$master_ip"
    create_database_and_table
    start_replication "postgres_password"
    check_replication "postgres_password"
    check_master_shutdown "postgres_password"

    echo "Replication is configured and verified."
    echo "======================================"
}

# Calling the main function
main
