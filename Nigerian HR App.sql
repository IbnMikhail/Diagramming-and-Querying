DROP TABLE IF EXISTS Employee CASCADE;
CREATE TABLE Employee (
  EmployeeID int PRIMARY KEY,
  FirstName text,
  LastName text,
  DateOfBirth date,
  Address varchar(255),
  PhoneNumber varchar(12),
  Email varchar(30),
  HireDate date,
  EmployeeType text,
  DepartmentID int 

  CONSTRAINT fk_Department FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
);
INSERT INTO Employee VALUES ('1', 'faysal', 'mikail', '1999-02-11', 'Area 11', '08138384542', 'mikailfaysaltobi@gmail.com', '2023-01-21', 'PartTimeEmployee', '1');



DROP TABLE IF EXISTS Department CASCADE;
CREATE TABLE Department (
  DepartmentID int Primary Key,
  DepartmentName text,
  EmployeeID int 

  CONSTRAINT fk_Department FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
);
INSERT INTO Department VALUE ('1', 'procurement' ,'1');



DROP TABLE IF EXISTS JobPosition CASCADE;
CREATE TABLE JobPosition (
  PositionID int Primary Key,
  PositionTitle text,
  EmployeeID int ,
  DepartmentID int 

CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
CONSTRAINT fk_Department FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO JobPosition VALUES ('1','procurement officer','1','1');



DROP TABLE IF EXISTS FullTimeEmployee CASCADE;
CREATE TABLE FullTimeEmployee (
  EmployeeID int,
  MonthlySalary int

  CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID) 
);
INSERT INTO FullTimeEmployee VALUES ('1','$1000');



DROP TABLE IF EXISTS PartTimeEmployee CASCADE;
CREATE TABLE "PartTimeEmployee" (
  EmployeeID int,
  HourlyRate varchar

  CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
);
INSERT INTO PartTimeEmployee VALUES ('1','$60',);



DROP TABLE IF EXISTS LeaveRequest CASCADE;
CREATE TABLE LeaveRequest (
  LeaveRequestID int Primary Key,
  RequestDate date,
  StartDate date,
  EndDate date,
  Status text,
  EmployeeID int

  CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);
INSERT INTO LeaveRequest VALUES ('1','2023-02-11','2023-02-20','2023-05-20','pending','1');



DROP TABLE IF EXISTS TrainingSession CASCADE;
CREATE TABLE TrainingSession(
  SessionID int Primary Key,
  SessionName text,
  SessionDate Date,
  Location varchar(30)
  EmployeeID int

  CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);
INSERT INTO TrainingSession VALUES ('1','mental health','2023-02-11','dexter');



DROP TABLE IF EXISTS AttendanceRecord CASCADE;
CREATE TABLE AttendanceRecord(
  RecordID int Primary Key,
  RecordDate date,
  EmployeeID int,
  SessionID int

  CONSTRAINT fk_Employee FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
  CONSTRAINT fk_SessionID FOREIGN KEY(TrainingSession) REFERENCES TrainingSession(SessionID) 
);
INSERT INTO AttendanceRecord VALUES ('1','2023-02-11','1','1');
