CREATE TABLE `COURSE` (
  `Course_name`   varchar(45) NOT NULL,
  `Course_number` varchar(10) NOT NULL,
  `Credit_hours`  int(11)     NOT NULL,
  `Department`    varchar(5)  NOT NULL,
  PRIMARY KEY (`Course_number`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `GRADE_REPORT` (
  `Student_number`     int(11)    NOT NULL,
  `Section_identifier` int(11)    NOT NULL,
  `Grade`              varchar(1) NOT NULL,
  PRIMARY KEY (`Student_number`, `Section_identifier`),
  KEY `Section_identifier_idx` (`Section_identifier`),
  CONSTRAINT `Section_identifier` FOREIGN KEY (`Section_identifier`) REFERENCES `SECTION` (`Section_identifier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Student_number` FOREIGN KEY (`Student_number`) REFERENCES `STUDENT` (`Student_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `SECTION` (
  `Section_identifier` int(11)     NOT NULL,
  `Course_number`      varchar(10) NOT NULL,
  `Semester`           varchar(10) NOT NULL,
  `Year`               varchar(2)  NOT NULL,
  `Instructor`         varchar(10) NOT NULL,
  PRIMARY KEY (`Section_identifier`),
  KEY `Course_number_idx` (`Course_number`),
  KEY `Course_number` (`Course_number`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `STUDENT` (
  `Name`           varchar(10) NOT NULL,
  `Student_number` int(11)     NOT NULL,
  `Class`          int(11)     NOT NULL,
  `Major`          varchar(5)  NOT NULL,
  PRIMARY KEY (`Student_number`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;