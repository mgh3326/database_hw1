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
  PRIMARY KEY (`Ssn`),
  KEY `Super_ssn_idx` (`Super_ssn`),
  CONSTRAINT `Super_ssn` FOREIGN KEY (`Super_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `DEPARTMENT` (
  `Dname`          varchar(20) NOT NULL,
  `Dnumber`        int(11)     NOT NULL,
  `Mgr_ssn`        int(11)     NOT NULL,
  `Mgr_start_date` date        NOT NULL,
  PRIMARY KEY (`Dnumber`),
  KEY `Mgr_ssn_idx` (`Mgr_ssn`),
  CONSTRAINT `Mgr_ssn` FOREIGN KEY (`Mgr_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `DEPENDENT` (
  `Essn`           int(11)     NOT NULL,
  `Dependent_name` varchar(20) NOT NULL,
  `Sex`            varchar(1)  NOT NULL,
  `Bdate`          date        NOT NULL,
  `Relationship`   varchar(15) NOT NULL,
  PRIMARY KEY (`Essn`, `Dependent_name`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `DEPT_LOCATIONS` (
  `Dnumber`   int(11)     NOT NULL,
  `Dlocation` varchar(20) NOT NULL,
  PRIMARY KEY (`Dnumber`, `Dlocation`),
  CONSTRAINT `Dnumber` FOREIGN KEY (`Dnumber`) REFERENCES `DEPARTMENT` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `PROJECT` (
  `Pname`     varchar(20) NOT NULL,
  `Pnumber`   int(11)     NOT NULL,
  `Plocation` varchar(20) NOT NULL,
  `Dnum`      int(11)     NOT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `Dnum_idx` (`Dnum`),
  CONSTRAINT `Dnum` FOREIGN KEY (`Dnum`) REFERENCES `DEPARTMENT` (`Dnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `WORKS_ON` (
  `Essn`  int(11) NOT NULL,
  `Pno`   int(11) NOT NULL,
  `Hours` float DEFAULT NULL,
  PRIMARY KEY (`Essn`, `Pno`),
  KEY `Pno_idx` (`Pno`),
  CONSTRAINT `Essn` FOREIGN KEY (`Essn`) REFERENCES `EMPLOYEE` (`Ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pno` FOREIGN KEY (`Pno`) REFERENCES `PROJECT` (`Pnumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


