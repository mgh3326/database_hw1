CREATE DATABASE `q3`
  CHARACTER SET utf8
  COLLATE utf8_general_ci;
#DB 생성
show databases;

#DB 확인
use q3;
drop database q3;
show tables;
CREATE TABLE `EMPLOYEE` (
  `Fname`     varchar(10) NOT NULL,
  `Minit`     varchar(1)  NOT NULL,
  `Lname`     varchar(10) NOT NULL,
  `Ssn`       int(11)     NOT NULL,
  `Bdate`     date        NOT NULL,
  `Address`   varchar(45) NOT NULL,
  `Sex`       varchar(1)  NOT NULL,
  `Salary`    int(11)     NOT NULL,
  `Super_ssn` int(11) DEFAULT NULL,
  `Dno`       int(11)     NOT NULL,
  PRIMARY KEY (`Ssn`)
);
desc EMPLOYEE;
select *
from EMPLOYEE;
INSERT INTO `EMPLOYEE`
VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', '30000', '333445555', '5');
INSERT INTO `EMPLOYEE`
VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', '40000', '888665555', '5');
INSERT INTO `EMPLOYEE`
VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', '25000', '987654321', '4');
INSERT INTO `EMPLOYEE`
VALUES
  ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', '43000', '888665555', '4');
INSERT INTO `EMPLOYEE`
VALUES
  ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire oak, Humble, TX', 'M', '38000', '333445555', '5');
INSERT INTO `EMPLOYEE`
VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '731 Fondren, Houston, TX', 'F', '25000', '333445555', '5');
INSERT INTO `EMPLOYEE`
VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', '25000', '987654321', '4');
INSERT INTO `EMPLOYEE`
VALUES ('James', 'E', 'Borg', '888665555', '1937-1 1-10', '450 Stone, Houston, TX', 'M', '55000', 'NULL', '1');


CREATE TABLE `DEPARTMENT` (
  `Dname`          varchar(20) NOT NULL,
  `Dnumber`        int(11)     NOT NULL,
  `Mgr_ssn`        int(11)     NOT NULL,
  `Mgr_start_date` date        NOT NULL,
  PRIMARY KEY (`Dnumber`)
);
select *
from DEPARTMENT;
INSERT INTO `DEPARTMENT`
VALUES ('Research', '5', '333445555', '1988-05-22');
INSERT INTO `DEPARTMENT`
VALUES ('Administration', '4', '987654321', '1995-01-01');
INSERT INTO `DEPARTMENT`
VALUES ('Headquarters', '1', '888665555', '1981-06-19');


CREATE TABLE `DEPENDENT` (
  `Essn`           int(11)     NOT NULL,
  `Dependent_name` varchar(20) NOT NULL,
  `Sex`            varchar(1)  NOT NULL,
  `Bdate`          date        NOT NULL,
  `Relationship`   varchar(15) NOT NULL,
  PRIMARY KEY (`Essn`, `Dependent_name`)
);
INSERT INTO `DEPENDENT`
VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO `DEPENDENT`
VALUES ('333445555', 'Theodore', 'M', '1983-10-25', 'Son');

INSERT INTO `DEPENDENT`
VALUES ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');

INSERT INTO `DEPENDENT`
VALUES ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO `DEPENDENT`
VALUES ('123456789', 'Michael', 'M', '1988-01-04', 'Son');

INSERT INTO `DEPENDENT`
VALUES ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter');
INSERT INTO `DEPENDENT`
VALUES ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');
select *
from DEPENDENT;
CREATE TABLE `DEPT_LOCATIONS` (
  `Dnumber`   int(11)     NOT NULL,
  `Dlocation` varchar(20) NOT NULL,
  PRIMARY KEY (`Dnumber`, `Dlocation`)

);
INSERT INTO `DEPT_LOCATIONS`
VALUES ('1', 'Houston');
INSERT INTO `DEPT_LOCATIONS`
VALUES ('4', 'Stafford');

INSERT INTO `DEPT_LOCATIONS`
VALUES ('5', 'Bellaire');

INSERT INTO `DEPT_LOCATIONS`
VALUES ('5', 'Sugarland');

INSERT INTO `DEPT_LOCATIONS`
VALUES ('5', 'Houston');
select *
from DEPT_LOCATIONS;


CREATE TABLE `PROJECT` (
  `Pname`     varchar(20) NOT NULL,
  `Pnumber`   int(11)     NOT NULL,
  `Plocation` varchar(20) NOT NULL,
  `Dnum`      int(11)     NOT NULL,
  PRIMARY KEY (`Pnumber`)

);
INSERT INTO `PROJECT`
VALUES ('ProductX', '1', 'Bellaire', '5');
INSERT INTO `PROJECT`
VALUES ('ProductY', '2', 'Sugarland', '5');

INSERT INTO `PROJECT`
VALUES ('ProductZ', '3', 'Houston', '5');

INSERT INTO `PROJECT`
VALUES ('Computerization', '10', 'Stafford', '4');

INSERT INTO `PROJECT`
VALUES ('Reorganization', '20', 'Houston', '1');

INSERT INTO `PROJECT`
VALUES ('Newbenefits', '30', 'Stafford', '4');
select *
from PROJECT;

CREATE TABLE `WORKS_ON` (
  `Essn`  int(11) NOT NULL,
  `Pno`   int(11) NOT NULL,
  `Hours` float DEFAULT NULL,
  PRIMARY KEY (`Essn`, `Pno`)
);
select *
from WORKS_ON;
# drop table WORKS_ON;
INSERT INTO `WORKS_ON`
VALUES ('123456789', '1', '32.5');
INSERT INTO `WORKS_ON`
VALUES ('123456789', '2', '7.5');
INSERT INTO `WORKS_ON`
VALUES ('666884444', '3', '40.0');
INSERT INTO `WORKS_ON`
VALUES ('453453453', '1', '20.0');
INSERT INTO `WORKS_ON`
VALUES ('453453453', '2', '20.0');
INSERT INTO `WORKS_ON`
VALUES ('333445555', '2', '10.0');
INSERT INTO `WORKS_ON`
VALUES ('333445555', '3', '10.0');
INSERT INTO `WORKS_ON`
VALUES ('333445555', '10', '10.0');
INSERT INTO `WORKS_ON`
VALUES ('333445555', '20', '10.0');
INSERT INTO `WORKS_ON`
VALUES ('999887777', '30', '30.0');
INSERT INTO `WORKS_ON`
VALUES ('999887777', '10', '10.0');
INSERT INTO `WORKS_ON`
VALUES ('987987987', '10', '35.0');
INSERT INTO `WORKS_ON`
VALUES ('987987987', '30', '5.0');
INSERT INTO `WORKS_ON`
VALUES ('987654321', '30', '20.0');
INSERT INTO `WORKS_ON`
VALUES ('987654321', '20', '15.0');
INSERT INTO `WORKS_ON`
VALUES ('888665555', '20', NULL);


select *
from WORKS_ON;

#a
select Lname
from EMPLOYEE
where DNO = (SELECT DNO
             from EMPLOYEE
             where Salary = (SELECT max(Salary)
                             from EMPLOYEE));

#b
select Lname
from EMPLOYEE
where Super_ssn in (select ssn
                    from EMPLOYEE
                    where Super_ssn = '888665555');

#c
select Lname
from EMPLOYEE
where Salary > 10000 + (select min(Salary)
                        from EMPLOYEE);