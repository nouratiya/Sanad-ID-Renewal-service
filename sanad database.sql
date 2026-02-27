DROP DATABASE IF EXISTS SANAD_ID_RENEWAL_DB;
CREATE DATABASE SANAD_ID_RENEWAL_DB;
USE SANAD_ID_RENEWAL_DB;

CREATE TABLE Citizen (
    CitizenID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender ENUM('Male','Female','Other') NOT NULL,
    Nationality VARCHAR(50) default 'jordanian	',
    Email VARCHAR(100) UNIQUE,
    Country VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    StreetName VARCHAR(100) NOT NULL,
    PRIMARY KEY (CitizenID)
);

CREATE TABLE CitizenPhone (
    CitizenID INT NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (CitizenID, PhoneNumber),
    FOREIGN KEY (CitizenID) REFERENCES Citizen(CitizenID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE Employee (
    EmployeeID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobRole VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PRIMARY KEY (EmployeeID)
);

-- FIX HERE: RESTRICT instead of CASCADE
CREATE TABLE EmployeePhone (
    EmployeeID INT NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    PRIMARY KEY (EmployeeID, PhoneNumber),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE ServiceRequest (
    RequestID INT NOT NULL AUTO_INCREMENT,
    CitizenID INT NOT NULL,
    EmployeeID INT,
    SubmissionDate DATE NOT NULL,
    RequestStatus ENUM('Pending','Under Review','Approved','Rejected','Completed') NOT NULL,
    ProgressStage VARCHAR(50),
    PRIMARY KEY (RequestID),
    FOREIGN KEY (CitizenID) REFERENCES Citizen(CitizenID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Payment (
    PaymentID INT NOT NULL AUTO_INCREMENT,
    RequestID INT NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentMethod ENUM('Card','E-Wallet','Cash') NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentStatus ENUM('Completed','Pending','Failed') NOT NULL,
    PRIMARY KEY (PaymentID),
    FOREIGN KEY (RequestID) REFERENCES ServiceRequest(RequestID) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (AmountPaid > 100)
);

