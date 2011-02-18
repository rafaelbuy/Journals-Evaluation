-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: evaluation
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.9-log

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'técnico');
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (215,1,42),(214,1,29),(213,1,34),(212,1,31),(211,1,47),(210,1,40),(209,1,36),(208,1,46),(207,1,41),(206,1,35),(205,1,43),(204,1,28),(203,1,45),(202,1,44),(201,1,32),(200,1,33),(199,1,48),(198,1,30);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_403f60f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add log entry',8,'add_logentry'),(23,'Can change log entry',8,'change_logentry'),(24,'Can delete log entry',8,'delete_logentry'),(25,'Can add flat page',9,'add_flatpage'),(26,'Can change flat page',9,'change_flatpage'),(27,'Can delete flat page',9,'delete_flatpage'),(28,'Can add evaluation',10,'add_evaluation'),(29,'Can change evaluation',10,'change_evaluation'),(30,'Can delete evaluation',10,'delete_evaluation'),(31,'Can add followup',11,'add_followup'),(32,'Can change followup',11,'change_followup'),(33,'Can delete followup',11,'delete_followup'),(34,'Can add media',12,'add_media'),(35,'Can change media',12,'change_media'),(36,'Can delete media',12,'delete_media'),(37,'Can add registration profile',13,'add_registrationprofile'),(38,'Can change registration profile',13,'change_registrationprofile'),(39,'Can delete registration profile',13,'delete_registrationprofile'),(40,'Can add type',14,'add_type'),(41,'Can change type',14,'change_type'),(42,'Can delete type',14,'delete_type'),(43,'Can add context',15,'add_context'),(44,'Can change context',15,'change_context'),(45,'Can delete context',15,'delete_context'),(46,'Can add status',16,'add_status'),(47,'Can change status',16,'change_status'),(48,'Can delete status',16,'delete_status'),(49,'Can list all evaluation',10,'list_all_evaluation'),(50,'Can set status',10,'can_set_status');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','Jamil ','Atta','atta.jamil@gmail.com','sha1$dceba$01e855f6d5889da8f762f241cc376129c5c59a80',1,1,1,'2011-02-09 17:18:44','2010-11-18 12:54:05'),(32,'cinthyaperona','Cinthya','Perona','cinthya.perona@scielo.org','sha1$7b3ac$a0c111121a6d308e5a164df64a41e050582b9323',1,1,0,'2011-02-01 18:07:47','2011-02-01 18:07:47'),(33,'fabiana.montanari','Fabiana','Montanari','abiana.montanari@scielo.org','sha1$ce33f$7f511be289addbe102eed1c20cca8a0397bdd3c8',1,1,1,'2011-02-01 18:08:02','2011-02-01 18:08:02'),(31,'deniseperes','Denise','Peres','denise.peres@scielo.org','sha1$c41aa$d83c855fb431e173d949b4b0abe5662794baf4ef',1,1,0,'2011-02-01 18:12:51','2011-02-01 18:07:23'),(34,'Teste','','','atta.jamil@gmail.com','sha1$4f986$cab818600167f9acc8c192358d9f20581238a786',0,1,0,'2011-02-16 19:36:44','2011-02-16 19:07:10');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (23,32,1),(24,31,1);
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=481 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (480,33,32),(479,33,19),(478,33,34),(477,33,35),(476,33,36),(475,33,37),(474,33,30),(473,33,31),(472,33,18),(471,33,33),(470,33,16),(469,33,17),(468,33,14),(467,33,15),(466,33,38),(465,33,39),(464,33,10),(463,33,11),(462,33,12),(461,33,13),(460,33,8),(459,33,9),(458,33,6),(457,33,7),(456,33,4),(455,33,5),(454,33,2),(453,33,3),(452,33,1),(451,33,41),(450,33,40),(449,33,29),(448,33,42),(447,33,45),(446,33,44),(445,33,47),(444,33,46),(443,33,23),(442,33,22),(441,33,21),(440,33,20),(439,33,27),(438,33,26),(437,33,25),(436,33,24),(435,33,43),(434,33,48),(433,33,28);
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
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2011-01-07 18:32:25',1,12,'8','Media object',2,'Modificado file.'),(2,'2011-01-10 16:43:30',1,11,'39','39',2,'Adicionado media \"Media object\"'),(3,'2011-01-10 16:43:47',1,11,'47','47',2,'Adicionado media \"Media object\"'),(4,'2011-01-10 16:45:46',1,11,'47','47',2,'Adicionado media \"Media object\"'),(5,'2011-01-10 19:15:40',1,3,'2','jamil',3,''),(6,'2011-01-10 19:15:40',1,3,'3','test1',3,''),(7,'2011-01-10 19:31:24',1,3,'4','test',3,''),(8,'2011-01-10 19:40:00',1,3,'5','test1',3,''),(9,'2011-01-10 19:40:00',1,3,'6','test2',3,''),(10,'2011-01-10 19:58:45',1,7,'1','scieo.evaluation',2,'Modificado domain e name.'),(11,'2011-01-10 19:59:03',1,3,'7','test1',3,''),(12,'2011-01-10 20:00:14',1,7,'1','scielo.evaluation',2,'Modificado domain.'),(13,'2011-01-10 20:18:00',1,3,'8','test1',3,''),(14,'2011-01-10 20:18:00',1,3,'9','test2',3,''),(15,'2011-01-11 12:32:03',1,3,'10','test3',3,''),(16,'2011-01-11 13:13:03',1,3,'11','test1',3,''),(17,'2011-01-11 13:18:43',1,3,'12','test3',3,''),(18,'2011-01-11 13:20:37',1,3,'13','test3',3,''),(19,'2011-01-11 13:21:02',1,3,'14','test1',3,''),(20,'2011-01-11 13:21:56',1,3,'15','test1',3,''),(21,'2011-01-11 13:23:33',1,3,'16','test1',3,''),(22,'2011-01-11 15:32:47',1,3,'17','test1',3,''),(23,'2011-01-11 15:34:24',1,3,'18','test1',3,''),(24,'2011-01-11 15:36:53',1,3,'19','test1',3,''),(25,'2011-01-11 15:39:34',1,3,'20','test1',3,''),(26,'2011-01-11 15:41:45',1,3,'21','test1',3,''),(27,'2011-01-11 17:32:53',1,7,'1','localhost',2,'Modificado domain.'),(28,'2011-01-11 18:17:10',1,3,'22','Test1',3,''),(29,'2011-01-11 18:20:47',1,3,'23','Test1',3,''),(30,'2011-01-11 18:23:28',1,3,'24','test1',3,''),(31,'2011-01-11 18:24:50',1,7,'1','localhost:8000',2,'Modificado domain.'),(32,'2011-01-11 18:24:59',1,3,'25','test1',3,''),(33,'2011-01-12 10:22:20',1,3,'26','test1',3,''),(34,'2011-01-14 15:52:15',1,7,'2','evaluation',1,''),(35,'2011-01-14 15:52:17',1,9,'1','/new/jamil -- Opa',1,''),(36,'2011-01-14 15:57:51',1,9,'1','/new/jamil -- Opa',2,'No fields changed.'),(37,'2011-01-14 16:03:06',1,9,'1','/new/jamil -- Opa',2,'No fields changed.'),(38,'2011-01-14 16:03:09',1,9,'1','/new/jamil -- Opa',2,'No fields changed.'),(39,'2011-01-14 16:31:13',1,9,'2','Teste -- /about/',1,''),(40,'2011-01-14 16:41:35',1,7,'2','evaluation',3,''),(41,'2011-01-14 16:41:45',1,9,'1','/new/jamil -- Opa',2,'No fields changed.'),(42,'2011-01-14 16:41:50',1,9,'1','/new/jamil -- Opa',2,'No fields changed.'),(43,'2011-01-14 16:44:01',1,9,'2','Teste -- /about/',2,'Changed sites.'),(44,'2011-01-14 16:47:06',1,9,'2','Teste -- /about/',2,'No fields changed.'),(45,'2011-01-14 16:47:32',1,7,'1','evaluation',2,'Changed domain.'),(46,'2011-01-14 16:48:12',1,7,'1','evaluation',2,'No fields changed.'),(47,'2011-01-14 16:48:14',1,7,'1','evaluation',2,'No fields changed.'),(48,'2011-01-14 17:05:47',1,9,'2','Teste -- /about/',2,'No fields changed.'),(49,'2011-01-14 17:07:56',1,9,'1','/new/jamil -- Opa',3,''),(50,'2011-01-14 17:07:56',1,9,'2','Teste -- /about/',3,''),(51,'2011-01-14 17:13:31',1,9,'3','/test -- Teste',1,''),(52,'2011-01-14 17:16:39',1,9,'3','/test -- Teste',2,'No fields changed.'),(53,'2011-01-14 17:16:40',1,9,'3','/test -- Teste',2,'No fields changed.'),(54,'2011-01-14 17:19:40',1,9,'4','teste -- tesastert',1,''),(55,'2011-01-14 17:20:06',1,9,'4','teste -- tesastert',3,''),(56,'2011-01-14 17:40:55',1,9,'5','/about -- About',1,''),(57,'2011-01-14 18:00:44',1,9,'5','/about/ -- About',2,'Modificado url.'),(58,'2011-01-14 18:02:39',1,9,'6','/jamil/ -- jaskjdkajsk',1,''),(59,'2011-01-28 10:20:23',1,13,'27','Registration information for Teste',3,''),(60,'2011-01-28 10:20:27',1,13,'26','Registration information for test1',3,''),(61,'2011-01-28 10:31:45',1,10,'2','request_evaluation',1,''),(62,'2011-01-28 10:31:48',1,10,'2','request_evaluation',2,'No fields changed.'),(63,'2011-01-28 13:23:46',1,14,'1','Type object',1,''),(64,'2011-01-28 13:23:48',1,14,'1','Type object',2,'Nenhum campo modificado.'),(65,'2011-01-28 13:24:05',1,14,'2','Type object',1,''),(66,'2011-01-28 13:31:34',1,14,'1','Avaliação para inclusão',1,''),(67,'2011-01-28 13:31:38',1,14,'2','Avaliação por área temática',1,''),(68,'2011-01-28 16:04:37',1,14,'1','Avaliação para inclusão',1,''),(69,'2011-01-28 16:04:41',1,14,'2','Avaliação por área temática',1,''),(70,'2011-01-28 16:05:14',1,15,'1','Context object',1,''),(71,'2011-01-28 16:05:36',1,15,'2','Context object',1,''),(72,'2011-01-28 16:44:35',1,15,'3','Confirmação de recebimento recurso',1,''),(73,'2011-01-28 16:58:14',1,15,'4','Confirmação de recebimento de fascículos',1,''),(74,'2011-01-28 16:58:37',1,15,'5','Confirmação de inclusão no processo',1,''),(75,'2011-01-28 16:59:02',1,15,'6','Solicitação de arquivo(s) faltante(s)',1,''),(76,'2011-01-28 16:59:33',1,15,'7','Solicitação de fascículos',1,''),(77,'2011-01-28 17:00:03',1,15,'8','Solicitação de complementação ou correção de informação',1,''),(78,'2011-01-28 17:00:45',1,15,'9','Solicitação de atualização de dados do formulário de avaliação',1,''),(79,'2011-01-28 17:01:14',1,15,'10','Solicitação de esclarecimento de dúvidas',1,''),(80,'2011-01-28 17:01:35',1,15,'11','Informações sobre a divulgação dos resultados',1,''),(81,'2011-01-28 17:02:07',1,15,'12','Resultados do processo',1,''),(82,'2011-01-28 17:02:12',1,15,'13','Outros',1,''),(83,'2011-02-01 13:55:18',1,15,'14','Nome da área - segunda etapa',1,''),(84,'2011-02-01 13:55:41',1,15,'15','nome da área - resultado do processo',1,''),(85,'2011-02-01 13:56:05',1,15,'16','Nome da área - confirmação de recebimento de arquivos ',1,''),(86,'2011-02-01 13:56:28',1,15,'17','Nome da área - confirmação de recebimento de fascículos',1,''),(87,'2011-02-01 13:56:51',1,15,'18','Nome da área - confirmação de inclusão no processo',1,''),(88,'2011-02-01 13:57:19',1,15,'19','Nome da área - solicitação de arquivo(s) faltante(s)',1,''),(89,'2011-02-01 13:57:38',1,15,'20','Nome da área - solicitação de fascículos',1,''),(90,'2011-02-01 13:58:06',1,15,'21','Nome da área - solicitação de complementação ou correção de informação',1,''),(91,'2011-02-01 13:58:27',1,15,'22','Nome da área - solicitação de esclarecimento de dúvidas',1,''),(92,'2011-02-01 13:58:53',1,15,'23','Nome da área - informação sobre a divulgação dos resultados',1,''),(93,'2011-02-01 13:59:02',1,15,'24','Nome da área - Outros',1,''),(94,'2011-02-01 15:49:37',1,14,'1','Avaliação para inclusão',1,''),(95,'2011-02-01 15:49:40',1,14,'2','Avaliação por área temática',1,''),(96,'2011-02-01 15:51:04',1,15,'1','Confirmação de Rcebimento de arquivos',1,''),(97,'2011-02-01 16:04:41',1,16,'1','Null',1,''),(98,'2011-02-01 16:04:46',1,16,'1','Null',2,'No fields changed.'),(99,'2011-02-01 16:27:02',1,14,'1','Avaliação para inclusão',1,''),(100,'2011-02-01 16:27:05',1,14,'2','Avaliação por área temática',1,''),(101,'2011-02-01 16:27:18',1,15,'1','Confirmação de Rcebimento de arquivos',1,''),(102,'2011-02-01 16:27:19',1,15,'1','Confirmação de Rcebimento de arquivos',2,'No fields changed.'),(103,'2011-02-01 16:31:16',1,16,'1','Null',1,''),(104,'2011-02-01 16:44:00',1,10,'2','Journal Title',3,''),(105,'2011-02-01 16:44:00',1,10,'1','Revista brasileira de Cirurgia Ortognastica',3,''),(106,'2011-02-01 17:16:35',1,16,'2','Aguardando envio de Documento',1,''),(107,'2011-02-01 17:16:54',1,11,'9','9',2,'Changed status.'),(108,'2011-02-01 17:27:17',1,9,'5','/about/ -- About',3,''),(109,'2011-02-01 17:27:17',1,9,'6','/jamil/ -- jaskjdkajsk',3,''),(110,'2011-02-01 17:27:17',1,9,'3','/test -- Teste',3,''),(111,'2011-02-01 17:27:27',1,3,'30','fabio',3,''),(112,'2011-02-01 17:27:27',1,3,'29','jamil',3,''),(113,'2011-02-01 17:27:27',1,3,'27','test1',3,''),(114,'2011-02-01 17:27:27',1,3,'28','Teste',3,''),(115,'2011-02-01 17:32:29',1,9,'7','/about/pt/ -- About',1,''),(116,'2011-02-01 17:33:15',1,9,'7','/about/pt/ -- Sobre',2,'Changed title and content.'),(117,'2011-02-01 17:33:35',1,9,'8','/about/en/ -- About',1,''),(118,'2011-02-01 17:34:44',1,9,'9','/about/es/ -- Sobre',1,''),(119,'2011-02-01 17:35:48',1,14,'1','Avaliação para inclusão',1,''),(120,'2011-02-01 17:35:51',1,14,'2','Avaliação por área temática',1,''),(121,'2011-02-01 17:39:51',1,15,'1','Confirmação de Recebimento de arquivos',1,''),(122,'2011-02-01 17:40:00',1,15,'2','Confirmação de Recebimento de recurso',1,''),(123,'2011-02-01 17:40:18',1,15,'3','Confirmação de Recebimento de fascículos',1,''),(124,'2011-02-01 17:40:45',1,15,'4','Confirmação de inclusão no processo',1,''),(125,'2011-02-01 17:41:11',1,15,'5','Solicitação de arquivo(s) faltante(s)',1,''),(126,'2011-02-01 17:41:20',1,15,'6','Solicitação de fascículos',1,''),(127,'2011-02-01 17:41:36',1,15,'7','Solicitação de complementação ou correção de informação',1,''),(128,'2011-02-01 17:41:54',1,15,'8','Solicitação de atualização de dados do formulário de avaliação',1,''),(129,'2011-02-01 17:42:08',1,15,'9','Solicitação de esclarecimento de dúvidas',1,''),(130,'2011-02-01 17:42:18',1,15,'10','Informações sobre a divulgação dos resultados',1,''),(131,'2011-02-01 17:42:25',1,15,'11','Resultados do processo',1,''),(132,'2011-02-01 17:42:35',1,15,'12','Outros',1,''),(133,'2011-02-01 17:43:02',1,15,'13','Nome da área - primeira etapa',1,''),(134,'2011-02-01 17:43:17',1,15,'14','Nome da área - se',1,''),(135,'2011-02-01 17:43:25',1,15,'14','Nome da área - segunda etapa',2,'Changed context_name.'),(136,'2011-02-01 17:43:38',1,15,'15','Nome da área - resultado do processo',1,''),(137,'2011-02-01 17:44:01',1,15,'16','Nome da área - confirmação de recebimento de arquivos',1,''),(138,'2011-02-01 17:44:26',1,15,'17','Nome da área - confirmação de recebimento de fascículos',1,''),(139,'2011-02-01 17:44:38',1,15,'18','Nome da área - confirmação de inclusão no processo',1,''),(140,'2011-02-01 17:45:23',1,15,'19','Nome da área - solicitação de arquivo(s) faltante(s)',1,''),(141,'2011-02-01 17:45:40',1,15,'20','Nome da área - solicitação de fascículos',1,''),(142,'2011-02-01 17:46:06',1,15,'21','Nome da área - solicitação de complementação ou correção de informação',1,''),(143,'2011-02-01 17:46:29',1,15,'22','Nome da área - solicitação de esclarecimento de dúvidas',1,''),(144,'2011-02-01 17:46:44',1,15,'23','Nome da área - informação sobre a divulgação dos resultados',1,''),(145,'2011-02-01 17:46:50',1,15,'24','Outros',1,''),(146,'2011-02-01 17:49:52',1,16,'1','Aguardando envio de Documento',1,''),(147,'2011-02-01 17:50:03',1,16,'2','Em processo de avaliação',1,''),(148,'2011-02-01 17:50:36',1,16,'3','Aprovado para inclusão na Coleção SciELO Brasil',1,''),(149,'2011-02-01 17:51:07',1,16,'4','Aprovado com restrições para inclusão na Coleção SciELO Brasil',1,''),(150,'2011-02-01 17:51:38',1,16,'5','Aprovado sob condições para inclusão na Coleção SciELO Brasil',1,''),(151,'2011-02-01 17:52:25',1,16,'6','Aprovado para avaliação de mérido científico pelos menbros do Comitê Consultivo',1,''),(152,'2011-02-01 17:52:56',1,16,'7','Aprovado para avaliação de mérito científico por formato e endogenia',1,''),(153,'2011-02-01 17:53:26',1,16,'8','Encaminhada para a avaliação de mérito científico por recurso',1,''),(154,'2011-02-01 17:53:59',1,16,'9','pendente para a avaliação de mérito científico complementar',1,''),(155,'2011-02-01 17:54:22',1,16,'10','Pendente para avaliação complementar do comitê Consultivo',1,''),(156,'2011-02-01 17:55:06',1,16,'11','Recurso pendente para a avaliação complementar do comitê Consultivo',1,''),(157,'2011-02-01 17:55:31',1,16,'12','Reprovado pelos menbros do Comitê Consultivo',1,''),(158,'2011-02-01 17:55:53',1,16,'13','Reprovado na pré-etapa de avaliação',1,''),(159,'2011-02-01 17:56:30',1,16,'14','Reprovado na avaliação de formato e endogeniia e pelos menbros do comitê Consultivo',1,''),(160,'2011-02-01 17:56:44',1,16,'15','Aguardando envio de Documento',1,''),(161,'2011-02-01 17:57:02',1,16,'16','Em processo de avaliação de área',1,''),(162,'2011-02-01 17:57:53',1,16,'17','Aprovado na avaliação de área para inclusão na Coleção SciELO Brasil',1,''),(163,'2011-02-01 17:58:27',1,16,'18','Aprovado com restrições na avaliação de área para inclusão na Coleção SciELO Brasil',1,''),(164,'2011-02-01 17:59:16',1,16,'19','Aprovado sob condições na avaliação de área para inclusão na Coleção SciELO Brasil',1,''),(165,'2011-02-01 17:59:39',1,16,'20','Pendente para finalização do processo de avaliação de área',1,''),(166,'2011-02-01 18:00:00',1,16,'21','Reprovado por falta de apresentação de documentação ',1,''),(167,'2011-02-01 18:04:33',1,2,'1','técnico',1,''),(168,'2011-02-01 18:07:23',1,3,'31','deniseperes',1,''),(169,'2011-02-01 18:07:47',1,3,'32','cinthyaperona',1,''),(170,'2011-02-01 18:08:02',1,3,'33','fabiana.montanari',1,''),(171,'2011-02-01 18:09:28',1,3,'32','cinthyaperona',2,'Changed first_name, last_name, email and groups.'),(172,'2011-02-01 18:09:57',1,3,'31','deniseperes',2,'Changed first_name, last_name, email and groups.'),(173,'2011-02-01 18:10:39',1,3,'33','fabiana.montanari',2,'Changed first_name, last_name, email, is_staff, is_superuser and user_permissions.'),(174,'2011-02-01 18:10:56',1,3,'1','admin',2,'Changed first_name and last_name.'),(175,'2011-02-01 18:11:01',1,3,'1','admin',2,'No fields changed.'),(176,'2011-02-01 18:11:41',1,3,'31','deniseperes',2,'Changed is_staff.'),(177,'2011-02-01 18:11:48',1,3,'32','cinthyaperona',2,'Changed is_staff.'),(178,'2011-02-01 18:12:44',1,2,'1','técnico',2,'Changed permissions.'),(179,'2011-02-02 12:52:18',1,3,'32','cinthyaperona',2,'Changed is_active.'),(180,'2011-02-02 12:55:02',1,3,'32','cinthyaperona',2,'Changed is_active.'),(181,'2011-02-02 13:29:42',1,9,'10','/documentation -- Documentation',1,''),(182,'2011-02-02 13:30:04',1,9,'10','/documentation/ -- Documentation',2,'Modificado/a url.'),(183,'2011-02-02 13:32:28',1,9,'11','/scielo_brasil/en/ -- teste scielo brasil en ',1,''),(184,'2011-02-02 13:33:18',1,9,'11','/documentation/scielo_brasil/en/ -- teste scielo brasil en ',2,'Modificado/a url.'),(185,'2011-02-02 13:54:27',1,10,'4','Revista brasileira de Cirurgia Ortognastica',2,'Added followup \"5\".'),(186,'2011-02-02 15:48:04',1,9,'10','/documentation/ -- Documentation',3,''),(187,'2011-02-02 15:48:07',1,9,'11','/documentation/scielo_brasil/en/ -- teste scielo brasil en ',3,''),(188,'2011-02-02 15:48:55',1,9,'12','/news/pt/ -- Notícias',1,''),(189,'2011-02-02 15:49:19',1,9,'12','/news/pt/ -- Notícias',2,'No fields changed.'),(190,'2011-02-02 15:49:35',1,9,'13','/news/es -- Noticias',1,''),(191,'2011-02-02 15:49:57',1,9,'14','/news/en/ -- News',1,''),(192,'2011-02-02 15:50:04',1,9,'13','/news/es/ -- Noticias',2,'Changed url.'),(193,'2011-02-02 15:50:06',1,9,'13','/news/es/ -- Noticias',2,'No fields changed.'),(194,'2011-02-02 15:51:18',1,9,'15','/faq/en/ -- FAQ',1,''),(195,'2011-02-02 15:51:40',1,9,'16','/gaq/pt/ -- FAQ',1,''),(196,'2011-02-02 15:51:57',1,9,'17','/faq/es -- FAQ',1,''),(197,'2011-02-02 15:52:09',1,9,'17','/faq/es/ -- FAQ',2,'Changed url.'),(198,'2011-02-02 15:53:59',1,9,'15','/faq/en/ -- FAQ',2,'Changed content.'),(199,'2011-02-02 15:54:01',1,9,'15','/faq/en/ -- FAQ',2,'No fields changed.'),(200,'2011-02-02 15:54:10',1,9,'17','/faq/es/ -- FAQ',2,'Changed content.'),(201,'2011-02-02 15:54:19',1,9,'16','/faq/pt/ -- FAQ',2,'Changed url and content.'),(202,'2011-02-02 15:55:03',1,9,'15','/faq/en/ -- FAQ',2,'Changed content.'),(203,'2011-02-02 15:55:11',1,9,'15','/faq/en/ -- FAQ',2,'No fields changed.'),(204,'2011-02-02 15:55:16',1,9,'17','/faq/es/ -- FAQ',2,'Changed content.'),(205,'2011-02-02 15:55:22',1,9,'16','/faq/pt/ -- FAQ',2,'Changed content.'),(206,'2011-02-02 15:58:05',1,9,'15','/faq/en/ -- FAQ',2,'Changed content.'),(207,'2011-02-02 15:59:30',1,9,'18','/help/en/ -- Help',1,''),(208,'2011-02-02 16:00:24',1,9,'19','/help/es/ -- Ayuda',1,''),(209,'2011-02-02 16:00:37',1,9,'20','/help/pt/ -- Ajuda',1,''),(210,'2011-02-02 16:05:11',1,9,'15','/faq/en/ -- FAQ',2,'Changed content.'),(211,'2011-02-02 16:06:01',1,9,'15','/faq/en/ -- FAQ',2,'Changed content.'),(212,'2011-02-02 16:08:22',1,9,'15','/faq/en/ -- FAQ',2,'Changed content.'),(213,'2011-02-02 16:09:24',1,9,'15','/faq/en/ -- FAQ',2,'Changed content.'),(214,'2011-02-02 16:09:43',1,9,'17','/faq/es/ -- FAQ',2,'Changed content.'),(215,'2011-02-02 16:09:49',1,9,'16','/faq/pt/ -- FAQ',2,'Changed content.'),(216,'2011-02-02 17:02:11',1,7,'1','evaluation',2,'Changed name.'),(217,'2011-02-02 17:07:53',1,9,'21','/documentation/pt/ -- Documentação',1,''),(218,'2011-02-02 17:08:07',1,9,'22','/documentation/en/ -- Documentation',1,''),(219,'2011-02-02 17:08:52',1,9,'23','/documentation/es/ -- Documentación',1,''),(220,'2011-02-02 18:43:09',31,10,'1','Revista brasileira de Cirurgia Ortognastica',2,'Added followup \"2\".'),(221,'2011-02-02 18:47:21',31,10,'1','Revista brasileira de Cirurgia Ortognastica',2,'Added followup \"3\".'),(222,'2011-02-02 18:48:54',31,10,'2','teste',1,''),(223,'2011-02-02 18:49:55',31,11,'4','4',1,''),(224,'2011-02-02 18:59:01',31,10,'1','Revista brasileira de Cirurgia Ortognastica',2,'Added followup \"1\".'),(225,'2011-02-02 19:00:21',31,10,'1','Revista brasileira de Cirurgia Ortognastica',2,'Added followup \"2\".'),(226,'2011-02-02 19:02:45',31,10,'2','Revista brasileira de Cirurgia Ortognastica',2,'Added followup \"3\".'),(227,'2011-02-02 19:15:13',31,10,'1','Teste',2,'Added followup \"1\".'),(228,'2011-02-03 12:58:51',1,10,'1','Teste para status',2,'Adicionado followup \"3\"'),(229,'2011-02-03 13:13:07',1,16,'9','Pendente para a avaliação de mérito científico complementar',2,'Modificado status_name.'),(230,'2011-02-03 14:10:42',1,16,'1','Nova solicição de avaliação',2,'Changed status_name.'),(231,'2011-02-09 16:42:16',1,9,'24','/teste/ -- Teste',1,''),(232,'2011-02-09 16:43:23',1,9,'24','/teste/ -- Teste',2,'Changed content.'),(233,'2011-02-09 16:44:00',1,9,'24','/teste/ -- Teste',2,'Changed content.'),(234,'2011-02-16 19:08:56',1,2,'1','técnico',2,'Changed permissions.'),(235,'2011-02-16 19:21:06',1,7,'1','localhost:8000',2,'Changed domain.');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'log entry','admin','logentry'),(9,'flat page','flatpages','flatpage'),(10,'evaluation','evaluations','evaluation'),(11,'followup','evaluations','followup'),(12,'media','evaluations','media'),(13,'registration profile','registration','registrationprofile'),(14,'type','evaluations','type'),(15,'context','evaluations','context'),(16,'status','evaluations','status');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

