# SQL Queries and Database Management

## Objective:
The aim of this assignment is to gain practical experience in writing SQL queries and managing a database. The tasks involve retrieving specific data, performing database backup and restoration, and setting up an automated backup process.

## Task 1:

Given the following tables:
- **Analysis**:
  - an_id — Analysis ID
  - an_name — Analysis name
  - an_cost — Analysis cost
  - an_price — Analysis retail price
  - an_group — Analysis group

- **Groups**:
  - gr_id — Group ID
  - gr_name — Group name
  - gr_temp — Temperature storage condition

- **Orders**:
  - ord_id — Order ID
  - ord_datetime — Order date and time
  - ord_an — Analysis ID

Write a query to retrieve the names and prices of all analyses sold between February 5, 2020, and the following week.