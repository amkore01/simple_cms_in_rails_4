/*
SQLyog Community v9.33 GA
MySQL - 5.1.21-beta-community : Database - simple_cms_development
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`simple_cms_development` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `simple_cms_development`;

/*Table structure for table `pages` */

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pages_on_subject_id` (`subject_id`),
  KEY `index_pages_on_permalink` (`permalink`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `pages` */

insert  into `pages`(`id`,`subject_id`,`name`,`permalink`,`position`,`visible`,`created_at`,`updated_at`) values (1,1,'First Page','1-first-page',1,1,'2015-01-17 00:45:44','2015-01-20 11:26:07'),(2,2,'Second Page','second',2,1,'2015-01-17 01:29:19','2015-01-18 20:16:32'),(6,5,'last page','last',5,1,'2015-01-19 07:59:35','2015-01-19 07:59:35'),(8,2,'Default Page','default',7,1,'2015-01-19 09:55:47','2015-01-19 09:55:47'),(10,5,'magic page','magic',9,1,'2015-01-19 10:41:45','2015-01-19 10:41:45'),(11,5,'wonder','wonder',10,0,'2015-01-19 10:46:07','2015-01-19 10:46:07'),(12,5,'title','title',11,0,'2015-01-19 10:48:13','2015-01-19 10:48:13');

/*Table structure for table `pages_users` */

DROP TABLE IF EXISTS `pages_users`;

CREATE TABLE `pages_users` (
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_pages_users_on_page_id_and_user_id` (`page_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pages_users` */

insert  into `pages_users`(`page_id`,`user_id`) values (1,1);

/*Table structure for table `schema_migrations` */

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schema_migrations` */

insert  into `schema_migrations`(`version`) values ('20150116172647'),('20150116173245'),('20150116182750'),('20150116182810'),('20150116182828'),('20150117014910'),('20150117030429'),('20150119024542');

/*Table structure for table `section_edits` */

DROP TABLE IF EXISTS `section_edits`;

CREATE TABLE `section_edits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_section_edits_on_section_id_and_user_id` (`section_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `section_edits` */

insert  into `section_edits`(`id`,`section_id`,`user_id`,`summary`,`created_at`,`updated_at`) values (1,1,1,'Test Edit','2015-01-17 03:33:59','2015-01-17 03:38:42'),(2,1,1,'ch-ch-ch-changes','2015-01-17 03:45:14','2015-01-17 03:45:14');

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `content_type` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sections_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `sections` */

insert  into `sections`(`id`,`page_id`,`name`,`position`,`visible`,`content_type`,`content`,`created_at`,`updated_at`) values (1,1,'Section One',1,1,'HTML','<p>This is first section.</p> \r\n<p>Its working correctly.</p>','2015-01-17 03:23:11','2015-01-20 11:26:07'),(2,2,'Section second',2,1,'text','magic second','2015-01-18 21:18:36','2015-01-18 21:18:36');

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `subjects` */

insert  into `subjects`(`id`,`name`,`position`,`visible`,`created_at`,`updated_at`) values (1,'First Subject',1,1,'2015-01-17 00:36:14','2015-01-20 03:44:55'),(2,'Second Subject',2,1,'2015-01-17 00:39:10','2015-01-17 13:56:13'),(5,'Fourth Subject',3,1,'2015-01-19 00:24:04','2015-01-19 00:24:04');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`created_at`,`updated_at`,`password_digest`) values (1,'avadhut','kore','amkore01@gmail.com',NULL,'2015-01-17 02:52:05','2015-01-19 06:09:09','$2a$10$3b8GI0H0YHqvyWMkM9Jszun6e6cAmq8rdwCIz7o1HjZsdDboxHnHG');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
