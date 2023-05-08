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