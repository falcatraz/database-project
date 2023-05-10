-- this will be for triggers
use publicworks;

-- Creating a trigger that will update the balance whenever a balance is paid
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