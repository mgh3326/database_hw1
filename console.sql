CREATE DATABASE `q2`
  CHARACTER SET utf8
  COLLATE utf8_general_ci;
#DB 생성
show databases;
#DB 확인
use q2;
CREATE TABLE `STUDENT` (
  `Name`           char(10) NOT NULL,
  `Student_number` tinyint  NOT NULL,
  `Class`          tinyint  NOT NULL,
  `Major`          char(10) NOT NULL,
  PRIMARY KEY (`Student_number`)
);


desc STUDENT;
# drop table STUDENT;
INSERT INTO `STUDENT` VALUES ('Smith', '17', '1', 'CS');

select *
from STUDENT;
#들어갔는지 확인

INSERT INTO `STUDENT` VALUES ('Brown', '8', '2', 'CS');

select *
from STUDENT
order by Class;
#들어갔는지 확인

CREATE TABLE `COURSE` (
  `Course_Name`   char(30) NOT NULL,
  `Course_number` char(10) NOT NULL,
  `Credit_hours`  tinyint  NOT NULL,
  `Department`    char(10) NOT NULL,
  PRIMARY KEY (`Course_number`)
);
# drop table  COURSE;
select *
from COURSE;

INSERT INTO `COURSE` VALUES ('Intro to Computer Science', 'CS1310', '4', 'CS');
INSERT INTO `COURSE` VALUES ('Data Structures', 'CS3320', '4', 'CS');
INSERT INTO `COURSE` VALUES ('Discrete Mathematics', 'MATH2410', '3', 'MATH');
INSERT INTO `COURSE` VALUES ('Database', 'CS3380', '3', 'CS');

select *
from COURSE
order by Credit_hours desc, Department desc;
# drop table SECTION;
CREATE TABLE `SECTION` (
  `Section_identifier` smallint                                    NOT NULL,
  `Course_number`      char(10)                                    NOT NULL,
  `Semester`           enum ('Spring', 'Summer', 'Fall', 'winter') NOT NULL,
  `Year`               tinyint                                     NOT NULL,
  `Instructor`         char(10)                                    NOT NULL,

  PRIMARY KEY (`Section_identifier`)
);
INSERT INTO `SECTION` VALUES ('85', 'MATH2410', 'Fall', '07', 'King');
INSERT INTO `SECTION` VALUES ('92', 'CS1310', 'Fall', '07', 'Anderson');
INSERT INTO `SECTION` VALUES ('102', 'CS3320', 'Spring', '08', 'Knuth');
INSERT INTO `SECTION` VALUES ('112', 'MATH2410', 'Fall', '08', 'Chang');
INSERT INTO `SECTION` VALUES ('119', 'CS1310', 'Fall', '08', 'Anderson');
INSERT INTO `SECTION` VALUES ('135', 'CS3380', 'Fall', '08', 'Stone');

CREATE TABLE `GRADE_REPORT` (
  `Student_number`     tinyint                             NOT NULL,
  `Section_identifier` smallint                            NOT NULL,
  `Grade`              enum ('A', 'B', 'C', 'D', 'E', 'F') NOT NULL,
  PRIMARY KEY (`Section_identifier`)
);
INSERT INTO `GRADE_REPORT` VALUES ('17', '112', 'B');
INSERT INTO `GRADE_REPORT` VALUES ('17', '119', 'C');
INSERT INTO `GRADE_REPORT` VALUES ('8', '85', 'A');
INSERT INTO `GRADE_REPORT` VALUES ('8', '92', 'A');
INSERT INTO `GRADE_REPORT` VALUES ('8', '102', 'B');
INSERT INTO `GRADE_REPORT` VALUES ('8', '135', 'A');

CREATE TABLE `PREREQUISITE` (
  `Course_number`       char(10) NOT NULL,
  `Prerequisite_number` char(10) NOT NULL,
  PRIMARY KEY (`Prerequisite_number`)
);
INSERT INTO `PREREQUISITE` VALUES ('CS3380', 'CS3320');
INSERT INTO `PREREQUISITE` VALUES ('CS3380', 'MATH2410');
INSERT INTO `PREREQUISITE` VALUES ('CS3320', 'CS1310');

#2a
SELECT
  Name,
  Major
FROM STUDENT
WHERE NOT EXISTS(SELECT *
                 FROM GRADE_REPORT
                 WHERE Student_number = STUDENT.Student_Number AND NOT GRADE = 'A');
#2-b
SELECT
  Name,
  Major
FROM STUDENT
WHERE NOT EXISTS(SELECT *
                 FROM GRADE_REPORT
                 WHERE Student_number = STUDENT.Student_Number AND GRADE = 'A');