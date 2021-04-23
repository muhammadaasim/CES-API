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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admissionuser` */

insert  into `admissionuser`(`id`,`fullname`,`caste`,`cnic`,`username`,`password`,`date`,`isdisabled`) values 
(1,'aasim','soomro','323232323','aasim','aasim','2/2/2222',0);

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
(4,'admissionform',1);

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`name`) values 
(1,'CS'),
(2,'BBA');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `deptincharge` */

insert  into `deptincharge`(`id`,`fullname`,`caste`,`dept_id`,`username`,`password`,`cnic`,`image`) values 
(1,'Asad','Bhatti',1,'asad','asad','123424424244',NULL);

/*Table structure for table `examcontroller` */

DROP TABLE IF EXISTS `examcontroller`;

CREATE TABLE `examcontroller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(40) DEFAULT NULL,
  `caste` varchar(40) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `examcontroller` */

insert  into `examcontroller`(`id`,`fullname`,`caste`,`username`,`password`) values 
(1,'Shaikh','shaikh','ali','ali');

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
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `examform_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `examform_ibfk_2` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `examform` */

insert  into `examform`(`id`,`std_id`,`session`,`sem_id`,`type`,`status`,`remarks`,`date`,`image`) values 
(1,1,2021,1,0,3,NULL,'1618653650659','http://localhost:4000/uploads/download.jpg'),
(2,2,2021,1,0,3,NULL,'1618654440390','http://localhost:4000/uploads/download.jpg'),
(3,2,2021,1,1,3,NULL,'1618656345909','http://localhost:4000/uploads/download.jpg'),
(4,2,2021,1,1,3,NULL,'1618656557784','http://localhost:4000/uploads/download.jpg');

/*Table structure for table `f_form_subject` */

DROP TABLE IF EXISTS `f_form_subject`;

CREATE TABLE `f_form_subject` (
  `f_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `ismarked` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `f_id` (`f_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `f_form_subject_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `examform` (`id`),
  CONSTRAINT `f_form_subject_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_form_subject` */

insert  into `f_form_subject`(`f_id`,`sub_id`,`id`,`ismarked`) values 
(1,1,1,1),
(1,2,2,1),
(1,3,3,0),
(1,4,4,0),
(1,5,5,1),
(1,6,6,1),
(2,1,7,0),
(2,2,8,0),
(2,3,9,0),
(2,4,10,0),
(2,5,11,1),
(2,6,12,1),
(3,2,13,0),
(3,1,14,0),
(4,2,15,0),
(4,1,16,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_subject_teacher_assign` */

insert  into `f_subject_teacher_assign`(`sub_id`,`t_id`,`session`,`incharge_id`,`date`,`id`) values 
(1,2,2021,1,'1618653727849',1),
(2,2,2021,1,'1618653731850',2),
(5,1,2021,1,'1618653761987',3),
(6,1,2021,1,'1618653764228',4);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `marks_ledger` */

insert  into `marks_ledger`(`id`,`std_id`,`sub_id`,`t_id`,`f_id`,`midmark`,`status`,`date`,`sessionalmark`,`finalmark`,`totalmark`,`remarks`) values 
(1,1,2,2,1,18,4,'1618653921511',8,17,47,'Approved By Controller'),
(2,1,2,2,1,7,4,'1618653982575',19,19,45,'Approved By Controller'),
(3,2,5,1,2,15,4,'1618654518034',9,18,90,'Approved By Controller'),
(4,1,5,1,2,10,4,'1618655199222',6,11,90,'Approved By Controller')