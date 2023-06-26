#!/bin/bash

#launch ./script.sh with arguments "username" "password" "output file"

username=$1
password=$2
output_file=$3

grep -q "$username" /etc/passwd && { echo "This user already exists. Exiting."; exit 0; } || useradd -c "Add user" -m "$username"

echo "Added user $username"
echo "$username:$password" | chpasswd
echo "Added password $password for user $username"
commands=('uname -a' 'lsmod' 'lscpu' 'fdisk -l' 'df -h' 'lspci' 'ip a' 'apt list --installed' 'yum list installed')

for ((i = 0; i < ${#commands[6]}; i++ )); do
  eval "${commands[i]}" >> /home/"$username"/"$output_file"
  printf '%s\n' ==================== >> /home/"$username"/"$output_file"
done

if grep -q CentOS /etc/*elease; then
    eval "${commands[8]}" >> /home/"$username"/"$output_file"
    printf '%s\n' ==================== >> /home/"$username"/"$output_file"
  elif grep -q Ubuntu /etc/*elease; then
    eval "${commands[7]}" >> /home/"$username"/"$output_file"
    printf '%s\n' ==================== >> /home/"$username"/"$output_file"
  else
    exit
fi
echo "Created output file $output_file for user $username"