--CREATE DATABASE IF NOT EXISTS ph_employee_db

CREATE TABLE employees(
	
	emp_no	INT NOT NULL,
	birth_date	DATE NOT NULL,
	first_name	VARCHAR(30) NOT NULL,
	last_name	VARCHAR(30) NOT NULL,
	gender		VARCHAR(1) NOT NULL,
	hire_date	DATE NOT NULL,
	PRIMARY KEY(emp_no)
);

CREATE TABLE titles(

	emp_no	INT NOT NULL,
	title	VARCHAR NOT NULL,
	from_date	DATE NOT NULL,
	to_date		DATE NOT NULL,
    PRIMARY KEY(emp_no, from_date, title),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)	
);

CREATE TABLE departments(

	dept_no	VARCHAR  NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY(dept_no),
	UNIQUE(dept_name)
);

CREATE TABLE dept_manager(

	dept_no	VARCHAR  NOT NULL,
	emp_no	INT NOT NULL,
	from_date	DATE NOT NULL,
	to_date		DATE NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(

	emp_no	INT NOT NULL,
	dept_no	VARCHAR  NOT NULL,
	from_date	DATE NOT NULL,
	to_date		DATE NOT NULL,
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries(

	emp_no	INT NOT NULL,
	salary  INT NOT NULL,
	from_date	DATE NOT NULL,
	to_date		DATE NOT NULL,
    PRIMARY KEY(emp_no, from_date),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);