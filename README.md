SANAD Personal ID Renewal Database System
Overview

This project implements a relational database system for the SANAD Personal Identification Card Renewal service in Jordan. It is designed to manage citizen information, track service requests, process payments, and provide secure access for government employees, administrators, and auditors.

The system demonstrates how a structured database can support real-world digital government services, ensuring data integrity, secure recordkeeping, and efficient workflow management.

Features

Citizen Management: Register, update, and track personal information.

Service Requests: Submit, monitor, and manage personal ID renewal requests.

Payment Handling: Process payments, track status, and link payments to service requests.

Employee Roles: Authorized employees can review requests and update statuses.

Admin & Auditor Access: Administrators manage all system functions; auditors can view service requests for compliance.

Reports & Views: Generate overviews of requests, payments, and user activity.

Security & Validation: Role-based access, data validation rules, and input/output checks.

Database Design

The database consists of the following core entities:

Entity	Description
Citizen	Stores personal information including name, DOB, nationality, email, and address.
CitizenPhone	Handles multiple phone numbers per citizen.
Employee	Stores employee details and roles.
EmployeePhone	Handles multiple phone numbers per employee.
ServiceRequest	Tracks service requests, progress, and assigned employee.
Payment	Stores payment records linked to service requests.

Relationships:

Citizen → ServiceRequest (1:M)

Employee → ServiceRequest (1:M)

ServiceRequest → Payment (1:M)

Citizen → CitizenPhone (1:M)

Employee → EmployeePhone (1:M)

The database is normalized up to 3NF to minimize redundancy and ensure data consistency.

Technical Details

Database Management System: MySQL

Implementation Components:

Tables, views, and stored procedures

SQL queries for data retrieval and reporting

Role-based access control for different user types

Validation & Testing:

Primary and foreign key constraints

UNIQUE, NOT NULL, CHECK, and DEFAULT constraints

GUI validation for CRUD operations

Maintenance:

Regular backups and recovery procedures

Performance optimization via indexing and data integrity checks

Installation & Setup

Clone the Repository

git clone <repository-url>


Import Database

Use MySQL Workbench or a similar tool.

Go to Server → Data Import and select the provided sanad_database.sql file.

Ensure tables, procedures, and sample data are imported successfully.

Configure the Connection

Update database connection settings in the web application or GUI with your MySQL credentials.

Access the System

Open the system locally via browser: http://localhost/sanad/

Use provided admin or employee credentials to explore functionality.
