USE SANAD_ID_RENEWAL_DB;

INSERT INTO Citizen (FirstName, LastName, DateOfBirth, Gender, Nationality, Email, Country, City, StreetName)
VALUES ('Ahmad', 'Haddad', '1998-05-12', 'Male', 'Jordanian', 'ahmad.h@gmail.com', 'Jordan', 'Amman', 'Mecca Street'),
('Sara', 'Khalil', '2000-09-21', 'Female', 'Jordanian', 'sara.k@gmail.com', 'Jordan', 'Zarqa', 'King Abdullah St'),
('Omar', 'Nasser', '1995-02-03', 'Male', 'Jordanian', 'omar.n@gmail.com', 'Jordan', 'Irbid', 'University St'),
('Lina', 'Salem', '2001-11-17', 'Female', 'Jordanian', 'lina.s@gmail.com', 'Jordan', 'Amman', 'Gardens St'),
('Yousef', 'Mahmoud', '1997-07-30', 'Male', 'Jordanian', 'yousef.m@gmail.com', 'Jordan', 'Aqaba', 'Beach Road');

INSERT INTO CitizenPhone (CitizenID, PhoneNumber)
VALUES (1, '0791234567'),
(1, '0789876543'),
(2, '0771122334'),
(3, '0795566778'),
(4, '0783344556'),
(5, '0779988776');

INSERT INTO Employee (EmployeeID, FirstName, LastName, JobRole, Email)
VALUES (101, 'Ali', 'Odeh', 'Request Officer', 'ali.o@sanad.gov'),
(102, 'Mona', 'Yasin', 'Senior Reviewer', 'mona.y@sanad.gov'),
(103, 'Khaled', 'Fares', 'Payment Auditor', 'khaled.f@sanad.gov'),
(104, 'Rana', 'Issa', 'Service Supervisor', 'rana.i@sanad.gov'),
(105, 'Hani', 'Zaid', 'System Admin', 'hani.z@sanad.gov');

INSERT INTO EmployeePhone (EmployeeID, PhoneNumber)
VALUES (101, '0791112223'),
(102, '0784445556'),
(103, '0776667778'),
(104, '0798889991'),
(105, '0782223334');

INSERT INTO ServiceRequest (RequestID, SubmissionDate, RequestStatus, ProgressStage, CitizenID, EmployeeID)
VALUES (1001, '2025-01-05', 'Pending', 'Submitted', 1, 101),
(1002, '2025-01-06', 'Under Review', 'Verification', 2, 102),
(1003, '2025-01-07', 'Approved', 'Approval', 3, 104),
(1004, '2025-01-08', 'Rejected', 'Review Failed', 4, 102),
(1005, '2025-01-09', 'Completed', 'Finished', 5, 105);

INSERT INTO Payment (RequestID, AmountPaid, PaymentMethod, PaymentDate, PaymentStatus)
VALUES (1001, 500, 'Card', '2025-01-06', 'Completed'),
(1002, 500, 'E-Wallet', '2025-01-07', 'Completed'),
(1003, 600, 'Card', '2025-01-08', 'Completed'),
(1004, 800, 'E-Wallet', '2025-01-09', 'Failed'),
(1005, 1000, 'Cash', '2025-01-10', 'Completed');



# View 1: List of all service requests with citizen and employee names
CREATE VIEW View_ServiceRequests AS
SELECT 
    SR.RequestID,
    C.FirstName AS CitizenFirstName,
    C.LastName AS CitizenLastName,
    E.FirstName AS EmployeeFirstName,
    E.LastName AS EmployeeLastName,
    SR.SubmissionDate,
    SR.RequestStatus
FROM ServiceRequest SR
JOIN Citizen C ON SR.CitizenID = C.CitizenID
JOIN Employee E ON SR.EmployeeID = E.EmployeeID;
 
-- View 2: Payments summary for each service request
CREATE VIEW View_PaymentSummary AS
SELECT
    SR.RequestID,
    C.FirstName AS CitizenFirstName,
    C.LastName AS CitizenLastName,
    SUM(P.AmountPaid) AS TotalPaid,
    COUNT(P.PaymentID) AS NumberOfPayments
FROM Payment P
JOIN ServiceRequest SR ON P.RequestID = SR.RequestID
JOIN Citizen C ON SR.CitizenID = C.CitizenID
GROUP BY SR.RequestID, C.FirstName, C.LastName;
 
-- View 3: Citizen contact info with multiple phone numbers
CREATE VIEW View_CitizenContacts AS
SELECT 
    C.CitizenID,
    C.FirstName,
    C.LastName,
    C.Email,
    CP.PhoneNumber
FROM Citizen C
LEFT JOIN CitizenPhone CP ON C.CitizenID = CP.CitizenID;
 
-- View 4: Pending service requests with citizen details
CREATE VIEW View_PendingRequests AS
SELECT
    SR.RequestID,
    C.FirstName AS CitizenFirstName,
    C.LastName AS CitizenLastName,
    SR.SubmissionDate,
    SR.RequestStatus
FROM ServiceRequest SR
JOIN Citizen C ON SR.CitizenID = C.CitizenID
WHERE SR.RequestStatus = 'Pending';
 
USE SANAD_DB;
 
 
DELIMITER $$
 
CREATE PROCEDURE Get_Total_Payments_By_Citizen()
BEGIN
    SELECT 
        c.CitizenID,
        c.FirstName,
        c.LastName,
        SUM(p.AmountPaid) AS TotalPayments
    FROM 
        Citizen c
    JOIN 
        ServiceRequest sr ON c.CitizenID = sr.CitizenID
    JOIN 
        Payment p ON sr.RequestID = p.RequestID
    WHERE 
        p.PaymentStatus = 'Completed'
    GROUP BY 
        c.CitizenID, c.FirstName, c.LastName;
END $$
 
DELIMITER ;
 
USE SANAD_DB;
 
DROP PROCEDURE IF EXISTS Get_Pending_Requests_By_Employee;
 
DELIMITER $$
 
CREATE PROCEDURE Get_Pending_Requests_By_Employee()
BEGIN
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        COUNT(sr.RequestID) AS PendingRequests
    FROM 
        Employee e
    JOIN 
        ServiceRequest sr ON e.EmployeeID = sr.EmployeeID
    WHERE 
        sr.RequestStatus = 'Pending'
    GROUP BY 
        e.EmployeeID, e.FirstName, e.LastName;
END $$
 
DELIMITER ;
 
USE SANAD_DB;
 
 
DELIMITER $$
 
CREATE PROCEDURE Get_Citizen_Request_Status(IN citizen_id INT)
BEGIN
    SELECT 
        sr.RequestID,
        sr.SubmissionDate,
        sr.RequestStatus,
        sr.ProgressStage
    FROM 
        ServiceRequest sr
    WHERE 
        sr.CitizenID = citizen_id;
END $$
 
USE SANAD_DB;
 
 
DELIMITER $$
 
CREATE PROCEDURE Get_Payments_By_Method()
BEGIN
    SELECT 
        PaymentMethod,
        COUNT(PaymentID) AS TotalPayments,
        SUM(AmountPaid) AS TotalAmount
    FROM 
        Payment
    WHERE 
        PaymentStatus = 'Completed'
    GROUP BY 
        PaymentMethod;
END $$
 
DELIMITER ;
 
 
DELIMITER ;
