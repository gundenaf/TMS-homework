#!/usr/bin/python3

import os
import string

def ping_addresses(ip_addresses, output_file):
    with open(output_file, 'w') as f:
        for ip in ip_addresses:
            response = os.system(f'ping -c 4 {ip}')
            if response == 0:
                f.write(f'{ip} is reachable\n')
            else:
                f.write(f'{ip} is not reachable\n')

def analyze_string(input_string):
    upper_count = 0
    lower_count = 0
    digit_count = 0
    punctuation_count = 0

    for char in input_string:
        if char.isupper():
            upper_count += 1
        elif char.islower():
            lower_count += 1
        elif char.isdigit():
            digit_count += 1
        elif char in string.punctuation:
            punctuation_count += 1

    print(f'Upper case count: {upper_count}')
    print(f'Lower case count: {lower_count}')
    print(f'Digit count: {digit_count}')
    print(f'Punctuation count: {punctuation_count}')

def common_elements(list1, list2):
    common = []
    for item in list1:
        if item in list2:
            common.append(item)
    print('Common elements:', common)

def sort_descending(numbers):
    numbers.sort(reverse=True)
    print('Sorted list in descending order:', numbers)

def unique_elements_check(input_tuple):
    unique = True
    for item in input_tuple:
        if input_tuple.count(item) > 1:
            unique = False
            break
    print(f'All elements are unique: {unique}')

def find_files_with_substring(directory, substring):
    matching_files = []
    for file in os.listdir(directory):
        if substring in file:
            matching_files.append(file)
    print('Files with the substring:', matching_files)

def common_characters(string1, string2):
    common = set()
    for char in string1:
        if char in string2:
            common.add(char)
    print('Common characters:', common)

def median(numbers):
    sorted_numbers = sorted(numbers)
    n = len(sorted_numbers)
    if n % 2 == 1:
        median_value = sorted_numbers[n // 2]
    else:
        median_value = (sorted_numbers[n // 2 - 1] + sorted_numbers[n // 2]) / 2
    print(f'Median: {median_value}')

def replace_vowels(input_string):
    vowels = 'aeiouAEIOU'
    modified_string = ''
    for char in input_string:
        if char in vowels:
            modified_string += '-'
        else:
            modified_string += char
    print('Modified string:', modified_string)

def unique_elements_from_lists(list1, list2):
    unique_elements = list(set(list1) | set(list2))
    print('Unique elements from both lists:', unique_elements)

if __name__ == '__main__':
    try:
        ip_addresses = ['8.8.8.8', '8.8.4.4']
        ping_output_file = 'ping_results.txt'
        ping_addresses(ip_addresses, ping_output_file)

        input_str = 'Hello World! 123'
        analyze_string(input_str)

        list1 = [1, 2, 3, 4, 5]
        list2 = [4, 5, 6, 7, 8]
        common_elements(list1, list2)

        numbers = [5, 2, 9, 1, 5, 6]
        sort_descending(numbers)

        unique_tuple = (1, 2, 3, 4, 5)
        unique_elements_check(unique_tuple)

        directory_path = 'data_folder/'
        substring = 'data'
        find_files_with_substring(directory_path, substring)

        string1 = 'abcdef'
        string2 = 'acdfgh'
        common_characters(string1, string2)

        median(numbers)

        input_str = 'Hello World!'
        replace_vowels(input_str)

        unique_elements_from_lists(list1, list2)

    except KeyboardInterrupt:
        print('Script execution interrupted.')
    except Exception as e:
        print(f'An error occurred: {e}')
