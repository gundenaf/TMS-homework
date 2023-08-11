#!/bin/bash

filename="input.txt"

non_dublicates=$(sed -E 's/\b(\w+)\b\s+\b\1\b/\1/g' "$filename")

echo "$non_dublicates"