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

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `caste` varchar(255) DEFAULT NULL,
  `cnic` varchar(16) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `date` varchar(50) DEFAULT '0',
  `isdisabled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `adminuser` */

insert  into `adminuser`(`id`,`fullname`,`caste`,`cnic`,`username`,`password`,`date`,`isdisabled`) values 
(1,'Saleem','Shaikh','1234242234','saleem','saleem','4322424232',0);

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
(1,'yasin','yasin','12345-1234567-1','yasin','yasin','1619415607768',0);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `configname` varchar(30) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `config` */

insert  into `config`(`id`,`configname`,`startdate`,`enddate`) values 
(1,'examform','2021-05-02','2021-05-10'),
(2,'result','2021-05-01','2021-05-03'),
(3,'recheck','2021-05-01','2021-05-19'),
(4,'admission','2021-05-01','2021-05-27');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`name`) values 
(1,'Computer Science'),
(2,'Commerce'),
(3,'Business Adminstration'),
(4,'Teacher Education'),
(5,'English');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `deptincharge` */

insert  into `deptincharge`(`id`,`fullname`,`caste`,`dept_id`,`username`,`password`,`cnic`,`image`) values 
(1,'Asadullah','bhatti',1,'asad1','asad1','12345-1234567-1','http://localhost:4000/uploads/download.jpg'),
(2,'Muhammad Ali Shaikh','Shaikh',4,'shaikh','shaikh','12312-1231121-1','http://localhost:4000/uploads/download.jpg'),
(3,'Tanvir Muhammad','    ',5,'tanvir','tanvir','12345-1234567-3','http://localhost:4000/uploads/navttc.jpg');

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
(1,'Muhammad Ali ','Muhammad Ali ','ali11','ali11');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `examform` */

insert  into `examform`(`id`,`std_id`,`session`,`sem_id`,`type`,`status`,`remarks`,`date`,`image`) values 
(1,1,2021,9,0,3,NULL,'1619417796370','http://localhost:4000/uploads/404-error-page-found_41910-364.jpg'),
(2,2,2021,9,0,3,NULL,'1619418448732','http://localhost:4000/uploads/404-error-page-found_41910-364.jpg'),
(3,3,2021,25,0,3,NULL,'1619426930136','http://localhost:4000/uploads/download.jpg'),
(4,9,2021,181,0,2,NULL,'1619958467019','http://localhost:4000/uploads/navttc.jpg'),
(5,9,2021,181,0,3,NULL,'1619959081822','http://localhost:4000/uploads/navttc.jpg'),
(6,9,2021,182,0,3,NULL,'1619966458853','http://localhost:4000/uploads/navttc.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_form_subject` */

