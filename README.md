
# Project Name: Company Database
## Introduction
This project involves working with PostgreSQL, a powerful open-source relational database management system. The task includes creating two tables, populating them with sample data, and executing various SQL queries to perform database operations.

## Database Setup
1. Ensure PostgreSQL is installed on your system. If not, you can download it from [PostgreSQL official website](https://www.postgresql.org/download/).
2. Create a new database titled "company_db" or any other suitable name.

## Table Creation
Two tables have been created for this :
- `employees` table with fields:
  - employee_id (Primary Key): Integer, unique identifier for employees.
  - employee_name: String, representing the employee's name.
  - age: Integer, indicating the employee's age.
  - email: String, storing the employee's email address.
  - department_id: Integer, referencing the department the employee belongs to.
  - salary: Numeric, indicating the employee's salary.
  - status: String, storing the employee's employment status.
- `departments` table with fields:
  - department_id (Primary Key): Integer, unique identifier for departments.
  - department_name: String, indicating the department's name.
 
## SQL Queries
The project includes several SQL queries to perform various tasks:

1. Retrieve all employees with a salary greater than 60000.
2. Retrieve the names of employees using a limit of 2, starting from the 3rd employee.
3. Calculate and display the average age of all employees.
4. Retrieve the names of employees whose email addresses contain 'example.com', 'example.net', or 'google.com'.
5. Retrieve the names of all employees who belong to the department titled 'Engineering'.
6. Update the status of the employee with the highest salary to 'Promoted'. (Note: Uses a subquery to identify the employee with the highest salary)
7. Retrieve the department name and the average salary of employees in each department.

## Usage
1. Execute the SQL code for table creation and sample data insertion.
2. Run the provided queries to interact with the database.
   
Feel free to reach out if you have any questions or issues!
