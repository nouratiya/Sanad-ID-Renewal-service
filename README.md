SANAD Personal ID Renewal Database System 
# Overview:-

This project implements a relational database system for the SANAD Personal Identification Card Renewal service in Jordan. It manages citizen data, service requests, payments, and secure access for employees, administrators, and auditors.

# The system ensures:-
✅ Data integrity

✅ Secure recordkeeping

✅ Efficient workflow management

# Features :-

1. Citizen Management: Register, update, and track personal information.
   
2.Service Requests: Submit, monitor, and manage personal ID renewal requests.

3.Payment Handling: Process payments, track status, and link payments to requests.

4.Employee Roles: Authorized employees review requests and update statuses.

5.Admin & Auditor Access: Admins manage all system functions; auditors view requests for compliance.

6.Reports & Views: Generate overviews of requests, payments, and user activity.

7.Security & Validation: Role-based access, data validation, and input/output checks.

# Database Design :-
Core Entities (Entity	Description)
1. Citizen	Stores personal information: name, DOB, nationality, email, address
   
2. CitizenPhone	Handles multiple phone numbers per citizen
  
3. Employee	Stores employee details and roles

4.EmployeePhone	Handles multiple phone numbers per employee

5.ServiceRequest	Tracks service requests, progress, and assigned employee

6.Payment	Stores payment records linked to service requests

# Relationships :-

1.Citizen → ServiceRequest (1:M)

2.Employee → ServiceRequest (1:M)

3.ServiceRequest → Payment (1:M)

4.Citizen → CitizenPhone (1:M)

5.Employee → EmployeePhone (1:M)

- The database is normalized up to 3NF to minimize redundancy and ensure data consistency.

# Technical Details :-

- Database Management System: MySQL

- Implementation Components:

- Tables, views, and stored procedures

- SQL queries for data retrieval and reporting

- Role-based access control

- Validation & Testing 🧪

- GUI validation for CRUD operations

- Maintenance 



Access the System

Open locally via browser: http://localhost/sanad/

Use provided admin or employee credentials to explore functionality
