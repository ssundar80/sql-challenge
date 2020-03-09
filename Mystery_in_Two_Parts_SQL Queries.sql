--List the following details of each employee: 
    --employee number, last name, first name, gender, and salary.

SELECT employee.emp_no, employee.last_name, employee.first_name, employee.gender, salary.salary
FROM employee
JOIN salary ON employee.emp_no=salary.emp_no;

--List employees who were hired in 1986.

SELECT 
employee.emp_no, employee.first_name, employee.last_name, dept_employee.from_date 
FROM
dept_employee
JOIN employee ON dept_employee.emp_no=employee.emp_no
WHERE extract(year from from_date) = 1986;

--List the manager of each department with the following information: 
    --department number, department name, the manager's employee number, 
    --last name, first name, and start and end employment dates

SELECT 
m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM Employee e JOIN dept_manager m ON e.emp_no=m.emp_no JOIN Department d ON m.dept_no=d.dept_no;

--List the department of each employee with the following information: 
    --employee number, last name, first name, and department name.

SELECT 
e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee e JOIN dept_employee de ON e.emp_no=de.emp_no JOIN department d ON d.dept_no=de.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employee
WHERE first_name LIKE 'Hercules' and last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 

FROM

department d join dept_employee de ON d.dept_no =de.dept_no

join employee e ON e.emp_no =de.emp_no

WHERE d.dept_no = 'd007';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 

FROM

department d join dept_employee de ON d.dept_no =de.dept_no

join employee e ON e.emp_no =de.emp_no

WHERE d.dept_no = 'd007' or d.dept_no = 'd005';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT 
last_name, count(*)
FROM
employee
GROUP By last_name
ORDER By count DESC;
