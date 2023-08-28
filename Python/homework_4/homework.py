#!/usr/bin/python3

class Circle:
    def __init__(self, radius, color):
        self.radius = radius
        self.color = color

    def area(self):
        return 3.14159 * self.radius ** 2

    def circumference(self):
        return 2 * 3.14159 * self.radius


class BankAccount:
    def __init__(self, account_number, owner_name, balance):
        self.account_number = account_number
        self.owner_name = owner_name
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if amount <= self.balance:
            self.balance -= amount
        else:
            print("Insufficient funds!")

    def __str__(self):
        return f"Account: {self.account_number}, Owner: {self.owner_name}, Balance: {self.balance}"


class Student:
    def __init__(self, name, age, average_score):
        self.name = name
        self.age = age
        self.average_score = average_score

    def calculate_status(self):
        if self.average_score >= 9.0:
            return "Excellent student"
        elif self.average_score >= 6.0:
            return "Good student"
        else:
            return "Average student"

    def __str__(self):
        return f"Name: {self.name}, Age: {self.age}, Average Score: {self.average_score}"


class Book:
    def __init__(self, title, author, year):
        self.title = title
        self.author = author
        self.year = year

    def update_title(self, new_title):
        self.title = new_title

    def update_author(self, new_author):
        self.author = new_author

    def update_year(self, new_year):
        self.year = new_year

    def __str__(self):
        return f"Title: {self.title}, Author: {self.author}, Year: {self.year}"


class Car:
    def __init__(self, brand, model, color, year):
        self.brand = brand
        self.model = model
        self.color = color
        self.year = year

    def update_color(self, new_color):
        self.color = new_color

    def update_year(self, new_year):
        self.year = new_year

    def __str__(self):
        return f"Brand: {self.brand}, Model: {self.model}, Color: {self.color}, Year: {self.year}"


if __name__ == "__main__":
    circle1 = Circle(5, "red")
    circle2 = Circle(3, "blue")

    print("Circle 1:")
    print("Area:", circle1.area())
    print("Circumference:", circle1.circumference())

    print("\nCircle 2:")
    print("Area:", circle2.area())
    print("Circumference:", circle2.circumference())

    account1 = BankAccount("12345", "Slava", 1000)
    account2 = BankAccount("54321", "Artsiom", 500)

    print("\nAccount 1:")
    print(account1)
    account1.deposit(200)
    account1.withdraw(150)
    print(account1)

    print("\nAccount 2:")
    print(account2)
    account2.deposit(1000)
    account2.withdraw(800)
    print(account2)

    student1 = Student("Slava", 26, 9.2)
    student2 = Student("Artsiom", 26, 7.2)

    print("\nStudent 1:")
    print(student1)
    print("Status:", student1.calculate_status())

    print("\nStudent 2:")
    print(student2)
    print("Status:", student2.calculate_status())

    book1 = Book("The Phoenix Project: A Novel about IT, DevOps, and Helping Your Business Win", "Gene Kim", 2013)
    book2 = Book("The Linux Command Line: A Complete Introduction", "William E. Shotts Jr.", 2012)

    print("\nBook 1:")
    print(book1)

    print("\nBook 2:")
    print(book2)

    book2.update_title("The Linux Command Line, 2nd Edition: A Complete Introduction")
    book2.update_author("William Shotts")
    book2.update_year(2019)
    print(book2)

    car1 = Car("Toyota", "Corolla", "silver", 2019)
    car2 = Car("Ford", "Mustang", "red", 2022)

    print("\nCar 1:")
    print(car1)
    car1.update_color("black")
    car1.update_year(2023)
    print(car1)

    print("\nCar 2:")
    print(car2)
