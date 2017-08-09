DROP SCHEMA IF EXISTS DigitalOrgChart;
CREATE SCHEMA DigitalOrgChart;
USE DigitalOrgChart;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees
(Employee_ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Employee_Name VARCHAR(60) NULL,
Job_Title VARCHAR(100) NULL,
Supervisor_ID INT NULL,
Job_Level VARCHAR(60));

INSERT INTO Employees
(Employee_Name, Job_Title, Supervisor_ID, Job_Level)
VALUES 
('Blandon Casenave', 'SVP, Corporate Digital Measurement Strategy', NULL, 'Senior Vice President'),
('Jared Raskin', 'Director, Digital Measurement Strategy', 1, 'Director'),
('Steven Han', 'Director, Digital Research', 1, 'Director'),
('William Schuknecht', 'Director, Analytics', 1, 'Director'),
('Josh Goldfischer', 'Sr. Manager of Digital Analytics', 4, 'Senior Manager'),
('Mariya Rubinshteyn', 'Sr. Manager, Implementation', 3, 'Senior Manager'),
('Neil Shapiro', 'Manager, Metrics and Analysis', 2, 'Manager'),
('Melissa Childs', 'Digital Analyst', 6, 'Analyst'),
('Gloria Lago', 'Analyst, Digital Analytics', 5, 'Analyst'),
('Cameron Tucker', 'NBC Entertainment Intern', 1, 'Intern');

SELECT E.Employee_Name AS 'Employee Name',
M.Employee_Name AS 'Manager Name'
FROM Employees E
LEFT JOIN Employees M
ON E.Supervisor_ID = M.Employee_ID
ORDER BY E.Employee_Name;