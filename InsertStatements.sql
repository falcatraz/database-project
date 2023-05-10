-- this is for inserting values into our tables
use publicworks;
-- Inserting into the job title table
INSERT INTO job_title (j_titleid, j_titlename, j_hourlyrate) VALUES 
(1000, "Admin Assistant", 29.95),
(1001, "Civil Engineer", 45.67),
(1002, "Engineer Tech", 32.09),
(1003, "Student Worker", 15.75),
(1004, "Contract Specialist", 30.01),
(1005, "Supervisor", 47.90),
(1006, "Inspector", 31.01);

SELECT * FROM job_title;
#DELETE FROM job_title;

-- inserting into departments
INSERT INTO department (d_departmentid, d_departmentname, d_departmentphone, d_departmentlocation) VALUES
(200, "Sewers Department", "786-901-9312", "Hall of Administration"),
(201, "Watershed Department", "786-899-6310", "Saticoy Extension"),
(202, "Bridges Department", "786-890-6230", "Oxnard PWA Building"),
(203, "Roads & Transportation", "786-432-5746", "Hall of Administration"),
(204, "Operations & Maintenance", "786-334-9090", "Moorpark Extension");

SELECT * FROM department;
#DELETE FROM department;

-- inserting into contractor
INSERT INTO contractor (c_contractorid, c_contractorname, c_contact, c_contractorphoneno) VALUES
(400, "HAP LLC", "Humbert Gonzales", "705-324-8888"),
(401, "Brad & Sons", "Donald Brown", "705-483-9090"),
(402, "NV5", "Brenda Rosales", "705-351-4301"),
(403, "Raytheon", "Emily Thompson", "705-543-0001"),
(404, "Cementech", "Jeremiah Dawson", "705-7850");

SELECT * FROM contractor;
#DELETE FROM contractor;

-- inserting into employee
INSERT INTO employee (e_employeeid, e_firstname, e_lastname, e_phonenumber, titleid, departmentno) VALUES
(1001, "Francisco", "Alcaraz", "605-666-6666", 1003, 201),
(1002, "Angela", "Bofin", "605-901-9312", 1001, 201),
(1003, "Lisa", "Manza", "605-765-9087", 1003, 201),
(1004, "Matt", "Hermantrout", "605-212-2222", 1002, 201),
(1005, "Walter", "White", "605-444-4444", 1004, 201),
(1006, "Ann", "Stacy", "605-897-4301", 1000, 201),
(1007, "John", "Mayer", "605-786-1001", 1005, 201),
(1008, "Miley", "Hu", "605-209-9090", 1005, 201),
(1009, "Erik", "Villanueva", "605-001-9942", 1005, 201),
(1010, "Cristian", "Eriksen", "605-902-9311", 1005, 201),
(1011, "Selma", "Witheford", "605-805-0911", 1005, 201),
(1012, "Natalie", "Arroyo", "605-808-7023", 1006, 201),
(1013, "Dan", "Bugarin", "605-070-7011", 1006, 201);

SELECT * FROM employee;
#DELETE FROM employee;

-- inserting into bank account
INSERT INTO county_bank_account VALUES
(245600, "Sewers Account", "2003-05-01", 500000, "For equipment", 200),
(245601, "Watershed Department Acct", "2001-04-23", 500000, "For equipment", 201),
(245602, "Bridges Department Acct", "2002-03-12", 500000, "For equipment", 202),
(245603, "Roads and Traspo Acct", "2000-11-11", 500000, "For equipment", 203),
(245604, "Operations & Maint. Acct", "2001-01-02", 500000, "For equipment", 204),
(245605, "Sewers Travel", "2003-05-01", 10000, "For travel expenses", 200);

SELECT * FROM county_bank_account;
#DELETE FROM county_bank_account;

-- inserting into consturction contract
INSERT INTO construction_contract VALUES
(45600, 400, 1004, "2010-05-03", 30000),
(45601, 401, 1004, "2011-11-20", 50000),
(45602, 402, 1004, "2009-12-12", 20000),
(45603, 403, 1004, "2012-09-01", 10000),
(45604, 404, 1004, "2010-01-01", 45000);

SELECT * FROM construction_contract;
#DELETE FROM construction_contract;

-- inserting into zone
INSERT INTO zone VALUES
(1, "North County", 1007),
(2, "South County", 1008),
(3, "East County", 1009),
(4, "West County", 1010),
(5, "Central County", 1011);

SELECT * FROM zone;

-- inserting into project
INSERT INTO project VALUES
(80030, "Sandy Creek Tributary", "2013-01-01", NULL, 1, 45600),
(80031, "Cabrillo Hills Revelon Slough", "2014-12-12", NULL, 4, 45601),
(80032, "Pike's Ridge Improvements", "2015-09-05", NULL, 2, 45602),
(80033, "Inyo Basin Uplift", "2013-05-09", NULL, 3, 45603),
(80034, "Santana Dam Improvements", "2014-09-01", NULL, 1, 45604);

UPDATE project SET p_endDate = NULL;

SELECT * FROM project;

-- inserting into inspection
INSERT INTO inspection VALUES
(5000, "2013-04-15", 80030, 1012),
(5001, "2016-06-13", 80031, 1013),
(5002, "2017-10-23", 80032, 1013),
(5003, "2014-05-09", 80033, 1012),
(5004, "2014-11-16", 80034, 1013);

SELECT * FROM inspection;

-- inserting into violation
INSERT INTO violation VALUES
(1, 80031, 5001, "2016-07-03", "Illegal dumping of residue"),
(2, 80031, 5001, "2016-07-03", "Wrong guardrails"),
(1, 80030, 5000, "2013-04-16", "Illegal dumping");

SELECT * FROM violation;

-- inserting into permit
INSERT INTO permit VALUES
(1, 80030, "Excavation Permit","2013-01-15"),
(1, 80031, "Excavation Permit","2014-12-20"),
(1, 80032, "Excavation Permit","2015-09-15"),
(1, 80033, "Excavation Permit","2013-06-01"),
(1, 80034, "Excavation Permit","2014-09-20");

SELECT * FROM permit;

-- creating a procedure for inserting into invoices
