-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: CommitteServer
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'normal_manager'),(1,'superuser');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,2,19),(29,2,20),(30,2,21),(31,2,22),(32,2,23),(33,2,24),(34,2,25),(35,2,26),(36,2,27);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add student',7,'add_student'),(20,'Can change student',7,'change_student'),(21,'Can delete student',7,'delete_student'),(22,'Can add project',8,'add_project'),(23,'Can change project',8,'change_project'),(24,'Can delete project',8,'delete_project'),(25,'Can add account',9,'add_account'),(26,'Can change account',9,'change_account'),(27,'Can delete account',9,'delete_account'),(28,'Can add department',10,'add_department'),(29,'Can change department',10,'change_department'),(30,'Can delete department',10,'delete_department'),(31,'Can add roomrent',11,'add_roomrent'),(32,'Can change roomrent',11,'change_roomrent'),(33,'Can delete roomrent',11,'delete_roomrent');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$R2JdXOjxyrSA$F7DPGymUa8y56V2vY0/Xq2TaCvVNmkfTdRJKkSKiHM0=','2019-07-16 08:55:14.378469',1,'tianwen','','','tianwen532@163.com',1,1,'2019-04-30 11:11:00.000000'),(2,'pbkdf2_sha256$36000$vMuyaPcymRfW$sHhopmHFIwWM3i0FRsZXPw/79FgisEFEI/AYND/8Ir0=','2019-04-30 16:09:13.098181',0,'user2','','','',1,1,'2019-04-30 16:04:00.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,1,1),(1,2,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,19),(2,2,20),(3,2,21),(4,2,22),(5,2,23),(6,2,24),(7,2,25),(8,2,26),(9,2,27);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-30 11:11:58.240150','1','1650176',1,'[{\"added\": {}}]',7,1),(2,'2019-04-30 11:12:32.446233','1','1650176',2,'[{\"changed\": {\"fields\": [\"nickname\", \"email\", \"wechat\", \"phone\", \"pwd\", \"ismanager\"]}}]',7,1),(3,'2019-04-30 15:41:51.657252','10190101','10190101',1,'[{\"added\": {}}]',8,1),(4,'2019-04-30 15:54:15.627292','a10190101','a10190101',1,'[{\"added\": {}}]',9,1),(5,'2019-04-30 15:56:53.731523','a10190101','a10190101',2,'[{\"changed\": {\"fields\": [\"stime\", \"etime\"]}}]',9,1),(6,'2019-04-30 16:02:12.369318','10190101','10190101',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',8,1),(7,'2019-04-30 16:02:22.310130','10190101','10190101',2,'[{\"changed\": {\"fields\": [\"checking\", \"borrow\"]}}]',8,1),(8,'2019-04-30 16:02:47.332071','10190101','10190101',2,'[{\"changed\": {\"fields\": [\"etime\"]}}]',8,1),(9,'2019-04-30 16:04:13.541985','2','user2',1,'[{\"added\": {}}]',4,1),(10,'2019-04-30 16:05:12.848533','2','user2',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,1),(11,'2019-04-30 16:05:36.363159','2','user2',2,'[{\"changed\": {\"fields\": [\"is_staff\"]}}]',4,1),(12,'2019-04-30 16:05:58.770147','1','superuser',1,'[{\"added\": {}}]',2,1),(13,'2019-04-30 16:06:35.165704','2','normal_manager',1,'[{\"added\": {}}]',2,1),(14,'2019-04-30 16:06:55.019658','2','user2',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(15,'2019-04-30 16:07:44.331827','1','tianwen',2,'[{\"changed\": {\"fields\": [\"groups\", \"last_login\"]}}]',4,1),(16,'2019-04-30 16:09:02.512046','2','normal_manager',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',2,1),(17,'2019-04-30 16:10:10.656041','2','normal_manager',2,'[{\"changed\": {\"fields\": [\"permissions\"]}}]',2,1),(18,'2019-04-30 16:10:16.331601','2','normal_manager',2,'[]',2,1),(19,'2019-05-01 02:17:32.672595','01','01',1,'[{\"added\": {}}]',10,1),(20,'2019-05-01 02:17:37.913951','02','02',1,'[{\"added\": {}}]',10,1),(21,'2019-05-01 02:17:47.059414','03','03',1,'[{\"added\": {}}]',10,1),(22,'2019-05-01 02:17:52.102004','04','04',1,'[{\"added\": {}}]',10,1),(23,'2019-05-01 02:17:58.737061','05','05',1,'[{\"added\": {}}]',10,1),(24,'2019-05-01 02:18:04.997889','07','07',1,'[{\"added\": {}}]',10,1),(25,'2019-05-01 02:18:09.323457','08','08',1,'[{\"added\": {}}]',10,1),(26,'2019-05-01 02:18:13.267765','09','09',1,'[{\"added\": {}}]',10,1),(27,'2019-05-01 02:18:18.990548','10','10',1,'[{\"added\": {}}]',10,1),(28,'2019-05-01 02:18:23.483393','11','11',1,'[{\"added\": {}}]',10,1),(29,'2019-05-01 02:18:36.915421','05','05',2,'[{\"changed\": {\"fields\": [\"dname\"]}}]',10,1),(30,'2019-05-01 02:18:43.967712','04','04',2,'[{\"changed\": {\"fields\": [\"dname\"]}}]',10,1),(31,'2019-05-01 02:18:49.556610','06','06',1,'[{\"added\": {}}]',10,1),(32,'2019-05-01 02:52:24.104793','10190102','10190102',1,'[{\"added\": {}}]',8,1),(33,'2019-05-01 02:52:38.125325','10190102','10190102',2,'[{\"changed\": {\"fields\": [\"checking\"]}}]',8,1),(34,'2019-05-01 02:52:47.410835','10190102','10190102',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',8,1),(35,'2019-05-01 13:05:52.684642','10190103','10190103',2,'[{\"changed\": {\"fields\": [\"pname\", \"stime\", \"etime\", \"place\", \"department\", \"introduce\", \"link\", \"checking\", \"borrow\", \"status\"]}}]',8,1),(36,'2019-05-01 13:07:22.527695','10190103','10190103',3,'',8,1),(37,'2019-05-01 13:08:31.306979','10190103','10190103',2,'[{\"changed\": {\"fields\": [\"checking\", \"status\"]}}]',8,1),(38,'2019-05-01 13:08:57.692451','10190103','10190103',2,'[{\"changed\": {\"fields\": [\"stime\", \"etime\"]}}]',8,1),(39,'2019-05-02 05:29:10.473551','a10190102','a10190102',2,'[{\"changed\": {\"fields\": [\"reason\"]}}]',9,1),(40,'2019-05-02 05:29:31.519813','A10190101','A10190101',2,'[{\"changed\": {\"fields\": [\"aid\"]}}]',9,1),(41,'2019-05-02 05:29:40.565341','A10190102','A10190102',2,'[{\"changed\": {\"fields\": [\"aid\"]}}]',9,1),(42,'2019-05-02 05:29:57.693825','P10190101','P10190101',2,'[{\"changed\": {\"fields\": [\"pid\"]}}]',8,1),(43,'2019-05-02 05:30:01.910906','P10190103','P10190103',2,'[{\"changed\": {\"fields\": [\"pid\"]}}]',8,1),(44,'2019-05-02 05:30:05.616094','P10190103','P10190103',2,'[{\"changed\": {\"fields\": [\"pid\"]}}]',8,1),(45,'2019-05-02 05:30:08.955073','P10190103','P10190103',2,'[{\"changed\": {\"fields\": [\"pid\"]}}]',8,1),(46,'2019-05-02 05:30:14.736403','P10190103','P10190103',2,'[{\"changed\": {\"fields\": [\"pid\"]}}]',8,1),(47,'2019-05-02 05:30:32.031747','10190103','10190103',3,'',8,1),(48,'2019-05-02 05:30:36.009227','P10190102','P10190102',2,'[{\"changed\": {\"fields\": [\"pid\"]}}]',8,1),(49,'2019-05-02 05:30:43.787420','10190101','10190101',3,'',8,1),(50,'2019-05-02 05:30:43.789821','10190102','10190102',3,'',8,1),(51,'2019-05-02 05:30:52.955688','P101901012','P101901012',2,'[{\"changed\": {\"fields\": [\"pid\"]}}]',8,1),(52,'2019-05-02 05:30:57.214182','P101901012','P101901012',3,'',8,1),(53,'2019-05-02 05:31:04.702200','P10190103','P10190103',2,'[{\"changed\": {\"fields\": [\"introduce\"]}}]',8,1),(54,'2019-05-09 09:56:48.692659','1650176','1650176',2,'[{\"changed\": {\"fields\": [\"department\", \"job\", \"department2\"]}}]',7,1),(55,'2019-05-09 09:57:30.265231','1650176','1650176',2,'[]',7,1),(56,'2019-05-09 10:00:25.282666','12','12',1,'[{\"added\": {}}]',10,1),(57,'2019-05-09 10:00:30.676629','13','13',1,'[{\"added\": {}}]',10,1),(58,'2019-05-09 10:20:36.856351','1650183','1650183',2,'[{\"changed\": {\"fields\": [\"job\"]}}]',7,1),(59,'2019-05-09 10:23:51.425118','1650183','1650183',3,'',7,1),(60,'2019-05-09 10:29:01.194783','168','168',2,'[{\"changed\": {\"fields\": [\"job\"]}}]',7,1),(61,'2019-05-09 10:30:04.401158','1650176','1650176',2,'[{\"changed\": {\"fields\": [\"job\", \"isjobed\", \"jobedtime\"]}}]',7,1),(62,'2019-05-09 10:30:15.625036','168','168',3,'',7,1),(63,'2019-05-09 10:34:37.136903','168','168',3,'',7,1),(64,'2019-05-09 10:34:46.971821','1650176','1650176',2,'[]',7,1),(65,'2019-07-15 10:16:15.757480','P10190102','P10190102',2,'[]',8,1),(66,'2019-07-15 10:20:44.758229','R101','Roomrent object',2,'[{\"changed\": {\"fields\": [\"rid\"]}}]',11,1),(67,'2019-07-15 10:20:56.072050','RR','Roomrent object',3,'',11,1),(68,'2019-07-16 07:56:44.235848','adf','adf',3,'',8,1),(69,'2019-07-16 07:58:57.761125','adfs','adfs',3,'',8,1),(70,'2019-07-16 07:58:57.763540','adfsdaf','adfsdaf',3,'',8,1),(71,'2019-07-16 07:58:57.764937','adfsdafd','adfsdafd',3,'',8,1),(72,'2019-07-16 08:04:29.112089','P02190101','P02190101',3,'',8,1),(73,'2019-07-16 08:04:29.113927','P02190102','P02190102',3,'',8,1),(74,'2019-07-16 08:04:29.114917','P02190103','P02190103',3,'',8,1),(75,'2019-07-16 08:04:29.116220','P10190105','P10190105',3,'',8,1),(76,'2019-07-16 08:04:29.118162','P10190106','P10190106',3,'',8,1),(77,'2019-07-16 08:05:00.633148','P02190101','P02190101',3,'',8,1),(78,'2019-07-16 08:05:00.636164','P02190102','P02190102',3,'',8,1),(79,'2019-07-16 08:21:28.201797','A12190201','A12190201',3,'',9,1),(80,'2019-07-16 08:21:28.203384','A12190202','A12190202',3,'',9,1),(81,'2019-07-16 08:21:28.206087','A12190203','A12190203',3,'',9,1),(82,'2019-07-16 08:21:28.207384','A12190204','A12190204',3,'',9,1),(83,'2019-07-16 08:21:28.208769','adfsdf','adfsdf',3,'',9,1),(84,'2019-07-16 08:21:28.209673','afds','afds',3,'',9,1),(85,'2019-07-16 08:21:40.333827','A10190201','A10190201',2,'[{\"changed\": {\"fields\": [\"aid\"]}}]',9,1),(86,'2019-07-16 08:21:45.336218','A10190101','A10190101',3,'',9,1),(87,'2019-07-16 08:24:20.645901','A12190201','A12190201',3,'',9,1),(88,'2019-07-16 08:24:20.647431','A12190202','A12190202',3,'',9,1),(89,'2019-07-16 08:24:28.359204','A12190201','A12190201',2,'[{\"changed\": {\"fields\": [\"aid\"]}}]',9,1),(90,'2019-07-16 08:24:32.582794','A10190201','A10190201',3,'',9,1),(91,'2019-07-16 08:31:14.353002','R12191-101','Roomrent object',3,'',11,1),(92,'2019-07-16 08:31:14.354508','R101','Roomrent object',3,'',11,1),(93,'2019-07-16 08:35:44.830529','R1219010204','Roomrent object',3,'',11,1),(94,'2019-07-16 08:35:44.832402','R1219010203','Roomrent object',3,'',11,1),(95,'2019-07-16 08:35:44.834752','R1219010202','Roomrent object',3,'',11,1),(96,'2019-07-16 08:35:44.836376','R1219010201','Roomrent object',3,'',11,1),(97,'2019-07-16 08:42:17.940130','R1219050401','Roomrent object',2,'[]',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'mainsite','account'),(10,'mainsite','department'),(8,'mainsite','project'),(11,'mainsite','roomrent'),(7,'mainsite','student'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-30 11:10:44.124851'),(2,'auth','0001_initial','2019-04-30 11:10:44.926633'),(3,'admin','0001_initial','2019-04-30 11:10:44.976729'),(4,'admin','0002_logentry_remove_auto_add','2019-04-30 11:10:44.988228'),(5,'contenttypes','0002_remove_content_type_name','2019-04-30 11:10:45.031348'),(6,'auth','0002_alter_permission_name_max_length','2019-04-30 11:10:45.050405'),(7,'auth','0003_alter_user_email_max_length','2019-04-30 11:10:45.074241'),(8,'auth','0004_alter_user_username_opts','2019-04-30 11:10:45.086234'),(9,'auth','0005_alter_user_last_login_null','2019-04-30 11:10:45.109471'),(10,'auth','0006_require_contenttypes_0002','2019-04-30 11:10:45.110832'),(11,'auth','0007_alter_validators_add_error_messages','2019-04-30 11:10:45.118387'),(12,'auth','0008_alter_user_username_max_length','2019-04-30 11:10:45.159327'),(13,'mainsite','0001_initial','2019-04-30 11:10:45.170854'),(14,'mainsite','0002_auto_20190429_2158','2019-04-30 11:10:45.204683'),(15,'mainsite','0003_auto_20190429_2201','2019-04-30 11:10:45.209443'),(16,'sessions','0001_initial','2019-04-30 11:10:45.224445'),(17,'mainsite','0004_auto_20190430_2327','2019-04-30 15:27:13.379186'),(18,'mainsite','0005_account','2019-04-30 15:50:45.126223'),(19,'mainsite','0006_auto_20190430_2356','2019-04-30 15:56:33.646521'),(20,'mainsite','0007_auto_20190501_0001','2019-04-30 16:01:39.101543'),(21,'mainsite','0008_department','2019-05-01 02:13:32.426983'),(22,'mainsite','0009_auto_20190509_1751','2019-05-09 09:51:53.583443'),(23,'mainsite','0010_auto_20190509_1755','2019-05-09 09:55:40.548750'),(24,'mainsite','0011_auto_20190509_1810','2019-05-09 10:10:18.825052'),(25,'mainsite','0012_auto_20190509_1827','2019-05-09 10:29:21.606882'),(26,'mainsite','0013_roomrent','2019-07-15 09:46:53.967060'),(27,'mainsite','0014_roomrent_sid','2019-07-15 10:07:00.408095'),(28,'mainsite','0015_auto_20190715_1807','2019-07-15 10:07:32.353544'),(29,'mainsite','0016_auto_20190715_1819','2019-07-15 10:20:25.232956'),(30,'mainsite','0017_auto_20190715_1820','2019-07-15 10:20:25.263389'),(31,'mainsite','0018_auto_20190716_1634','2019-07-16 08:34:22.815308'),(32,'mainsite','0019_roomrent_status','2019-07-16 08:40:33.721724');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0r5c7x42pn0aasj7xbk66nldwd7nnncj','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-05-02 05:27:52.034751'),('4313wqmc7ytk2e7uq0gyidj2e3kpbmkc','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-05-02 06:32:35.709453'),('4fxulccbh7jjcp10z7bapzun205dysu9','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-05-02 05:53:57.125889'),('4mhcrrw5wmr16vgy1jg3ih6sjwus38uh','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-07-16 08:51:25.663483'),('6adcdz7jusy02id2x0g1d8t0108gjcck','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-07-15 10:24:36.032236'),('8lokfshnq0br64zbrl5dmpi5cwp0c30w','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-05-09 10:44:58.989662'),('9x89rc4mz26vkgmr40uv7sd9awxgs2a0','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-07-15 02:10:46.110979'),('hdj2t5gv7se113wzd0btmygf8rg4zwse','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-07-16 08:08:49.905117'),('j2uczccjxznfhmvjgttoz6my2vs4ks5k','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-07-16 08:27:53.050521'),('lnxwidizdt5hhui2ic70p6ghzxtn1d40','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-05-16 06:01:37.034275'),('miff0jcu2mkoj6jy1n4267ns7dssjulv','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-05-16 05:45:14.412885'),('p3wgzuz9x9k6mnqvvxvncevdia0140aq','ZGI5MmExZWE3ZDQwYWQyN2M0ZTkyN2I1NzI0NjcyODdmN2VjZmZlMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1MmE0M2EzZGE3NzZjYTNiOTdjNTYxZGQzM2UxMzM4MWM2M2YyYjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-07-29 10:28:35.426349'),('qfkybovla2o6c60wbpnjha9rrqbnmphe','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-05-02 05:38:39.725439'),('rubii8zxgvtybgvm86n01e8zkk8prs6i','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-05-02 06:19:46.129669'),('spsm696fjnjhh1yh82l3dz3d31vvtija','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-07-15 02:42:41.200615'),('ts01n8dy79zqd7veme8ou4w5x5z7ir97','YzU3N2ExNWMyMjUzYzk1OGYwMjU0MDhkYWU5YWM0ODgyNzFjM2Y5Yzp7InRoaXNfc2lkIjoiMTY1MDE3NiIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiX2F1dGhfdXNlcl9oYXNoIjoiMDUyYTQzYTNkYTc3NmNhM2I5N2M1NjFkZDMzZTEzMzgxYzYzZjJiMCIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkifQ==','2019-07-16 07:39:34.947235'),('wkkglgwrq4ksiovxv74pjgm1087aogw4','ODU5MDRlYTdhOTM3ZWU3ZWI3NDM2NWU1NTVlOTM0MDRjNWIyMjliZDp7InRoaXNfc2lkIjoiMTY1MDE3NiIsInRoaXNfc25hbWUiOiJcdThkNzVcdTY1ODdcdTU5MjkiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=','2019-07-15 09:57:28.866537');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_account`
--

DROP TABLE IF EXISTS `mainsite_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_account` (
  `aid` varchar(10) NOT NULL,
  `reason` longtext NOT NULL,
  `money` double NOT NULL,
  `checking` int(11) NOT NULL,
  `stime` date DEFAULT NULL,
  `etime` date DEFAULT NULL,
  `pid_id` varchar(10) NOT NULL,
  `sid_id` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `mainsite_account_pid_id_3e18b9f1_fk_mainsite_project_pid` (`pid_id`),
  KEY `mainsite_account_sid_id_8d3fb125_fk_mainsite_student_sid` (`sid_id`),
  CONSTRAINT `mainsite_account_pid_id_3e18b9f1_fk_mainsite_project_pid` FOREIGN KEY (`pid_id`) REFERENCES `mainsite_project` (`pid`),
  CONSTRAINT `mainsite_account_sid_id_8d3fb125_fk_mainsite_student_sid` FOREIGN KEY (`sid_id`) REFERENCES `mainsite_student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_account`
--

LOCK TABLES `mainsite_account` WRITE;
/*!40000 ALTER TABLE `mainsite_account` DISABLE KEYS */;
INSERT INTO `mainsite_account` VALUES ('A12190201','网站编写费用，相关打印费用，网站上线云服务器费用',1200,0,NULL,NULL,'P10190101','1650176',0);
/*!40000 ALTER TABLE `mainsite_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_department`
--

DROP TABLE IF EXISTS `mainsite_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_department` (
  `did` varchar(2) NOT NULL,
  `dname` varchar(15) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_department`
--

LOCK TABLES `mainsite_department` WRITE;
/*!40000 ALTER TABLE `mainsite_department` DISABLE KEYS */;
INSERT INTO `mainsite_department` VALUES ('01','文艺部'),('02','学术部'),('03','体育部'),('04','外联部'),('05','国际部'),('06','新媒体中心'),('07','组织部'),('08','班联部'),('09','实践部'),('10','信息事务部'),('11','监察部'),('12','主席团'),('13','无');
/*!40000 ALTER TABLE `mainsite_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_project`
--

DROP TABLE IF EXISTS `mainsite_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_project` (
  `pid` varchar(10) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `stime` date NOT NULL,
  `etime` date NOT NULL,
  `place` varchar(50) NOT NULL,
  `pernum` int(10) unsigned NOT NULL,
  `department` varchar(2) NOT NULL,
  `introduce` longtext NOT NULL,
  `link` longtext,
  `checking` int(11) NOT NULL,
  `borrow` int(11) NOT NULL,
  `sid_id` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `mainsite_project_sid_id_320d1f5a_fk_mainsite_student_sid` (`sid_id`),
  CONSTRAINT `mainsite_project_sid_id_320d1f5a_fk_mainsite_student_sid` FOREIGN KEY (`sid_id`) REFERENCES `mainsite_student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_project`
--

LOCK TABLES `mainsite_project` WRITE;
/*!40000 ALTER TABLE `mainsite_project` DISABLE KEYS */;
INSERT INTO `mainsite_project` VALUES ('P10190101','学生会网站编写','2019-01-01','2019-07-01','同济大学嘉定校区',1,'10','编写完成同济大学经济与管理学院学生会办事网站','192.168.32.129:8000/admin',1,1,'1650176',1),('P10190102','学生会网站维护','2019-05-01','2020-06-30','同济大学嘉定校区',1,'10','学生会网站维护，功能增补，页面美化','',1,0,'1650176',1),('P10190103','学生会网站上线','2019-05-01','2019-05-02','同济大学嘉定校区',1,'10','学生会网站上挂云服务器D','',1,0,'1650176',1),('P10190104','测试','2019-01-01','2019-10-01','阿道夫',12,'10','asfdgh','adfs',0,0,'1650176',0),('P10190105','afd','2019-01-01','2019-01-01','afd',12,'10','fda','',0,0,'1650176',0);
/*!40000 ALTER TABLE `mainsite_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_roomrent`
--

DROP TABLE IF EXISTS `mainsite_roomrent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_roomrent` (
  `rid` varchar(15) NOT NULL,
  `day` date NOT NULL,
  `room` varchar(10) NOT NULL,
  `type` int(11) NOT NULL,
  `stime` varchar(8) NOT NULL,
  `etime` varchar(8) NOT NULL,
  `pid_id` varchar(10) NOT NULL,
  `sid_id` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `mainsite_roomrent_pid_id_798ff2e8_fk_mainsite_project_pid` (`pid_id`),
  KEY `mainsite_roomrent_sid_id_0fc6331e_fk_mainsite_student_sid` (`sid_id`),
  CONSTRAINT `mainsite_roomrent_pid_id_798ff2e8_fk_mainsite_project_pid` FOREIGN KEY (`pid_id`) REFERENCES `mainsite_project` (`pid`),
  CONSTRAINT `mainsite_roomrent_sid_id_0fc6331e_fk_mainsite_student_sid` FOREIGN KEY (`sid_id`) REFERENCES `mainsite_student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_roomrent`
--

LOCK TABLES `mainsite_roomrent` WRITE;
/*!40000 ALTER TABLE `mainsite_roomrent` DISABLE KEYS */;
INSERT INTO `mainsite_roomrent` VALUES ('R1219050401','2019-05-04','a301',0,'07:16','08:20','P10190101','1650176',0);
/*!40000 ALTER TABLE `mainsite_roomrent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainsite_student`
--

DROP TABLE IF EXISTS `mainsite_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainsite_student` (
  `sid` varchar(10) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `wechat` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `ismanager` int(11) NOT NULL,
  `department` varchar(2) DEFAULT NULL,
  `department2` varchar(2) DEFAULT NULL,
  `job` varchar(2) DEFAULT NULL,
  `isjobed` int(11) NOT NULL,
  `jobedtime` date DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainsite_student`
--

LOCK TABLES `mainsite_student` WRITE;
/*!40000 ALTER TABLE `mainsite_student` DISABLE KEYS */;
INSERT INTO `mainsite_student` VALUES ('1650176','赵文天','TIANWEN','tianwen532@163.com','ZWT_TIANWEN','18019081964','YUNDAGAOKE',1,'12','13','5',1,'2018-03-18');
/*!40000 ALTER TABLE `mainsite_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-16  6:17:49
