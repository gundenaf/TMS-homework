#!/bin/bash

for file in *.log
do
    mv -- "$file" "${file%.log}_$(date +%d-%m-%Y_%H:%M:%S).log"
done

for file in *.py
do
    mv -- "$file" "${file%.py}_$(git rev-parse HEAD).py"
done