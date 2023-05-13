USE publicworks;


CALL sp_add_violation(80030, 5000, curdate(), "Toxic Spillage");
SELECT * FROM violation;

SELECT * FROM employee;
