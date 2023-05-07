CREATE DATABASE PublicWorks;

USE PublicWorks;

CREATE TABLE employee (
	e_id INT PRIMARY KEY,
    e_firstname VARCHAR(20),
    e_lastname VARCHAR(20),
    e_phonenumber VARCHAR(13),
    e_title VARCHAR(30)
);

CREATE TABLE contractor (
	c_contractorID INT PRIMARY KEY,
    c_contractorName VARCHAR(20),
    c_contactFirst VARCHAR(20),
    c_contractLast VARCHAR(20),
    c_contractorPhoneNo VARCHAR(13)
);

CREATE TABLE zone (
	z_zoneNo INT PRIMARY KEY,
    z_zoneName VARCHAR(20),
    z_supervisorFirst VARCHAR(20),
    z_supervisorLast VARCHAR(20)
);

