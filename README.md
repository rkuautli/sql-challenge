# sql-challenge
## Summary


- Data Modeling
We identified six CSV files corresponding to different aspects of employee data. The tables designed based on these files are:

employees: Holds basic employee information.
departments: Contains department details.
salaries: Tracks employee salaries over time.
titles: Records employee titles over time.
dept_emp: Manages the many-to-many relationship between employees and departments.
dept_manager: Links departments with their managers.
An Entity Relationship Diagram (ERD) was created to visualize how these tables interact through primary and foreign keys.

- Data Engineering
We established the SQL table schemas with appropriate data types, constraints, and relationships:

employees table: Employee ID is the primary key.
departments table: Department ID is the primary key.
salaries table: Composite primary key (employee_id, from_date) with a foreign key reference to employees.
titles table: Composite primary key (employee_id, from_date) with a foreign key reference to employees.
dept_emp table: Composite primary key (employee_id, department_id, from_date) with foreign key references to both employees and departments.
dept_manager table: Composite primary key (department_id, employee_id, from_date) with foreign key references to both departments and employees.
CSV data was imported into these tables with attention to data types and constraints.

- Data Analysis
SQL Queries and Results:

Employee Details: Extracted employee ID, last name, first name, gender, and current salary.
Employees Hired in 1986: Retrieved first name, last name, and hire date of employees hired in 1986.
Department Managers: Listed managers of each department along with department number, department name, employee number, last name, and first name.
Employee Department Info: Provided department number, employee number, last name, first name, and department name for each employee.
Specific Employee Information: Found employees named Hercules with last names starting with B, listing their first name, last name, and gender.
Sales Department Employees: Listed employees in the Sales department, including their employee number, last name, and first name.
Sales and Development Departments: Identified employees in both Sales and Development departments, with details including employee number, last name, first name, and department name.
Frequency of Last Names: Displayed the frequency count of each last name, sorted in descending order.
Conclusion
This challenge successfully demonstrated the process of data modeling, data engineering, and data analysis using SQL. The tasks included designing a relational database schema, importing data, and performing various queries to extract and analyze specific employee information. This structured approach ensures data integrity and supports comprehensive analysis based on historical employee data.
