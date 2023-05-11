use publicworks;
-- Views

-- 1 creating a view that counts the number of violations per project
CREATE VIEW numViolations AS
SELECT p_projectNo, COUNT(p_projectNo) FROM project RIGHT JOIN violation ON p_projectNo = projectNo 
GROUP BY p_projectNo;

SELECT * FROM numviolations;

-- 2 creating view to see which employees inspected projects, with the project name and the zone no
CREATE VIEW seeInspectedSites AS
SELECT e.e_employeeID, e.e_firstname, e.e_lastname, i.IN_inspectionDate, p.p_projectName, z.z_zoneNo 
FROM employee e 
RIGHT JOIN inspection i ON e.e_employeeID = i.inspectorID 
RIGHT JOIN project p ON i.projectNo = p.p_projectNo
JOIN zone z ON p.zoneNo = z.z_zoneNo;

SELECT * FROM seeInspectedSites;

-- 3 creating a view that shows the total balances of the accounts of each department
CREATE VIEW totalDepartmentBalances AS
SELECT d_departmentID, d_departmentName, SUM(c.b_accountBalance) 
FROM department d JOIN county_bank_account c ON d.d_departmentID = c.accountOwnerID
GROUP BY d.d_departmentID;

SELECT * FROM totalDepartmentBalances;

-- 4 creating a view to see employees and their title
CREATE VIEW viewJobTitles AS
SELECT e.e_lastname, e.e_firstname, e.e_employeeID, j.j_titleName FROM employee e LEFT JOIN job_title j ON e.titleID = j.j_titleID ORDER BY e.e_lastname;

SELECT * FROM viewJobTitles;

-- 5 creating a view to see the project employees are working on
CREATE VIEW viewWorkersOnProject AS
SELECT e.e_employeeID, e.e_firstname, e.e_lastname, p.p_projectNo, p.p_projectName 
FROM employee e RIGHT JOIN works_on w ON e.e_employeeID = w.employeeID LEFT JOIN project p ON w.projectNo = p.p_projectNo;

SELECT * FROM viewWorkersOnProject;

-- 6 creating a view that will allow us to see the number of permits a project has been granted.
CREATE VIEW viewNumPermits AS
SELECT p.p_projectNo, p_projectName, COUNT(p_projectName) FROM project p JOIN permit t ON p.p_projectNo = t.projectNo GROUP BY p_projectNo;

SELECT * FROM viewNumPermits;