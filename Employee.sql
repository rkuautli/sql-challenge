CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Sex CHAR(1),
    HireDate DATE
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Salaries (
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    FromDate DATE,
    ToDate DATE,
    PRIMARY KEY (EmployeeID, FromDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Titles (
    EmployeeID INT,
    Title VARCHAR(50),
    FromDate DATE,
    ToDate DATE,
    PRIMARY KEY (EmployeeID, FromDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Dept_Emp (
    DeptID INT,
    EmployeeID INT,
    FromDate DATE,
    ToDate DATE,
    PRIMARY KEY (DeptID, EmployeeID, FromDate),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Dept_Manager (
    DeptID INT,
    EmployeeID INT,
    FromDate DATE,
    ToDate DATE,
    PRIMARY KEY (DeptID, EmployeeID, FromDate),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
\COPY Employees FROM 'path/to/employees.csv' CSV HEADER;
\COPY Departments FROM 'path/to/departments.csv' CSV HEADER;
\COPY Salaries FROM 'path/to/salaries.csv' CSV HEADER;
\COPY Titles FROM 'path/to/titles.csv' CSV HEADER;
\COPY Dept_Emp FROM 'path/to/dept_emp.csv' CSV HEADER;
\COPY Dept_Manager FROM 'path/to/dept_manager.csv' CSV HEADER;

SELECT e.EmployeeID, e.LastName, e.FirstName, e.Sex, s.Salary
FROM Employees e
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE s.ToDate = '9999-01-01';  -- assuming '9999-01-01' represents the current salary

SELECT FirstName, LastName, HireDate
FROM Employees
WHERE EXTRACT(YEAR FROM HireDate) = 1986;

SELECT dm.DeptID, d.DeptName, e.EmployeeID, e.LastName, e.FirstName
FROM Dept_Manager dm
JOIN Employees e ON dm.EmployeeID = e.EmployeeID
JOIN Departments d ON dm.DeptID = d.DeptID
WHERE dm.ToDate = '9999-01-01';  -- assuming '9999-01-01' represents the current manager

SELECT de.DeptID, e.EmployeeID, e.LastName, e.FirstName, d.DeptName
FROM Dept_Emp de
JOIN Employees e ON de.EmployeeID = e.EmployeeID
JOIN Departments d ON de.DeptID = d.DeptID
WHERE de.ToDate = '9999-01-01';  -- assuming '9999-01-01' represents the current department

SELECT FirstName, LastName, Sex
FROM Employees
WHERE FirstName = 'Hercules' AND LastName LIKE 'B%';

SELECT e.EmployeeID, e.LastName, e.FirstName
FROM Employees e
JOIN Dept_Emp de ON e.EmployeeID = de.EmployeeID
JOIN Departments d ON de.DeptID = d.DeptID
WHERE d.DeptName = 'Sales' AND de.ToDate = '9999-01-01';

SELECT e.EmployeeID, e.LastName, e.FirstName, d.DeptName
FROM Employees e
JOIN Dept_Emp de ON e.EmployeeID = de.EmployeeID
JOIN Departments d ON de.DeptID = d.DeptID
WHERE d.DeptName IN ('Sales', 'Development') AND de.ToDate = '9999-01-01';

SELECT LastName, COUNT(*) AS Frequency
FROM Employees
GROUP BY LastName
ORDER BY Frequency DESC;
