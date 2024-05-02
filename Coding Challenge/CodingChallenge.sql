-- Coding Challenges: CareerHub, The Job Board-- Create SQL Schema from the application, use the class attributes for table column names.-- Create Database CareerHubDBCREATE DATABASE CareerHub;-- Use the Database CareerHubDBUSE CareerHub;-- Create Companies table
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

