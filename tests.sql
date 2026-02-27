# test 1
INSERT INTO Citizen (FirstName, LastName, DateOfBirth, Gender, Nationality, Email, Country, City, StreetName)
VALUES ('Ahmad', 'Saleh', '2002-05-10', 'Male', 'Jordanian', 'ahmad.saleh@test.com', 'Jordan', 'Amman', 'Queen Rania St');


SELECT CitizenID FROM Citizen WHERE Email = 'ahmad.saleh@test.com';

-- Try to force duplicate CitizenID by inserting with explicit ID
INSERT INTO Citizen (CitizenID, FirstName, LastName, DateOfBirth, Gender, Nationality, Email, Country, City, StreetName)
VALUES (1, 'Omar', 'Hassan', '2001-03-02', 'Male', 'Jordanian', 'omar.hassan@test.com', 'Jordan', 'Zarqa', 'Main St');


# test 2
INSERT INTO Citizen (CitizenID, FirstName, LastName, DateOfBirth, Gender, Nationality, Email, Country, City, StreetName)
VALUES (NULL, 'Test', 'User', '2000-01-01', 'Male', 'Jordanian', 'test.user@test.com', 'Jordan', 'Amman', 'Test Street');

# test 3
INSERT INTO EmployeePhone (EmployeeID, PhoneNumber)
VALUES (19, '0790000000');

# test 4
SELECT * FROM Employee WHERE EmployeeID = 101;
SELECT * FROM EmployeePhone WHERE EmployeeID = 101;

UPDATE Employee
SET EmployeeID = 201
WHERE EmployeeID = 101;

SELECT * FROM Employee WHERE FirstName = 'Ali';
SELECT * FROM EmployeePhone WHERE FirstName = 'Ali';
SELECT * FROM EmployeePhone WHERE EmployeeID = 201;

SHOW CREATE TABLE EmployeePhone;
ALTER TABLE EmployeePhone
DROP FOREIGN KEY EmployeePhone_ibfk_1;


# fk TEST 2
ALTER TABLE EmployeePhone
DROP FOREIGN KEY EmployeePhone_ibfk_1;
ALTER TABLE EmployeePhone
ADD CONSTRAINT EmployeePhone_ibfk_1
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
ON DELETE RESTRICT
ON UPDATE CASCADE;
INSERT INTO Employee (EmployeeID, FirstName, LastName, JobRole, EmployeeLevel, Email)
VALUES (101, 'Ali', 'Odeh', 'Request Officer', 'Level 1', 'ali.o@sanad.gov');
INSERT INTO EmployeePhone (EmployeeID, PhoneNumber)
VALUES (101, '0791112223');

DELETE FROM Employee
WHERE EmployeeID = 101;



# Fk test 4 
INSERT INTO Employee (EmployeeID, FirstName, LastName, JobRole, EmployeeLevel, Email)
VALUES (200, 'Test', 'Employee', 'Officer', 'Level 1', 'test.emp@sanad.gov');
INSERT INTO Citizen (FirstName, LastName, DateOfBirth, Gender, Nationality, Email, Country, City, StreetName)
VALUES ('Test', 'Citizen', '2000-01-01', 'Male', 'Jordanian', 'test.cit@sanad.com', 'Jordan', 'Amman', 'Street 1');
INSERT INTO ServiceRequest (CitizenID, EmployeeID, SubmissionDate, RequestStatus, ProgressStage)
VALUES (1, 200, '2026-02-10', 'Pending', 'Submitted');

SELECT RequestID, CitizenID, EmployeeID
FROM ServiceRequest
WHERE EmployeeID = 200;

DELETE FROM Employee
WHERE EmployeeID = 200;

DELETE FROM Employee
WHERE EmployeeID = 200;

SELECT RequestID, CitizenID, EmployeeID
FROM ServiceRequest
WHERE RequestID = 1;


# Test unique
INSERT INTO Citizen (FirstName, LastName, DateOfBirth, Gender, Nationality, Email, Country, City, StreetName)
VALUES ('Test', 'User1', '2000-01-01', 'Male', 'Jordanian', 'duplicate@test.com', 'Jordan', 'Amman', 'Street 1');

INSERT INTO Citizen (FirstName, LastName, DateOfBirth, Gender, Nationality, Email, Country, City, StreetName)
VALUES ('Test', 'User2', '2001-01-01', 'Female', 'Jordanian', 'duplicate@test.com', 'Jordan', 'Zarqa', 'Street 2');


# defualt test

INSERT INTO Citizen (FirstName, LastName, DateOfBirth, Gender, Email, Country, City, StreetName)
VALUES ('Default', 'Test', '2000-01-01', 'Male', 'default@test.com', 'Jordan', 'Amman', 'Street 1');

SELECT CitizenID, Nationality
FROM Citizen
WHERE Email = 'default@test.com';


# Test not null
INSERT INTO Employee (FirstName, LastName, JobRole, EmployeeLevel, Email)
VALUES ('Test', 'Employee', 'Officer', NULL, 'null.level@sanad.gov');

# Test check 
INSERT INTO Payment (RequestID, AmountPaid, PaymentMethod, PaymentDate, PaymentStatus)
VALUES (1, 12, 'Cash', '2026-02-10', 'Completed');

# Test datatypes 
INSERT INTO Payment (RequestID, AmountPaid, PaymentMethod, PaymentDate, PaymentStatus)
VALUES (1, 'abc', 'Cash', '2026-02-10', 'Completed');


# query 1
SELECT C.CitizenID, C.FirstName, C.LastName, SR.RequestID, P.PaymentID, P.AmountPaid, P.PaymentMethod, P.PaymentDate, P.PaymentStatus
FROM Citizen C
JOIN ServiceRequest SR ON C.CitizenID = SR.CitizenID
JOIN Payment P ON SR.RequestID = P.RequestID;

SELECT * FROM Citizen;
SELECT * FROM Payment;


# Query 2 
SELECT C.CitizenID, C.FirstName, C.LastName, SUM(P.AmountPaid) AS TotalPaid
FROM Citizen C
JOIN ServiceRequest SR ON C.CitizenID = SR.CitizenID
JOIN Payment P ON SR.RequestID = P.RequestID
WHERE P.PaymentStatus = 'Completed'
GROUP BY C.CitizenID, C.FirstName, C.LastName
HAVING SUM(P.AmountPaid) > 700;

select * from payment;
select * from servicerequest;

select * from citizen;



# query 3
SELECT JobRole, COUNT(*) AS NumberOfEmployees
FROM Employee
GROUP BY JobRole;

select * from employee;



# query 4
select * from employeephone;
UPDATE EmployeePhone
SET PhoneNumber = '0799999999'
WHERE EmployeeID = 102;


