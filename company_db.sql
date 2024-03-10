
-- add table employees
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(255),
    age INTEGER,
    email VARCHAR(255),
    department_id INTEGER,
    salary NUMERIC,
    status VARCHAR(255),
      created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);
-- add table departments
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(255),
      created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);



-- Insert  data employees table
INSERT INTO employees (employee_id, employee_name, age, email, department_id, salary, status) VALUES
(1, 'Alice', 30, 'alice@example.com', 1, 60000, NULL),
(2, 'Bob', 35, 'bob@example.net', 2, 65000, NULL),
(3, 'Charlie', 28, 'charlie@google.com', 1, 55000, NULL),
(4, 'David', 33, 'david@yahoo.com', 2, 62000, NULL),
(5, 'Eve', 31, 'eve@example.net', 3, 58000, NULL),
(6, 'Frank', 29, 'frank@example.com', 1, 59000, NULL),
(7, 'Grace', 34, 'grace@google.com', 2, 63000, NULL),
(8, 'Henry', 32, 'henry@yahoo.com', 3, 57000, NULL),
(9, 'Ivy', 27, 'ivy@gmail.com', 1, 56000, NULL),
(10, 'Jack', 36, 'jack@example.net', 2, 64000, NULL),
(11, 'Karen', 29, 'karen@gmail.com', 3, 60000, NULL),
(12, 'Liam', 33, 'liam@gmail.com', 1, 59000, NULL),
(13, 'Mia', 31, 'mia@yahoo.com', 2, 62000, NULL),
(14, 'Nora', 28, 'nora@yahoo.com', 3, 57000, NULL),
(15, 'Oliver', 35, 'oliver@example.net', 1, 61000, NULL),
(16, 'Penelope', 30, 'penelope@google.com', 2, 63000, NULL),
(17, 'Quinn', 32, 'quinn@google.com', 3, 59000, NULL),
(18, 'Rachel', 27, 'rachel@gmail.com', 1, 55000, NULL),
(19, 'Sam', 34, 'sam@example.net', 2, 64000, NULL),
(20, 'Taylor', 31, 'taylor@yahoo.com', 3, 58000, NULL);

-- insert data  departments table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Finance');

-- show  all  table Data 
SELECT * FROM employees ;
SELECT * FROM departments ;


--drop Table departments;

--- update function
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$function$

-- Update the age of employee with employee_id 1 to 31
UPDATE employees
SET age = 30,updated_at = CURRENT_TIMESTAMP
WHERE employee_id = 1;







----------------------------------------------------QUERY------------------------------------------------------






--Query 1: Retrieve all employees with a salary greater than 60000
SELECT * FROM employees
WHERE salary > 60000;




--Query 2: Retrieve the names of employees using a limit of 2, starting from the 3rd employee.
SELECT employee_name
FROM employees
ORDER BY employee_id
OFFSET 2
LIMIT 2;



--Query 3: Calculate and display the average age of all employees  and display the average age with just one digit after the decimal point.

SELECT ROUND(AVG(age), 1) AS average_age
FROM employees;



--Query 4: Retrieve the names of employees whose email addresses contain 'example.com', 'example.net', or 'google.com'.
SELECT employee_name FROM employees
WHERE email LIKE '%example.com%'
   OR email LIKE '%example.net%'
   OR email LIKE '%google.com%'
  ORDER BY employee_id ;

--Query 5: Retrieve the names of all employees who belong to the department titled 'Engineering'.
SELECT employee_name FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Engineering')
ORDER BY employee_id;


---Query 6: Update the status of the employee with the highest salary to 'Promoted'.


UPDATE employees
SET status = 'Promoted', updated_at = CURRENT_TIMESTAMP
WHERE salary = (SELECT MAX(salary) FROM employees);



---Query 7: Retrieve the department name and the average salary of employees in each department.
SELECT d.department_name, AVG(e.salary) AS avg
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;
