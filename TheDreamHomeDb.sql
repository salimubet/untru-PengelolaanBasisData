
CREATE TABLE `branch` (
  `branchNo` char(4) NOT NULL,
  `street` varchar(25) NOT NULL,
  `city` varchar(15) NOT NULL,
  `postcode` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `branch` (`branchNo`, `street`, `city`, `postcode`) VALUES
('B002', '56 Clover Dr', 'London', 'NW10 6EU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU');


CREATE TABLE `client` (
  `clientNo` varchar(7) NOT NULL,
  `fName` varchar(15) NOT NULL,
  `lName` varchar(15) NOT NULL,
  `telNo` varchar(13) NOT NULL,
  `prefType` varchar(10) NOT NULL,
  `maxRent` decimal(5,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `client` (`clientNo`, `fName`, `lName`, `telNo`, `prefType`, `maxRent`) VALUES
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', '350.0'),
('CR62', 'Mary', 'Tregar', '01224-196720', 'Flat', '600.0'),
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', '750.0'),
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', '425.0');


CREATE TABLE `privateowner` (
  `ownerNo` varchar(7) NOT NULL,
  `fName` varchar(15) NOT NULL,
  `lName` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `telNo` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `privateowner` (`ownerNo`, `fName`, `lName`, `address`, `telNo`) VALUES
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728'),
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212'),
('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025');


CREATE TABLE `propertyforrent` (
  `propertyNo` varchar(8) NOT NULL,
  `street` varchar(25) NOT NULL,
  `city` varchar(15) NOT NULL,
  `postcode` varchar(8) NOT NULL,
  `propertyType` varchar(10) NOT NULL,
  `rooms` smallint(6) NOT NULL,
  `rent` decimal(5,1) NOT NULL,
  `ownerNo` varchar(7) NOT NULL,
  `staffNo` varchar(5) DEFAULT NULL,
  `branchNo` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `propertyforrent` (`propertyNo`, `street`, `city`, `postcode`, `propertyType`, `rooms`, `rent`, `ownerNo`, `staffNo`, `branchNo`) VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, '650.0', 'CO46', 'SA9', 'B007'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, '450.0', 'CO93', 'SG14', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, '600.0', 'CO87', 'SG37', 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, '375.0', 'CO93', 'SG37', 'B003'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, '350.0', 'CO40', NULL, 'B003'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 4, '400.0', 'CO87', 'SL41', 'B005');


CREATE TABLE `registration` (
  `clientNo` varchar(7) NOT NULL,
  `branchNo` char(4) NOT NULL,
  `staffNo` varchar(5) NOT NULL,
  `dateJoined` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `registration` (`clientNo`, `branchNo`, `staffNo`, `dateJoined`) VALUES
('CR56', 'B003', 'SG37', '2000-04-11'),
('CR62', 'B007', 'SA9', '2000-03-07'),
('CR74', 'B003', 'SG37', '1999-11-16'),
('CR76', 'B005', 'SL41', '2001-01-02');


CREATE TABLE `staff` (
  `staffNo` varchar(5) NOT NULL,
  `fName` varchar(15) NOT NULL,
  `lName` varchar(15) NOT NULL,
  `oPosition` varchar(10) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `salary` decimal(9,2) NOT NULL,
  `branchNo` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `staff` (`staffNo`, `fName`, `lName`, `oPosition`, `sex`, `DOB`, `salary`, `branchNo`) VALUES
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-02-19', '9000.00', 'B007'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-11-24', '18000.00', 'B003'),
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-10-11', '12000.00', 'B003'),
('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', '24000.00', 'B003'),
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01', '30000.00', 'B005'),
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-13', '9000.00', 'B005');


CREATE TABLE `viewing` (
  `clientNo` varchar(7) NOT NULL,
  `propertyNo` varchar(8) NOT NULL,
  `viewDate` date NOT NULL,
  `comments` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `viewing` (`clientNo`, `propertyNo`, `viewDate`, `comments`) VALUES
('CR56', 'PA14', '2001-05-24', 'too small'),
('CR62', 'PA14', '2001-05-14', 'no dining room'),
('CR56', 'PG36', '2001-04-28', NULL),
('CR56', 'PG4', '2001-05-26', NULL),
('CR76', 'PG4', '2001-04-20', 'too --ote');

ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchNo`);

ALTER TABLE `client`
  ADD PRIMARY KEY (`clientNo`);

ALTER TABLE `privateowner`
  ADD PRIMARY KEY (`ownerNo`);

ALTER TABLE `propertyforrent`
  ADD PRIMARY KEY (`propertyNo`),
  ADD KEY `Property_Owner_FK` (`ownerNo`),
  ADD KEY `Property_Staff_FK` (`staffNo`),
  ADD KEY `Property_Branch_FK` (`branchNo`);

ALTER TABLE `registration`
  ADD PRIMARY KEY (`clientNo`,`branchNo`),
  ADD KEY `Regist_Branch_FK` (`branchNo`),
  ADD KEY `Regist_Staff_FK` (`staffNo`);

ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffNo`),
  ADD KEY `Staff_Branch_FK` (`branchNo`);

ALTER TABLE `viewing`
  ADD PRIMARY KEY (`propertyNo`,`clientNo`),
  ADD KEY `Viewing_Client_FK` (`clientNo`);

ALTER TABLE `propertyforrent`
  ADD CONSTRAINT `Property_Branch_FK` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`),
  ADD CONSTRAINT `Property_Owner_FK` FOREIGN KEY (`ownerNo`) REFERENCES `privateowner` (`ownerNo`),
  ADD CONSTRAINT `Property_Staff_FK` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`);

ALTER TABLE `registration`
  ADD CONSTRAINT `Regist_Branch_FK` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`),
  ADD CONSTRAINT `Regist_Client_FK` FOREIGN KEY (`clientNo`) REFERENCES `client` (`clientNo`),
  ADD CONSTRAINT `Regist_Staff_FK` FOREIGN KEY (`staffNo`) REFERENCES `staff` (`staffNo`);

ALTER TABLE `staff`
  ADD CONSTRAINT `Staff_Branch_FK` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branchNo`);

ALTER TABLE `viewing`
  ADD CONSTRAINT `Viewing_Client_FK` FOREIGN KEY (`clientNo`) REFERENCES `client` (`clientNo`),
  ADD CONSTRAINT `Viewing_Propty_FK` FOREIGN KEY (`propertyNo`) REFERENCES `propertyforrent` (`propertyNo`);