insert  into `f_form_subject`(`f_id`,`sub_id`,`id`,`ismarked`) values 
(1,1,1,1),
(1,2,2,1),
(1,3,3,1),
(1,4,4,1),
(1,5,5,1),
(2,1,6,1),
(2,2,7,1),
(2,3,8,1),
(2,4,9,1),
(2,5,10,1),
(3,6,11,0),
(3,7,12,0),
(3,8,13,1),
(3,9,14,1),
(4,10,15,1),
(4,11,16,1),
(5,10,17,1),
(5,11,18,1),
(6,12,19,1),
(6,13,20,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_subject_teacher_assign` */

insert  into `f_subject_teacher_assign`(`sub_id`,`t_id`,`session`,`incharge_id`,`date`,`id`) values 
(1,1,2021,1,'1619417748199',1),
(2,1,2021,1,'1619417764937',3),
(5,2,2021,1,'1619418590033',4),
(3,3,2021,1,'1619418610839',5),
(4,3,2021,1,'1619418613357',6),
(8,4,2021,2,'1619425767744',7),
(9,4,2021,2,'1619425793381',9),
(10,5,2021,3,'1619958747537',10),
(28,6,2021,3,'1619958759954',11),
(27,6,2021,3,'1619958764821',12),
(24,6,2021,3,'1619958768886',13),
(19,6,2021,3,'1619958784595',14),
(13,6,2021,3,'1619958786988',15),
(14,6,2021,3,'1619958790610',16),
(14,5,2021,3,'1619958793186',17),
(18,5,2021,3,'1619958795544',18),
(12,5,2021,3,'1619958797833',19),
(15,5,2021,3,'1619958800170',20),
(11,5,2021,3,'1619958805706',21),
(17,5,2021,3,'1619958808044',22),
(20,5,2021,3,'1619958810434',23),
(20,5,2021,3,'1619958817675',24),
(22,5,2021,3,'1619958820881',25),
(25,5,2021,3,'1619958823633',26),
(25,6,2021,3,'1619958828858',27),
(16,6,2021,3,'1619958831664',28),
(23,6,2021,3,'1619958837704',29),
(21,5,2021,3,'1619958894003',30),
(26,5,2021,3,'1619958896307',31),
(26,5,2021,3,'1619958899832',32);

/*Table structure for table `general_log` */

DROP TABLE IF EXISTS `general_log`;

CREATE TABLE `general_log` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL,
  `server_id` int unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';

/*Data for the table `general_log` */

/*Table structure for table `log_marks_ledger` */

DROP TABLE IF EXISTS `log_marks_ledger`;

CREATE TABLE `log_marks_ledger` (
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
  `activity` varchar(250) DEFAULT NULL,
  `user` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `log_marks_ledger` */

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `marks_ledger` */

insert  into `marks_ledger`(`id`,`std_id`,`sub_id`,`t_id`,`f_id`,`midmark`,`status`,`date`,`sessionalmark`,`finalmark`,`totalmark`,`remarks`) values 
(2,2,1,1,2,19,4,'1619418545544',11,20,50,'Approved By Controller'),
(3,2,2,1,2,0,4,'1619418553070',0,21,21,'Approved By Controller'),
(4,1,1,1,1,18,4,'1619418563202',20,50,90,'Approved By Controller'),
(5,1,5,2,2,14,4,'1619418638235',16,33,73,'Approved By Controller'),
(6,1,5,2,1,21,4,'1619418648932',14,16,51,'Approved By Controller'),
(7,1,4,3,2,20,4,'1619418685925',20,31,71,'Approved By Controller'),
(8,1,3,3,2,17,4,'1619418699503',10,10,50,'Approved By Controller'),
(9,1,3,3,1,19,4,'1619419976174',18,29,50,'Approved By Controller'),
(10,1,4,3,1,24,4,'1619420023159',18,28,50,'Approved By Controller'),
(11,3,9,4,3,25,4,'1619427652864',15,37,77,'Approved By Controller'),
(12,3,8,4,3,13,4,'1619427720394',12,25,50,'Approved By Controller'),
(13,9,10,5,4,30,4,'1619959727738',20,48,98,'Approved By Controller'),
(14,9,11,5,5,20,4,'1619959820242',20,40,80,'Approved By Controller'),
(15,9,10,5,5,10,4,'1619959841935',10,50,70,'Approved By Controller'),
(16,9,11,5,4,20,4,'1619959849560',20,30,70,'Approved By Controller'),
(17,9,12,5,6,20,2,'1619967139715',15,40,75,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `program` */

insert  into `program`(`id`,`name`,`dept_id`,`fullname`) values 
(1,'BSCS',1,NULL),
(2,'BBA',3,NULL),
(3,'BSIT',1,NULL),
(4,'B.Ed',4,NULL),
(5,'BSENG',5,'English Literture');

/*Table structure for table `recheck` */

DROP TABLE IF EXISTS `recheck`;

CREATE TABLE `recheck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `std_id` int NOT NULL,
  `ml_id` int DEFAULT NULL,
  `remarks` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `p_mid` int NOT NULL,
  `p_sessional` int DEFAULT NULL,
  `p_final` int DEFAULT NULL,
  `p_total` int DEFAULT NULL,
  `n_mid` int DEFAULT NULL,
  `n_sessional` int DEFAULT NULL,
  `n_final` int DEFAULT NULL,
  `n_total` int DEFAULT NULL,
  PRIMARY KEY (`id`,`p_mid`),
  KEY `std_id` (`std_id`),
  KEY `ml_id` (`ml_id`),
  CONSTRAINT `recheck_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `recheck_ibfk_2` FOREIGN KEY (`ml_id`) REFERENCES `marks_ledger` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `recheck` */

insert  into `recheck`(`id`,`std_id`,`ml_id`,`remarks`,`status`,`p_mid`,`p_sessional`,`p_final`,`p_total`,`n_mid`,`n_sessional`,`n_final`,`n_total`) values 
(1,1,3,'af',1,60,90,90,90,20,20,NULL,NULL),
(2,2,2,'lannat',3,20,20,40,80,30,20,50,100),
(3,2,2,'xyz ch',2,20,20,40,80,NULL,NULL,NULL,NULL),
(4,3,3,'lanat munh me pai tai',2,20,20,40,NULL,NULL,NULL,NULL,NULL),
(5,3,3,'lanat munh me pai tai',2,20,20,40,80,NULL,NULL,NULL,NULL);

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `semester` */

insert  into `semester`(`id`,`name`,`prog_id`) values 
(1,'first',1),
(2,'2nd',1),
(3,'third',1),
(4,'fourth',1),
(5,'fifth',1),
(6,'sixth',1),
(7,'seventh',1),
(8,'eighth',1),
(9,'first',3),
(10,'second',3),
(11,'third',3),
(12,'fourth',3),
(13,'fifth',3),
(14,'sixth',3),
(15,'seventh',3),
(16,'eighth',3),
(17,'first',2),
(18,'second',2),
(19,'third',2),
(20,'fourth',2),
(21,'fifth',2),
(22,'sixth',2),
(23,'seventh',2),
(24,'eighth',2),
(25,'first',4),
(26,'second',4),
(27,'third',4),
(28,'fouth',4),
(29,'fifth',4),
(30,'sixth',4),
(31,'seventh',4),
(32,'eighth',4),
(33,NULL,NULL),
(34,NULL,NULL),
(35,NULL,NULL),
(36,NULL,NULL),
(37,'first',2),
(38,'fourth',2),
(39,'third',2),
(40,'second',2),
(41,'first',2),
(42,'fourth',2),
(43,'second',2),
(44,'fifth',2),
(45,'sixth',2),
(46,'third',2),
(47,'seventh',2),
(48,'eighth',2),
(49,'first',3),
(50,'second',3),
(51,'seventh',3),
(52,'eighth',3),
(53,'third',3),
(54,'fourth',3),
(55,'fifth',3),
(56,'sixth',3),
(57,'first',4),
(58,'second',4),
(59,'fourth',4),
(60,'third',4),
(61,'first',4),
(62,'fifth',4),
(63,'second',4),
(64,'sixth',4),
(65,'seventh',4),
(66,'third',4),
(67,'fourth',4),
(68,'eighth',4),
(69,'first',1),
(70,'second',1),
(71,'fourth',1),
(72,'fifth',1),
(73,'third',1),
(74,'sixth',1),
(75,'seventh',1),
(76,'eighth',1),
(77,'first',1),
(78,'second',1),
(79,'third',1),
(80,'fourth',1),
(81,'sixth',2),
(82,'first',2),
(83,'second',2),
(84,'seventh',2),
(85,'eighth',2),
(86,'third',2),
(87,'fourth',2),
(88,'fifth',2),
(89,'first',3),
(90,'second',3),
(91,'third',3),
(92,'fourth',3),
(93,'first',2),
(94,'second',2),
(95,'third',2),
(96,'fourth',2),
(97,'first',3),
(98,'second',3),
(99,'fourth',3),
(100,'fifth',3),
(101,'sixth',3),
(102,'third',3),
(103,'seventh',3),
(104,'eighth',3),
(105,'first',1),
(106,'second',1),
(107,'third',1),
(108,'fourth',1),
(109,'first',2),
(110,'fourth',2),
(111,'second',2),
(112,'third',2),
(113,'first',4),
(114,'second',4),
(115,'third',4),
(116,'fourth',4),
(117,'fifth',4),
(118,'sixth',4),
(119,'seventh',4),
(120,'eighth',4),
(121,'first',4),
(122,'sixth',4),
(123,'fifth',4),
(124,'seventh',4),
(125,'second',4),
(126,'eighth',4),
(127,'third',4),
(128,'fourth',4),
(129,'first',1),
(130,'second',1),
(131,'fourth',1),
(132,'fifth',1),
(133,'third',1),
(134,'sixth',1),
(135,'seventh',1),
(136,'eighth',1),
(137,'first',1),
(138,'second',1),
(139,'fifth',1),
(140,'sixth',1),
(141,'seventh',1),
(142,'third',1),
(143,'fourth',1),
(144,'eighth',1),
(145,'first',4),
(146,'second',4),
(147,'third',4),
(148,'fourth',4),
(149,'first',4),
(150,'fifth',4),
(151,'second',4),
(152,'sixth',4),
(153,'seventh',4),
(154,'eighth',4),
(155,'third',4),
(156,'fourth',4),
(157,'first',2),
(158,'third',2),
(159,'second',2),
(160,'fourth',2),
(161,'first',3),
(162,'second',3),
(163,'third',3),
(164,'fourth',3),
(165,'fifth',3),
(166,'sixth',3),
(167,'seventh',3),
(168,'eighth',3),
(169,'first',2),
(170,'fourth',2),
(171,'second',2),
(172,'third',2),
(173,'first',3),
(174,'third',3),
(175,'second',3),
(176,'fourth',3),
(177,'fifth',3),
(178,'sixth',3),
(179,'seventh',3),
(180,'eighth',3),
(181,'first',5),
(182,'second',5),
(183,'third',5),
(184,'fourth',5),
(185,'fifth',5),
(186,'seventh',5),
(187,'sixth',5),
(188,'eighth',5);

/*Table structure for table `slow_log` */

DROP TABLE IF EXISTS `slow_log`;

CREATE TABLE `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int NOT NULL,
  `rows_examined` int NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int NOT NULL,
  `insert_id` int NOT NULL,
  `server_id` int unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `thread_id` bigint unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';

/*Data for the table `slow_log` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rollno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fullname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  `semester_id` int NOT NULL,
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
  PRIMARY KEY (`id`,`semester_id`),
  KEY `prog_id` (`prog_id`),
  KEY `student_semester` (`semester_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`),
  CONSTRAINT `student_semester` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`rollno`,`fullname`,`prog_id`,`semester_id`,`caste`,`dateofbirth`,`religion`,`gender`,`nationality`,`username`,`password`,`district`,`address`,`fathername`,`insertiondate`,`isdisabled`,`image`) values 
(1,'BS-IT-004','Mohsin',3,1,'Soomro','1998-02-01','Islam',1,'Pakistan','mohsin','mohsin','shikarpur','Near Jamal Shah muhala ','Abdul qadeer','1619415713022',0,'http://localhost:4000/uploads/download.jpg'),
(2,'BS-IT-005','Madiha',3,1,'Arain','1998-03-30','Islam',2,'Pakistan','madiha','madiha','shikarpur','near','Ghulam murtaza','1619418429559',0,'http://localhost:4000/uploads/download.jpg'),
(3,'BS-ED-001','A',4,1,'A','2005-10-29','Islam',1,'Pakistan','aa','aa','Shikarpur','A','A','1619426190008',0,'http://localhost:4000/uploads/download.jpg'),
(4,'BS-ED-002','b',4,1,'b','2006-08-28','Islam',1,'pakistan','bb','bb','shikarpur','b','b','1619426256697',0,'http://localhost:4000/uploads/download.jpg'),
(5,'BS-ED-003','c',4,1,'c','2012-10-29','Islam',1,'pakistan','cc','cc','shikapur','c','c','1619426295735',0,'http://localhost:4000/uploads/download.jpg'),
(6,'BS-ED-004','d',4,1,'d','2010-09-29','Islam',1,'pakistan','dd','dd','shikarpur','d','d','1619426336098',0,'http://localhost:4000/uploads/download.jpg'),
(7,'BS-ED-005','e',4,1,'e','2010-11-29','Islam',1,'pakistan','ee','ee','shikarpur','e','e','1619426425298',0,'http://localhost:4000/uploads/download.jpg'),
(8,'17-BSCS-10','Usman Soomro',1,1,'Soomro','19-22-22','islam',1,'pakistan','usman','usman','shikarpur','shikarpur','khalid','21312313123123\\',0,NULL),
(9,'17-bseng-11','saleem ahmed',5,1,'soomro','2222-02-22','islam',1,'pakistani','saleem','saleem','shikarpur','asdfasdfasdfa\nsdfasdf\nasdf\nasdf\n','abdul sallam','1619958421656',0,'http://localhost:4000/uploads/navttc.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`credit_hour`,`course_code`,`sem_id`,`type`,`isdisabled`) values 
(1,'PF (TH)',3,'BSIT-1',9,0,1),
(2,' PF (PR)',1,'BSIT-1',9,1,1),
(3,'Elementry Math',2,'BSIT-3',9,0,1),
(4,'Pak Study',3,'BSIT-1',9,0,1),
(5,'English',3,'BSIT-1',9,0,1),
(6,'OOP (TH)',3,'BED-1',25,0,0),
(7,'Elementry math',3,'BED-1',25,0,0),
(8,'PF (TH)',3,'BED-1',25,0,1),
(9,'PF (PR)',1,'BED-1',25,1,1),
(10,'Liteterutre',2,'bs-literture',181,0,1),
(11,'Communiation Skill',3,'afasdf',181,0,1),
(12,'Pyschology',3,'sfasdf',182,0,1),
(13,'Geology',3,'asdfa',182,0,1),
(14,'Chemography',3,'asdfa',183,0,1),
(15,'art of science',3,'SFG4',183,0,1),
(16,'English 2',3,'asdf',184,0,1),
(17,'English-4',3,'dffa',185,0,1),
(18,'Philosophy1',3,'dfasdf3',187,0,1),
(19,'Geology1',3,'3424',187,0,1),
(20,'English 5',3,'43534',187,0,1),
(21,'Geography4',3,'A2334',186,0,1),
(22,'Pyschology',2,'452',186,0,1),
(23,'ICT',3,'asdfa',188,0,1),
(24,'Thesis',3,'3323',188,0,1),
(25,'Linguistic 2',3,'3aw',188,0,1),
(26,'Communication Skill2',3,'535',183,0,1),
(27,'Pyschology 5',3,'4344',184,0,1),
(28,'Masters of English',3,'fgs',185,0,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fullname`,`surname`,`dept_id`,`username`,`password`,`CNIC`,`date`,`isdisabled`,`image`) values 
(1,'Kashif Ali','Dayo',1,'kashif','kashif','12345-1234567-1',NULL,0,'http://localhost:4000/uploads/start-0e837dcc57769db2306d8d659f53555feb500b3c5d456879b9c843d1872e7baa.jpg'),
(2,'Naveed Ali','Abro',1,'naveed','naveed','43301-1345601-5',NULL,0,'http://localhost:4000/uploads/404-error-page-found_41910-364.jpg'),
(3,'Farhan Ali','Surahio',1,'farhan','farhan','12345-1239127-1',NULL,0,'http://localhost:4000/uploads/download.jpg'),
(4,'Dr Gulzar','Shaikh',4,'gulzar','gulzar','43241-4315452-3',NULL,0,'http://localhost:4000/uploads/download.jpg'),
(5,'khalid','khalid',5,'khalid','khalid','12345-1234567-3',NULL,0,'http://localhost:4000/uploads/navttc.jpg'),
(6,'waheed','sheikh',5,'waheed','waheed','12345-1234563-1',NULL,0,'http://localhost:4000/uploads/navttc.jpg');

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

/*Table structure for table `getconfig` */

DROP TABLE IF EXISTS `getconfig`;

/*!50001 DROP VIEW IF EXISTS `getconfig` */;
/*!50001 DROP TABLE IF EXISTS `getconfig` */;

/*!50001 CREATE TABLE  `getconfig`(
 `id` int ,
 `isenabled` int ,
 `configname` varchar(30) ,
 `startdate` date ,
 `enddate` date 
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
 `sem_id` int ,
 `semester` varchar(20) ,
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

/*Table structure for table `getgazzated` */

DROP TABLE IF EXISTS `getgazzated`;

/*!50001 DROP VIEW IF EXISTS `getgazzated` */;
/*!50001 DROP TABLE IF EXISTS `getgazzated` */;

/*!50001 CREATE TABLE  `getgazzated`(
 `id` int ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `sem_id` int ,
 `semester` varchar(20) ,
 `STATUS` int ,
 `std_id` int ,
 `rollno` varchar(30) ,
 `student_name` varchar(40) ,
 `father_name` varchar(40) ,
 `gpa` double(23,6) ,
 `remarks` varchar(8) 
)*/;

/*Table structure for table `getimproversubject` */

DROP TABLE IF EXISTS `getimproversubject`;

/*!50001 DROP VIEW IF EXISTS `getimproversubject` */;
/*!50001 DROP TABLE IF EXISTS `getimproversubject` */;

/*!50001 CREATE TABLE  `getimproversubject`(
 `std_id` int ,
 `rollno` varchar(30) ,
 `dept_id` int ,
 `prog_id` int ,
 `sem_id` int ,
 `subj_id` int ,
 `subj_name` varchar(40) 
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
 `fathername` varchar(40) ,
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
 `t_id` int ,
 `teacher` varchar(50) ,
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

/*Table structure for table `getmarksledger` */

DROP TABLE IF EXISTS `getmarksledger`;

/*!50001 DROP VIEW IF EXISTS `getmarksledger` */;
/*!50001 DROP TABLE IF EXISTS `getmarksledger` */;

/*!50001 CREATE TABLE  `getmarksledger`(
 `std_id` int ,
 `rollno` varchar(30) ,
 `fullname` varchar(40) ,
 `fathername` varchar(40) ,
 `session` int ,
 `semester` varchar(20) ,
 `gender` int ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `programfullname` varchar(30) ,
 `sem_id` int ,
 `id` int ,
 `gp` double(22,2) 
)*/;

/*Table structure for table `getprograms` */

DROP TABLE IF EXISTS `getprograms`;

/*!50001 DROP VIEW IF EXISTS `getprograms` */;
/*!50001 DROP TABLE IF EXISTS `getprograms` */;

/*!50001 CREATE TABLE  `getprograms`(
 `id` int ,
 `Prog` varchar(30) ,
 `Dept_id` int ,
 `Dept` varchar(50) ,
 `fullname` varchar(30) 
)*/;

/*Table structure for table `getrecheck` */

DROP TABLE IF EXISTS `getrecheck`;

/*!50001 DROP VIEW IF EXISTS `getrecheck` */;
/*!50001 DROP TABLE IF EXISTS `getrecheck` */;

/*!50001 CREATE TABLE  `getrecheck`(
 `id` int ,
 `ml_id` int ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `incharge_id` int ,
 `prog_id` int ,
 `status_code` int ,
 `status` varchar(23) ,
 `program` varchar(30) ,
 `t_id` int ,
 `teacher` varchar(50) ,
 `std_id` int ,
 `student_name` varchar(40) ,
 `sub_id` int ,
 `subject` varchar(40) ,
 `sub_type` int ,
 `p_mid` int ,
 `p_sessional` int ,
 `p_final` int ,
 `p_total` int ,
 `n_mid` int ,
 `n_sessional` int ,
 `n_final` int ,
 `n_total` int 
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
 `sem_id` int ,
 `semester` varchar(20) ,
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
 `Sem_Name` varchar(20) ,
 `program` varchar(30) 
)*/;

/*Table structure for table `getsubjmarks` */

DROP TABLE IF EXISTS `getsubjmarks`;

/*!50001 DROP VIEW IF EXISTS `getsubjmarks` */;
/*!50001 DROP TABLE IF EXISTS `getsubjmarks` */;

/*!50001 CREATE TABLE  `getsubjmarks`(
 `std_id` int ,
 `rollno` varchar(30) ,
 `gender` int ,
 `fullname` varchar(40) ,
 `session` int ,
 `fathername` varchar(40) ,
 `sem_id` int ,
 `semester` varchar(20) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `programfullname` varchar(30) ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `form_id` int ,
 `subj_id` int ,
 `subj_name` varchar(40) ,
 `sub_type` int ,
 `credit_hour` int ,
 `course_code` varchar(30) ,
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

/*Table structure for table `semmarksheet` */

DROP TABLE IF EXISTS `semmarksheet`;

/*!50001 DROP VIEW IF EXISTS `semmarksheet` */;
/*!50001 DROP TABLE IF EXISTS `semmarksheet` */;

/*!50001 CREATE TABLE  `semmarksheet`(
 `std_id` int ,
 `rollno` varchar(30) ,
 `fullname` varchar(40) ,
 `session` int ,
 `semester` varchar(20) ,
 `gender` int ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `fathername` varchar(40) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `programfullname` varchar(30) ,
 `credit_hour` int ,
 `course_code` varchar(30) ,
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
 `sub_type` int ,
 `sub_name` varchar(40) ,
 `credit_hour` int 
)*/;

/*View structure for view getassignedteachers */

/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;
/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getassignedteachers` AS select `s`.`id` AS `id`,`fst`.`id` AS `fst_id`,`fst`.`session` AS `session`,`s`.`name` AS `sub_name`,`t`.`id` AS `teacher_id`,`t`.`fullname` AS `teacher_name`,`ic`.`id` AS `incharge_id`,`ic`.`fullname` AS `incharge_name`,`s`.`isdisabled` AS `isdisabled` from (((`f_subject_teacher_assign` `fst` join `subject` `s` on((`fst`.`sub_id` = `s`.`id`))) join `teacher` `t` on((`fst`.`t_id` = `t`.`id`))) join `deptincharge` `ic` on((`ic`.`id` = `fst`.`incharge_id`))) */;

/*View structure for view getconfig */

/*!50001 DROP TABLE IF EXISTS `getconfig` */;
/*!50001 DROP VIEW IF EXISTS `getconfig` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getconfig` AS select `config`.`id` AS `id`,if((curdate() between `config`.`startdate` and `config`.`enddate`),1,0) AS `isenabled`,`config`.`configname` AS `configname`,`config`.`startdate` AS `startdate`,`config`.`enddate` AS `enddate` from `config` */;

/*View structure for view getexamformdata */

/*!50001 DROP TABLE IF EXISTS `getexamformdata` */;
/*!50001 DROP VIEW IF EXISTS `getexamformdata` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getexamformdata` AS select `ef`.`id` AS `id`,`p`.`dept_id` AS `dept_id`,`p`.`name` AS `programme`,`s`.`rollno` AS `rollno`,`s`.`fullname` AS `name`,`sm`.`id` AS `sem_id`,`sm`.`name` AS `semester`,`s`.`caste` AS `caste`,(case when (`s`.`gender` = 1) then 'Male' else 'Female' end) AS `gender`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`status` AS `status`,(case when (`ef`.`status` = 0) then 'Pending' when (`ef`.`status` = 1) then 'Approved By I/C ' when (`ef`.`status` = 2) then 'Rejected By HOD' when (`ef`.`status` = 3) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `form_status`,`ef`.`remarks` AS `remarks`,`ef`.`image` AS `image` from ((((`examform` `ef` join `student` `s` on((`s`.`id` = `ef`.`std_id`))) join `program` `p` on((`s`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) join `semester` `sm` on((`sm`.`id` = `ef`.`sem_id`))) */;

/*View structure for view getexamforms */

/*!50001 DROP TABLE IF EXISTS `getexamforms` */;
/*!50001 DROP VIEW IF EXISTS `getexamforms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getexamforms` AS select `ef`.`id` AS `id`,`std`.`id` AS `student_id`,`ef`.`session` AS `session`,`ef`.`sem_id` AS `sem_id`,`ef`.`type` AS `form_type`,`ef`.`status` AS `status`,`ef`.`remarks` AS `remarks`,`ffs`.`sub_id` AS `sub_id`,`s`.`name` AS `sub_name`,`s`.`credit_hour` AS `credit_hour`,`ef`.`image` AS `image` from ((((`examform` `ef` join `f_form_subject` `ffs` on((`ffs`.`f_id` = `ef`.`id`))) join `subject` `s` on((`s`.`id` = `ffs`.`sub_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `semester` `sem` on((`sem`.`id` = `ef`.`sem_id`))) */;

/*View structure for view getgazzated */

/*!50001 DROP TABLE IF EXISTS `getgazzated` */;
/*!50001 DROP VIEW IF EXISTS `getgazzated` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getgazzated` AS select `getmarksheet`.`f_id` AS `id`,`getmarksheet`.`dept_id` AS `dept_id`,`getmarksheet`.`dept` AS `dept`,`getmarksheet`.`prog_id` AS `prog_id`,`getmarksheet`.`program` AS `program`,`getmarksheet`.`sem_id` AS `sem_id`,`getmarksheet`.`semester` AS `semester`,`getmarksheet`.`status` AS `STATUS`,`getmarksheet`.`std_id` AS `std_id`,`getmarksheet`.`rollno` AS `rollno`,`getmarksheet`.`fullname` AS `student_name`,`getmarksheet`.`fathername` AS `father_name`,avg(`getmarksheet`.`gp`) AS `gpa`,if((sum((case when (`getmarksheet`.`remarks` = 'FAIL') then 1 else 0 end)) > 3),'Termback',if((avg(`getmarksheet`.`gp`) < 1.33),'Termback',if(sum((`getmarksheet`.`remarks` = 'FAIL')),'Fail','Pass'))) AS `remarks` from `getmarksheet` group by `getmarksheet`.`dept`,`getmarksheet`.`program`,`getmarksheet`.`semester`,`getmarksheet`.`rollno` */;

/*View structure for view getimproversubject */

/*!50001 DROP TABLE IF EXISTS `getimproversubject` */;
/*!50001 DROP VIEW IF EXISTS `getimproversubject` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getimproversubject` AS select `semmarksheet`.`std_id` AS `std_id`,`semmarksheet`.`rollno` AS `rollno`,`semmarksheet`.`dept_id` AS `dept_id`,`semmarksheet`.`prog_id` AS `prog_id`,`semmarksheet`.`sem_id` AS `sem_id`,`semmarksheet`.`subj_id` AS `subj_id`,`semmarksheet`.`subj_name` AS `subj_name` from `semmarksheet` where (`semmarksheet`.`grade` <> 'B') */;

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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarksheet` AS select `ml`.`id` AS `id`,`ml`.`std_id` AS `std_id`,`std`.`rollno` AS `rollno`,`p`.`dept_id` AS `dept_id`,`ml`.`f_id` AS `f_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`d`.`name` AS `dept`,`std`.`prog_id` AS `prog_id`,`p`.`name` AS `program`,`p`.`fullname` AS `pro_fname`,`sb`.`sem_id` AS `sem_id`,`ml`.`status` AS `status`,`sm`.`name` AS `semester`,(case when (`std`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gender`,`std`.`fullname` AS `fullname`,`std`.`fathername` AS `fathername`,`sb`.`id` AS `sub_id`,`sb`.`name` AS `subject_name`,(case when (`sb`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ml`.`midmark` AS `midmark`,`ml`.`sessionalmark` AS `sessionalmark`,`ml`.`finalmark` AS `finalmark`,`ml`.`totalmark` AS `totalmark`,(case when (`sb`.`type` = 0) then `findgp`(`ml`.`totalmark`,100) else `findgp`(`ml`.`totalmark`,50) end) AS `gp`,(case when (`sb`.`type` = 0) then `findgrade`(`ml`.`totalmark`,100) else `findgrade`(`ml`.`totalmark`,50) end) AS `grade`,(case when (`sb`.`type` = 0) then `findremarks`(`ml`.`totalmark`,100) else `findremarks`(`ml`.`totalmark`,50) end) AS `remarks`,(case when (`ml`.`status` = 1) then 'Pending' when (`ml`.`status` = 2) then 'Approved By I/C ' when (`ml`.`status` = 3) then 'Rejected By HOD' when (`ml`.`status` = 4) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `marks_status` from ((((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) join (select `getsubjmarks`.`subj_id` AS `subj_id`,max(`getsubjmarks`.`total_marks`) AS `max_marks` from `getsubjmarks` group by `getsubjmarks`.`subj_id`) `ml2` on(((`sb`.`id` = `ml2`.`subj_id`) and (`ml`.`totalmark` = `ml2`.`max_marks`)))) where (`ml`.`status` = 4) */;

/*View structure for view getmarksled */

/*!50001 DROP TABLE IF EXISTS `getmarksled` */;
/*!50001 DROP VIEW IF EXISTS `getmarksled` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarksled` AS select `ml`.`id` AS `id`,`ml`.`std_id` AS `std_id`,`std`.`rollno` AS `rollno`,`p`.`dept_id` AS `dept_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`d`.`name` AS `dept`,`std`.`prog_id` AS `prog_id`,`p`.`name` AS `program`,`di`.`id` AS `hod_id`,`sb`.`sem_id` AS `sem_id`,`ml`.`status` AS `status`,`sm`.`name` AS `semester`,`std`.`fullname` AS `fullname`,`ml`.`t_id` AS `t_id`,`t`.`fullname` AS `teacher`,`sb`.`id` AS `sub_id`,`sb`.`name` AS `subject_name`,(case when (`sb`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ml`.`midmark` AS `midmark`,`ml`.`sessionalmark` AS `sessionalmark`,`ml`.`finalmark` AS `finalmark`,`ml`.`totalmark` AS `totalmark`,(case when (`sb`.`type` = 0) then `findgp`(`ml`.`totalmark`,100) else `findgp`(`ml`.`totalmark`,50) end) AS `gp`,(case when (`sb`.`type` = 0) then `findgrade`(`ml`.`totalmark`,100) else `findgrade`(`ml`.`totalmark`,50) end) AS `grade`,(case when (`sb`.`type` = 0) then `findremarks`(`ml`.`totalmark`,100) else `findremarks`(`ml`.`totalmark`,50) end) AS `remarks`,(case when (`ml`.`status` = 1) then 'Pending' when (`ml`.`status` = 2) then 'Approved By I/C ' when (`ml`.`status` = 3) then 'Rejected By HOD' when (`ml`.`status` = 4) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `marks_status` from ((((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) join `teacher` `t` on((`t`.`id` = `ml`.`t_id`))) */;

/*View structure for view getmarksledger */

/*!50001 DROP TABLE IF EXISTS `getmarksledger` */;
/*!50001 DROP VIEW IF EXISTS `getmarksledger` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarksledger` AS select `getsubjmarks`.`std_id` AS `std_id`,`getsubjmarks`.`rollno` AS `rollno`,`getsubjmarks`.`fullname` AS `fullname`,`getsubjmarks`.`fathername` AS `fathername`,`getsubjmarks`.`session` AS `session`,`getsubjmarks`.`semester` AS `semester`,`getsubjmarks`.`gender` AS `gender`,`getsubjmarks`.`dept_id` AS `dept_id`,`getsubjmarks`.`dept` AS `dept`,`getsubjmarks`.`prog_id` AS `prog_id`,`getsubjmarks`.`program` AS `program`,`getsubjmarks`.`programfullname` AS `programfullname`,`getsubjmarks`.`sem_id` AS `sem_id`,`getsubjmarks`.`form_id` AS `id`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgp`(max(`getsubjmarks`.`total_marks`),100) else `findgp`(max(`getsubjmarks`.`total_marks`),50) end) AS `gp` from `getsubjmarks` group by `getsubjmarks`.`program`,`getsubjmarks`.`semester`,`getsubjmarks`.`std_id` */;

/*View structure for view getprograms */

/*!50001 DROP TABLE IF EXISTS `getprograms` */;
/*!50001 DROP VIEW IF EXISTS `getprograms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getprograms` AS select `p`.`id` AS `id`,`p`.`name` AS `Prog`,`d`.`id` AS `Dept_id`,`d`.`name` AS `Dept`,`p`.`fullname` AS `fullname` from (`program` `p` join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*View structure for view getrecheck */

/*!50001 DROP TABLE IF EXISTS `getrecheck` */;
/*!50001 DROP VIEW IF EXISTS `getrecheck` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getrecheck` AS select `rchk`.`id` AS `id`,`ml`.`id` AS `ml_id`,`p`.`dept_id` AS `dept_id`,`d`.`name` AS `dept`,`deptic`.`id` AS `incharge_id`,`p`.`id` AS `prog_id`,`rchk`.`status` AS `status_code`,(case when (`rchk`.`status` = 1) then 'Pending' when (`rchk`.`status` = 2) then 'Approved By I/C ' when (`rchk`.`status` = 3) then 'Rejected By HOD' when (`rchk`.`status` = 4) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `status`,`p`.`name` AS `program`,`t`.`id` AS `t_id`,`t`.`fullname` AS `teacher`,`ml`.`std_id` AS `std_id`,`std`.`fullname` AS `student_name`,`sub`.`id` AS `sub_id`,`sub`.`name` AS `subject`,`sub`.`type` AS `sub_type`,`rchk`.`p_mid` AS `p_mid`,`rchk`.`p_sessional` AS `p_sessional`,`rchk`.`p_final` AS `p_final`,`rchk`.`p_total` AS `p_total`,`rchk`.`n_mid` AS `n_mid`,`rchk`.`n_sessional` AS `n_sessional`,`rchk`.`n_final` AS `n_final`,`rchk`.`n_total` AS `n_total` from ((((((((`recheck` `rchk` join `student` `std` on((`std`.`id` = `rchk`.`std_id`))) join `marks_ledger` `ml` on((`ml`.`id` = `rchk`.`ml_id`))) join `program` `p` on((`std`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) join `subject` `sub` on((`sub`.`id` = `ml`.`sub_id`))) join `semester` `sm` on((`sm`.`id` = `sub`.`sem_id`))) join `deptincharge` `deptic` on((`deptic`.`dept_id` = `d`.`id`))) join `teacher` `t` on((`t`.`id` = `ml`.`t_id`))) */;

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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getstudent` AS select `s`.`id` AS `id`,`s`.`isdisabled` AS `isdisabled`,`s`.`rollno` AS `rollno`,`s`.`fullname` AS `fullname`,`s`.`fathername` AS `fathername`,`s`.`caste` AS `caste`,`d`.`id` AS `dept_id`,`d`.`name` AS `department`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`sm`.`id` AS `sem_id`,`sm`.`name` AS `semester`,`s`.`dateofbirth` AS `dateofbirth`,`s`.`religion` AS `religion`,`s`.`gender` AS `gender`,`s`.`nationality` AS `nationality`,`s`.`username` AS `username`,`s`.`password` AS `password`,`s`.`district` AS `district`,`s`.`address` AS `address`,`s`.`insertiondate` AS `date`,`s`.`image` AS `image` from (((`student` `s` join `program` `p` on((`s`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) join `semester` `sm` on((0 <> `s`.`semester_id`))) */;

/*View structure for view getsubjbydept */

/*!50001 DROP TABLE IF EXISTS `getsubjbydept` */;
/*!50001 DROP VIEW IF EXISTS `getsubjbydept` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getsubjbydept` AS select `sub`.`id` AS `id`,`sub`.`name` AS `Subj_Name`,`sm`.`id` AS `Sem_id`,`sm`.`name` AS `Sem_Name`,`p`.`id` AS `program_id`,`p`.`name` AS `program_name`,`p`.`dept_id` AS `dept_id`,`sub`.`isdisabled` AS `isdisabled` from ((`subject` `sub` join `semester` `sm` on((`sm`.`id` = `sub`.`sem_id`))) join `program` `p` on((`p`.`id` = `sm`.`prog_id`))) */;

/*View structure for view getsubjects */

/*!50001 DROP TABLE IF EXISTS `getsubjects` */;
/*!50001 DROP VIEW IF EXISTS `getsubjects` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsubjects` AS select `s`.`id` AS `id`,`s`.`name` AS `Subj_Name`,`sm`.`id` AS `Sem_id`,`sm`.`name` AS `Sem_Name`,`p`.`name` AS `program` from ((`subject` `s` join `semester` `sm` on((`sm`.`id` = `s`.`sem_id`))) join `program` `p` on((`p`.`id` = `sm`.`prog_id`))) */;

/*View structure for view getsubjmarks */

/*!50001 DROP TABLE IF EXISTS `getsubjmarks` */;
/*!50001 DROP VIEW IF EXISTS `getsubjmarks` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsubjmarks` AS select `std`.`id` AS `std_id`,`std`.`rollno` AS `rollno`,`std`.`gender` AS `gender`,`std`.`fullname` AS `fullname`,`ef`.`session` AS `session`,`std`.`fathername` AS `fathername`,`sm`.`id` AS `sem_id`,`sm`.`name` AS `semester`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`p`.`fullname` AS `programfullname`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept`,`ef`.`id` AS `form_id`,`sb`.`id` AS `subj_id`,`sb`.`name` AS `subj_name`,`sb`.`type` AS `sub_type`,`sb`.`credit_hour` AS `credit_hour`,`sb`.`course_code` AS `course_code`,`ml`.`totalmark` AS `total_marks` from ((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) */;

/*View structure for view getteacher */

/*!50001 DROP TABLE IF EXISTS `getteacher` */;
/*!50001 DROP VIEW IF EXISTS `getteacher` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getteacher` AS select `t`.`id` AS `id`,`t`.`fullname` AS `teacher_name`,`t`.`surname` AS `surname`,`t`.`dept_id` AS `dept_id`,`d`.`name` AS `dept_name`,`t`.`isdisabled` AS `isdisabled`,`t`.`image` AS `image` from (`teacher` `t` join `dept` `d` on((`d`.`id` = `t`.`dept_id`))) */;

/*View structure for view msheet */

/*!50001 DROP TABLE IF EXISTS `msheet` */;
/*!50001 DROP VIEW IF EXISTS `msheet` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `msheet` AS select `getsubjmarks`.`std_id` AS `std_id`,`getsubjmarks`.`sem_id` AS `sem_id`,`getsubjmarks`.`form_id` AS `form_id`,`getsubjmarks`.`subj_id` AS `subj_id`,`getsubjmarks`.`subj_name` AS `subj_name`,`getsubjmarks`.`sub_type` AS `sub_type`,max(`getsubjmarks`.`total_marks`) AS `obt_marks`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgp`(max(`getsubjmarks`.`total_marks`),100) else `findgp`(max(`getsubjmarks`.`total_marks`),50) end) AS `gp`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgrade`(max(`getsubjmarks`.`total_marks`),100) else `findgrade`(max(`getsubjmarks`.`total_marks`),50) end) AS `grade`,(case when (`getsubjmarks`.`sub_type` = 0) then `findremarks`(max(`getsubjmarks`.`total_marks`),100) else `findremarks`(max(`getsubjmarks`.`total_marks`),50) end) AS `remarks` from `getsubjmarks` group by `getsubjmarks`.`std_id`,`getsubjmarks`.`subj_id` */;

/*View structure for view semmarksheet */

/*!50001 DROP TABLE IF EXISTS `semmarksheet` */;
/*!50001 DROP VIEW IF EXISTS `semmarksheet` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `semmarksheet` AS select `getsubjmarks`.`std_id` AS `std_id`,`getsubjmarks`.`rollno` AS `rollno`,`getsubjmarks`.`fullname` AS `fullname`,`getsubjmarks`.`session` AS `session`,`getsubjmarks`.`semester` AS `semester`,`getsubjmarks`.`gender` AS `gender`,`getsubjmarks`.`dept_id` AS `dept_id`,`getsubjmarks`.`dept` AS `dept`,`getsubjmarks`.`fathername` AS `fathername`,`getsubjmarks`.`prog_id` AS `prog_id`,`getsubjmarks`.`program` AS `program`,`getsubjmarks`.`programfullname` AS `programfullname`,`getsubjmarks`.`credit_hour` AS `credit_hour`,`getsubjmarks`.`course_code` AS `course_code`,`getsubjmarks`.`sem_id` AS `sem_id`,`getsubjmarks`.`form_id` AS `form_id`,`getsubjmarks`.`subj_id` AS `subj_id`,`getsubjmarks`.`subj_name` AS `subj_name`,`getsubjmarks`.`sub_type` AS `sub_type`,max(`getsubjmarks`.`total_marks`) AS `obt_marks`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgp`(max(`getsubjmarks`.`total_marks`),100) else `findgp`(max(`getsubjmarks`.`total_marks`),50) end) AS `gp`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgrade`(max(`getsubjmarks`.`total_marks`),100) else `findgrade`(max(`getsubjmarks`.`total_marks`),50) end) AS `grade`,(case when (`getsubjmarks`.`sub_type` = 0) then `findremarks`(max(`getsubjmarks`.`total_marks`),100) else `findremarks`(max(`getsubjmarks`.`total_marks`),50) end) AS `remarks` from `getsubjmarks` group by `getsubjmarks`.`std_id`,`getsubjmarks`.`subj_id` */;

/*View structure for view teacherassignedsubjectform */

/*!50001 DROP TABLE IF EXISTS `teacherassignedsubjectform` */;
/*!50001 DROP VIEW IF EXISTS `teacherassignedsubjectform` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `teacherassignedsubjectform` AS select `sta`.`id` AS `sta_id`,`ef`.`id` AS `form_id`,`ffs`.`id` AS `id`,`std`.`id` AS `std_id`,`std`.`fullname` AS `student_name`,`t`.`id` AS `teacher_id`,`ffs`.`ismarked` AS `ismarked`,`t`.`fullname` AS `teacher_name`,`s`.`isdisabled` AS `isdisabled`,`ef`.`session` AS `session`,`ef`.`sem_id` AS `sem_id`,`sem`.`name` AS `semester`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`status` AS `status`,`ef`.`remarks` AS `remarks`,`ffs`.`sub_id` AS `sub_id`,`s`.`type` AS `sub_type`,`s`.`name` AS `sub_name`,`s`.`credit_hour` AS `credit_hour` from ((((((`examform` `ef` join `f_form_subject` `ffs` on((`ffs`.`f_id` = `ef`.`id`))) join `subject` `s` on((`s`.`id` = `ffs`.`sub_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `semester` `sem` on((`sem`.`id` = `ef`.`sem_id`))) join `f_subject_teacher_assign` `sta` on((`sta`.`sub_id` = `ffs`.`sub_id`))) join `teacher` `t` on((`t`.`id` = `sta`.`t_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
