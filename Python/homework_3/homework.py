#!/usr/bin/python3

import os
from jinja2 import Template

def multiply_numbers(a, b):
    return a * b

def create_and_read_file():
    try:
        with open("test.txt", "w") as file:
            file.write("This is a test file for programming homework")
        
        with open("test.txt", "r") as file:
            content = file.read()
            print(content)
    except Exception as e:
        print("Error:", e)

def create_directory_and_files():
    try:
        os.mkdir("mydir")
        os.chdir("mydir")
        for i in range(1, 4):
            with open(f"file{i}.txt", "w"):
                pass
        
        file_list = os.listdir()
        print("Files in directory:", file_list)
    except Exception as e:
        print("Error:", e)

def generate_html_template(users):
    try:
        template_str = '''
        <html>
        <head>
            <title>User List</title>
        </head>
        <body>
            <h1>User List</h1>
            <ul>
                {% for user in users %}
                <li>Name: {{ user['name'] }}, Email: {{ user['email'] }}</li>
                {% endfor %}
            </ul>
        </body>
        </html>
        '''

        template = Template(template_str)
        rendered_template = template.render(users=users)
        with open("template.html", "w") as file:
            file.write(rendered_template)
    except Exception as e:
        print("Error:", e)

if __name__ == "__main__":
    try:
        num1 = 5
        num2 = 3
        result = multiply_numbers(num1, num2)
        print(f"Result of multiplication: {result}")

        create_and_read_file()

        create_directory_and_files()

        user_list = [
            {"name": "Slava", "email": "slava@example.com"},
            {"name": "Artsiom", "email": "artsiom@example.com"},
            {"name": "Sergey", "email": "sergey@example.com"}
        ]
        generate_html_template(user_list)
    except Exception as e:
        print("Error:", e)
