SANAD Personal ID Renewal Database System 🌐
Overview

This project implements a relational database system for the SANAD Personal Identification Card Renewal service in Jordan. It manages citizen data, service requests, payments, and secure access for employees, administrators, and auditors.

The system ensures:
✅ Data integrity
✅ Secure recordkeeping
✅ Efficient workflow management

Features ✨

👤 Citizen Management: Register, update, and track personal information.

📝 Service Requests: Submit, monitor, and manage personal ID renewal requests.

💳 Payment Handling: Process payments, track status, and link payments to requests.

🛠 Employee Roles: Authorized employees review requests and update statuses.

🏛 Admin & Auditor Access: Admins manage all system functions; auditors view requests for compliance.

📊 Reports & Views: Generate overviews of requests, payments, and user activity.

🔒 Security & Validation: Role-based access, data validation, and input/output checks.

Database Design 🗂
Core Entities
Entity	Description
👤 Citizen	Stores personal information: name, DOB, nationality, email, address
📞 CitizenPhone	Handles multiple phone numbers per citizen
👨‍💼 Employee	Stores employee details and roles
📱 EmployeePhone	Handles multiple phone numbers per employee
📝 ServiceRequest	Tracks service requests, progress, and assigned employee
💰 Payment	Stores payment records linked to service requests
Relationships 🔗

Citizen → ServiceRequest (1:M)

Employee → ServiceRequest (1:M)

ServiceRequest → Payment (1:M)

Citizen → CitizenPhone (1:M)

Employee → EmployeePhone (1:M)

The database is normalized up to 3NF to minimize redundancy and ensure data consistency.

Technical Details ⚙️

Database Management System: MySQL

Implementation Components:

Tables, views, and stored procedures

SQL queries for data retrieval and reporting

Role-based access control

Validation & Testing 🧪

Primary and foreign key constraints

UNIQUE, NOT NULL, CHECK, and DEFAULT constraints

GUI validation for CRUD operations

Maintenance 🛡

Regular backups and recovery procedures

Performance optimization via indexing and integrity checks

Installation & Setup 🖥

Clone the Repository

git clone <repository-url>


Import Database

Use MySQL Workbench → Server → Data Import → select sanad_database.sql

Configure the Connection

Update the web application or GUI with your MySQL credentials

Access the System

Open locally via browser: http://localhost/sanad/

Use provided admin or employee credentials to explore functionality
