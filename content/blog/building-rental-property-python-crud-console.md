---
title: 'Building a Rental Property Management App in Python Console'
date: 2024-09-25
authors:
  - name: andresuchitra
    link: https://github.com/andresuchdata
    image: https://github.com/andresuchdata.png
tags:
  - Python
  - CRUD
  - Console
  - JSON
  - Tutorial
excludeSearch: false
---

Welcome to this tutorial where we will build a simple yet effective rental property management application using Python. This application will allow users to manage rental transactions, properties, and customers through a console interface. 
<!--more-->
We will cover the key features, the tech stack, and provide a step-by-step guide to get you started.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Tech Stack](#tech-stack)
4. [Setting Up the Project](#setting-up-the-project)
5. [Understanding the Code Structure](#understanding-the-code-structure)
6. [Running the Application](#running-the-application)
7. [Conclusion](#conclusion)

## Introduction

In this tutorial, we will create a console-based application that allows users to manage rental properties. The application will support CRUD (Create, Read, Update, Delete) operations for rentals, customers, and properties. We will also implement input validation and use JSON files for data persistence.

## Features

The rental property management app will include the following features:

- **CRUD Operations**: Manage rental transactions, customers, and properties.
- **Input Validation**: Ensure that user inputs are valid and handle errors gracefully.
- **Persistent Storage**: Use JSON files to store data persistently.
- **User-Friendly Console Interface**: Provide a colorful and interactive console menu.

## Tech Stack

The application is built using the following technologies:

- **Python**: The primary programming language.
- **Colorama**: A library for colorful console output.
- **JSON**: For data storage.
- **Standard Libraries**: Such as `datetime`, `os`, and `re`.

## Setting Up the Project

To get started, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd rental-property
   ```

2. **Create a Virtual Environment**:
   ```bash
   make venv
   ```

3. **Install Dependencies**:
   Ensure you have the required packages installed:
   ```bash
   pip install -r requirements.txt
   ```

## Understanding the Code Structure

The project is organized into several modules:

- **app.py**: The main entry point of the application.
- **services/**: Contains business logic for rentals, customers, and properties.
- **utils/**: Utility functions for database operations and printing menus.
- **db/**: JSON files for storing data.

### Key Code Snippets

Here are some important code snippets to understand the functionality:

**Main Application Loop (app.py)**:
```python
import os
from colorama import Fore
from utils.db import read_db
from utils.print_menu import print_menu
from services.rentals import print_rental_list, add_rental, edit_rental, remove_rental, search_sort_rental
from services.customer import print_customer_list, add_customer, remove_customer, search_and_sort as search_sort_customer
from services.property import print_property_list, add_property, remove_property, search_and_sort as search_sort_property

# Database file paths
CUSTOMERS_DB_FILE = os.path.join(os.path.dirname(__file__), 'db', 'customers.json')
PROPERTIES_DB_FILE = os.path.join(os.path.dirname(__file__), 'db', 'properties.json')
RENTALS_DB_FILE = os.path.join(os.path.dirname(__file__), 'db', 'rentals.json')

# Load data from JSON files
rentals = list(read_db(RENTALS_DB_FILE))
properties = list(read_db(PROPERTIES_DB_FILE))
customers = list(read_db(CUSTOMERS_DB_FILE))

option = ''
while option.startswith('q') == False:
    print_menu()
    option = input("Please pick any option, or press quit or q to quit the program: ").lower()

    if option == '1':
        print_rental_list(rentals, properties, customers)
    elif option == '2':
        add_rental(rentals, properties, customers)
    # Additional options...
    elif option == 'q' or option == 'quit':
        continue
    else:
        print(Fore.RED + "INVALID option! Please try again")

```

**Adding a Rental (services/rentals.py)**:
```python
def add_rental(rentals: list, properties: list, customers: list):
    print_property_list(properties)
    property_id = input("\nPlease the property ID for rent: ")
    # Validate property ID...
    # Get customer ID...
    # Validate dates...
    new_rental = {
        "id": new_id,
        "customer": customer_id,
        "property": property_id,
        "start_date": start_date.strftime("%d/%m/%Y"),
        "end_date": end_date.strftime("%d/%m/%Y"),
        "period": period,
        "total_price": round(total_price)
    }
    rentals.append(new_rental)
    print("New rental has been created successfully!")

```

## Running the Application

To run the application, simply execute the following command in your terminal:
```bash
python app.py
```
You will be greeted with a colorful console menu where you can choose various options to manage rentals, customers, and properties.

## Conclusion

In this tutorial, we have built a rental property management application using Python. We covered the features, tech stack, and provided a detailed explanation of the code structure. This project serves as a great starting point for anyone looking to learn about building console applications in Python, with a little bit complexity in manual querying setup between Python standard collections (dict, list, etc)

Feel free to explore the code, add new features, or modify existing ones to suit your needs. Happy coding!

[Take a look on my project and please submit any comment or issues!](https://github.com/andresuchdata/python-crud-json)


