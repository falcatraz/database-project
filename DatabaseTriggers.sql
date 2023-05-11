-- this will be for triggers
use publicworks;

-- 1 Creating a trigger that will update the balance whenever a balance is paid
-- assumption is that invoices are inserted whenever they are paid

DELIMITER //
CREATE TRIGGER check_account_balance
BEFORE INSERT ON INVOICE
FOR EACH ROW
BEGIN
    DECLARE account_balance FLOAT;
    SELECT b_accountBalance INTO account_balance FROM county_bank_account WHERE b_accountNo = NEW.bankAccountNo;
    IF (account_balance < NEW.i_amount) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient account balance';
	ELSE 
        UPDATE county_bank_account SET b_accountBalance = b_accountBalance - NEW.i_amount WHERE b_accountNo = NEW.bankAccountNo;
    END IF;
END //
DELIMITER ;

SELECT * FROM county_bank_account;
INSERT INTO invoice VALUES (90001, 500000, curdate(), 245600, 45600);


-- 2 trigger that will validate that only a contract specialist can be in a construction contract
DELIMITER // 
CREATE TRIGGER validate_construction_specialist
BEFORE INSERT ON construction_contract
FOR EACH ROW
BEGIN
DECLARE job_type INT;
	SELECT titleid INTO job_type FROM employee WHERE e_employeeID = NEW.countyrepid;
    IF (job_type != '1004') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Must be a contract specialist for county representative';
	END IF;
END //
DELIMITER ;


-- 3 creating a trigger to validate that only an inspector can conduct an inspection
DELIMITER // 
CREATE TRIGGER validate_inspector
BEFORE INSERT ON inspection
FOR EACH ROW
BEGIN
DECLARE job_type INT;
	SELECT titleid INTO job_type FROM employee WHERE e_employeeID = NEW.inspectorid;
    IF (job_type != '1006') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only an inspector can submit a report';
	END IF;
END //
DELIMITER ;