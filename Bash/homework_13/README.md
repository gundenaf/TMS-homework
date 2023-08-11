# Homework No. 13 - String Manipulation and Regular Expressions in Bash

The goal of this homework is to gain practical experience in working with strings and regular expressions in Bash, as well as learning about logical blocks and functions.

## Task 1: Count Words

Given a text, count the number of words in it. A word is defined as a sequence of letters (Russian or English) that may contain hyphens.

### Input:
He --- is a gray-red-purple radish!!
:->
Not a cat.
www.cat.ru

### Output: 9

## Task 2: File Renaming and Manipulation

1. Rename all log files to have a timestamp in the filename: `filename_{timestamp}.log`.
2. For all files with the `.py` extension, append the commit hash to the end of the filename.

## Task 3: Remove Duplicate Words

Identify and correct repeated words in a text. Replace each occurrence of a word followed by one or more whitespace characters and then the same word again with a single occurrence of the word.