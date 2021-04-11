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

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `configname` varchar(30) DEFAULT NULL,
  `isenabled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `config` */

insert  into `config`(`id`,`configname`,`isenabled`) values 
(1,'examform',1),
(2,'result',1),
(3,'printing',1),
(4,'admissionform',0);

/*Table structure for table `controller` */

DROP TABLE IF EXISTS `controller`;

CREATE TABLE `controller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(40) DEFAULT NULL,
  `caste` varchar(40) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `controller` */

insert  into `controller`(`id`,`fullname`,`caste`,`username`,`password`) values 
(1,'mullo','shaikh','mullo','mullo'),
(2,'aasim','soomro','aasim','aasim');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`name`) values 
(1,'Computer Science'),
(2,'Commerce'),
(3,'English'),
(4,'Business'),
(5,'Education'),
(6,'Social Science'),
(7,'Chemistry');

/*Table structure for table `deptincharge` */

DROP TABLE IF EXISTS `deptincharge`;

CREATE TABLE `deptincharge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `deptincharge_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `deptincharge` */

insert  into `deptincharge`(`id`,`fullname`,`caste`,`dept_id`,`username`,`password`) values 
(1,'Asadullah','bhatti',1,'asad','asad'),
(2,'Zulfiqar','rajpar',2,'zulfi','zulfi'),
(3,'Parkash','hindu',4,'pk','pk');

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
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `examform_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `examform_ibfk_2` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `examform` */

insert  into `examform`(`id`,`std_id`,`session`,`sem_id`,`type`,`status`,`remarks`,`date`) values 
(1,1,2020,1,1,1,NULL,NULL),
(2,1,2021,1,1,1,'','1618239984174'),
(4,1,2021,2,2,0,'','1618240127351'),
(5,4,2021,3,2,0,'xyz','23412341234'),
(6,9,2021,4,NULL,0,'','1618309073173'),
(7,9,2021,4,0,0,'','1617950338993'),
(8,9,2021,4,0,0,'','1617950344746'),
(9,9,2021,4,0,0,'','1617950478275'),
(10,9,2021,4,0,0,'','1617950487659'),
(11,9,2021,4,0,0,'','1617951724559'),
(12,9,2021,4,0,0,'','1617986405425'),
(13,9,2021,6,0,1,'','1617986786832'),
(14,9,2021,4,0,0,'','1617987132308'),
(15,9,2021,6,0,0,'','1617987193557'),
(16,9,2021,4,0,0,'','1617987229377'),
(17,9,2021,4,0,0,'','1617987522534'),
(18,9,2021,4,0,0,'','1617987575482'),
(19,9,2021,4,0,1,'','1617987778224'),
(20,10,2021,8,0,4,NULL,'4534525423');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_form_subject` */

insert  into `f_form_subject`(`f_id`,`sub_id`,`id`) values 
(1,1,1),
(1,2,2),
(1,3,3),
(1,4,4),
(1,5,5),
(1,2,6),
(2,3,7),
(2,4,8),
(2,6,9),
(2,1,10),
(19,1,11),
(19,2,12),
(19,3,13),
(19,4,14),
(19,5,15),
(20,1,16),
(20,2,17),
(20,10,18),
(20,9,19),
(20,8,20);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_subject_teacher_assign` */

insert  into `f_subject_teacher_assign`(`sub_id`,`t_id`,`session`,`incharge_id`,`date`,`id`) values 
(1,1,2021,1,'2',1),
(2,2,2021,2,'2',2),
(3,2,2021,3,'1',3),
(6,2,2020,1,'1',4),
(NULL,NULL,2021,NULL,'1618316791682',5),
(NULL,NULL,2021,NULL,'1618316846463',6),
(4,3,2021,NULL,'1618316938592',7),
(4,3,2021,1,'1618317160609',8),
(5,3,2021,1,'1618317404968',9);

/*Table structure for table `marks_ledger` */

DROP TABLE IF EXISTS `marks_ledger`;

CREATE TABLE `marks_ledger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `std_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  `f_id` int DEFAULT NULL,
  `mark` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `sub_id` (`sub_id`),
  KEY `t_id` (`t_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `marks_ledger_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `marks_ledger_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `marks_ledger_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `marks_ledger_ibfk_4` FOREIGN KEY (`f_id`) REFERENCES `examform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `marks_ledger` */

