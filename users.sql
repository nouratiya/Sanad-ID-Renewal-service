CREATE USER 'Hani_Zaid'@'localhost' IDENTIFIED BY 'YourStrongPassword';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON SANAD_ID_RENEWAL_DB.* 
TO 'Hani_Zaid'@'localhost';
 
CREATE USER 'Ali_Odeh'@'localhost' IDENTIFIED BY 'YourStrongPassword';
GRANT SELECT, UPDATE, INSERT,DELETE
ON SANAD_ID_RENEWAL_DB.ServiceRequest 
TO 'Ali_Odeh'@'localhost';
GRANT SELECT, UPDATE, INSERT,DELETE
ON SANAD_ID_RENEWAL_DB.Citizen 
TO 'Ali_Odeh'@'localhost';
GRANT SELECT, UPDATE, INSERT,DELETE 
ON SANAD_ID_RENEWAL_DB.Payment 
TO 'Ali_Odeh'@'localhost';
 
CREATE USER 'Khaled_Fares'@'localhost' IDENTIFIED BY 'YourStrongPassword';
GRANT SELECT 
ON SANAD_ID_RENEWAL_DB.* 
TO 'Khaled_Fares'@'localhost';
 
CREATE USER 'Ahmad_Haddad'@'localhost' IDENTIFIED BY 'YourStrongPassword';
GRANT SELECT, UPDATE 
ON SANAD_ID_RENEWAL_DB.Citizen 
TO 'Ahmad_Haddad'@'localhost';
GRANT SELECT, INSERT 
ON SANAD_ID_RENEWAL_DB.ServiceRequest 
TO 'Ahmad_Haddad'@'localhost';
GRANT SELECT, INSERT 
ON SANAD_ID_RENEWAL_DB.Payment 
TO 'Ahmad_Haddad'@'localhost';