DROP TABLE IF EXISTS `django_flatpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_a4b49ab` (`url`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
INSERT INTO `django_flatpage` VALUES (9,'/about/es/','Sobre','Sobre en el español',0,'',0),(8,'/about/en/','About','About in Inglish',0,'',0),(7,'/about/pt/','Sobre','Sobre em português',0,'',0),(13,'/news/es/','Noticias','<p><a href=\"http://revistapesquisa.fapesp.br/?art=6976&bd=2&pg=1&lg=\"text-decoration:none\">A ess&ecirc;ncia de Cyro dos Anjos</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6974&bd=2&pg=1&lg=\"text-decoration:none\">Sucesso reprodutivo das aves</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6973&bd=2&pg=1&lg=\"text-decoration:none\">Transplante de c&eacute;lulas fetais</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6972&bd=2&pg=1&lg=\"text-decoration:none\">Autores ind&iacute;genas</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6971&bd=2&pg=1&lg=\"text-decoration:none\">Mecaniza&ccedil;&atilde;o agr&iacute;cola</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6970&bd=2&pg=1&lg=\"text-decoration:none\">Simulador de opera&ccedil;&atilde;o de lavra</a><br>',0,'',0),(14,'/news/en/','News','<p><a href=\"http://revistapesquisa.fapesp.br/?art=6976&bd=2&pg=1&lg=\"text-decoration:none\">A ess&ecirc;ncia de Cyro dos Anjos</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6974&bd=2&pg=1&lg=\"text-decoration:none\">Sucesso reprodutivo das aves</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6973&bd=2&pg=1&lg=\"text-decoration:none\">Transplante de c&eacute;lulas fetais</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6972&bd=2&pg=1&lg=\"text-decoration:none\">Autores ind&iacute;genas</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6971&bd=2&pg=1&lg=\"text-decoration:none\">Mecaniza&ccedil;&atilde;o agr&iacute;cola</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6970&bd=2&pg=1&lg=\"text-decoration:none\">Simulador de opera&ccedil;&atilde;o de lavra</a><br>',0,'',0),(15,'/faq/en/','FAQ','F.A.Q. - journals selection\r\n\r\n\r\nWhat are the criteria for indexing a journal in SciELO Brazil?\r\nHow are electronic journals evaluated?\r\nHow is the selection process carried out?\r\nHow often are evaluations performed?\r\nWho are the members of the Advisory Committee of SciELO Brazil?\r\nAfter evaluation, how is the decision communicated to the journal?\r\nIf a journal is selected, from which issue on will it be indexed?\r\nWhat are the procedures if a journal is not selected to or excluded from SciELO collection?\r\n\r\n \r\n\r\nWhat are the criteria for indexing a journal in SciELO Brazil?\r\n\r\nTo be indexed in SciELO Brazil, a journal should go through an evaluation process, based on criteria and procedures that are internationally adopted by databases.\r\n\r\nThe criteria adopted by SciELO to select journals are detailed in the document \"SciELO Criteria: criteria, policy and procedures for admission and permanence of scientific journals in the SciELO collection\", available at <http://www.scielo.br/criteria/scielo_brasil_en.html>.\r\n\r\nThe SciELO Brazil collection is composed only of scientific journals published in Brazil. Foreign journals interested in admission in SciELO Network should contact the SciELO Unit in their respective country. For a list of countries with a national SciELO site, see <http://www.scielo.org/index.php?lang=en>.\r\n\r\n \r\n\r\nHow are electronic journals evaluated?\r\n\r\nThe electronic journals are evaluated according to \"SciELO Brazil Criteria\".\r\n\r\nIt is essential that electronic journals have a website and publish the Editorial Board names, their respective affiliation, and Instructions to Authors.\r\n\r\n \r\n\r\nHow is the selection process carried out?\r\n\r\nThe selection process for admission of new journals in SciELO Brazil collection is divided into three stages: (1) pre-assessment of format and indicators, (2) evaluation of scientific contents by an expert, and (3) final review by SciELO Brazil Advisory Committee.\r\n\r\n \r\n\r\nHow often are evaluations performed?\r\n\r\nThe SciELO Brazil Advisory Committee meets at least four times a year.\r\n\r\n \r\n\r\nWho are the members of the SciELO Brazil Advisory Committee?\r\n\r\nThe Committee is composed of representatives of the national scientific community. For further information about the composition and objectives of the Committee, see \"SciELO Brazil Criteria\".\r\n\r\nIf necessary, external consultants and experts may take part in meetings and activities of the Committee.\r\n\r\n \r\n\r\nAfter evaluation, how is the decision communicated to the journal?\r\n\r\nThe opinion of the SciELO Brazil Advisory Committee is sent to the journal editor by mail, e-mail or fax, and it may provide recommendations to make changes to the journal and the terms to implement them.\r\n\r\n \r\n\r\nIf a journal is selected, from which issue on will it be indexed?\r\n\r\nThe entry of a new title in SciELO collection is made by publishing the two most recent issues. The previous issues, back to 1997, should be added to the collection later; therefore, electronic files should be available to send to SciELO Unit.\r\n\r\n \r\n\r\nWhat are the procedures if a journal is not selected to or excluded from SciELO collection?\r\n\r\nThe editor of the journal may appeal, at any time, and send a review, together with the corresponding documentation. The Advisory Committee will examine it in the next meeting.\r\n\r\nThe journal may be submitted again for evaluation. However, it should comply with the report of the Committee before application.',0,'',0),(12,'/news/pt/','Notícias','<p><a href=\"http://revistapesquisa.fapesp.br/?art=6976&bd=2&pg=1&lg=\"text-decoration:none\">A ess&ecirc;ncia de Cyro dos Anjos</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6974&bd=2&pg=1&lg=\"text-decoration:none\">Sucesso reprodutivo das aves</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6973&bd=2&pg=1&lg=\"text-decoration:none\">Transplante de c&eacute;lulas fetais</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6972&bd=2&pg=1&lg=\"text-decoration:none\">Autores ind&iacute;genas</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6971&bd=2&pg=1&lg=\"text-decoration:none\">Mecaniza&ccedil;&atilde;o agr&iacute;cola</a><br>\r\n<a href=\"http://revistapesquisa.fapesp.br/?art=6970&bd=2&pg=1&lg=\"text-decoration:none\">Simulador de opera&ccedil;&atilde;o de lavra</a><br>',0,'',0),(16,'/faq/pt/','FAQ','F.A.Q. - journals selection\r\n\r\n\r\nWhat are the criteria for indexing a journal in SciELO Brazil?\r\nHow are electronic journals evaluated?\r\nHow is the selection process carried out?\r\nHow often are evaluations performed?\r\nWho are the members of the Advisory Committee of SciELO Brazil?\r\nAfter evaluation, how is the decision communicated to the journal?\r\nIf a journal is selected, from which issue on will it be indexed?\r\nWhat are the procedures if a journal is not selected to or excluded from SciELO collection?\r\n\r\n \r\n\r\nWhat are the criteria for indexing a journal in SciELO Brazil?\r\n\r\nTo be indexed in SciELO Brazil, a journal should go through an evaluation process, based on criteria and procedures that are internationally adopted by databases.\r\n\r\nThe criteria adopted by SciELO to select journals are detailed in the document \"SciELO Criteria: criteria, policy and procedures for admission and permanence of scientific journals in the SciELO collection\", available at <http://www.scielo.br/criteria/scielo_brasil_en.html>.\r\n\r\nThe SciELO Brazil collection is composed only of scientific journals published in Brazil. Foreign journals interested in admission in SciELO Network should contact the SciELO Unit in their respective country. For a list of countries with a national SciELO site, see <http://www.scielo.org/index.php?lang=en>.\r\n\r\n \r\n\r\nHow are electronic journals evaluated?\r\n\r\nThe electronic journals are evaluated according to \"SciELO Brazil Criteria\".\r\n\r\nIt is essential that electronic journals have a website and publish the Editorial Board names, their respective affiliation, and Instructions to Authors.\r\n\r\n \r\n\r\nHow is the selection process carried out?\r\n\r\nThe selection process for admission of new journals in SciELO Brazil collection is divided into three stages: (1) pre-assessment of format and indicators, (2) evaluation of scientific contents by an expert, and (3) final review by SciELO Brazil Advisory Committee.\r\n\r\n \r\n\r\nHow often are evaluations performed?\r\n\r\nThe SciELO Brazil Advisory Committee meets at least four times a year.\r\n\r\n \r\n\r\nWho are the members of the SciELO Brazil Advisory Committee?\r\n\r\nThe Committee is composed of representatives of the national scientific community. For further information about the composition and objectives of the Committee, see \"SciELO Brazil Criteria\".\r\n\r\nIf necessary, external consultants and experts may take part in meetings and activities of the Committee.\r\n\r\n \r\n\r\nAfter evaluation, how is the decision communicated to the journal?\r\n\r\nThe opinion of the SciELO Brazil Advisory Committee is sent to the journal editor by mail, e-mail or fax, and it may provide recommendations to make changes to the journal and the terms to implement them.\r\n\r\n \r\n\r\nIf a journal is selected, from which issue on will it be indexed?\r\n\r\nThe entry of a new title in SciELO collection is made by publishing the two most recent issues. The previous issues, back to 1997, should be added to the collection later; therefore, electronic files should be available to send to SciELO Unit.\r\n\r\n \r\n\r\nWhat are the procedures if a journal is not selected to or excluded from SciELO collection?\r\n\r\nThe editor of the journal may appeal, at any time, and send a review, together with the corresponding documentation. The Advisory Committee will examine it in the next meeting.\r\n\r\nThe journal may be submitted again for evaluation. However, it should comply with the report of the Committee before application.',0,'',0),(17,'/faq/es/','FAQ','F.A.Q. - journals selection\r\n\r\n\r\nWhat are the criteria for indexing a journal in SciELO Brazil?\r\nHow are electronic journals evaluated?\r\nHow is the selection process carried out?\r\nHow often are evaluations performed?\r\nWho are the members of the Advisory Committee of SciELO Brazil?\r\nAfter evaluation, how is the decision communicated to the journal?\r\nIf a journal is selected, from which issue on will it be indexed?\r\nWhat are the procedures if a journal is not selected to or excluded from SciELO collection?\r\n\r\n \r\n\r\nWhat are the criteria for indexing a journal in SciELO Brazil?\r\n\r\nTo be indexed in SciELO Brazil, a journal should go through an evaluation process, based on criteria and procedures that are internationally adopted by databases.\r\n\r\nThe criteria adopted by SciELO to select journals are detailed in the document \"SciELO Criteria: criteria, policy and procedures for admission and permanence of scientific journals in the SciELO collection\", available at <http://www.scielo.br/criteria/scielo_brasil_en.html>.\r\n\r\nThe SciELO Brazil collection is composed only of scientific journals published in Brazil. Foreign journals interested in admission in SciELO Network should contact the SciELO Unit in their respective country. For a list of countries with a national SciELO site, see <http://www.scielo.org/index.php?lang=en>.\r\n\r\n \r\n\r\nHow are electronic journals evaluated?\r\n\r\nThe electronic journals are evaluated according to \"SciELO Brazil Criteria\".\r\n\r\nIt is essential that electronic journals have a website and publish the Editorial Board names, their respective affiliation, and Instructions to Authors.\r\n\r\n \r\n\r\nHow is the selection process carried out?\r\n\r\nThe selection process for admission of new journals in SciELO Brazil collection is divided into three stages: (1) pre-assessment of format and indicators, (2) evaluation of scientific contents by an expert, and (3) final review by SciELO Brazil Advisory Committee.\r\n\r\n \r\n\r\nHow often are evaluations performed?\r\n\r\nThe SciELO Brazil Advisory Committee meets at least four times a year.\r\n\r\n \r\n\r\nWho are the members of the SciELO Brazil Advisory Committee?\r\n\r\nThe Committee is composed of representatives of the national scientific community. For further information about the composition and objectives of the Committee, see \"SciELO Brazil Criteria\".\r\n\r\nIf necessary, external consultants and experts may take part in meetings and activities of the Committee.\r\n\r\n \r\n\r\nAfter evaluation, how is the decision communicated to the journal?\r\n\r\nThe opinion of the SciELO Brazil Advisory Committee is sent to the journal editor by mail, e-mail or fax, and it may provide recommendations to make changes to the journal and the terms to implement them.\r\n\r\n \r\n\r\nIf a journal is selected, from which issue on will it be indexed?\r\n\r\nThe entry of a new title in SciELO collection is made by publishing the two most recent issues. The previous issues, back to 1997, should be added to the collection later; therefore, electronic files should be available to send to SciELO Unit.\r\n\r\n \r\n\r\nWhat are the procedures if a journal is not selected to or excluded from SciELO collection?\r\n\r\nThe editor of the journal may appeal, at any time, and send a review, together with the corresponding documentation. The Advisory Committee will examine it in the next meeting.\r\n\r\nThe journal may be submitted again for evaluation. However, it should comply with the report of the Committee before application.',0,'',0),(19,'/help/es/','Ayuda','Ayuda',0,'',0),(20,'/help/pt/','Ajuda','Ajuda',0,'',0),(21,'/documentation/pt/','Documentação','Documentação',0,'',0),(22,'/documentation/en/','Documentation','Documentation',0,'',0),(23,'/documentation/es/','Documentación','Documentación',0,'',0),(18,'/help/en/','Help','Help',0,'',0),(24,'/teste/','Teste','Teste de parametros\r\n\r\n\r\n',0,'',0);
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

DROP TABLE IF EXISTS `django_flatpage_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flatpage_id` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_21210108` (`flatpage_id`),
  KEY `django_flatpage_sites_6223029` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
INSERT INTO `django_flatpage_sites` VALUES (207,9,1),(206,8,1),(208,7,1),(219,13,1),(220,12,1),(218,14,1),(212,15,1),(214,16,1),(213,17,1),(215,18,1),(216,19,1),(217,20,1),(211,21,1),(209,22,1),(210,23,1),(221,24,1);
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_granular_permissions_permission`
--

DROP TABLE IF EXISTS `django_granular_permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_granular_permissions_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_granular_permissions_permission_1bb8f392` (`content_type_id`),
  KEY `django_granular_permissions_permission_403f60f` (`user_id`),
  KEY `django_granular_permissions_permission_425ae3c4` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_granular_permissions_permission`
--

LOCK TABLES `django_granular_permissions_permission` WRITE;
/*!40000 ALTER TABLE `django_granular_permissions_permission` DISABLE KEYS */;
INSERT INTO `django_granular_permissions_permission` VALUES (1,'list_all',10,2,34,1);
/*!40000 ALTER TABLE `django_granular_permissions_permission` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('033265ff23fd37c517f6283bea676e70','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4zZmMxODk4YTZmYThmN2Y3NGY4\nYjNjMDY0OWFhZTkzOA==\n','2011-01-18 15:44:34'),('8dee84f190efa2658b573b782559f973','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4zZmMxODk4YTZmYThmN2Y3NGY4\nYjNjMDY0OWFhZTkzOA==\n','2010-12-02 12:55:34'),('2bdea7f5c0955d837c5c4ed2ad4249aa','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4zZmMxODk4YTZmYThmN2Y3NGY4\nYjNjMDY0OWFhZTkzOA==\n','2011-01-28 19:31:23'),('cb3579364e25bbeb037df5ce3365cb0a','gAJ9cQEuNzM5ZmQwZTgxNTE5OTJmNWYwMDg0YzdmMjJkMWJiODg=\n','2011-02-04 17:14:17'),('7160d33c1bc7896f1c3eb74377cfb7ce','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEfdS5lMjIzY2VlYjE2MDE3Nzk4MDdl\nZDdkZjhkMjcyZjJjNQ==\n','2011-02-16 18:41:26'),('823da97d67929a833fe1bd972ddbc114','gAJ9cQEuNzM5ZmQwZTgxNTE5OTJmNWYwMDg0YzdmMjJkMWJiODg=\n','2011-01-28 15:17:45'),('d8e2b999eb716fb3ca6f595ca59e0de1','gAJ9cQEuNzM5ZmQwZTgxNTE5OTJmNWYwMDg0YzdmMjJkMWJiODg=\n','2011-02-15 18:13:11'),('83baa6032baabe66d730a2716032878c','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4zZmMxODk4YTZmYThmN2Y3NGY4\nYjNjMDY0OWFhZTkzOA==\n','2011-02-11 10:18:48'),('f1cafe1155d64fe10b8e9677866d12fa','gAJ9cQEoVRJjb3VudF90aWNrZXRzX3VzZXJxAksAVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRo\nX3VzZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2Vu\nZHEFdS41YjhlZjdlZTQwZTRjYzg3N2U3ZWRkNzNmZDIzYzc0OA==\n','2011-02-16 17:12:34'),('e6b0020b41efccdb01e46c54a80615de','gAJ9cQEoVRJjb3VudF90aWNrZXRzX3VzZXJxAksDVQ1fYXV0aF91c2VyX2lkcQOKAQFVEl9hdXRo\nX3VzZXJfYmFja2VuZHEEVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2Vu\nZHEFdS43MjlhYTY4Y2JjYjQwOTY3ZjVjNmFlNDFiMzIwMzQ0Zg==\n','2011-02-17 14:10:45'),('cf0e64dd151f615d359cc436230e4c81','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UWY291bnRfZXZhbHVhdGlvbnNfdXNlcnEESwBVD2RqYW5nb19sYW5n\ndWFnZXEFWAUAAABwdC1icnEGVQ1fYXV0aF91c2VyX2lkcQeKAQF1LmRlZDdhMWVlMjRmOTY5ZTQ3\nMDJlNTA2YTg1ZTZmNDgz\n','2011-02-23 17:37:35'),('c1055d7b1653d190dae9198dedead3ba','gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4zZmMxODk4YTZmYThmN2Y3NGY4\nYjNjMDY0OWFhZTkzOA==\n','2011-02-23 16:41:39'),('7e5b4a74ddfa2d13991b6f7c5175b1b3','gAJ9cQEoVRZjb3VudF9ldmFsdWF0aW9uc191c2VycQJLAlUNX2F1dGhfdXNlcl9pZHEDigEfVRJf\nYXV0aF91c2VyX2JhY2tlbmRxBFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJh\nY2tlbmRxBXUuYmU3MTJjY2ZjYzkzNzI1MGEyNzQyMjMyNDkxNWI4MzE=\n','2011-03-03 14:07:39');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'evaluation','SciELO Brazil Journal Selection');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations_context`
--

DROP TABLE IF EXISTS `evaluations_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluations_context` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `context_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluations_context_777d41c8` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations_context`
--

LOCK TABLES `evaluations_context` WRITE;
/*!40000 ALTER TABLE `evaluations_context` DISABLE KEYS */;
INSERT INTO `evaluations_context` VALUES (1,1,'Confirmação de Recebimento de arquivos'),(2,1,'Confirmação de Recebimento de recurso'),(3,1,'Confirmação de Recebimento de fascículos'),(4,1,'Confirmação de inclusão no processo'),(5,1,'Solicitação de arquivo(s) faltante(s)'),(6,1,'Solicitação de fascículos'),(7,1,'Solicitação de complementação ou correção de informação'),(8,1,'Solicitação de atualização de dados do formulário de avaliação'),(9,1,'Solicitação de esclarecimento de dúvidas'),(10,1,'Informações sobre a divulgação dos resultados'),(11,1,'Resultados do processo'),(12,1,'Outros'),(13,2,'Nome da área - primeira etapa'),(14,2,'Nome da área - segunda etapa'),(15,2,'Nome da área - resultado do processo'),(16,2,'Nome da área - confirmação de recebimento de arquivos'),(17,2,'Nome da área - confirmação de recebimento de fascículos'),(18,2,'Nome da área - confirmação de inclusão no processo'),(19,2,'Nome da área - solicitação de arquivo(s) faltante(s)'),(20,2,'Nome da área - solicitação de fascículos'),(21,2,'Nome da área - solicitação de complementação ou correção de informação'),(22,2,'Nome da área - solicitação de esclarecimento de dúvidas'),(23,2,'Nome da área - informação sobre a divulgação dos resultados'),(24,2,'Outros');
/*!40000 ALTER TABLE `evaluations_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations_evaluation`
--

DROP TABLE IF EXISTS `evaluations_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluations_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `institution` varchar(512) NOT NULL,
  `issn` varchar(9) NOT NULL,
  `journal_title` varchar(256) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluations_evaluation_685aee7` (`creator_id`),
  KEY `evaluations_evaluation_777d41c8` (`type_id`),
  KEY `evaluations_evaluation_51da1b88` (`journal_title`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations_evaluation`
--

LOCK TABLES `evaluations_evaluation` WRITE;
/*!40000 ALTER TABLE `evaluations_evaluation` DISABLE KEYS */;
INSERT INTO `evaluations_evaluation` VALUES (6,31,1,'2011-02-16 18:51:45','Teste','123456789','Teste','Teste'),(7,34,2,'2011-02-16 19:07:56','Teste','1234-5678','Teste','Teste');
/*!40000 ALTER TABLE `evaluations_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations_followup`
--

DROP TABLE IF EXISTS `evaluations_followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluations_followup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_id` int(11) NOT NULL,
  `iteration_date` datetime NOT NULL,
  `subject` varchar(256) NOT NULL,
  `description` longtext NOT NULL,
  `reported_by_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `context_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluations_followup_2f04b9de` (`evaluation_id`),
  KEY `evaluations_followup_79771d09` (`iteration_date`),
  KEY `evaluations_followup_766dfd70` (`subject`),
  KEY `evaluations_followup_7fa05aac` (`reported_by_id`),
  KEY `evaluations_followup_44224078` (`status_id`),
  KEY `evaluations_followup_8510bf2` (`context_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations_followup`
--

LOCK TABLES `evaluations_followup` WRITE;
/*!40000 ALTER TABLE `evaluations_followup` DISABLE KEYS */;
INSERT INTO `evaluations_followup` VALUES (8,7,'2011-02-16 19:09:30','Teste','Teste',31,17,13),(9,7,'2011-02-16 19:11:38','Teste','Teste',31,17,13),(10,7,'2011-02-16 19:15:25','Teste3','Teste3',31,19,14),(11,7,'2011-02-16 19:16:17','Teste4','Teste',31,20,19),(12,7,'2011-02-16 19:18:25','Teste','Teste',31,21,20),(13,7,'2011-02-16 19:21:24','Teste','Teste',1,19,16),(14,7,'2011-02-17 14:06:57','Teste','Teste',31,18,15);
/*!40000 ALTER TABLE `evaluations_followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations_media`
--

DROP TABLE IF EXISTS `evaluations_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluations_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followup_id` int(11) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluations_media_260afb5c` (`followup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations_media`
--

LOCK TABLES `evaluations_media` WRITE;
/*!40000 ALTER TABLE `evaluations_media` DISABLE KEYS */;
INSERT INTO `evaluations_media` VALUES (6,9,'files/expert-python_16.pdf'),(7,10,'files/Revista_Árvore_-_Pareceristas.xls'),(8,11,'files/_AvaliaçãoPHP.xls'),(9,12,'files/_AvaliaçãoPHP_1.xls'),(10,13,'files/_AvaliaçãoPHP_2.xls'),(11,14,'files/martha.odt');
/*!40000 ALTER TABLE `evaluations_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations_status`
--

DROP TABLE IF EXISTS `evaluations_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluations_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `status_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluations_status_777d41c8` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations_status`
--

LOCK TABLES `evaluations_status` WRITE;
/*!40000 ALTER TABLE `evaluations_status` DISABLE KEYS */;
INSERT INTO `evaluations_status` VALUES (1,1,'Nova solicição de avaliação'),(2,1,'Aguardando envio de Documento'),(3,1,'Em processo de avaliação'),(4,1,'Aprovado para inclusão na Coleção SciELO Brasil'),(5,1,'Aprovado com restrições para inclusão na Coleção SciELO Brasil'),(6,1,'Aprovado sob condições para inclusão na Coleção SciELO Brasil'),(7,1,'Aprovado para avaliação de mérido científico pelos menbros do Comitê Consultivo'),(8,1,'Aprovado para avaliação de mérito científico por formato e endogenia'),(9,1,'Encaminhada para a avaliação de mérito científico por recurso'),(10,1,'Pendente para a avaliação de mérito científico complementar'),(11,1,'Pendente para avaliação complementar do comitê Consultivo'),(12,1,'Recurso pendente para a avaliação complementar do comitê Consultivo'),(13,1,'Reprovado pelos menbros do Comitê Consultivo'),(14,1,'Reprovado na pré-etapa de avaliação'),(15,1,'Reprovado na avaliação de formato e endogeniia e pelos menbros do comitê Consultivo'),(16,2,'Aguardando envio de Documento'),(17,2,'Em processo de avaliação de área'),(18,2,'Aprovado na avaliação de área para inclusão na Coleção SciELO Brasil'),(19,2,'Aprovado com restrições na avaliação de área para inclusão na Coleção SciELO Brasil'),(20,2,'Aprovado sob condições na avaliação de área para inclusão na Coleção SciELO Brasil'),(21,2,'Pendente para finalização do processo de avaliação de área'),(22,2,'Reprovado por falta de apresentação de documentação ');
/*!40000 ALTER TABLE `evaluations_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluations_type`
--

DROP TABLE IF EXISTS `evaluations_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluations_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluations_type`
--

LOCK TABLES `evaluations_type` WRITE;
/*!40000 ALTER TABLE `evaluations_type` DISABLE KEYS */;
INSERT INTO `evaluations_type` VALUES (1,'Avaliação para inclusão'),(2,'Avaliação por área temática');
/*!40000 ALTER TABLE `evaluations_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
INSERT INTO `registration_registrationprofile` VALUES (30,34,'ALREADY_ACTIVATED');
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-02-17 12:12:07
