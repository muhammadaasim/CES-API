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
(1,'admission','admission','12345-1234567-1','admission','admission','1620136891856',0);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `configname` varchar(30) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `config` */

insert  into `config`(`id`,`configname`,`startdate`,`enddate`) values 
(1,'examform','2021-05-03','2021-05-14'),
(2,'result','2021-05-03','2021-05-13'),
(3,'recheck','2021-05-01','2021-05-19'),
(4,'admission','2021-05-01','2021-05-15');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`name`) values 
(1,'Computer Science'),
(2,'Commerce'),
(3,'Business Administration');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `deptincharge` */

insert  into `deptincharge`(`id`,`fullname`,`caste`,`dept_id`,`username`,`password`,`cnic`,`image`) values 
(1,'Asadullah','Bhatti',1,'asad11','asad11','33354-2323233-3','http://localhost:4000/uploads/navttc.jpg'),
(2,'Parkash','Hindu',3,'parkash','parkash','32345-1234567-1','http://localhost:4000/uploads/navttc.jpg');

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
(1,'Muhammad Ali','Sheikh','ali11','ali11');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `examform` */

insert  into `examform`(`id`,`std_id`,`session`,`sem_id`,`type`,`status`,`remarks`,`date`,`image`) values 
(1,1,2021,1,0,3,NULL,'1620137116415','http://localhost:4000/uploads/navttc.jpg'),
(2,1,2021,2,0,3,NULL,'1620137136248','http://localhost:4000/uploads/navttc.jpg'),
(3,1,2021,3,0,3,NULL,'1620137145837','http://localhost:4000/uploads/navttc.jpg'),
(4,1,2021,4,0,3,NULL,'1620137160793','http://localhost:4000/uploads/navttc.jpg'),
(5,1,2021,5,0,3,NULL,'1620137170609','http://localhost:4000/uploads/navttc.jpg'),
(6,1,2021,6,0,3,NULL,'1620137181691','http://localhost:4000/uploads/navttc.jpg'),
(7,1,2021,7,0,3,NULL,'1620137192812','http://localhost:4000/uploads/navttc.jpg'),
(8,1,2021,8,0,3,NULL,'1620137210881','http://localhost:4000/uploads/navttc.jpg'),
(9,3,2021,17,0,3,NULL,'1620141118123','http://localhost:4000/uploads/navttc.jpg'),
(10,3,2021,18,0,3,NULL,'1620143667233','http://localhost:4000/uploads/navttc.jpg'),
(11,3,2021,19,0,3,NULL,'1620143685803','http://localhost:4000/uploads/navttc.jpg'),
(12,3,2021,20,0,3,NULL,'1620143694987','http://localhost:4000/uploads/navttc.jpg'),
(13,3,2021,21,0,3,NULL,'1620143704019','http://localhost:4000/uploads/navttc.jpg'),
(14,3,2021,22,0,3,NULL,'1620143711182','http://localhost:4000/uploads/navttc.jpg'),
(15,3,2021,23,0,3,NULL,'1620143723298','http://localhost:4000/uploads/navttc.jpg'),
(16,3,2021,24,0,3,NULL,'1620143763522','http://localhost:4000/uploads/navttc.jpg'),
(17,4,2021,17,0,3,NULL,'1620149233270','http://localhost:4000/uploads/navttc.jpg'),
(18,4,2021,18,0,3,NULL,'1620149247995','http://localhost:4000/uploads/navttc.jpg'),
(19,4,2021,19,0,3,NULL,'1620149257299','http://localhost:4000/uploads/navttc.jpg'),
(20,4,2021,20,0,3,NULL,'1620149266278','http://localhost:4000/uploads/navttc.jpg'),
(21,4,2021,21,0,3,NULL,'1620149276447','http://localhost:4000/uploads/navttc.jpg'),
(22,4,2021,22,0,3,NULL,'1620149295027','http://localhost:4000/uploads/navttc.jpg'),
(23,4,2021,23,0,3,NULL,'1620149307117','http://localhost:4000/uploads/navttc.jpg'),
(24,4,2021,24,0,3,NULL,'1620149319375','http://localhost:4000/uploads/navttc.jpg'),
(25,3,2021,18,1,3,NULL,'1620156357033','http://localhost:4000/uploads/navttc.jpg'),
(26,3,2021,24,1,3,NULL,'1620157025732','http://localhost:4000/uploads/navttc.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_form_subject` */

insert  into `f_form_subject`(`f_id`,`sub_id`,`id`,`ismarked`) values 
(1,1,1,1),
(1,2,2,1),
(1,3,3,1),
(1,6,4,1),
(1,4,5,1),
(1,5,6,1),
(2,7,7,1),
(2,8,8,1),
(2,9,9,1),
(3,10,10,1),
(3,13,11,1),
(3,11,12,1),
(3,12,13,1),
(4,14,14,1),
(4,15,15,1),
(4,16,16,1),
(4,17,17,1),
(4,18,18,1),
(5,19,19,1),
(5,20,20,1),
(5,21,21,1),
(5,22,22,1),
(6,23,23,1),
(6,24,24,1),
(6,25,25,1),
(6,26,26,1),
(7,27,27,1),
(7,28,28,1),
(7,29,29,1),
(8,30,30,1),
(8,31,31,1),
(8,32,32,1),
(9,60,33,1),
(9,61,34,1),
(10,62,35,1),
(10,63,36,1),
(11,64,37,1),
(11,65,38,1),
(12,66,39,1),
(12,67,40,1),
(13,68,41,1),
(13,69,42,1),
(14,70,43,1),
(14,71,44,1),
(15,72,45,1),
(15,73,46,1),
(16,74,47,1),
(16,75,48,1),
(17,60,49,1),
(17,61,50,1),
(18,62,51,1),
(18,63,52,1),
(19,64,53,1),
(19,65,54,1),
(20,66,55,1),
(20,67,56,1),
(21,68,57,1),
(21,69,58,1),
(22,70,59,1),
(22,71,60,1),
(23,72,61,1),
(23,73,62,1),
(24,74,63,1),
(24,75,64,1),
(25,62,65,1),
(26,75,66,1),
(26,74,67,1),
(26,75,68,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_subject_teacher_assign` */

insert  into `f_subject_teacher_assign`(`sub_id`,`t_id`,`session`,`incharge_id`,`date`,`id`) values 
(1,1,2021,1,'1620137768402',1),
(2,1,2021,1,'1620137770410',2),
(3,1,2021,1,'1620137772356',3),
(4,1,2021,1,'1620137775164',4),
(5,1,2021,1,'1620137780953',5),
(6,1,2021,1,'1620137786677',6),
(7,1,2021,1,'1620137793451',7),
(8,1,2021,1,'1620137795552',8),
(9,1,2021,1,'1620137797317',9),
(10,1,2021,1,'1620137801092',10),
(11,1,2021,1,'1620137802984',11),
(12,1,2021,1,'1620137805167',12),
(13,1,2021,1,'1620137807593',13),
(14,1,2021,1,'1620137812305',14),
(15,1,2021,1,'1620137814076',15),
(16,1,2021,1,'1620137816823',16),
(17,1,2021,1,'1620137819096',17),
(18,1,2021,1,'1620137821389',18),
(19,1,2021,1,'1620137825173',19),
(20,1,2021,1,'1620137827791',20),
(21,1,2021,1,'1620137830930',21),
(22,1,2021,1,'1620137832902',22),
(23,1,2021,1,'1620137844388',23),
(24,1,2021,1,'1620137846104',24),
(25,1,2021,1,'1620137848183',25),
(26,1,2021,1,'1620137850869',26),
(27,1,2021,1,'1620137855501',27),
(28,1,2021,1,'1620137857060',28),
(29,1,2021,1,'1620137859333',29),
(30,1,2021,1,'1620137862815',30),
(31,1,2021,1,'1620137865349',31),
(32,1,2021,1,'1620137867357',32),
(60,2,2021,2,'1620142210562',33),
(61,2,2021,2,'1620142212897',34),
(62,2,2021,2,'1620142217592',35),
(63,2,2021,2,'1620142220578',36),
(64,2,2021,2,'1620145102392',37),
(65,2,2021,2,'1620145104978',38),
(66,2,2021,2,'1620145108237',39),
(67,2,2021,2,'1620145110133',40),
(68,2,2021,2,'1620145114326',41),
(69,2,2021,2,'1620145116333',42),
(70,2,2021,2,'1620145120080',43),
(71,2,2021,2,'1620145121978',44),
(72,2,2021,2,'1620145151601',45),
(73,2,2021,2,'1620145154185',46),
(74,2,2021,2,'1620145159925',47),
(75,2,2021,2,'1620145161931',48);

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `marks_ledger` */

insert  into `marks_ledger`(`id`,`std_id`,`sub_id`,`t_id`,`f_id`,`midmark`,`status`,`date`,`sessionalmark`,`finalmark`,`totalmark`,`remarks`) values 
(1,1,1,1,1,20,4,'1620137989491',20,30,70,'Approved By Controller'),
(2,1,2,1,1,0,4,'1620137997695',0,40,40,'Approved By Controller'),
(3,1,3,1,1,20,4,'1620138009605',20,40,80,'Approved By Controller'),
(4,1,6,1,1,20,4,'1620138022662',20,40,80,'Approved By Controller'),
(5,1,4,1,1,0,4,'1620138029207',0,35,35,'Approved By Controller'),
(6,1,5,1,1,30,4,'1620138042661',20,40,90,'Approved By Controller'),
(7,1,7,1,2,30,4,'1620138050875',20,45,95,'Approved By Controller'),
(8,1,10,1,3,30,4,'1620138060238',20,33,83,'Approved By Controller'),
(9,1,13,1,3,27,4,'1620138068672',20,44,91,'Approved By Controller'),
(10,1,19,1,5,30,4,'1620138076972',20,30,80,'Approved By Controller'),
(11,1,9,1,2,22,4,'1620138087015',12,30,64,'Approved By Controller'),
(12,1,11,1,3,23,4,'1620138100637',20,44,87,'Approved By Controller'),
(13,1,22,1,5,20,4,'1620138109645',10,30,60,'Approved By Controller'),
(14,1,8,1,2,20,4,'1620138120592',10,50,80,'Approved By Controller'),
(15,1,12,1,3,20,4,'1620138128273',20,44,84,'Approved By Controller'),
(16,1,21,1,5,22,4,'1620138137516',20,44,86,'Approved By Controller'),
(17,1,15,1,4,20,4,'1620138799842',20,33,73,'Approved By Controller'),
(18,1,14,1,4,20,4,'1620138815868',10,40,70,'Approved By Controller'),
(19,1,17,1,4,20,4,'1620138824608',20,40,80,'Approved By Controller'),
(20,1,25,1,6,20,4,'1620138833276',20,40,80,'Approved By Controller'),
(21,1,28,1,7,20,4,'1620138843190',20,30,70,'Approved By Controller'),
(22,1,27,1,7,20,4,'1620138851026',20,40,80,'Approved By Controller'),
(23,1,29,1,7,25,4,'1620138862069',20,40,85,'Approved By Controller'),
(24,1,26,1,6,22,4,'1620138870799',20,44,86,'Approved By Controller'),
(25,1,30,1,8,20,4,'1620138878646',20,50,90,'Approved By Controller'),
(26,1,31,1,8,30,4,'1620138887374',20,20,70,'Approved By Controller'),
(27,1,24,1,6,20,4,'1620138894562',20,20,60,'Approved By Controller'),
(28,1,20,1,5,22,4,'1620138903681',20,44,86,'Approved By Controller'),
(29,1,23,1,6,22,4,'1620138913943',20,33,75,'Approved By Controller'),
(30,1,32,1,8,30,4,'1620138922594',20,40,90,'Approved By Controller'),
(31,1,18,1,4,20,4,'1620138932406',20,33,73,'Approved By Controller'),
(32,1,16,1,4,27,4,'1620138942306',20,30,77,'Approved By Controller'),
(33,3,61,2,9,20,4,'1620142295666',20,40,80,'Approved By Controller'),
(34,3,60,2,9,20,4,'1620142312973',20,33,73,'Approved By Controller'),
(35,3,62,2,10,20,4,'1620144947173',20,30,70,'Approved By Controller'),
(36,3,63,2,10,30,4,'1620144957262',20,30,80,'Approved By Controller'),
(37,3,75,2,16,20,4,'1620145249994',20,30,70,'Approved By Controller'),
(38,3,74,2,16,20,4,'1620145256887',20,20,60,'Approved By Controller'),
(39,3,73,2,15,20,4,'1620145264201',20,20,60,'Approved By Controller'),
(40,3,71,2,14,20,4,'1620145271486',20,20,60,'Approved By Controller'),
(41,3,72,2,15,20,4,'1620145277942',20,20,60,'Approved By Controller'),
(42,3,70,2,14,20,4,'1620145286509',20,20,60,'Approved By Controller'),
(43,3,68,2,13,20,4,'1620145292875',20,20,60,'Approved By Controller'),
(44,3,67,2,12,20,4,'1620145301547',20,20,60,'Approved By Controller'),
(45,3,66,2,12,20,4,'1620145308060',20,20,60,'Approved By Controller'),
(46,3,65,2,11,20,4,'1620145314502',20,20,60,'Approved By Controller'),
(47,3,69,2,13,20,4,'1620145320722',20,20,60,'Approved By Controller'),
(48,3,64,2,11,20,4,'1620145327306',20,20,60,'Approved By Controller'),
(49,4,60,2,17,30,4,'1620149546091',20,50,100,'Approved By Controller'),
(50,4,61,2,17,30,4,'1620149562549',20,39,89,'Approved By Controller'),
(51,4,62,2,18,20,4,'1620149571927',20,50,90,'Approved By Controller'),
(52,4,63,2,18,20,4,'1620149583639',20,49,89,'Approved By Controller'),
(53,4,64,2,19,30,4,'1620149596274',10,49,89,'Approved By Controller'),
(54,4,65,2,19,30,4,'1620149609645',15,48,93,'Approved By Controller'),
(55,4,66,2,20,30,4,'1620149619597',10,50,90,'Approved By Controller'),
(56,4,67,2,20,30,4,'1620149634740',10,50,90,'Approved By Controller'),
(57,4,68,2,21,30,4,'1620149642942',20,40,90,'Approved By Controller'),
(58,4,69,2,21,20,4,'1620149650008',20,50,90,'Approved By Controller'),
(59,4,70,2,22,30,4,'1620149658069',20,50,100,'Approved By Controller'),
(60,4,72,2,23,30,4,'1620149669945',20,50,100,'Approved By Controller'),
(61,4,73,2,23,30,4,'1620149676825',20,40,90,'Approved By Controller'),
(62,4,74,2,24,30,4,'1620149686176',20,50,100,'Approved By Controller'),
(63,4,71,2,22,30,4,'1620149697304',20,50,100,'Approved By Controller'),
(64,4,75,2,24,30,4,'1620149711776',20,50,100,'Approved By Controller'),
(65,3,62,2,25,30,4,'1620156473635',20,40,90,'Approved By Controller'),
(66,3,74,2,26,30,4,'1620159103594',20,48,98,'Approved By Controller'),
(67,3,75,2,26,30,4,'1620159117532',20,41,91,'Approved By Controller');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `program` */

insert  into `program`(`id`,`name`,`dept_id`,`fullname`) values 
(1,'BSCS',1,'Computer Science'),
(2,'BSCom',2,'Commerce'),
(3,'BBA',3,'Business Administration');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `recheck` */

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(24,'Eighth',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`rollno`,`fullname`,`prog_id`,`semester_id`,`caste`,`dateofbirth`,`religion`,`gender`,`nationality`,`username`,`password`,`district`,`address`,`fathername`,`insertiondate`,`isdisabled`,`image`) values 
(1,'21-BSCS-1','Maheen',1,1,'chandio','20020-02-02','islam',2,'pakistan','maheen','maheen','shikarpur','shikarpur','nazeer hussain','1620137005251',0,'http://localhost:4000/uploads/navttc.jpg'),
(2,'21-BSCom-1','usman',2,9,'soomro','2111-02-11','islam',1,'pakistan','usman','usman','shikarpur','shikarpur','usman','1620137059675',0,'http://localhost:4000/uploads/navttc.jpg'),
(3,'21-BBA-1','yasir',3,17,'soomro','2012-02-22','islam',1,'pakistan','yasir','yasir','shikarpur','shikarpur','yasir','1620141032859',0,'http://localhost:4000/uploads/navttc.jpg'),
(4,'21-BBA-2','yameen',3,17,'sheikh','2222-02-22','islam',1,'pakistan','yameen','yameen','shikarpur','shikarpur','yaseen','1620149203526',0,'http://localhost:4000/uploads/navttc.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`credit_hour`,`course_code`,`sem_id`,`type`,`isdisabled`) values 
(1,'Programming Fundamentals(TH)',3,'1.1',1,0,1),
(2,'Programming Fundamentals(PR)',3,'1.1',1,1,1),
(3,'ITC (TH)',3,'1.1',1,0,1),
(4,'ITC ( PR)',3,'1.1',1,1,1),
(5,'ENglish',3,'1.1',1,0,1),
(6,'E.Maths',3,'1.1',1,0,1),
(7,'DLD',3,'1.1',2,0,1),
(8,'OB',3,'1.1',2,0,1),
(9,'DS',3,'1.1',2,0,1),
(10,'B.E',3,'1.1',3,0,1),
(11,'DLD',3,'1.1',3,0,1),
(12,'ZZy',3,'333',3,0,1),
(13,'ZZZ',3,'333',3,0,1),
(14,'SSDS',3,'333',4,0,1),
(15,'dfadfa',3,'333',4,0,1),
(16,'Asadf',3,'333',4,0,1),
(17,'DFF',3,'333',4,0,1),
(18,'UUA',3,'333',4,0,1),
(19,'NISS',3,'333',5,0,1),
(20,'Neee',3,'333',5,0,1),
(21,'nIsds',3,'333',5,0,1),
(22,'TLT',3,'333',5,0,1),
(23,'Uls',3,'333',6,0,1),
(24,'VLT',3,'333',6,0,1),
(25,'SDS',3,'333',6,0,1),
(26,'sds',3,'333',6,0,1),
(27,'JIji',3,'333',7,0,1),
(28,'AAe',3,'333',7,0,1),
(29,'UXM',3,'333',7,0,1),
(30,'LGT',3,'333',8,0,1),
(31,'BGU',3,'333',8,0,1),
(32,'BSU',3,'333',8,0,1),
(33,'BNT',3,'333',9,0,0),
(34,'BLS',3,'333',9,0,0),
(35,'NSA',3,'333',9,0,0),
(36,'USA',3,'333',10,0,0),
(37,'AQQ',3,'333',10,0,0),
(38,'ADAs',3,'333',10,0,0),
(39,'JKLJ',3,'333',11,0,0),
(40,'hhdjh',3,'333',11,0,0),
(41,'jj',3,'1111',11,0,0),
(42,'KJKJK',3,'1111',12,0,0),
(43,'kjkjkj',3,'1111',12,0,0),
(44,'asdfa',3,'1111',12,0,0),
(45,'adfadf',3,'1111',12,0,0),
(46,'dafa',3,'1111',12,0,0),
(47,'KKLKL',3,'1111',13,0,0),
(48,'JKJKJ',3,'1111',13,0,0),
(49,'hhh',3,'1111',13,0,0),
(50,'jjt',3,'1111',14,0,0),
(51,'JSD',3,'1111',14,0,0),
(52,'BSD',3,'1111',14,0,0),
(53,'BSU',3,'1111',14,0,0),
(54,'NST',3,'1111',15,0,0),
(55,'Jjjs',3,'1111',15,0,0),
(56,'jsak',3,'1111',15,0,0),
(57,'jkjk',3,'1111',16,0,0),
(58,'ERE',3,'1111',16,0,0),
(59,'CVCX',3,'1111',16,0,0),
(60,'XYZ',3,'1.1',17,0,1),
(61,'UFZ',3,'2.1',17,0,1),
(62,'BFA',3,'2.1',18,0,1),
(63,'BFD',3,'2.1',18,0,1),
(64,'UFD',3,'2.1',19,0,1),
(65,'UXZ',3,'2.1',19,0,1),
(66,'LZZ',3,'2.1',20,0,1),
(67,'LZA',3,'2.1',20,0,1),
(68,'BUFA',3,'2.1',21,0,1),
(69,'BS',3,'2.1',21,0,1),
(70,'NBN',3,'2.1',22,0,1),
(71,'BNA',3,'2.1',22,0,1),
(72,'LLZ',3,'2.1',23,0,1),
(73,'LOM',3,'2.1',23,0,1),
(74,'BSD',3,'2.1',24,0,1),
(75,'BLL',3,'2.1',24,0,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fullname`,`surname`,`dept_id`,`username`,`password`,`CNIC`,`date`,`isdisabled`,`image`) values 
(1,'abdullah','soomro',1,'abdullah','abdullah','43304-1234567-1',NULL,0,'http://localhost:4000/uploads/navttc.jpg'),
(2,'parkash','hindu',3,'parkash','parkash','33333-2323232-2',NULL,0,'http://localhost:4000/uploads/navttc.jpg');

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

/* Procedure structure for procedure `Sp_inserteightsemesters` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_inserteightsemesters` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`mohsin`@`%` PROCEDURE `Sp_inserteightsemesters`(
prog_id INT 
)
BEGIN
INSERT INTO semester (NAME,prog_id) VALUES
	('First',prog_id),('Second',prog_id),('Third',prog_id),('Fourth',prog_id),('Fifth',prog_id),('Sixth',prog_id),('Seventh',prog_id),('Eighth',prog_id);

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
 `gender` varchar(5) ,
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
 `status` int ,
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
 `gen` varchar(5) ,
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

/*Table structure for table `getgazzated1` */

DROP TABLE IF EXISTS `getgazzated1`;

/*!50001 DROP VIEW IF EXISTS `getgazzated1` */;
/*!50001 DROP TABLE IF EXISTS `getgazzated1` */;

/*!50001 CREATE TABLE  `getgazzated1`(
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

/*Table structure for table `getpassedstudent` */

DROP TABLE IF EXISTS `getpassedstudent`;

/*!50001 DROP VIEW IF EXISTS `getpassedstudent` */;
/*!50001 DROP TABLE IF EXISTS `getpassedstudent` */;

/*!50001 CREATE TABLE  `getpassedstudent`(
 `id` int ,
 `dept_id` int ,
 `dept` varchar(50) ,
 `prog_id` int ,
 `program` varchar(30) ,
 `sem_id` int ,
 `sem_qty` bigint ,
 `std_id` int ,
 `rollno` varchar(30) ,
 `gender` varchar(5) ,
 `student_name` varchar(40) ,
 `father_name` varchar(40) ,
 `gpa` double(27,10) ,
 `remarks` varchar(8) 
)*/;

/*Table structure for table `getmarksheett` */

DROP TABLE IF EXISTS `getmarksheett`;

/*!50001 DROP VIEW IF EXISTS `getmarksheett` */;
/*!50001 DROP TABLE IF EXISTS `getmarksheett` */;

/*!50001 CREATE TABLE  `getmarksheett`(
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
 `gen` varchar(5) ,
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

/*View structure for view getassignedteachers */

/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;
/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getassignedteachers` AS select `s`.`id` AS `id`,`fst`.`id` AS `fst_id`,`fst`.`session` AS `session`,`s`.`name` AS `sub_name`,`t`.`id` AS `teacher_id`,`t`.`fullname` AS `teacher_name`,`ic`.`id` AS `incharge_id`,`ic`.`fullname` AS `incharge_name`,`s`.`isdisabled` AS `isdisabled` from (((`f_subject_teacher_assign` `fst` join `subject` `s` on((`fst`.`sub_id` = `s`.`id`))) join `teacher` `t` on((`fst`.`t_id` = `t`.`id`))) join `deptincharge` `ic` on((`ic`.`id` = `fst`.`incharge_id`))) */;

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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getgazzated` AS select `getmarksheet`.`f_id` AS `id`,`getmarksheet`.`dept_id` AS `dept_id`,`getmarksheet`.`dept` AS `dept`,`getmarksheet`.`prog_id` AS `prog_id`,`getmarksheet`.`program` AS `program`,`getmarksheet`.`gender` AS `gender`,`getmarksheet`.`sem_id` AS `sem_id`,`getmarksheet`.`semester` AS `semester`,`getmarksheet`.`status` AS `STATUS`,`getmarksheet`.`std_id` AS `std_id`,`getmarksheet`.`rollno` AS `rollno`,`getmarksheet`.`fullname` AS `student_name`,`getmarksheet`.`fathername` AS `father_name`,avg(`getmarksheet`.`gp`) AS `gpa`,if((sum((case when (`getmarksheet`.`remarks` = 'FAIL') then 1 else 0 end)) > 3),'Termback',if((avg(`getmarksheet`.`gp`) < 1.33),'Termback',if(sum((`getmarksheet`.`remarks` = 'FAIL')),'Fail','Pass'))) AS `remarks` from `getmarksheet` group by `getmarksheet`.`dept`,`getmarksheet`.`program`,`getmarksheet`.`semester`,`getmarksheet`.`rollno` */;

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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarksheet` AS select distinct `ml`.`id` AS `id`,`ml`.`std_id` AS `std_id`,`std`.`rollno` AS `rollno`,`p`.`dept_id` AS `dept_id`,`ml`.`f_id` AS `f_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`d`.`name` AS `dept`,`std`.`prog_id` AS `prog_id`,`p`.`name` AS `program`,`p`.`fullname` AS `pro_fname`,`sb`.`sem_id` AS `sem_id`,`ml`.`status` AS `status`,`sm`.`name` AS `semester`,(case when (`std`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gender`,`std`.`fullname` AS `fullname`,`std`.`fathername` AS `fathername`,`sb`.`id` AS `sub_id`,`sb`.`name` AS `subject_name`,(case when (`sb`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ml`.`midmark` AS `midmark`,`ml`.`sessionalmark` AS `sessionalmark`,`ml`.`finalmark` AS `finalmark`,`ml`.`totalmark` AS `totalmark`,(case when (`sb`.`type` = 0) then `findgp`(`ml`.`totalmark`,100) else `findgp`(`ml`.`totalmark`,50) end) AS `gp`,(case when (`sb`.`type` = 0) then `findgrade`(`ml`.`totalmark`,100) else `findgrade`(`ml`.`totalmark`,50) end) AS `grade`,(case when (`sb`.`type` = 0) then `findremarks`(`ml`.`totalmark`,100) else `findremarks`(`ml`.`totalmark`,50) end) AS `remarks`,(case when (`ml`.`status` = 1) then 'Pending' when (`ml`.`status` = 2) then 'Approved By I/C ' when (`ml`.`status` = 3) then 'Rejected By HOD' when (`ml`.`status` = 4) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `marks_status` from ((((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) join (select `ml`.`sub_id` AS `subj_id`,max(`ml`.`totalmark`) AS `max_marks` from `marks_ledger` `ml` group by `ml`.`sub_id`) `ml2` on(((`sb`.`id` = `ml2`.`subj_id`) or (`ml`.`totalmark` = `ml2`.`max_marks`)))) where (`ml`.`status` = 4) */;

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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getstudent` AS select `s`.`id` AS `id`,`s`.`isdisabled` AS `isdisabled`,`s`.`rollno` AS `rollno`,`s`.`fullname` AS `fullname`,`s`.`fathername` AS `fathername`,`s`.`caste` AS `caste`,`d`.`id` AS `dept_id`,`d`.`name` AS `department`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`sm`.`id` AS `sem_id`,`sm`.`name` AS `semester`,`s`.`dateofbirth` AS `dateofbirth`,`s`.`religion` AS `religion`,`s`.`gender` AS `gender`,`s`.`nationality` AS `nationality`,`s`.`username` AS `username`,`s`.`password` AS `password`,`s`.`district` AS `district`,`s`.`address` AS `address`,`s`.`insertiondate` AS `date`,`s`.`image` AS `image` from (((`student` `s` join `program` `p` on((`s`.`prog_id` = `p`.`id`))) join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) join `semester` `sm` on((`sm`.`id` = `s`.`semester_id`))) */;

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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsubjmarks` AS select `std`.`id` AS `std_id`,`std`.`rollno` AS `rollno`,`std`.`gender` AS `gender`,`std`.`fullname` AS `fullname`,`ef`.`session` AS `session`,`std`.`fathername` AS `fathername`,`sm`.`id` AS `sem_id`,`sm`.`name` AS `semester`,`p`.`id` AS `prog_id`,`p`.`name` AS `program`,`p`.`fullname` AS `programfullname`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept`,`ef`.`id` AS `form_id`,`sb`.`id` AS `subj_id`,`sb`.`name` AS `subj_name`,`sb`.`type` AS `sub_type`,`sb`.`credit_hour` AS `credit_hour`,`ml`.`status` AS `status`,`sb`.`course_code` AS `course_code`,`ml`.`totalmark` AS `total_marks` from ((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) where (`ml`.`status` = 4) */;

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

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `semmarksheet` AS select `getsubjmarks`.`std_id` AS `std_id`,`getsubjmarks`.`rollno` AS `rollno`,`getsubjmarks`.`fullname` AS `fullname`,`getsubjmarks`.`session` AS `session`,`getsubjmarks`.`semester` AS `semester`,(case when (`getsubjmarks`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gen`,`getsubjmarks`.`dept_id` AS `dept_id`,`getsubjmarks`.`dept` AS `dept`,`getsubjmarks`.`fathername` AS `fathername`,`getsubjmarks`.`prog_id` AS `prog_id`,`getsubjmarks`.`program` AS `program`,`getsubjmarks`.`programfullname` AS `programfullname`,`getsubjmarks`.`credit_hour` AS `credit_hour`,`getsubjmarks`.`course_code` AS `course_code`,`getsubjmarks`.`sem_id` AS `sem_id`,`getsubjmarks`.`form_id` AS `form_id`,`getsubjmarks`.`subj_id` AS `subj_id`,`getsubjmarks`.`subj_name` AS `subj_name`,`getsubjmarks`.`sub_type` AS `sub_type`,max(`getsubjmarks`.`total_marks`) AS `obt_marks`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgp`(max(`getsubjmarks`.`total_marks`),100) else `findgp`(max(`getsubjmarks`.`total_marks`),50) end) AS `gp`,(case when (`getsubjmarks`.`sub_type` = 0) then `findgrade`(max(`getsubjmarks`.`total_marks`),100) else `findgrade`(max(`getsubjmarks`.`total_marks`),50) end) AS `grade`,(case when (`getsubjmarks`.`sub_type` = 0) then `findremarks`(max(`getsubjmarks`.`total_marks`),100) else `findremarks`(max(`getsubjmarks`.`total_marks`),50) end) AS `remarks` from `getsubjmarks` group by `getsubjmarks`.`std_id`,`getsubjmarks`.`subj_id` */;

/*View structure for view teacherassignedsubjectform */

/*!50001 DROP TABLE IF EXISTS `teacherassignedsubjectform` */;
/*!50001 DROP VIEW IF EXISTS `teacherassignedsubjectform` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `teacherassignedsubjectform` AS select `sta`.`id` AS `sta_id`,`ef`.`id` AS `form_id`,`ffs`.`id` AS `id`,`std`.`id` AS `std_id`,`std`.`fullname` AS `student_name`,`t`.`id` AS `teacher_id`,`ffs`.`ismarked` AS `ismarked`,`t`.`fullname` AS `teacher_name`,`s`.`isdisabled` AS `isdisabled`,`ef`.`session` AS `session`,`ef`.`sem_id` AS `sem_id`,`sem`.`name` AS `semester`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`ef`.`status` AS `status`,`ef`.`remarks` AS `remarks`,`ffs`.`sub_id` AS `sub_id`,`s`.`type` AS `sub_type`,`s`.`name` AS `sub_name`,`s`.`credit_hour` AS `credit_hour` from ((((((`examform` `ef` join `f_form_subject` `ffs` on((`ffs`.`f_id` = `ef`.`id`))) join `subject` `s` on((`s`.`id` = `ffs`.`sub_id`))) join `student` `std` on((`std`.`id` = `ef`.`std_id`))) join `semester` `sem` on((`sem`.`id` = `ef`.`sem_id`))) join `f_subject_teacher_assign` `sta` on((`sta`.`sub_id` = `ffs`.`sub_id`))) join `teacher` `t` on((`t`.`id` = `sta`.`t_id`))) */;

/*View structure for view getimproversubject */

/*!50001 DROP TABLE IF EXISTS `getimproversubject` */;
/*!50001 DROP VIEW IF EXISTS `getimproversubject` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getimproversubject` AS select `semmarksheet`.`std_id` AS `std_id`,`semmarksheet`.`rollno` AS `rollno`,`semmarksheet`.`dept_id` AS `dept_id`,`semmarksheet`.`prog_id` AS `prog_id`,`semmarksheet`.`sem_id` AS `sem_id`,`semmarksheet`.`subj_id` AS `subj_id`,`semmarksheet`.`subj_name` AS `subj_name` from `semmarksheet` where (`semmarksheet`.`grade` <> 'B') */;

/*View structure for view getconfig */

/*!50001 DROP TABLE IF EXISTS `getconfig` */;
/*!50001 DROP VIEW IF EXISTS `getconfig` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getconfig` AS select `config`.`id` AS `id`,if((curdate() between `config`.`startdate` and `config`.`enddate`),1,0) AS `isenabled`,`config`.`configname` AS `configname`,`config`.`startdate` AS `startdate`,`config`.`enddate` AS `enddate` from `config` */;

/*View structure for view getgazzated1 */

/*!50001 DROP TABLE IF EXISTS `getgazzated1` */;
/*!50001 DROP VIEW IF EXISTS `getgazzated1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getgazzated1` AS select `getmarksheet`.`f_id` AS `id`,`getmarksheet`.`dept_id` AS `dept_id`,`getmarksheet`.`dept` AS `dept`,`getmarksheet`.`prog_id` AS `prog_id`,`getmarksheet`.`program` AS `program`,`getmarksheet`.`sem_id` AS `sem_id`,`getmarksheet`.`semester` AS `semester`,`getmarksheet`.`status` AS `STATUS`,`getmarksheet`.`std_id` AS `std_id`,`getmarksheet`.`rollno` AS `rollno`,`getmarksheet`.`fullname` AS `student_name`,`getmarksheet`.`fathername` AS `father_name`,avg(`getmarksheet`.`gp`) AS `gpa`,if((sum((case when (`getmarksheet`.`remarks` = 'FAIL') then 1 else 0 end)) > 3),'Termback',if((avg(`getmarksheet`.`gp`) < 1.33),'Termback',if(sum((`getmarksheet`.`remarks` = 'FAIL')),'Fail','Pass'))) AS `remarks` from (`getmarksheet` join `student` `s` on((`s`.`semester_id` = `getmarksheet`.`sem_id`))) group by `getmarksheet`.`dept`,`getmarksheet`.`program`,`getmarksheet`.`semester`,`getmarksheet`.`rollno` */;

/*View structure for view getpassedstudent */

/*!50001 DROP TABLE IF EXISTS `getpassedstudent` */;
/*!50001 DROP VIEW IF EXISTS `getpassedstudent` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getpassedstudent` AS select `getgazzated`.`id` AS `id`,`getgazzated`.`dept_id` AS `dept_id`,`getgazzated`.`dept` AS `dept`,`getgazzated`.`prog_id` AS `prog_id`,`getgazzated`.`program` AS `program`,`getgazzated`.`sem_id` AS `sem_id`,count(`getgazzated`.`sem_id`) AS `sem_qty`,`getgazzated`.`std_id` AS `std_id`,`getgazzated`.`rollno` AS `rollno`,`getgazzated`.`gender` AS `gender`,`getgazzated`.`student_name` AS `student_name`,`getgazzated`.`father_name` AS `father_name`,avg(`getgazzated`.`gpa`) AS `gpa`,`getgazzated`.`remarks` AS `remarks` from `getgazzated` where (`getgazzated`.`remarks` = 'pass') group by `getgazzated`.`dept`,`getgazzated`.`program`,`getgazzated`.`std_id` having (count(`getgazzated`.`sem_id`) >= 8) */;

/*View structure for view getmarksheett */

/*!50001 DROP TABLE IF EXISTS `getmarksheett` */;
/*!50001 DROP VIEW IF EXISTS `getmarksheett` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getmarksheett` AS select `ml`.`id` AS `id`,`ml`.`std_id` AS `std_id`,`std`.`rollno` AS `rollno`,`p`.`dept_id` AS `dept_id`,`ml`.`f_id` AS `f_id`,(case when (`ef`.`type` = 0) then 'Fresh' else 'Improver' end) AS `form_type`,`d`.`name` AS `dept`,`std`.`prog_id` AS `prog_id`,`p`.`name` AS `program`,`p`.`fullname` AS `pro_fname`,`sb`.`sem_id` AS `sem_id`,`ml`.`status` AS `status`,`sm`.`name` AS `semester`,(case when (`std`.`gender` = 1) then 'Mr.' else 'Miss.' end) AS `gen`,`std`.`fullname` AS `fullname`,`std`.`fathername` AS `fathername`,`sb`.`id` AS `sub_id`,`sb`.`name` AS `subject_name`,(case when (`sb`.`type` = 0) then 'Theory' else 'Practical' end) AS `sub_type`,`ml`.`midmark` AS `midmark`,`ml`.`sessionalmark` AS `sessionalmark`,`ml`.`finalmark` AS `finalmark`,`ml`.`totalmark` AS `totalmark`,(case when (`sb`.`type` = 0) then `findgp`(`ml`.`totalmark`,100) else `findgp`(`ml`.`totalmark`,50) end) AS `gp`,(case when (`sb`.`type` = 0) then `findgrade`(`ml`.`totalmark`,100) else `findgrade`(`ml`.`totalmark`,50) end) AS `grade`,(case when (`sb`.`type` = 0) then `findremarks`(`ml`.`totalmark`,100) else `findremarks`(`ml`.`totalmark`,50) end) AS `remarks`,(case when (`ml`.`status` = 1) then 'Pending' when (`ml`.`status` = 2) then 'Approved By I/C ' when (`ml`.`status` = 3) then 'Rejected By HOD' when (`ml`.`status` = 4) then 'Approved By Controller ' else 'Rejected By Controller' end) AS `marks_status` from ((((((((`marks_ledger` `ml` join `student` `std` on((`std`.`id` = `ml`.`std_id`))) join `subject` `sb` on((`sb`.`id` = `ml`.`sub_id`))) join `program` `p` on((`p`.`id` = `std`.`prog_id`))) join `dept` `d` on((`p`.`dept_id` = `d`.`id`))) join `semester` `sm` on((`sm`.`id` = `sb`.`sem_id`))) join `examform` `ef` on((`ef`.`id` = `ml`.`f_id`))) join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) join (select `getsubjmarks`.`subj_id` AS `subj_id`,max(`getsubjmarks`.`total_marks`) AS `max_marks` from `getsubjmarks` group by `getsubjmarks`.`subj_id`) `ml2` on(((`sb`.`id` = `ml2`.`subj_id`) and (`ml`.`totalmark` = `ml2`.`max_marks`)))) where (`ml`.`status` = 4) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
