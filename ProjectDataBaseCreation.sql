CREATE DATABASE PublicWorks;

USE PublicWorks;

-- final job title table
CREATE TABLE job_title (
	j_titleID INT PRIMARY KEY,
    j_titleName VARCHAR(25),
    j_hourlyRate FLOAT
    );

-- final department table
CREATE TABLE department (
	d_departmentID INT PRIMARY KEY,
    d_departmentName VARCHAR(35),
    d_departmentPhone VARCHAR(13),
    d_departmentLocation VARCHAR(25)
);
    
-- final contractor table
CREATE TABLE contractor (
	c_contractorID INT PRIMARY KEY,
	c_contractorName VARCHAR(20),
	c_contact VARCHAR(40),
	c_contractorPhoneNo VARCHAR(13)
);

-- final employee table
CREATE TABLE employee (
	e_employeeID INT PRIMARY KEY,
    e_firstname VARCHAR(20),
    e_lastname VARCHAR(20),
    e_phonenumber VARCHAR(13),
    titleID INT, -- foreign key
    departmentNo INT, -- foreign key
    
    CONSTRAINT fk_titleid FOREIGN KEY (titleID) REFERENCES job_title(j_titleID),
    CONSTRAINT fk_departno FOREIGN KEY (departmentNo) REFERENCES department(d_departmentID)
);

-- final zone table
CREATE TABLE zone (
	z_zoneNo INT PRIMARY KEY,
    z_zoneName VARCHAR(20),
    zoneSupervisorID INT, -- foreign key
    CONSTRAINT fk_zoneemp FOREIGN KEY (zoneSupervisorID) REFERENCES employee(e_employeeID)
	);

-- final construction contract table
CREATE TABLE construction_contract (
	ct_contractNo INT, -- primary key
    contractorID INT, -- foreign key and primary key
	countyRepID INT, -- foreign key and primary key
    ct_contractDate DATE,
    ct_awardAmount float,
    
    CONSTRAINT pk_contract PRIMARY KEY (ct_contractNo, contractorID, countyRepID),
    CONSTRAINT fk_ctcontractor FOREIGN KEY (contractorID) REFERENCES contractor(c_contractorID),
    CONSTRAINT fk_ctemp FOREIGN KEY (countyRepID) REFERENCES employee(e_employeeID)
);

-- final county bank account table
CREATE TABLE county_bank_account (
	b_accountNo INT PRIMARY KEY,
    b_accountName VARCHAR(30),
    b_dateOpened DATE,
    b_accountBalance FLOAT,
    b_PurposeDescription VARCHAR (70),
    accountOwnerID INT, -- foreign key
    
    CONSTRAINT fk_ownerid FOREIGN KEY (accountOwnerID) REFERENCES department(d_departmentID)
);

-- final invoice table
CREATE TABLE invoice (
	i_invoiceNo INT PRIMARY KEY,
    i_amount FLOAT,
    i_invoiceDate DATE,
    bankAccountNo INT, -- foreing key
    contractID INT, -- foreign key
    
    CONSTRAINT fk_invacctno FOREIGN KEY (bankAccountNo) REFERENCES county_bank_account(b_accountNo),
    CONSTRAINT fk_invcontract FOREIGN KEY (contractID) REFERENCES construction_contract(ct_contractNo)
);

-- final project table
CREATE TABLE project (
	p_projectNo INT PRIMARY KEY,
    p_projectName VARCHAR (40),
    p_startDate DATE,
    p_endDate DATE,
    zoneNo INT, -- foreign key
    contractNo INT, -- foreign key
    
    CONSTRAINT fk_projzone FOREIGN KEY (zoneNo) REFERENCES zone(z_zoneNo),
    CONSTRAINT fk_projcont FOREIGN KEY (contractNo) REFERENCES construction_contract(ct_contractNo)
);

-- final instpection table
CREATE TABLE inspection (
	IN_InspectionNo INT PRIMARY KEY,
    IN_inspectionDate DATE,
    projectNo INT, -- foreign key
    inspectorID INT, -- foreign key
    
    CONSTRAINT fk_inspproj FOREIGN KEY (projectNo) REFERENCES project(p_projectNo),
    CONSTRAINT fk_inspector FOREIGN KEY (inspectorID) REFERENCES employee(e_employeeID)
);

-- final violation table
CREATE TABLE violation (
	v_violationNo INT, -- PK
    projectNo INT, -- pk, fk
    inspectionNo INT, -- fk
    v_violationDate DATE,
    v_reason VARCHAR (70),
    
    CONSTRAINT pk_violation PRIMARY KEY (v_violationNo, projectNo),
    CONSTRAINT fk_vioproj FOREIGN KEY (projectNo) REFERENCES project(p_projectNo),
    CONSTRAINT fk_vioinsp FOREIGN KEY (inspectionNo) REFERENCES inspection(IN_InspectionNo)
);

-- final permit table
CREATE TABLE permit (
	pt_permitNo INT, -- PK,
    projectNo INT, -- PK, FK
    pt_permitName VARCHAR(35),
    pt_permitDate DATE,
    
    CONSTRAINT pk_permit PRIMARY KEY (pt_permitNo, projectNo),
    CONSTRAINT fk_permproj FOREIGN KEY (projectNo) REFERENCES project(p_projectNo)
);

-- final associative table for people that work on a project
CREATE TABLE works_on (
	employeeID INT,
    projectNo INT,
    
    CONSTRAINT pk_workson PRIMARY KEY (employeeID, projectNo),
    CONSTRAINT fk_workson FOREIGN KEY (employeeID) REFERENCES employee (e_employeeID),
    CONSTRAINT fk_workson2 FOREIGN KEY (projectNo) REFERENCES project (p_projectNo)
);

-- final associative table that will be used to store legacy records of the works_on table
CREATE TABLE worked_on (
	employeeID INT,
    projectNo INT,
    
    CONSTRAINT pk_workson2 PRIMARY KEY (employeeID, projectNo),
    CONSTRAINT fk_workson3 FOREIGN KEY (employeeID) REFERENCES employee (e_employeeID),
    CONSTRAINT fk_workson4 FOREIGN KEY (projectNo) REFERENCES project (p_projectNo)
);

