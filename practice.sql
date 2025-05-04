USE advanced_sql;

CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
salary DECIMAL(10, 2) NOT NULL,
department_id INT,
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

# to input data in to our department table
INSERT INTO departments (department_id, department_name) 
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Logictics'),
(105,  'Procurement');

# putting data in to our table
INSERT INTO employees (employee_id, name, salary, department_id)
VALUES
(101, 'John Oga', 300000, 104),
(102, 'Alice Udo', 100000, 102),
(103, 'Sgape Sam', 80000, 101),
(104, 'Adams Eve', 350000, 105), 
(105, 'John Abi', 20000, 103);

SELECT *
FROM employees
order by employee_id;