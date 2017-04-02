/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.21-log : Database - flowerdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`flowerdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `flowerdb`;

/*Table structure for table `catalog` */

DROP TABLE IF EXISTS `catalog`;

CREATE TABLE `catalog` (
  `catalogid` int(11) NOT NULL AUTO_INCREMENT,
  `catalogname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`catalogid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `catalog` */

insert  into `catalog`(`catalogid`,`catalogname`) values (1,'红玫瑰'),(2,'白玫瑰'),(3,'粉玫瑰'),(4,'紫玫瑰'),(5,'蓝玫瑰');

/*Table structure for table `flower` */

DROP TABLE IF EXISTS `flower`;

CREATE TABLE `flower` (
  `flowerid` int(11) NOT NULL AUTO_INCREMENT,
  `flowername` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `picture` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catalogid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flowerid`),
  KEY `FK_flower` (`catalogid`),
  CONSTRAINT `FK_flower` FOREIGN KEY (`catalogid`) REFERENCES `catalog` (`catalogid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `flower` */

insert  into `flower`(`flowerid`,`flowername`,`price`,`picture`,`catalogid`) values (1,'醉爱-红玫瑰（9支）',119,'h1.jpg',1),(2,'香水百合玫瑰',129,'h2.jpg',1),(3,'唯爱红玫瑰',126,'h3.jpg',1),(4,'梦巴黎红玫瑰',116,'h4.jpg',1),(5,'思念红玫瑰',139,'h5.jpg',1),(6,'愿得一人心玫瑰',136,'h6.jpg',1),(7,'约见',115,'b1.jpg',2),(8,'相知',199,'b2.jpg',2),(9,'相依相伴',176,'b3.jpg',2),(10,'初遇见',159,'b4.jpg',2),(11,'心醉',169,'b5.jpg',2),(12,'夏之恋',187,'b6.jpg',2),(13,'粉红回忆',201,'f1.jpg',3),(14,' 暖',220,'f2.jpg',3),(15,'纯真年代',216,'b1.jpg',4),(17,'蓝魅',139,'l2.jpg',5),(18,'蓝色醉爱',145,'l3.jpg',5),(19,'至尊玫瑰',127,'l4.jpg',5);

/*Table structure for table `guashi` */

DROP TABLE IF EXISTS `guashi`;

CREATE TABLE `guashi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK_guashi` (`userid`),
  CONSTRAINT `FK_guashi` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `guashi` */

insert  into `guashi`(`id`,`userid`) values (48,5);

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `orderitemid` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `flowerid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `FK_orderitem` (`flowerid`),
  KEY `FK_orderitem2` (`orderid`),
  CONSTRAINT `FK_orderitem` FOREIGN KEY (`flowerid`) REFERENCES `flower` (`flowerid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_orderitem2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orderitem` */

insert  into `orderitem`(`orderitemid`,`quantity`,`orderid`,`flowerid`) values (1,333,10,7),(2,6,10,14),(3,2,11,15),(4,23,11,13),(5,20,12,1),(6,12,13,19),(7,3,13,13);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK_orders` (`userid`),
  CONSTRAINT `FK_orders` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`orderid`,`orderdate`,`userid`) values (7,'2015-07-24 17:24:56',1),(8,'2015-07-24 17:25:11',1),(9,'2015-07-24 17:30:33',1),(10,'2015-07-24 17:33:17',1),(11,'2015-07-26 15:16:44',1),(12,'2015-07-30 20:16:14',1),(13,'2015-06-01 21:01:49',1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`userid`,`username`,`password`,`role`) values (1,'ty','56','customer'),(2,'admin','admin666','admin'),(3,'er','666','customer'),(4,'妈妈','666','customer'),(5,'fg','66',NULL);

/*Table structure for table `userdetail` */

DROP TABLE IF EXISTS `userdetail`;

CREATE TABLE `userdetail` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `xb` bit(1) DEFAULT NULL,
  `truename` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `csrq` date DEFAULT NULL,
  `phone` char(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `FK_userdetail` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `userdetail` */

insert  into `userdetail`(`userid`,`xb`,`truename`,`csrq`,`phone`,`email`,`address`) values (1,NULL,'',NULL,'','',''),(3,NULL,'fdg ',NULL,'','','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
