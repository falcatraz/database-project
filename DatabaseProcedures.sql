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

-- 7 procedure that will insert a contractor record
DELIMITER //
CREATE PROCEDURE sp_add_contractor(IN coname VARCHAR(20), IN contact VARCHAR(40), IN phone VARCHAR(13))
BEGIN
	SET @newID = (SELECT MAX(contractor.c_contractorID) + 1 FROM contractor);
    INSERT INTO contractor (c_contractorid, c_contractorname, c_contact, c_contractorphoneno) VALUES
    (@newID, coname, contact, phone);
END //
DELIMITER ;

CALL sp_add_contractor("NASA JPL", "Benedict Arnold", "805-901-9313");

SELECT * FROM contractor;

-- 8 procedure that will insert more construction contracts into the database
DELIMITER //
CREATE PROCEDURE sp_new_contract(IN contid INT, IN repid INT, IN contrdate DATE, IN amount FLOAT)
BEGIN
	SET @new_contract_no = (SELECT MAX(ct_contractNo) + 1 FROM construction_contract);
    INSERT INTO construction_contract VALUES
    (@new_contract_no, contid, repid, contrdate, amount);

END //
DELIMITER ;

CALL sp_new_contract(400, 1004, curdate(), 200000);
SELECT * FROM construction_contract;

-- 9 procedure that will add a project to our database
DELIMITER //
CREATE PROCEDURE sp_new_project(IN pname VARCHAR(40), IN sdate DATE, IN zone INT, IN contno INT)
BEGIN
	SET @newProjNum = (SELECT MAX(p_projectNo) + 1 FROM project);
    INSERT INTO project VALUES
    (@newProjNum, pname, sdate, NULL, zone, contno);
END //
DELIMITER ;
CALL sp_new_project("Matilija Retrofit", curdate(), 4, 45605);
SELECT * FROM project;

-- 10 procedure that will insert a new invoice.. trigger is already writen, so no need to worry about that
DELIMITER //
CREATE PROCEDURE sp_new_invoice(IN amount FLOAT, IN acct INT, IN conid INT)
BEGIN
	SET @newInvoice = (SELECT MAX(i_invoiceNo) + 1 FROM invoice);
    INSERT INTO invoice VALUES
    (@newInvoice, amount, curdate(), acct, conid);
END //
DELIMITER ;
CALL sp_new_invoice(25000, 245601, 45605);
SELECT * FROM invoice;

 -- 11 procedure that will create an inspection report
 DELIMITER //
 CREATE PROCEDURE sp_add_inspection(IN inspdate DATE, IN pronum INT, IN inspid INT)
 BEGIN
		SET @newNum = (SELECT MAX(IN_InspectionNo) + 1 FROM inspection);
        INSERT INTO inspection VALUES
        (@newNum, inspdate, pronum, inspid);
 END //
DELIMITER ;

CALL sp_add_inspection("2018-10-23", 80032, 1012);
SELECT * FROM inspection;

-- 12 procedure that will remove a record from the works_on entity since it will
-- indicate that those employees are no longer active on that project. It will automatically insert into a legacy table
DELIMITER //
CREATE PROCEDURE sp_remove_works_on(IN empid INT)
BEGIN
	DECLARE old_proj INT;
    SELECT projectNo INTO old_proj FROM works_on WHERE employeeID = empid;
    DELETE FROM works_on WHERE employeeID = empid;
    INSERT INTO worked_on VALUES (empid, old_proj);
END //
DELIMITER ;

CALL sp_remove_works_on(1006);
SELECT * FROM works_on;
SELECT * FROM worked_on;













