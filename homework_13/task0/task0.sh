#!/bin/bash

filename="input.txt"
word_count=0

for line in $(cat "$filename"); do
    current_words=$(echo "$line" | wc -w)
    ((word_count+=current_words))
done

echo "Number of words: $word_count"