-- this will be for procedures
USE publicworks;
-- 1 creating a procedure that will insert employee table
DELIMITER //
CREATE PROCEDURE sp_add_emp(IN fname VARCHAR(20), IN lname VARCHAR(20), IN phone VARCHAR(13), IN title INT, IN deptno INT)
BEGIN
	SET @newEmp = (SELECT MAX(employee.e_employeeID) + 1 FROM employee);
    INSERT INTO employee (e_employeeID, e_firstname, e_lastname, e_phonenumber, titleid, departmentno) VALUES
    (@newEmp, fname, lname, phone, title, deptno);
END //
DELIMITER ;

CALL sp_add_emp("Daisy", "Morales", "405-901-9312", 1002, 200);
SELECT * FROM employee;

-- 2 procedure to assigns workers to a project
SELECT * FROM viewJobTitles;
DELIMITER //
CREATE PROCEDURE sp_works_on(IN empnum INT, IN projnum INT)
BEGIN
    INSERT INTO works_on (employeeID, projectno) VALUES
    (empnum, projnum);
END //
DELIMITER ;

CALL sp_works_on(1002, 80030);
CALL sp_works_on(1004, 80030);
CALL sp_works_on(1006, 80030);
SELECT * FROM works_on;

-- 3 procedure for adding funds to a bank account
DELIMITER //
CREATE PROCEDURE sp_add_funds(IN acctno INT, IN amount FLOAT)
BEGIN
    UPDATE county_bank_account SET b_accountBalance = b_accountBalance + amount WHERE b_accountno = acctno;
END //
DELIMITER ;

CALL  sp_add_funds(245603, 45000);

