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

-- 4 procedure to create permits for a project
DELIMITER //
CREATE PROCEDURE sp_add_permit(IN projnum INT, IN pmname VARCHAR(35), IN pmdate DATE)
BEGIN
	SET @newPerm = (SELECT MAX(permit.pt_permitNo) + 1 FROM permit WHERE permit.projectNo = projnum);
    INSERT INTO permit (pt_permitNo, projectNo, pt_permitName, pt_permitDate) VALUES
    (@newPerm, projnum, pmname, pmdate);
END //
DELIMITER ;

CALL sp_add_permit(80030, "Traffic Permit", "2013-02-19");

-- 5 procedure to update the end date of a project
DELIMITER //
CREATE PROCEDURE sp_end_project(IN projnum INT, IN endate DATE)
BEGIN
	UPDATE project SET p_endDate = endate WHERE p_projectNo = projnum;
END //
DELIMITER ;

CALL sp_end_project(80030, curdate());
SELECT * FROM project;

-- 6 will report a violation
SELECT * FROM violation;
DELIMITER //
CREATE PROCEDURE sp_add_violation(IN pronum INT, IN inspno INT, IN vdate DATE, IN reason VARCHAR(70))
BEGIN
	SET @newVio = (SELECT MAX(violation.v_violationNo) + 1 FROM violation WHERE violation.projectNo = pronum);
    IF @newVio IS NULL THEN
		SET @newVio = 1;
        INSERT INTO violation(v_violationNo, projectNo, inspectionNo, v_violationDate, v_reason) VALUES
		(@newVio, pronum, inspno, vdate, reason);
	ELSE
		INSERT INTO violation(v_violationNo, projectNo, inspectionNo, v_violationDate, v_reason) VALUES
		(@newVio, pronum, inspno, vdate, reason);
	END IF;
END //
DELIMITER ;

CALL sp_add_violation(80034, 5004, curdate(), "Toxic Spillage");
SELECT * FROM violation;
