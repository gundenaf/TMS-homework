#!/usr/bin/python3

def print_hello_world():
    print("Hello, world!")

def add_numbers():
    result = 2 + 2
    print(result)

def greet_user():
    while True:
        name = input("Enter your name: ")
        if name.isdigit():
            print("Please enter a valid name, not a number.")
        elif not name.strip():
            print("Please enter a valid name, not an empty string.")
        else:
            print(f"Hello, {name}!")
            break

def print_numbers():
    for num in range(1, 11):
        print(num)

def get_age_and_print():
    while True:
        try:
            age = int(input("Enter your age: "))
            print(f"Your age is {age}.")
            break
        except ValueError:
            print("Invalid input. Please enter a valid age.")

def multiply_numbers():
    while True:
        try:
            num1 = float(input("Enter the first number: "))
            num2 = float(input("Enter the second number: "))
            product = num1 * num2
            print(f"Product of the numbers: {product}")
            break
        except ValueError:
            print("Invalid input. Please enter valid numbers.")

def first_letter():
    while True:
        word = input("Enter a word: ")
        if len(word) > 0:
            first_char = word[0]
            print(f"First letter: {first_char}")
            break
        else:
            print("Please enter a word.")

def square_number():
    while True:
        try:
            num = int(input("Enter an integer: "))
            square = num ** 2
            print(f"Square of the number: {square}")
            break
        except ValueError:
            print("Invalid input. Please enter a valid integer.")

def multiplication_table():
    multiplier = 5
    for i in range(1, 11):
        print(f"{multiplier} * {i} = {multiplier * i}")

def mean_of_numbers():
    while True:
        try:
            num1 = float(input("Enter the first number: "))
            num2 = float(input("Enter the second number: "))
            average = (num1 + num2) / 2
            print(f"Arithmetic mean: {average}")
            break
        except ValueError:
            print("Invalid input. Please enter valid numbers.")

if __name__ == "__main__":
    print_hello_world()
    add_numbers()
    greet_user()
    print_numbers()
    get_age_and_print()
    multiply_numbers()
    first_letter()
    square_number()
    multiplication_table()
    mean_of_numbers()
