DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;


CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR,
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex VARCHAR,
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
CREATE TABLE dept_emp(
	emp_no INT,
	dept_name VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_name) REFERENCES departments(dept_name)
);
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
    FOREIGN KEY (dept_name) REFERENCES departments(dept_name),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE salaries(
	emp_no INT,
	dept_name VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- 1.)List the employee number, last name, first name, sex,
-- and salary of each employee.
SELECT employees.emp_no AS "employee number",
	   employees.last_name AS "last name",
	   employees.first_name AS "first name",
	   employees.sex AS "Sex",
	   salaries.salary AS "salary"
FROM employees
	JOIN salaries
	ON (employees.emp_no = salaries.emp_no);

--2.) List the first name, last name, and hire date for the employees
--who were hired in 1986.
SELECT first_name,
	   last_name,
	   hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986

--3.)List the manager of each department along with their department number,
--department name, employee number, last name, and first name.
SELECT dept.dept_no AS "department number",
	   dept.dept_name as "department name",
	   emp.emp_no AS "employee number",
	   emp.last_name AS "last name",
	   emp.first_name AS "first name"
FROM employees AS emp
	JOIN dept_manager AS man
	ON (emp.emp_no = man.emp_no)
	JOIN departments AS dept
	ON (dept.dept_no = man.dept_no)
WHERE emp_title_id = 'm0001';

--4.) List the department number for each employee along with that employee’s
-- employee number, last name, first name, and department name.
SELECT dept_emp.dept_no AS "department number",
	   emp.emp_no AS "employee number",
	   emp.last_name AS "last name",
	   emp.first_name AS "first name",
	   d.dept_name as "department name"
FROM employees AS emp
	JOIN dept_emp
	ON (emp.emp_no = dept_emp.emp_no)
		JOIN departments AS d
		ON (d.dept_no = dept_emp.dept_no);

--5.) List first name, last name, and sex of each employee whose first name
-- is Hercules and whose last name begins with the letter B.
SELECT first_name,
	   last_name,
	   sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.) List each employee in the Sales department, including their employee
-- number, last name, and first name.
SELECT emp.emp_no AS "employee number",
       emp.last_name AS "last name",
       emp.first_name AS "first name",
       d.dept_name AS "department name"
FROM employees AS emp
	JOIN dept_emp
	ON (emp.emp_no = dept_emp.emp_no)
		JOIN departments AS d
		ON (d.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales';

--7.) List each employee in the Sales and Development departments, including
-- their employee number, last name, first name, and department name.
SELECT emp.emp_no AS "employee number",
       emp.last_name AS "last name",
       emp.first_name AS "first name",
       d.dept_name AS "department name"
FROM employees AS emp
	JOIN dept_emp
	ON (emp.emp_no = dept_emp.emp_no)
		JOIN departments AS d
		ON (d.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8.) List the frequency counts, in descending order, of all the employee
-- last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC



