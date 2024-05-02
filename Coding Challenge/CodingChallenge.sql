-- Coding Challenges: CareerHub, The Job Board

-- Create SQL Schema from the application, use the class attributes for table column names.

-- Create Database CareerHubDB
CREATE DATABASE CareerHub;

-- Use the Database CareerHubDB
USE CareerHub;

-- Create Companies table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

-- Create Jobs table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(18, 2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

-- Create Applicants table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    City VARCHAR(100),  
    State VARCHAR(100), 
    Resume VARCHAR(100)
);

-- Create Applications table
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

-- Insert Values Into Companies
INSERT INTO Companies (CompanyID, CompanyName, Location) 
VALUES
(1, 'Tech Innovations', 'San Francisco'),
(2, 'Data Driven Inc', 'New York'),
(3, 'GreenTech Solutions', 'Austin'),
(4, 'CodeCrafters', 'Boston'),
(5, 'HexaWare Technologies', 'Chennai');

-- Insert Values Into Jobs
INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) 
VALUES
(1, 1, 'Frontend Developer', 'Develop user-facing features', 'San Francisco', 75000, 'Full-time', '2023-01-10'),
(2, 2, 'Data Analyst', 'Interpret data models', 'New York', 68000, 'Full-time', '2023-02-20'),
(3, 3, 'Environmental Engineer', 'Develop environmental solutions', 'Austin', 85000, 'Full-time', '2023-03-15'),
(4, 1, 'Backend Developer', 'Handle server-side logic', 'Remote', 77000, 'Full-time', '2023-04-05'),
(5, 4, 'Software Engineer', 'Develop and test software systems', 'Boston', 90000, 'Full-time', '2023-01-18'),
(6, 5, 'HR Coordinator', 'Manage hiring processes', 'Chennai', 45000, 'Contract', '2023-04-25'),
(7, 2, 'Senior Data Analyst', 'Lead data strategies', 'New York', 95000, 'Full-time', '2023-01-22');

-- Insert Values Into Applicants
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, City, State, Resume) 
VALUES
(101, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'San Francisco', 'CA', 'Experienced web developer with 5 years of experience.'),
(102, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'New York', 'NY', 'Data enthusiast with 3 years of experience in data analysis.'),
(103, 'Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', 'Austin', 'TX', 'Environmental engineer with 4 years of field experience.'),
(104, 'Bob', 'Brown', 'bob.brown@example.com', '456-789-0123', 'Boston', 'MA', 'Seasoned software engineer with 8 years of experience.');

-- Insert Values Into Applications
INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter) 
VALUES
(1, 1, 101, '2023-04-01', 'I am excited to apply for the Frontend Developer position.'),
(2, 2, 102, '2023-04-02', 'I am interested in the Data Analyst position.'),
(3, 3, 103, '2023-04-03', 'I am eager to bring my expertise to your team as an Environmental Engineer.'),
(4, 4, 104, '2023-04-04', 'I am applying for the Backend Developer role to leverage my skills.'),
(5, 5, 101, '2023-04-05', 'I am also interested in the Software Engineer position at CodeCrafters.');

-- Checking the tables
SELECT * FROM Companies;
SELECT * FROM Applicants;
SELECT * FROM Applications;
SELECT * FROM Jobs;

-- Tasks:
-- 1. Provide a SQL script that initializes the database for the Job Board scenario �CareerHub�. 
CREATE DATABASE CareerHub;
USE CareerHub;

-- 2. Create tables for Companies, Jobs, Applicants and Applications. 
-- Create Companies table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

-- Create Jobs table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(18, 2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

-- Create Applicants table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    City VARCHAR(100),  
    State VARCHAR(100), 
    Resume VARCHAR(100)
);

-- Create Applications table
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

-- 3. Define appropriate primary keys, foreign keys, and constraints. 
-- Create Companies table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    Location VARCHAR(255)
);

-- Create Jobs table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255),
    JobDescription TEXT,
    JobLocation VARCHAR(255),
    Salary DECIMAL(18, 2),
    JobType VARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

-- Create Applicants table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    City VARCHAR(100),  
    State VARCHAR(100), 
    Resume VARCHAR(100)
);

-- Create Applications table
CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter TEXT,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.
SELECT * FROM Companies;
SELECT * FROM Applicants;
SELECT * FROM Applications;
SELECT * FROM Jobs;

-- 5. Write an SQL query to count the number of applications received for each job listing in the "Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all jobs, even if they have no applications.
SELECT J.JobTitle, COUNT(A.JobID) AS ApplicationCount
FROM Jobs J
LEFT JOIN Applications A ON J.JobID = A.JobID
GROUP BY J.JobTitle;

-- 6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range. Allow parameters for the minimum and maximum salary values. Display the job title, company name, location, and salary for each matching job.
DECLARE @MinSalary DECIMAL(18, 2) = 60000;
DECLARE @MaxSalary DECIMAL(18, 2) = 80000;

SELECT J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
FROM Jobs J
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE J.Salary BETWEEN @MinSalary AND @MaxSalary;

-- 7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a parameter for the ApplicantID, and return a result set with the job titles, company names, and application dates for all the jobs the applicant has applied to.
DECLARE @ApplicantID INT = 101;

SELECT J.JobTitle, C.CompanyName, A.ApplicationDate
FROM Applications A
JOIN Jobs J ON A.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE A.ApplicantID = @ApplicantID;

-- 8. Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.
SELECT AVG(Salary) AS AverageSalary
FROM Jobs
WHERE Salary > 0;

-- 9. Write an SQL query to identify the company that has posted the most job listings. Display the  company name along with the count of job listings they have posted. Handle ties if multiple companies have the same maximum count.
SELECT TOP 1 C.CompanyName, COUNT(J.JobID) AS JobCount
FROM Companies C
LEFT JOIN Jobs J ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyName
ORDER BY COUNT(J.JobID) DESC;

-- 10. Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.
DECLARE @City VARCHAR(100) = 'CityX';

SELECT DISTINCT A.*
FROM Applicants A
JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
JOIN Jobs J ON AP.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID
WHERE C.Location = @City 
AND DATEDIFF(YEAR, CONVERT(DATE, SUBSTRING(A.Resume, CHARINDEX('years', A.Resume) - 3, 2) + '-' + SUBSTRING(A.Resume, CHARINDEX('years', A.Resume) - 6, 2) + '-' + SUBSTRING(A.Resume, CHARINDEX('years', A.Resume) - 9, 4)), GETDATE()) >= 3;

-- 11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.
SELECT DISTINCT JobTitle
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000;

-- 12. Find the jobs that have not received any applications.
SELECT J.*
FROM Jobs J
LEFT JOIN Applications A ON J.JobID = A.JobID
WHERE A.JobID IS NULL;

-- 13. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.
SELECT A.FirstName, A.LastName, C.CompanyName, J.JobTitle
FROM Applicants A
JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
JOIN Jobs J ON AP.JobID = J.JobID
JOIN Companies C ON J.CompanyID = C.CompanyID;

-- 14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.
SELECT C.CompanyName, COUNT(J.JobID) AS JobCount
FROM Companies C
LEFT JOIN Jobs J ON C.CompanyID = J.CompanyID
GROUP BY C.CompanyName;

-- 15. List all applicants along with the companies and positions they have applied for, including those who have not applied.
SELECT A.FirstName, A.LastName, COALESCE(C.CompanyName, 'Not Applied') AS CompanyName, COALESCE(J.JobTitle, 'Not Applied') AS JobTitle
FROM Applicants A
LEFT JOIN Applications AP ON A.ApplicantID = AP.ApplicantID
LEFT JOIN Jobs J ON AP.JobID = J.JobID
LEFT JOIN Companies C ON J.CompanyID = C.CompanyID;

-- 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.
SELECT DISTINCT C.CompanyName
FROM Companies C
JOIN Jobs J ON C.CompanyID = J.CompanyID
WHERE J.Salary > (SELECT AVG(Salary) FROM Jobs WHERE Salary > 0);
