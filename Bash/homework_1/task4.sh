#!/bin/bash

# Script with FOR loop that display on console size and permissions of all files in directory and it's subdirectories
# name of directory is specified by user as command line argument

# Get command line arguments
directory=$1

# Main section (I'm too tired to make proper comments)
for directory in "$direcrory"
do
    ls -lR $1/*
done

echo "Here it is!"
