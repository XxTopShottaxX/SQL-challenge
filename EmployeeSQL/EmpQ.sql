--  Select All Queries
select * from Employees;
select * from Departments;
select * from Salaries;
select * from Titles;
select * from Dept_Employee;
select * from Dept_Manager;



-- 1. List the following details of each employee: employee number, 
--	  last name, first name, gender, and salary.

SELECT emp.emp_no AS "Employee Number",
		emp.last_name AS "Last Name",
		emp.first_name AS "First Name",
		emp.gender AS "Gender",
		concat('$', format (sal.salary, 2)) AS "Salary"
		
FROM employees emp
	LEFT JOIN salaries sal
	ON (emp.emp_no=sal.emp_no)
	ORDER BY emp.emp_no;

-- 2. List employees who were hired in 1986.

SELECT *
FROM employees
	WHERE hire_date >= '1986-01-01'
	AND hire_date <= '1986-12-31';




-- 3. List the manager of each department with the following information: 
--	  department number, department name, the manager's employee number, 
--	  last name, first name, and start and end employment dates.

SELECT dep.dept_no AS "Department Number",
		dep.dept_name AS "Department Name",
		emp.emp_no AS "Employee Number",
		emp.last_name AS "Last Name",
		emp.first_name AS "First Name",
		dmgr.from_date AS "From Date",
		dmgr.to_date AS "To Date"
FROM departments dep
  JOIN dept_manager dmgr
  ON dep.dept_no = dmgr.dept_no
    JOIN employees emp
    ON dmgr.emp_no = emp.emp_no;



-- 4. List the department of each employee with the following information: 
--	  employee number, last name, first name, and department name.

SELECT employees.emp_no AS "Employee Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", departments.dept_name AS "Department"
FROM employees
  JOIN dept_emp
  ON employees.emp_no=dept_emp.emp_no
    JOIN departments
	ON dept_emp.dept_no=departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
	WHERE first_name  = 'Hercules'
	AND last_name like 'B%';
  
 
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no AS "Employee Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", departments.dept_name AS "Departement"
FROM employees
	JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
		JOIN departments
		ON dept_emp.dept_no = departments.dept_no
		WHERE departments.dept_name = 'Sales';
	
	
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no AS "Employee Number", employees.last_name AS "Last Name", employees.first_name AS "First Name", departments.dept_name AS "Department"
FROM employees
	JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
		JOIN departments
		ON dept_emp.dept_no = departments.dept_no
		WHERE departments.dept_name = 'Sales'
		OR departments.dept_name = 'Development';
	

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM employees
	GROUP BY last_name
	ORDER BY COUNT(last_name) DESC;




