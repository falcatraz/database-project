-- this is for inserting values into our tables
use publicworks;
-- Inserting into the job title table
INSERT INTO job_title (j_titleid, j_titlename, j_hourlyrate) VALUES 
(1000, "Admin Assistant", 29.95),
(1001, "Civil Engineer", 45.67),
(1002, "Engineer Tech", 32.09),
(1003, "Student Worker", 15.75),
(1004, "Contract Specialist", 30.01);

SELECT * FROM job_title;

-- inserting into departments
INSERT INTO department (d_departmentid, d_departmentname, d_departmentphone, d_departmentlocation) VALUES
(200, "Sewers Department", "786-901-9312", "Hall of Administration"),
(201, "Watershed Department", "786-899-6310", "Saticoy Extension"),
(202, "Bridges Department", "786-890-6230", "Oxnard PWA Building"),
(203, "Roads & Transportation", "786-432-5746", "Hall of Administration"),
(204, "Operations & Maintenance", "786-334-9090", "Moorpark Extension");

SELECT * FROM department;

-- inserting into contractor
INSERT INTO contractor (c_contractorid, c_contractorname, c_contact, c_contractorphoneno) VALUES
(400, "HAP LLC", "Humbert Gonzales", "705-324-8888"),
(401, "Brad & Sons", "Donald Brown", "705-483-9090"),
(402, "NV5", "Brenda Rosales", "705-351-4301"),
(403, "Raytheon", "Emily Thompson", "705-543-0001"),
(404, "Cementech", "Jeremiah Dawson", "705-7850");

SELECT * FROM contractor;

-- inserting into employee
INSERT INTO employee (e_employeeid, e_firstname, e_lastname, e_phonenumber, titleid, departmentno) VALUES
(1001, "Francisco", "Alcaraz", "605-666-6666", 1003, 201),
(1002, "Angela", "Bofin", "605-901-9312", 1001, 201),
(1003, "Lisa", "Manza", "605-765-9087", 1003, 201),
(1004, "Matt", "Hermantrout", "605-212-2222", 1002, 201),
(1005, "Walter", "White", "605-444-4444", 1004, 201),
(1006, "Ann", "Stacy", "605-897-4301", 1000, 201);

SELECT * FROM employee;

-- inserting into bank account
INSERT INTO county_bank_account VALUES
(245600, "Sewers Account", "2017-05-01", 500000, "For equipment", 200),
(245601, "Watershed Department Acct", "2021-04-23", 500000, "For equipment", 201),
(245602, "Bridges Department Acct", "2019-03-12", 500000, "For equipment", 202),
(245603, "Roads and Traspo Acct", "2020-11-11", 500000, "For equipment", 203),
(245604, "Operations & Maint. Acct", "2017-01-02", 500000, "For equipment", 204);

SELECT * FROM county_bank_account;

-- inserting into consturction contract
INSERT INTO construction_contract VALUES
(45600, 400, 1004, "2020-05-03", 30000),
(45601, 401, 1004, "2021-11-20", 50000),
(45602, 402, 1004, "2019-12-12", 20000),
(45603, 403, 1004, "2022-09-01", 10000),
(45604, 404, 1004, "2021-01-01", 45000);

SELECT * FROM construction_contract;

-- inserting into inspection



