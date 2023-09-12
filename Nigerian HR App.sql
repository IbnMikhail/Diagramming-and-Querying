CREATE TABLE `Employee` (
  `EmployeeID` int PRIMARY KEY,
  `FirstName` text,
  `LastName` text,
  `DateOfBirth` varchar(255),
  `Address` varchar(255),
  `PhoneNumber` int,
  `Email` varchar(255),
  `HireDate` varchar(255),
  `EmployeeType` varchar(Full-Time or Part-Time),
  `DepartmentID` varchar(Foreign Key, references Department)
);

CREATE TABLE `Department` (
  `DepartmentID` int(Primary Key),
  `DepartmentName` text
);

CREATE TABLE `JobPosition` (
  `PositionID` int(Primary Key),
  `PositionTitle` text
);

CREATE TABLE `Payroll` (
  `PayrollID` int(Primary Key),
  `PayrollType` varchar(255),
  `FullTime` text,
  `PartTime` text,
  `Amount` int,
  `EmployeeID` int(Foreign Key, references Employee)
);

CREATE TABLE `EmployeeType` (
  `FullTime` varchar(255),
  `PartTime` varchar(255)
);

CREATE TABLE `LeaveRequest` (
  `LeaveRequestID` int(Primary Key),
  `RequestDate` varchar(255),
  `StartDate` varchar(255),
  `EndDate` varchar(255),
  `Status` text(e.g., Pending, Approved, Rejected),
  `EmployeeID` int(Foreign Key, references Employee)
);

CREATE TABLE `TrainingSession` (
  `SessionID` int(Primary Key),
  `SessionName` text,
  `SessionDate` varchar(255),
  `Location` varchar(255)
);

CREATE TABLE `AttendanceRecord` (
  `RecordID` int(Primary Key),
  `RecordDate` varchar(255),
  `EmployeeID` int(Foreign Key, references Employee),
  `SessionID` int(Foreign Key, references TrainingSession)
);

ALTER TABLE `Employee` ADD FOREIGN KEY (`EmployeeID`) REFERENCES `Department` (`DepartmentID`);

ALTER TABLE `LeaveRequest` ADD FOREIGN KEY (`LeaveRequestID`) REFERENCES `Employee` (`EmployeeID`);

ALTER TABLE `AttendanceRecord` ADD FOREIGN KEY (`RecordID`) REFERENCES `Employee` (`EmployeeID`);

ALTER TABLE `TrainingSession` ADD FOREIGN KEY (`SessionID`) REFERENCES `Employee` (`EmployeeID`);

ALTER TABLE `Employee` ADD FOREIGN KEY (`EmployeeID`) REFERENCES `JobPosition` (`PositionID`);

ALTER TABLE `EmployeeType` ADD FOREIGN KEY (`FullTime`) REFERENCES `Employee` (`EmployeeType`);

ALTER TABLE `EmployeeType` ADD FOREIGN KEY (`PartTime`) REFERENCES `Employee` (`EmployeeType`);

ALTER TABLE `Payroll` ADD FOREIGN KEY (`FullTime`) REFERENCES `EmployeeType` (`FullTime`);

ALTER TABLE `Payroll` ADD FOREIGN KEY (`PartTime`) REFERENCES `EmployeeType` (`PartTime`);