insert  into `marks_ledger`(`id`,`std_id`,`sub_id`,`t_id`,`f_id`,`mark`) values 
(1,1,1,1,1,100),
(2,10,10,6,20,45),
(3,10,9,4,20,60),
(4,10,6,3,20,73),
(8,1,7,1,1,88),
(12,1,8,4,1,77);

/*Table structure for table `program` */

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `program` */

insert  into `program`(`id`,`name`,`dept_id`) values 
(1,'Information Technology',1),
(2,'CS',2),
(3,'Phylosophy',3),
(4,'BS Commerce',3),
(5,'BE Computer SYs',3),
(6,'B.Ed',5),
(7,NULL,NULL);

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `semester` */

insert  into `semester`(`id`,`name`,`prog_id`) values 
(1,'1st',1),
(2,'2nd',1),
(3,'3rd',1),
(4,'4th',2),
(5,'5',1),
(6,'1st',2),
(7,'First',6),
(8,'Second',6),
(9,'Third',6),
(10,'Fourth',6);

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
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`rollno`,`fullname`,`prog_id`,`caste`,`dateofbirth`,`religion`,`gender`,`nationality`,`username`,`password`,`district`,`address`,`fathername`,`insertiondate`) values 
(1,'17-BSCS-010','Zohaib',2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(4,'17-BSCS-010','Zohaib',2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(5,'17-BSCS-010','Zohaib',2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(6,'17-BSCS-010',NULL,2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(7,'17-BSCS-010',NULL,2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(8,'17-BSCS-30','farhan',1,'Soomro','2/3/2020','Islam',2,'asdf','asdf','asdfasdf','asdfasdf','asdfasdf','asdfasdf','1617713110854'),
(9,'17-bsit-19','mohsin',2,'mohsin','2/234/234/','islam',1,'pakistani','mohsin','mohsin','mohsin','mohsin','asdfas','1617713110854'),
(10,'17-BSIT-10','Maheen',6,'chandio','22/2/2222','islam',2,'pakistani','maheen','maheen','maheen','maheen','','23423423423423');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `credit_hour` int DEFAULT NULL,
  `course_code` varchar(30) DEFAULT NULL,
  `sem_id` int DEFAULT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`credit_hour`,`course_code`,`sem_id`,`type`) values 
(1,'ITC',3,'CS-1',4,0),
(2,'PF',3,'CS-1',4,0),
(3,'PF',1,'CS-1',4,1),
(4,'Islamiyat',3,'CS-1',4,0),
(5,'Elementry Math',3,'CS-1',4,1),
(6,'OOP',3,NULL,2,0),
(7,'Communication Skill',3,NULL,2,0),
(8,'Pakistan Study',3,NULL,2,0),
(9,'Calculus',3,NULL,2,0),
(10,'Object Oriented Programming',3,'cs-2',8,1);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fullname`,`surname`,`dept_id`,`username`,`password`) values 
(1,'Naveed','abro',1,'naveed','12345'),
(2,'Asad Ali','Batti',1,NULL,NULL),
(3,'Kashif','Dayo',1,'Kashif','kashif'),
(4,'Shereen Fatima','Bhatti',1,'fatima','12345'),
(5,'Saddam','Teewino',1,'saddam','12345'),
(6,'Farhan','surahio',1,'farhan','farhan');

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
 `session` int ,
 `sub_name` varchar(40) ,
 `teacher_id` int ,
 `teacher_name` varchar(50) ,
 `incharge_id` int ,
 `incharge_name` varchar(30) 
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
 `form_status` varchar(23) 
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
 `credit_hour` int 
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
 `dept_name` varchar(50) 
)*/;

/*Table structure for table `getmarks` */

DROP TABLE IF EXISTS `getmarks`;

/*!50001 DROP VIEW IF EXISTS `getmarks` */;
/*!50001 DROP TABLE IF EXISTS `getmarks` */;

/*!50001 CREATE TABLE  `getmarks`(
 `id` int ,
 `rollno` varchar(30) ,
 `Name` varchar(40) ,
 `Subject` varchar(40) ,
 `Sub_Type` varchar(2) ,
 `mark` int ,
 `GP` double(22,2) ,
 `GRADE` varchar(20) ,
 `Remarks` varchar(20) 
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

/*Table structure for table `getstudent` */

DROP TABLE IF EXISTS `getstudent`;

/*!50001 DROP VIEW IF EXISTS `getstudent` */;
/*!50001 DROP TABLE IF EXISTS `getstudent` */;

/*!50001 CREATE TABLE  `getstudent`(
 `id` int ,
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
 `date` varchar(20) 
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

/*Table structure for table `getteacher` */

DROP TABLE IF EXISTS `getteacher`;

/*!50001 DROP VIEW IF EXISTS `getteacher` */;
/*!50001 DROP TABLE IF EXISTS `getteacher` */;

/*!50001 CREATE TABLE  `getteacher`(
 `id` int ,
 `teacher_name` varchar(50) ,
 `surname` varchar(50) ,
 `dept_id` int ,
 `dept_name` varchar(50) 
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
 `sub_type` varchar(9) 
)*/;

/*View structure for view getassignedteachers */

/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;
/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getassignedteachers` AS select `s`.`id` AS `id`,`fst`.`session` AS `session`,`s`.`name` AS `sub_name`,`t`.`id` AS `teacher_id`,`t`.`fullname` AS `teacher_name`,`ic`.`id` AS `incharge_id`,`ic`.`fullname` AS `incharge_name` from (((`f_subject_teacher_assign` `fst` join `subject` `s` on((`fst`.`sub_id` = `s`.`id`))) join `teacher` `t` on((`fst`.`t_id` = `t`.`id`))) join `deptincharge` `ic` on((`ic`.`id` = `fst`.`incharge_id`))) */;

/*View structure for view getexamformdata */

/*!50001 DROP TABLE IF EXISTS `getexamformdata` */;
/*!50001 DROP VIEW IF EXISTS `getexamformdata` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getexamformdata` AS select `ef`.`id` AS `id`,`p`.`dept_id` AS `dept_id`,`p`.`name` AS `programme`,`s`.`rollno` AS `rollno`,`s`.`fullname` AS `name`,`s`.`caste` AS `caste`,(case when (`s`.`gender` = 1) then 'Male' else 'Female' end) AS `gender`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`status` AS `status`,(case when (`ef`.`status` = 0) then 'Pending' when (`ef`.`status` = 1) then 'Approved By I/C ' when (`ef`.`status` = 2) then 'Rejected By HOD' when (`ef`.`status` = 3) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `form_status` from ((((`examform` `ef` join `student` `s` on((`s`.`id` = `ef`.`std_id`))) join `program` `p` on((`s`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) join `semester` `sm` on((`sm`.`id` = `ef`.`sem_id`))) where (`p`.`dept_id` = 2) */;

/*View structure for view getexamforms */

/*!50001 DROP TABLE IF EXISTS `getexamforms` */;
/*!50001 DROP VIEW IF EXISTS `getexamforms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getexamforms` AS select `ef`.`id` AS `id`,`std`.`id` AS `student_id`,`ef`.`session` AS `session`,`ef`.`sem_id` AS `sem_id`,`ef`.`type` AS `form_type`,`ef`.`status` AS `status`,`ef`.`remarks` AS `remarks`,`ffs`.`sub_id` AS `sub_id`,`s`.`name` AS `sub_name`,`s`.`credit_hour` AS `credit_hour` from ((((`examform` `ef` join `f_form_subject` `ffs` on((`ffs`.`f_id` = `ef`.`id`))) join `subject` `s` on((`s`.`id` = `ffs`.`sub_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `semester` `sem` on((`sem`.`id` = `ef`.`sem_id`))) */;

/*View structure for view getincharge */

/*!50001 DROP TABLE IF EXISTS `getincharge` */;
/*!50001 DROP VIEW IF EXISTS `getincharge` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getincharge` AS select `di`.`id` AS `id`,`di`.`fullname` AS `incharge_name`,`di`.`caste` AS `caste`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept_name` from (`dept` `d` join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) */;

/*View structure for view getmarks */

/*!50001 DROP TABLE IF EXISTS `getmarks` */;
/*!50001 DROP VIEW IF EXISTS `getmarks` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarks` AS select `ml`.`id` AS `id`,`std`.`rollno` AS `rollno`,`std`.`fullname` AS `Name`,`sub`.`name` AS `Subject`,(case when (`sub`.`type` = 0) then 'TH' else 'PR' end) AS `Sub_Type`,`ml`.`mark` AS `mark`,(case when (`sub`.`type` = 0) then `FINDGP`(`ml`.`mark`,100) else `FINDGP`(`ml`.`mark`,50) end) AS `GP`,(case when (`sub`.`type` = 0) then `FINDGRADE`(`ml`.`mark`,100) else `FINDGRADE`(`ml`.`mark`,50) end) AS `GRADE`,(case when (`sub`.`type` = 0) then `FINDREMARKS`(`ml`.`mark`,100) else `FINDREMARKS`(`ml`.`mark`,50) end) AS `Remarks` from ((`marks_ledger` `ml` join `subject` `sub` on((`sub`.`id` = `ml`.`sub_id`))) join `student` `std` on((`std`.`id` = `ml`.`std_id`))) */;

/*View structure for view getprograms */

/*!50001 DROP TABLE IF EXISTS `getprograms` */;
/*!50001 DROP VIEW IF EXISTS `getprograms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getprograms` AS select `p`.`id` AS `id`,`p`.`name` AS `Prog`,`d`.`id` AS `Dept_id`,`d`.`name` AS `Dept` from (`program` `p` join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*View structure for view getsemesters */

/*!50001 DROP TABLE IF EXISTS `getsemesters` */;
/*!50001 DROP VIEW IF EXISTS `getsemesters` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsemesters` AS select `s`.`id` AS `id`,`s`.`name` AS `Semester`,`p`.`id` AS `prog_id`,`p`.`name` AS `Program` from (`semester` `s` join `program` `p` on((`s`.`prog_id` = `p`.`id`))) */;

/*View structure for view getstudent */

/*!50001 DROP TABLE IF EXISTS `getstudent` */;
/*!50001 DROP VIEW IF EXISTS `getstudent` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getstudent` AS select `s`.`id` AS `id`,`s`.`rollno` AS `rollno`,`s`.`fullname` AS `fullname`,`s`.`fathername` AS `fathername`,`s`.`caste` AS `caste`,`d`.`id` AS `dept_id`,`d`.`name` AS `department`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`s`.`dateofbirth` AS `dateofbirth`,`s`.`religion` AS `religion`,`s`.`gender` AS `gender`,`s`.`nationality` AS `nationality`,`s`.`username` AS `username`,`s`.`password` AS `password`,`s`.`district` AS `district`,`s`.`address` AS `address`,`s`.`insertiondate` AS `date` from ((`student` `s` join `program` `p` on((`s`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*View structure for view getsubjects */

/*!50001 DROP TABLE IF EXISTS `getsubjects` */;
/*!50001 DROP VIEW IF EXISTS `getsubjects` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsubjects` AS select `s`.`id` AS `id`,`s`.`name` AS `Subj_Name`,`sm`.`id` AS `Sem_id`,`sm`.`name` AS `Sem_Name` from (`subject` `s` join `semester` `sm` on((`sm`.`id` = `s`.`sem_id`))) */;

/*View structure for view getteacher */

/*!50001 DROP TABLE IF EXISTS `getteacher` */;
/*!50001 DROP VIEW IF EXISTS `getteacher` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getteacher` AS select `t`.`id` AS `id`,`t`.`fullname` AS `teacher_name`,`t`.`surname` AS `surname`,`t`.`dept_id` AS `dept_id`,`d`.`name` AS `dept_name` from (`teacher` `t` join `dept` `d` on((`d`.`id` = `t`.`dept_id`))) */;

/*View structure for view getslip */

/*!50001 DROP TABLE IF EXISTS `getslip` */;
/*!50001 DROP VIEW IF EXISTS `getslip` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getslip` AS select `ef`.`id` AS `form_id`,`std`.`id` AS `std_id`,`std`.`rollno` AS `rollno`,(case when (`std`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gender`,`std`.`fullname` AS `fullname`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`ef`.`session` AS `session`,`ef`.`type` AS `form_type_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`sem_id` AS `sem_id`,`sm`.`name` AS `Semester`,`sub`.`name` AS `subjects`,(case when (`sub`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type` from ((((((`examform` `ef` join `f_form_subject` `fsub` on((`fsub`.`f_id` = `ef`.`id`))) join `subject` `sub` on((`sub`.`id` = `fsub`.`sub_id`))) join `semester` `sm` on((`sm`.`id` = `ef`.`sem_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
