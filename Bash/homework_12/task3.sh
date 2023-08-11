#!/bin/bash

# Script that make output (file name is specified by user as the first command line argument
# names of all files with the specified extension (third command line argument)
# from the specified directory (the directory name is specified by the user as the second command line argument

# Get command line arguments
filename=$1
directory=$2
extension=$3

# File search with specified extension and write them to a file
find "$directory" -type f -name "*.$extension" -exec basename {} \; > "$filename"

echo "File names with this .$extension in directory $directory are stored in file $filename"
