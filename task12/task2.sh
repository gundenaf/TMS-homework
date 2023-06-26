#!/bin/bash

# Output arguments in console
# write ./task2.sh arg1 arg2 arg3 for example
echo "Command line arguments:"
for arg in "$@"
do
    echo "$arg"
done

# Write arguments in file
filename="arg_output.txt"
echo "Command line arguments:" > "$filename"
for arg in "$@"
do
    echo "$arg" >> "$filename"
done

echo "Command line arguments stored in: $filename"


