DROP TABLE IF EXISTS Employee CASCADE;

CREATE TABLE Employee (
  EmployeeID SERIAL PRIMARY KEY,
  FirstName text,
  LastName text,
  DateOfBirth varchar,
  Address varchar(255),
  PhoneNumber varchar,
  Email varchar(255),
  HireDate varchar(255),
  EmployeeType varchar(255),
  DepartmentID varchar(255)
  
);

INSERT INTO Employee
(FirstName,LastName,DateOfBirth,Address,PhoneNumber,Email,HireDate,EmployeeType, DepartmentID)
VALUES
('Faysal','Mikail','11/02/1996','Area 11','08134344552','bnmikhail@gmail.com','05/01/2020','Full-Time', '1');



DROP TABLE IF EXISTS Employee CASCADE;

CREATE TABLE Department (
  DepartmentID SERIAL Primary Key,
  "DepartmentName" text
);

INSERT INTO Department
(DepartmentName)
VALUES
('procurement');



DROP TABLE IF EXISTS JobPosition CASCADE;

CREATE TABLE JobPosition (
  PositionID SERIAL Primary Key,
  PositionTitle text
);

INSERT INTO JobPosition
(PositionTitle)
VALUES
('Procurement officer');



DROP TABLE IF EXISTS Payroll CASCADE;

CREATE TABLE Payroll (
  PayrollID SERIAL Primary Key,
  PayrollType varchar,
  FullTime text,
  PartTime text,
  Amount int,
  EmployeeID SERIAL Foreign Key, references Employee
);

INSERT INTO Payroll
()


DROP TABLE IF EXISTS EmployeeType CASCADE;

CREATE TABLE "EmployeeType" (
  FullTime varchar,
  PartTime varchar
);
INSERT INTO EmployeeType
(FullTime, PartTime)
VALUES
('MonhlySalary', 'HourlyPay')


DROP TABLE IF EXISTS LeaveRequest CASCADE;

CREATE TABLE "LeaveRequest" (
  LeaveRequestID SERIAL(Primary Key),
  RequestDate varchar,
  StartDate varchar,
  EndDate varchar,
  Status text(e.g., Pending, Approved, Rejected),
  EmployeeID int(Foreign Key, references Employee)
);
INSERT INTO LeaveRequest
(RequestDate,StartDate, EndDate,Status, EmployeeID)
VALUES
('01/04/2021', '01/05/2021', '01/11/2021', 'Pending');


DROP TABLE IF EXISTS LeaveRequest CASCADE;

CREATE TABLE "TrainingSession" (
  SessionID SERIAL Primary Key,
  SessionName text,
  SessionDate varchar,
  Location varchar
);

INSERT INTO TrainingSession
(SessionName,SessionDate,Location)
VALUES
('bootcamp', '11/04/2023', 'dexter&heros');


DROP TABLE IF EXISTS AttendanceRecord CASCADE;

CREATE TABLE AttendanceRecord (
  RecordID SERIAL (Primary Key),
  RecordDate varchar,
  EmployeeID int(Foreign Key, references Employee),
  SessionID int(Foreign Key, references TrainingSession)
);

INSERT INTO AttendanceRecord
(RecordDate,EmployeeID,SessionID)
VALUES
('10/09/2022','1234', '102');


ALTER TABLE "Employee" ADD FOREIGN KEY ("EmployeeID") REFERENCES "Department" ("DepartmentID");

ALTER TABLE "LeaveRequest" ADD FOREIGN KEY ("LeaveRequestID") REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "AttendanceRecord" ADD FOREIGN KEY ("RecordID") REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "TrainingSession" ADD FOREIGN KEY ("SessionID") REFERENCES "Employee" ("EmployeeID");

ALTER TABLE "Employee" ADD FOREIGN KEY ("EmployeeID") REFERENCES "JobPosition" ("PositionID");

ALTER TABLE "EmployeeType" ADD FOREIGN KEY ("FullTime") REFERENCES "Employee" ("EmployeeType");

ALTER TABLE "EmployeeType" ADD FOREIGN KEY ("PartTime") REFERENCES "Employee" ("EmployeeType");

ALTER TABLE "Payroll" ADD FOREIGN KEY ("FullTime") REFERENCES "EmployeeType" ("FullTime");

ALTER TABLE "Payroll" ADD FOREIGN KEY ("PartTime") REFERENCES "EmployeeType" ("PartTime");
