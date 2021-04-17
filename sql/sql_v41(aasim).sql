/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 8.0.23 : Database - ces
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ces` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ces`;

/*Table structure for table `admissionuser` */

DROP TABLE IF EXISTS `admissionuser`;

CREATE TABLE `admissionuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) NOT NULL,
  `caste` varchar(50) DEFAULT NULL,
  `cnic` varchar(16) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `isdisabled` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admissionuser` */

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `configname` varchar(30) DEFAULT NULL,
  `isenabled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `config` */

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`name`) values 
(1,'Computer Science'),
(2,'Mathematics'),
(3,'English'),
(4,'Education'),
(5,'Business Administration'),
(6,NULL);

/*Table structure for table `deptincharge` */

DROP TABLE IF EXISTS `deptincharge`;

CREATE TABLE `deptincharge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `cnic` varchar(15) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `deptincharge_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `deptincharge` */

/*Table structure for table `examcontroller` */

DROP TABLE IF EXISTS `examcontroller`;

CREATE TABLE `examcontroller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(40) DEFAULT NULL,
  `caste` varchar(40) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `examcontroller` */

/*Table structure for table `examform` */

DROP TABLE IF EXISTS `examform`;

CREATE TABLE `examform` (
  `id` int NOT NULL AUTO_INCREMENT,
  `std_id` int DEFAULT NULL,
  `session` int DEFAULT NULL,
  `sem_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `ismarked` int DEFAULT '0',
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `examform_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `examform_ibfk_2` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `examform` */

insert  into `examform`(`id`,`std_id`,`session`,`sem_id`,`type`,`status`,`remarks`,`date`,`ismarked`,`image`) values 
(1,1,2021,1,0,3,'accepted','2021',1,NULL),
(2,2,2021,1,0,3,'accepted','2021',1,NULL),
(3,1,2021,1,0,3,'accepted','2021',1,NULL);

/*Table structure for table `f_form_subject` */

DROP TABLE IF EXISTS `f_form_subject`;

CREATE TABLE `f_form_subject` (
  `f_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `f_id` (`f_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `f_form_subject_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `examform` (`id`),
  CONSTRAINT `f_form_subject_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_form_subject` */

insert  into `f_form_subject`(`f_id`,`sub_id`,`id`) values 
(1,1,1),
(1,2,2),
(1,3,3),
(1,4,4),
(1,5,5),
(1,6,6),
(2,6,7),
(2,5,8),
(2,4,9),
(2,3,10),
(2,2,11),
(2,1,12),
(3,1,14),
(3,2,15),
(3,4,16);

/*Table structure for table `f_subject_teacher_assign` */

DROP TABLE IF EXISTS `f_subject_teacher_assign`;

CREATE TABLE `f_subject_teacher_assign` (
  `sub_id` int DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  `session` int DEFAULT NULL,
  `incharge_id` int DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_subject_teacher_assign` */

/*Table structure for table `marks_ledger` */

DROP TABLE IF EXISTS `marks_ledger`;

CREATE TABLE `marks_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `std_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  `f_id` int DEFAULT NULL,
  `midmark` int DEFAULT NULL,
  `status` int DEFAULT '0',
  `date` varchar(50) DEFAULT NULL,
  `sessionalmark` int DEFAULT NULL,
  `finalmark` int DEFAULT NULL,
  `totalmark` int DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `sub_id` (`sub_id`),
  KEY `t_id` (`t_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `marks_ledger_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `marks_ledger_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `marks_ledger_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `marks_ledger_ibfk_4` FOREIGN KEY (`f_id`) REFERENCES `examform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `marks_ledger` */

insert  into `marks_ledger`(`id`,`std_id`,`sub_id`,`t_id`,`f_id`,`midmark`,`status`,`date`,`sessionalmark`,`finalmark`,`totalmark`,`remarks`) values 
(1,1,1,NULL,1,20,3,'2021',15,40,20,NULL),
(2,1,2,NULL,1,10,3,'2021',15,30,30,NULL),
(3,1,3,NULL,1,0,3,'2021',0,0,50,NULL),
(4,1,4,NULL,1,10,0,'2021',10,50,30,NULL),
(5,1,5,NULL,1,NULL,0,'2021',NULL,NULL,20,NULL),
(6,1,6,NULL,1,15,0,'2021',15,35,20,NULL),
(7,1,1,NULL,3,30,3,'2021',30,45,30,NULL),
(8,1,2,NULL,3,NULL,3,'2021',NULL,0,20,NULL),
(9,1,4,NULL,3,20,3,'2021',20,40,60,NULL),
(10,2,1,NULL,2,10,0,'2021',20,40,70,NULL),
(11,2,2,NULL,2,15,0,'2021',20,NULL,44,NULL),
(12,2,3,NULL,2,20,0,'2021',20,NULL,90,NULL),
(14,2,4,NULL,2,22,0,'2021',20,NULL,88,NULL),
(15,2,5,NULL,2,NULL,0,NULL,NULL,NULL,40,NULL),
(16,2,6,NULL,2,NULL,0,NULL,NULL,NULL,66,NULL);

/*Table structure for table `program` */

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `fullname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `program` */

insert  into `program`(`id`,`name`,`dept_id`,`fullname`) values 
(1,'BSIT',1,'Information Technology'),
(2,'BSCS',1,'Computer Science'),
(3,'BSENG',3,'English'),
(4,'B.Ed',4,'Bechlor of Education'),
(5,'MATH',2,'Mathematics'),
(6,'BBA',5,'Business Administration');

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `semester` */

insert  into `semester`(`id`,`name`,`prog_id`) values 
(1,'First',1),
(2,'Second',1),
(3,'Third',1),
(4,'Fourth',1),
(5,'Fifth',1),
(6,'Sixth',1),
(7,'Seventh',1),
(8,'Eighth',1),
(9,'First',2),
(10,'Second',2),
(11,'Third',2),
(12,'Fourth',2),
(13,'Fifth',2),
(14,'Sixth',2),
(15,'Seventh',2),
(16,'Eighth',2),
(17,'First',3),
(18,'Second',3),
(19,'Third',3),
(20,'Fourth',3),
(21,'Fifth',3),
(22,'Sixth',3),
(23,'Seventh',3),
(24,'Eighth',3),
(25,'First',4),
(26,'Second',4),
(27,'Third',4),
(28,'Fourth',4),
(29,'Fifth',4),
(30,'Sixth',4),
(31,'Seventh',4),
(32,'Eighth',4),
(33,'First',5),
(34,'Second',5),
(35,'Third',5),
(36,'Fourth',5),
(37,'Fifth',5),
(38,'Sixth',5),
(39,'Seventh',5),
(40,'Eighth',5);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rollno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fullname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  `caste` varchar(20) DEFAULT NULL,
  `dateofbirth` varchar(30) DEFAULT NULL,
  `religion` varchar(18) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `nationality` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `fathername` varchar(40) DEFAULT NULL,
  `insertiondate` varchar(20) DEFAULT NULL,
  `isdisabled` int NOT NULL DEFAULT '0',
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`rollno`,`fullname`,`prog_id`,`caste`,`dateofbirth`,`religion`,`gender`,`nationality`,`username`,`password`,`district`,`address`,`fathername`,`insertiondate`,`isdisabled`,`image`) values 
(1,'17-BSCS-10','Muhammad Aasim',1,'Soomro','22/2/2222','Islam',1,'Pakistani','aasim','aasim',NULL,NULL,NULL,NULL,0,NULL),
(2,'17-BSIT-5','Mohsin ALi',1,'Soomro','22/2/2222','Islam',1,'Pakistani','mohsin','mohsin',NULL,NULL,NULL,NULL,0,NULL),
(3,'17-BSIT-4','Madiha',1,'Arain','2/2/2222','Islam',2,'Pakistani','madiha','madia',NULL,NULL,NULL,NULL,0,NULL),
(4,'17-BSIT-3','Sheeraz',1,'Syed','22/22/2222','Islam',1,NULL,'sheraz','sheraz',NULL,NULL,NULL,NULL,0,NULL);

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `credit_hour` int DEFAULT NULL,
  `course_code` varchar(30) DEFAULT NULL,
  `sem_id` int DEFAULT NULL,
  `type` int NOT NULL,
  `isdisabled` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`credit_hour`,`course_code`,`sem_id`,`type`,`isdisabled`) values 
(1,'PF (TH)',3,'PF',1,0,0),
(2,'PF (PR)',1,'PF',1,1,0),
(3,'ECC',3,'Eng',1,0,0),
(4,'ITC (TH)',3,'itc',1,0,0),
(5,'ITC (PR)',1,'itc',1,1,0),
(6,'Pak Study',3,'itc',1,0,0),
(7,'Calculus',3,'MATH2',2,0,0),
(8,'Communication Skill',3,'Eng2',2,0,0),
(9,'OOP (TH)',3,'OOP',2,0,0),
(10,'OOP (PR)',1,'OOP1',2,1,0),
(11,'DLD',3,'DLD',2,0,0),
(12,'Discrete Structure',3,'DS',2,0,0);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `CNIC` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `isdisabled` int DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

/* Function  structure for function  `FINDGP` */

/*!50003 DROP FUNCTION IF EXISTS `FINDGP` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`mohsin`@`%` FUNCTION `FINDGP`(
	obt int,
	tot int
) RETURNS double(20,2)
    DETERMINISTIC
BEGIN
    DECLARE gp DOUBLE(20,2);
    
IF obt*100/tot >= 87 THEN
SET gp=4.0;
ELSEIF obt*100/tot >= 85.5 THEN
SET gp=3.9;
ELSEIF obt*100/tot >= 84 THEN
SET gp=3.8;
ELSEIF obt*100/tot >= 82.5 THEN
SET gp=3.7;
ELSEIF obt*100/tot >= 81 THEN
SET gp=3.6;
ELSEIF obt*100/tot >= 79.5 THEN
SET gp=3.5;
ELSEIF obt*100/tot >= 78 THEN
SET gp=3.4;
ELSEIF obt*100/tot >= 76.5 THEN
SET gp=3.3;
ELSEIF obt*100/tot >= 75 THEN
SET gp=3.2;
ELSEIF obt*100/tot >= 73.5 THEN
SET gp=3.1;
ELSEIF obt*100/tot >= 72 THEN
SET gp=3.0;
ELSEIF obt*100/tot >= 70.5 THEN
SET gp=2.87;
ELSEIF obt*100/tot >= 69 THEN
SET gp=2.75;
ELSEIF obt*100/tot >= 67.5 THEN
SET gp=2.62;
ELSEIF obt*100/tot >= 66 THEN
SET gp=2.5;
ELSEIF obt*100/tot >= 64.5 THEN
SET gp=2.37;
ELSEIF obt*100/tot >= 63 THEN
SET gp=2.25;
ELSEIF obt*100/tot >= 61.5 THEN
SET gp=2.12;
ELSEIF obt*100/tot >= 60 THEN
SET gp=2.0;
ELSEIF obt*100/tot <60 THEN
SET gp=0.0;
    END IF;
    
	RETURN (gp);
END */$$
DELIMITER ;

/* Function  structure for function  `FINDGRADE` */

/*!50003 DROP FUNCTION IF EXISTS `FINDGRADE` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`mohsin`@`%` FUNCTION `FINDGRADE`(
	obt int,
	tot int
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(20);
    IF obt*100/tot >86 THEN
		SET grade = 'A';
    ELSEIF obt*100/tot > 71 THEN
        SET grade = 'B';
    ELSEIF obt*100/tot > 59 THEN
        SET grade = 'C';
        
    ELSEIF obt*100/tot < 60 THEN
        SET grade = 'F';
        
    END IF;
	RETURN (grade);
END */$$
DELIMITER ;

/* Function  structure for function  `FINDREMARKS` */

/*!50003 DROP FUNCTION IF EXISTS `FINDREMARKS` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`mohsin`@`%` FUNCTION `FINDREMARKS`(
	obt int,
	tot int
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE remarkss VARCHAR(20);
    IF obt*100/tot> 59 THEN
		SET remarkss = 'PASS';
        
    ELSEIF obt*100/tot < 60 THEN
        SET remarkss = 'FAIL';
        
    END IF;
	-- return the customer level
	RETURN (remarkss);
END */$$
DELIMITER ;

/*Table structure for table `getassignedteachers` */

DROP TABLE IF EXISTS `getassignedteachers`;

/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;
/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;

/*!50001 CREATE TABLE  `getassignedteachers`(
 `id` int ,
 `fst_id` int ,
 `session` int ,
 `sub_name` varchar(40) ,
 `teacher_id` int ,
 `teacher_name` varchar(50) ,
 `incharge_id` int ,
 `incharge_name` varchar(30) ,
 `isdisabled` int 
)*/;

/*Table structure for table `getexamformdata` */

DROP TABLE IF EXISTS `getexamformdata`;

/*!50001 DROP VIEW IF EXISTS `getexamformdata` */;
/*!50001 DROP TABLE IF EXISTS `getexamformdata` */;

/*!50001 CREATE TABLE  `getexamformdata`(
 `id` int ,
 `dept_id` int ,
 `programme` varchar(30) ,
 `rollno` varchar(30) ,
 `name` varchar(40) ,
 `caste` varchar(20) ,
 `gender` varchar(6) ,
 `form_type` varchar(8) ,
 `status` int ,
 `form_status` varchar(23) ,
 `remarks` varchar(200) ,
 `image` varchar(200) 
)*/;

/*Table structure for table `getexamforms` */

DROP TABLE IF EXISTS `getexamforms`;

/*!50001 DROP VIEW IF EXISTS `getexamforms` */;
/*!50001 DROP TABLE IF EXISTS `getexamforms` */;

/*!50001 CREATE TABLE  `getexamforms`(
 `id` int ,
 `student_id` int ,
 `session` int ,
 `sem_id` int ,
 `form_type` int ,
 `status` int ,
 `remarks` varchar(200) ,
 `sub_id` int ,
 `sub_name` varchar(40) ,
 `credit_hour` int ,
 `image` varchar(200) 
)*/;

/*Table structure for table `getincharge` */

DROP TABLE IF EXISTS `getincharge`;

/*!50001 DROP VIEW IF EXISTS `getincharge` */;
/*!50001 DROP TABLE IF EXISTS `getincharge` */;

/*!50001 CREATE TABLE  `getincharge`(
 `id` int ,
 `incharge_name` varchar(30) ,
 `caste` varchar(30) ,
 `dept_id` int ,
 `dept_name` varchar(50) ,
 `image` varchar(200) 
)*/;

/*Table structure for table `getmark` */

DROP TABLE IF EXISTS `getmark`;

/*!50001 DROP VIEW IF EXISTS `getmark` */;
/*!50001 DROP TABLE IF EXISTS `getmark` */;

/*!50001 CREATE TABLE  `getmark`(
 `id` int ,
 `std_id` int ,
 `rollno` varchar(30) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `fullname` varchar(40) ,
 `sub_id` int ,
 `name` varchar(40) 
)*/;

/*Table structure for table `getmarks` */

DROP TABLE IF EXISTS `getmarks`;

/*!50001 DROP VIEW IF EXISTS `getmarks` */;
/*!50001 DROP TABLE IF EXISTS `getmarks` */;

/*!50001 CREATE TABLE  `getmarks`(
 `id` int ,
 `form_id` int ,
 `std_id` int ,
 `rollno` varchar(30) ,
 `gender` varchar(5) ,
 `fullname` varchar(40) ,
 `caste` varchar(20) ,
 `fathername` varchar(40) ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `session` int ,
 `form_type_id` int ,
 `form_type` varchar(8) ,
 `sem_id` int ,
 `semester` varchar(20) ,
 `subject` varchar(40) ,
 `sub_type` varchar(9) ,
 `form_status` int ,
 `result_status` int 
)*/;

/*Table structure for table `getmarksheet` */

DROP TABLE IF EXISTS `getmarksheet`;

/*!50001 DROP VIEW IF EXISTS `getmarksheet` */;
/*!50001 DROP TABLE IF EXISTS `getmarksheet` */;

/*!50001 CREATE TABLE  `getmarksheet`(
 `id` int ,
 `std_id` int ,
 `rollno` varchar(30) ,
 `dept_id` int ,
 `f_id` int ,
 `form_type` varchar(8) ,
 `dept` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `pro_fname` varchar(30) ,
 `sem_id` int ,
 `status` int ,
 `semester` varchar(20) ,
 `gender` varchar(5) ,
 `fullname` varchar(40) ,
 `sub_id` int ,
 `subject_name` varchar(40) ,
 `sub_type` varchar(9) ,
 `midmark` int ,
 `sessionalmark` int ,
 `finalmark` int ,
 `totalmark` int ,
 `gp` double(22,2) ,
 `grade` varchar(20) ,
 `remarks` varchar(20) ,
 `marks_status` varchar(23) 
)*/;

/*Table structure for table `getmarksled` */

DROP TABLE IF EXISTS `getmarksled`;

/*!50001 DROP VIEW IF EXISTS `getmarksled` */;
/*!50001 DROP TABLE IF EXISTS `getmarksled` */;

/*!50001 CREATE TABLE  `getmarksled`(
 `id` int ,
 `std_id` int ,
 `rollno` varchar(30) ,
 `dept_id` int ,
 `form_type` varchar(8) ,
 `dept` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `hod_id` int ,
 `sem_id` int ,
 `status` int ,
 `semester` varchar(20) ,
 `fullname` varchar(40) ,
 `sub_id` int ,
 `subject_name` varchar(40) ,
 `sub_type` varchar(9) ,
 `midmark` int ,
 `sessionalmark` int ,
 `finalmark` int ,
 `totalmark` int ,
 `gp` double(22,2) ,
 `grade` varchar(20) ,
 `remarks` varchar(20) ,
 `marks_status` varchar(23) 
)*/;

/*Table structure for table `getprograms` */

DROP TABLE IF EXISTS `getprograms`;

/*!50001 DROP VIEW IF EXISTS `getprograms` */;
/*!50001 DROP TABLE IF EXISTS `getprograms` */;

/*!50001 CREATE TABLE  `getprograms`(
 `id` int ,
 `Prog` varchar(30) ,
 `Dept_id` int ,
 `Dept` varchar(50) 
)*/;

/*Table structure for table `getsemesters` */

DROP TABLE IF EXISTS `getsemesters`;

/*!50001 DROP VIEW IF EXISTS `getsemesters` */;
/*!50001 DROP TABLE IF EXISTS `getsemesters` */;

/*!50001 CREATE TABLE  `getsemesters`(
 `id` int ,
 `Semester` varchar(20) ,
 `prog_id` int ,
 `Program` varchar(30) 
)*/;

/*Table structure for table `getslip` */

DROP TABLE IF EXISTS `getslip`;

/*!50001 DROP VIEW IF EXISTS `getslip` */;
/*!50001 DROP TABLE IF EXISTS `getslip` */;

/*!50001 CREATE TABLE  `getslip`(
 `form_id` int ,
 `std_id` int ,
 `rollno` varchar(30) ,
 `gender` varchar(5) ,
 `fullname` varchar(40) ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `session` int ,
 `form_type_id` int ,
 `form_type` varchar(8) ,
 `sem_id` int ,
 `Semester` varchar(20) ,
 `subjects` varchar(40) ,
 `sub_type` varchar(9) ,
 `status` int ,
 `image` varchar(200) 
)*/;

/*Table structure for table `getstudent` */

DROP TABLE IF EXISTS `getstudent`;

/*!50001 DROP VIEW IF EXISTS `getstudent` */;
/*!50001 DROP TABLE IF EXISTS `getstudent` */;

/*!50001 CREATE TABLE  `getstudent`(
 `id` int ,
 `isdisabled` int ,
 `rollno` varchar(30) ,
 `fullname` varchar(40) ,
 `fathername` varchar(40) ,
 `caste` varchar(20) ,
 `dept_id` int ,
 `department` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `dateofbirth` varchar(30) ,
 `religion` varchar(18) ,
 `gender` int ,
 `nationality` varchar(30) ,
 `username` varchar(30) ,
 `password` varchar(20) ,
 `district` varchar(30) ,
 `address` varchar(250) ,
 `date` varchar(20) ,
 `image` varchar(200) 
)*/;

/*Table structure for table `getsubjbydept` */

DROP TABLE IF EXISTS `getsubjbydept`;

/*!50001 DROP VIEW IF EXISTS `getsubjbydept` */;
/*!50001 DROP TABLE IF EXISTS `getsubjbydept` */;

/*!50001 CREATE TABLE  `getsubjbydept`(
 `id` int ,
 `Subj_Name` varchar(40) ,
 `Sem_id` int ,
 `Sem_Name` varchar(20) ,
 `program_id` int ,
 `program_name` varchar(30) ,
 `dept_id` int ,
 `isdisabled` int 
)*/;

/*Table structure for table `getsubjects` */

DROP TABLE IF EXISTS `getsubjects`;

/*!50001 DROP VIEW IF EXISTS `getsubjects` */;
/*!50001 DROP TABLE IF EXISTS `getsubjects` */;

/*!50001 CREATE TABLE  `getsubjects`(
 `id` int ,
 `Subj_Name` varchar(40) ,
 `Sem_id` int ,
 `Sem_Name` varchar(20) 
)*/;

/*Table structure for table `getsubjmarks` */

DROP TABLE IF EXISTS `getsubjmarks`;

/*!50001 DROP VIEW IF EXISTS `getsubjmarks` */;
/*!50001 DROP TABLE IF EXISTS `getsubjmarks` */;

/*!50001 CREATE TABLE  `getsubjmarks`(
 `std_id` int ,
 `sem_id` int ,
 `form_id` int ,
 `subj_id` int ,
 `subj_name` varchar(40) ,
 `sub_type` int ,
 `total_marks` int 
)*/;

/*Table structure for table `getteacher` */

DROP TABLE IF EXISTS `getteacher`;

/*!50001 DROP VIEW IF EXISTS `getteacher` */;
/*!50001 DROP TABLE IF EXISTS `getteacher` */;

/*!50001 CREATE TABLE  `getteacher`(
 `id` int ,
 `teacher_name` varchar(50) ,
 `surname` varchar(50) ,
 `dept_id` int ,
 `dept_name` varchar(50) ,
 `isdisabled` int ,
 `image` varchar(200) 
)*/;

/*Table structure for table `msheet` */

DROP TABLE IF EXISTS `msheet`;

/*!50001 DROP VIEW IF EXISTS `msheet` */;
/*!50001 DROP TABLE IF EXISTS `msheet` */;

/*!50001 CREATE TABLE  `msheet`(
 `std_id` int ,
 `sem_id` int ,
 `form_id` int ,
 `subj_id` int ,
 `subj_name` varchar(40) ,
 `sub_type` int ,
 `obt_marks` int ,
 `gp` double(22,2) ,
 `grade` varchar(20) ,
 `remarks` varchar(20) 
)*/;

/*Table structure for table `teacherassignedsubjectform` */

DROP TABLE IF EXISTS `teacherassignedsubjectform`;

/*!50001 DROP VIEW IF EXISTS `teacherassignedsubjectform` */;
/*!50001 DROP TABLE IF EXISTS `teacherassignedsubjectform` */;

/*!50001 CREATE TABLE  `teacherassignedsubjectform`(
 `sta_id` int ,
 `form_id` int ,
 `id` int ,
 `std_id` int ,
 `student_name` varchar(40) ,
 `teacher_id` int ,
 `ismarked` int ,
 `teacher_name` varchar(50) ,
 `isdisabled` int ,
 `session` int ,
 `sem_id` int ,
 `semester` varchar(20) ,
 `form_type` varchar(8) ,
 `status` int ,
 `remarks` varchar(200) ,
 `sub_id` int ,
 `sub_name` varchar(40) ,
 `credit_hour` int 
)*/;

/*View structure for view getassignedteachers */

/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;
/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getassignedteachers` AS select `s`.`id` AS `id`,`fst`.`id` AS `fst_id`,`fst`.`session` AS `session`,`s`.`name` AS `sub_name`,`t`.`id` AS `teacher_id`,`t`.`fullname` AS `teacher_name`,`ic`.`id` AS `incharge_id`,`ic`.`fullname` AS `incharge_name`,`s`.`isdisabled` AS `isdisabled` from (((`f_subject_teacher_assign` `fst` join `subject` `s` on((`fst`.`sub_id` = `s`.`id`))) join `teacher` `t` on((`fst`.`t_id` = `t`.`id`))) join `deptincharge` `ic` on((`ic`.`id` = `fst`.`incharge_id`))) */;

/*View structure for view getexamformdata */

/*!50001 DROP TABLE IF EXISTS `getexamformdata` */;
/*!50001 DROP VIEW IF EXISTS `getexamformdata` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getexamformdata` AS select `ef`.`id` AS `id`,`p`.`dept_id` AS `dept_id`,`p`.`name` AS `programme`,`s`.`rollno` AS `rollno`,`s`.`fullname` AS `name`,`s`.`caste` AS `caste`,(case when (`s`.`gender` = 1) then 'Male' else 'Female' end) AS `gender`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`status` AS `status`,(case when (`ef`.`status` = 0) then 'Pending' when (`ef`.`status` = 1) then 'Approved By I/C ' when (`ef`.`status` = 2) then 'Rejected By HOD' when (`ef`.`status` = 3) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `form_status`,`ef`.`remarks` AS `remarks`,`ef`.`image` AS `image` from ((((`examform` `ef` join `student` `s` on((`s`.`id` = `ef`.`std_id`))) join `program` `p` on((`s`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) join `semester` `sm` on((`sm`.`id` = `ef`.`sem_id`))) */;

/*View structure for view getexamforms */

/*!50001 DROP TABLE IF EXISTS `getexamforms` */;
/*!50001 DROP VIEW IF EXISTS `getexamforms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getexamforms` AS select `ef`.`id` AS `id`,`std`.`id` AS `student_id`,`ef`.`session` AS `session`,`ef`.`sem_id` AS `sem_id`,`ef`.`type` AS `form_type`,`ef`.`status` AS `status`,`ef`.`remarks` AS `remarks`,`ffs`.`sub_id` AS `sub_id`,`s`.`name` AS `sub_name`,`s`.`credit_hour` AS `credit_hour`,`ef`.`image` AS `image` from ((((`examform` `ef` join `f_form_subject` `ffs` on((`ffs`.`f_id` = `ef`.`id`))) join `subject` `s` on((`s`.`id` = `ffs`.`sub_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `semester` `sem` on((`sem`.`id` = `ef`.`sem_id`))) */;

/*View structure for view getincharge */

/*!50001 DROP TABLE IF EXISTS `getincharge` */;
/*!50001 DROP VIEW IF EXISTS `getincharge` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getincharge` AS select `di`.`id` AS `id`,`di`.`fullname` AS `incharge_name`,`di`.`caste` AS `caste`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept_name`,`di`.`image` AS `image` from (`dept` `d` join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) */;

/*View structure for view getmark */

/*!50001 DROP TABLE IF EXISTS `getmark` */;
/*!50001 DROP VIEW IF EXISTS `getmark` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmark` AS select `ml`.`id` AS `id`,`ml`.`std_id` AS `std_id`,`std`.`rollno` AS `rollno`,`std`.`prog_id` AS `prog_id`,`p`.`name` AS `program`,`std`.`fullname` AS `fullname`,`sb`.`id` AS `sub_id`,`sb`.`name` AS `name` from (((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) */;

/*View structure for view getmarks */

/*!50001 DROP TABLE IF EXISTS `getmarks` */;
/*!50001 DROP VIEW IF EXISTS `getmarks` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarks` AS select `ml`.`id` AS `id`,`ef`.`id` AS `form_id`,`std`.`id` AS `std_id`,`std`.`rollno` AS `rollno`,(case when (`std`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gender`,`std`.`fullname` AS `fullname`,`std`.`caste` AS `caste`,`std`.`fathername` AS `fathername`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`ef`.`session` AS `session`,`ef`.`type` AS `form_type_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`sem_id` AS `sem_id`,`sm`.`name` AS `semester`,`sub`.`name` AS `subject`,(case when (`sub`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ef`.`status` AS `form_status`,`ml`.`status` AS `result_status` from (((((((`examform` `ef` join `f_form_subject` `fsub` on((`fsub`.`f_id` = `ef`.`id`))) join `subject` `sub` on((`sub`.`id` = `fsub`.`sub_id`))) join `semester` `sm` on((`sm`.`id` = `ef`.`sem_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) join `marks_ledger` `ml` on((`ef`.`id` = `ml`.`f_id`))) */;

/*View structure for view getmarksheet */

/*!50001 DROP TABLE IF EXISTS `getmarksheet` */;
/*!50001 DROP VIEW IF EXISTS `getmarksheet` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarksheet` AS select `ml`.`id` AS `id`,`ml`.`std_id` AS `std_id`,`std`.`rollno` AS `rollno`,`p`.`dept_id` AS `dept_id`,`ml`.`f_id` AS `f_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`d`.`name` AS `dept`,`std`.`prog_id` AS `prog_id`,`p`.`name` AS `program`,`p`.`fullname` AS `pro_fname`,`sb`.`sem_id` AS `sem_id`,`ml`.`status` AS `status`,`sm`.`name` AS `semester`,(case when (`std`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gender`,`std`.`fullname` AS `fullname`,`sb`.`id` AS `sub_id`,`sb`.`name` AS `subject_name`,(case when (`sb`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ml`.`midmark` AS `midmark`,`ml`.`sessionalmark` AS `sessionalmark`,`ml`.`finalmark` AS `finalmark`,`ml`.`totalmark` AS `totalmark`,(case when (`sb`.`type` = 0) then `findgp`(`ml`.`totalmark`,100) else `findgp`(`ml`.`totalmark`,50) end) AS `gp`,(case when (`sb`.`type` = 0) then `findgrade`(`ml`.`totalmark`,100) else `findgrade`(`ml`.`totalmark`,50) end) AS `grade`,(case when (`sb`.`type` = 0) then `findremarks`(`ml`.`totalmark`,100) else `findremarks`(`ml`.`totalmark`,50) end) AS `remarks`,(case when (`ml`.`status` = 1) then 'Pending' when (`ml`.`status` = 2) then 'Approved By I/C ' when (`ml`.`status` = 3) then 'Rejected By HOD' when (`ml`.`status` = 4) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `marks_status` from ((((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) join (select `getsubjmarks`.`subj_id` AS `subj_id`,max(`getsubjmarks`.`total_marks`) AS `max_marks` from `getsubjmarks` group by `getsubjmarks`.`subj_id`) `ml2` on(((`sb`.`id` = `ml2`.`subj_id`) and (`ml`.`totalmark` = `ml2`.`max_marks`)))) */;

/*View structure for view getmarksled */

/*!50001 DROP TABLE IF EXISTS `getmarksled` */;
/*!50001 DROP VIEW IF EXISTS `getmarksled` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarksled` AS select `ml`.`id` AS `id`,`ml`.`std_id` AS `std_id`,`std`.`rollno` AS `rollno`,`p`.`dept_id` AS `dept_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`d`.`name` AS `dept`,`std`.`prog_id` AS `prog_id`,`p`.`name` AS `program`,`di`.`id` AS `hod_id`,`sb`.`sem_id` AS `sem_id`,`ml`.`status` AS `status`,`sm`.`name` AS `semester`,`std`.`fullname` AS `fullname`,`sb`.`id` AS `sub_id`,`sb`.`name` AS `subject_name`,(case when (`sb`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ml`.`midmark` AS `midmark`,`ml`.`sessionalmark` AS `sessionalmark`,`ml`.`finalmark` AS `finalmark`,`ml`.`totalmark` AS `totalmark`,(case when (`sb`.`type` = 0) then `findgp`(`ml`.`totalmark`,100) else `findgp`(`ml`.`totalmark`,50) end) AS `gp`,(case when (`sb`.`type` = 0) then `findgrade`(`ml`.`totalmark`,100) else `findgrade`(`ml`.`totalmark`,50) end) AS `grade`,(case when (`sb`.`type` = 0) then `findremarks`(`ml`.`totalmark`,100) else `findremarks`(`ml`.`totalmark`,50) end) AS `remarks`,(case when (`ml`.`status` = 1) then 'Pending' when (`ml`.`status` = 2) then 'Approved By I/C ' when (`ml`.`status` = 3) then 'Rejected By HOD' when (`ml`.`status` = 4) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `marks_status` from (((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) */;

/*View structure for view getprograms */

/*!50001 DROP TABLE IF EXISTS `getprograms` */;
/*!50001 DROP VIEW IF EXISTS `getprograms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getprograms` AS select `p`.`id` AS `id`,`p`.`name` AS `Prog`,`d`.`id` AS `Dept_id`,`d`.`name` AS `Dept` from (`program` `p` join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*View structure for view getsemesters */

/*!50001 DROP TABLE IF EXISTS `getsemesters` */;
/*!50001 DROP VIEW IF EXISTS `getsemesters` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsemesters` AS select `s`.`id` AS `id`,`s`.`name` AS `Semester`,`p`.`id` AS `prog_id`,`p`.`name` AS `Program` from (`semester` `s` join `program` `p` on((`s`.`prog_id` = `p`.`id`))) */;

/*View structure for view getslip */

/*!50001 DROP TABLE IF EXISTS `getslip` */;
/*!50001 DROP VIEW IF EXISTS `getslip` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getslip` AS select `ef`.`id` AS `form_id`,`std`.`id` AS `std_id`,`std`.`rollno` AS `rollno`,(case when (`std`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gender`,`std`.`fullname` AS `fullname`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`ef`.`session` AS `session`,`ef`.`type` AS `form_type_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`sem_id` AS `sem_id`,`sm`.`name` AS `Semester`,`sub`.`name` AS `subjects`,(case when (`sub`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ef`.`status` AS `status`,`ef`.`image` AS `image` from ((((((`examform` `ef` join `f_form_subject` `fsub` on((`fsub`.`f_id` = `ef`.`id`))) join `subject` `sub` on((`sub`.`id` = `fsub`.`sub_id`))) join `semester` `sm` on((`sm`.`id` = `ef`.`sem_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*View structure for view getstudent */

/*!50001 DROP TABLE IF EXISTS `getstudent` */;
/*!50001 DROP VIEW IF EXISTS `getstudent` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getstudent` AS select `s`.`id` AS `id`,`s`.`isdisabled` AS `isdisabled`,`s`.`rollno` AS `rollno`,`s`.`fullname` AS `fullname`,`s`.`fathername` AS `fathername`,`s`.`caste` AS `caste`,`d`.`id` AS `dept_id`,`d`.`name` AS `department`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`s`.`dateofbirth` AS `dateofbirth`,`s`.`religion` AS `religion`,`s`.`gender` AS `gender`,`s`.`nationality` AS `nationality`,`s`.`username` AS `username`,`s`.`password` AS `password`,`s`.`district` AS `district`,`s`.`address` AS `address`,`s`.`insertiondate` AS `date`,`s`.`image` AS `image` from ((`student` `s` join `program` `p` on((`s`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*View structure for view getsubjbydept */

/*!50001 DROP TABLE IF EXISTS `getsubjbydept` */;
/*!50001 DROP VIEW IF EXISTS `getsubjbydept` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getsubjbydept` AS select `s`.`id` AS `id`,`s`.`name` AS `Subj_Name`,`sm`.`id` AS `Sem_id`,`sm`.`name` AS `Sem_Name`,`p`.`id` AS `program_id`,`p`.`name` AS `program_name`,`p`.`dept_id` AS `dept_id`,`s`.`isdisabled` AS `isdisabled` from ((`subject` `s` join `semester` `sm` on((`sm`.`id` = `s`.`sem_id`))) join `program` `p` on((`s`.`sem_id` = `p`.`id`))) */;

/*View structure for view getsubjects */

/*!50001 DROP TABLE IF EXISTS `getsubjects` */;
/*!50001 DROP VIEW IF EXISTS `getsubjects` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsubjects` AS select `s`.`id` AS `id`,`s`.`name` AS `Subj_Name`,`sm`.`id` AS `Sem_id`,`sm`.`name` AS `Sem_Name` from (`subject` `s` join `semester` `sm` on((`sm`.`id` = `s`.`sem_id`))) */;

/*View structure for view getsubjmarks */

/*!50001 DROP TABLE IF EXISTS `getsubjmarks` */;
/*!50001 DROP VIEW IF EXISTS `getsubjmarks` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsubjmarks` AS select `std`.`id` AS `std_id`,`sm`.`id` AS `sem_id`,`ef`.`id` AS `form_id`,`sb`.`id` AS `subj_id`,`sb`.`name` AS `subj_name`,`sb`.`type` AS `sub_type`,`ml`.`totalmark` AS `total_marks` from ((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) */;

/*View structure for view getteacher */

/*!50001 DROP TABLE IF EXISTS `getteacher` */;
/*!50001 DROP VIEW IF EXISTS `getteacher` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getteacher` AS select `t`.`id` AS `id`,`t`.`fullname` AS `teacher_name`,`t`.`surname` AS `surname`,`t`.`dept_id` AS `dept_id`,`d`.`name` AS `dept_name`,`t`.`isdisabled` AS `isdisabled`,`t`.`image` AS `image` from (`teacher` `t` join `dept` `d` on((`d`.`id` = `t`.`dept_id`))) */;

/*View structure for view msheet */

/*!50001 DROP TABLE IF EXISTS `msheet` */;
/*!50001 DROP VIEW IF EXISTS `msheet` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `msheet` AS select `getsubjmarks`.`std_id` AS `std_id`,`getsubjmarks`.`sem_id` AS `sem_id`,`getsubjmarks`.`form_id` AS `form_id`,`getsubjmarks`.`subj_id` AS `subj_id`,`getsubjmarks`.`subj_name` AS `subj_name`,`getsubjmarks`.`sub_type` AS `sub_type`,max(`getsubjmarks`.`total_marks`) AS `obt_marks`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgp`(max(`getsubjmarks`.`total_marks`),100) else `findgp`(max(`getsubjmarks`.`total_marks`),50) end) AS `gp`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgrade`(max(`getsubjmarks`.`total_marks`),100) else `findgrade`(max(`getsubjmarks`.`total_marks`),50) end) AS `grade`,(case when (`getsubjmarks`.`sub_type` = 0) then `findremarks`(max(`getsubjmarks`.`total_marks`),100) else `findremarks`(max(`getsubjmarks`.`total_marks`),50) end) AS `remarks` from `getsubjmarks` group by `getsubjmarks`.`std_id`,`getsubjmarks`.`subj_id` */;

/*View structure for view teacherassignedsubjectform */

/*!50001 DROP TABLE IF EXISTS `teacherassignedsubjectform` */;
/*!50001 DROP VIEW IF EXISTS `teacherassignedsubjectform` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `teacherassignedsubjectform` AS select `sta`.`id` AS `sta_id`,`ef`.`id` AS `form_id`,`ffs`.`id` AS `id`,`std`.`id` AS `std_id`,`std`.`fullname` AS `student_name`,`t`.`id` AS `teacher_id`,`ef`.`ismarked` AS `ismarked`,`t`.`fullname` AS `teacher_name`,`s`.`isdisabled` AS `isdisabled`,`ef`.`session` AS `session`,`ef`.`sem_id` AS `sem_id`,`sem`.`name` AS `semester`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`status` AS `status`,`ef`.`remarks` AS `remarks`,`ffs`.`sub_id` AS `sub_id`,`s`.`name` AS `sub_name`,`s`.`credit_hour` AS `credit_hour` from ((((((`examform` `ef` join `f_form_subject` `ffs` on((`ffs`.`f_id` = `ef`.`id`))) join `subject` `s` on((`s`.`id` = `ffs`.`sub_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `semester` `sem` on((`sem`.`id` = `ef`.`sem_id`))) join `f_subject_teacher_assign` `sta` on((`sta`.`sub_id` = `ffs`.`sub_id`))) join `teacher` `t` on((`t`.`id` = `sta`.`t_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
