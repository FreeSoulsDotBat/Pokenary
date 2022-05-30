-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: pokenary
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Pokenary Members');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (3,2,4),(2,2,24),(4,2,28);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add pokemon',1,'add_pokemon'),(2,'Can change pokemon',1,'change_pokemon'),(3,'Can delete pokemon',1,'delete_pokemon'),(4,'Can view pokemon',1,'view_pokemon'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add favorites',8,'add_favorites'),(30,'Can change favorites',8,'change_favorites'),(31,'Can delete favorites',8,'delete_favorites'),(32,'Can view favorites',8,'view_favorites');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$uU5vSkuD88inYUIUo2O0Lb$7A+SAeaE2CrqZcEcUmMOUzqOZ5a1CNh+ygl3TtbdYPA=','2022-05-22 18:06:54.336708',1,'djangoadmin','','','jonatan.fbossan@gmail.com',1,1,'2022-05-05 20:23:49.527564'),(4,'pbkdf2_sha256$320000$mUNXamavIKbx8xKhpLAj67$v3/ObH8T/ezCd7XOeecR6v14xzkzJDTqpFahDy6+rI4=','2022-05-24 14:47:13.722372',0,'teste','','','',0,1,'2022-05-22 16:35:38.000000'),(5,'pbkdf2_sha256$320000$IwLD7Zc3dKqQZl4h8vLx86$zOLKz1KMDNG+Y32PLbuY3Or1u/R9nQvrmANjqixkZi8=','2022-05-23 00:30:40.471908',0,'teste2','','','',0,1,'2022-05-23 00:30:29.823337'),(6,'pbkdf2_sha256$320000$SBss2ZmpeLPLMI84evbsG9$biy+aKiDD7kScRaNiQ/iKYW8vHV9e02omPjYoTNfnPw=','2022-05-27 14:43:03.536542',0,'teste3','','','',0,1,'2022-05-27 14:42:54.206266');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,4,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-21 18:39:47.562855','2','teste',1,'[{\"added\": {}}]',5,1),(2,'2022-05-22 14:08:12.064184','2','teste',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',5,1),(3,'2022-05-22 14:09:01.818476','2','teste',3,'',5,1),(4,'2022-05-22 14:10:52.350470','1','Pokenary Members',1,'[{\"added\": {}}]',4,1),(5,'2022-05-22 14:11:12.706351','1','Pokenary Members',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',4,1),(6,'2022-05-22 14:11:25.903879','1','Pokenary Members',3,'',4,1),(7,'2022-05-22 14:11:43.835226','2','Pokenary Members',1,'[{\"added\": {}}]',4,1),(8,'2022-05-22 14:11:48.021047','2','Pokenary Members',2,'[]',4,1),(9,'2022-05-22 14:12:59.297466','3','teste',1,'[{\"added\": {}}]',5,1),(10,'2022-05-22 14:14:21.927649','3','teste',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',5,1),(11,'2022-05-22 14:14:28.585545','3','teste',2,'[]',5,1),(12,'2022-05-22 16:35:06.398555','3','teste',3,'',5,1),(13,'2022-05-22 16:35:38.667355','4','teste',1,'[{\"added\": {}}]',5,1),(14,'2022-05-22 16:35:49.164972','4','teste',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',5,1),(15,'2022-05-22 16:37:13.263401','4','teste',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',5,1),(16,'2022-05-22 18:09:17.773979','2','Pokenary Members',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',4,1),(17,'2022-05-22 18:09:36.907583','4','teste',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',5,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(8,'home','favorites'),(1,'home','pokemon'),(7,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-28 13:28:57.528772'),(2,'auth','0001_initial','2022-04-28 13:28:59.159776'),(3,'admin','0001_initial','2022-04-28 13:28:59.615456'),(4,'admin','0002_logentry_remove_auto_add','2022-04-28 13:28:59.634450'),(5,'admin','0003_logentry_add_action_flag_choices','2022-04-28 13:28:59.653120'),(6,'contenttypes','0002_remove_content_type_name','2022-04-28 13:28:59.880800'),(7,'auth','0002_alter_permission_name_max_length','2022-04-28 13:29:00.061481'),(8,'auth','0003_alter_user_email_max_length','2022-04-28 13:29:00.115322'),(9,'auth','0004_alter_user_username_opts','2022-04-28 13:29:00.135171'),(10,'auth','0005_alter_user_last_login_null','2022-04-28 13:29:00.277073'),(11,'auth','0006_require_contenttypes_0002','2022-04-28 13:29:00.285912'),(12,'auth','0007_alter_validators_add_error_messages','2022-04-28 13:29:00.302287'),(13,'auth','0008_alter_user_username_max_length','2022-04-28 13:29:00.483640'),(14,'auth','0009_alter_user_last_name_max_length','2022-04-28 13:29:00.660291'),(15,'auth','0010_alter_group_name_max_length','2022-04-28 13:29:00.692431'),(16,'auth','0011_update_proxy_permissions','2022-04-28 13:29:00.706159'),(17,'auth','0012_alter_user_first_name_max_length','2022-04-28 13:29:00.889502'),(18,'home','0001_initial','2022-04-28 13:29:00.976206'),(19,'sessions','0001_initial','2022-04-28 13:29:01.107906'),(20,'home','0002_pokemon_abilities_pokemon_evolutions_pokemon_height_and_more','2022-05-04 16:53:22.121160'),(21,'home','0003_alter_pokemon_moves','2022-05-12 18:59:14.159943'),(22,'home','0004_alter_pokemon_abilities_alter_pokemon_evolutions_and_more','2022-05-16 20:22:17.532950'),(23,'home','0005_favorites','2022-05-24 13:10:02.051659'),(24,'home','0006_rename_pokemon_favorites_pokemon_id_and_more','2022-05-24 13:13:30.656544'),(25,'home','0007_rename_pokemon_id_favorites_pokemon_and_more','2022-05-25 13:30:29.932455'),(26,'home','0008_alter_favorites_stars','2022-05-27 13:58:24.143557');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a1pb93qq3eluvngnbuz3d5j27oea6scy','.eJxVjMsOwiAQRf-FtSEwDI-6dN9vIAOMUjU0Ke3K-O_apAvd3nPOfYlI21rj1nmJUxFn4cTpd0uUH9x2UO7UbrPMc1uXKcldkQftcpwLPy-H-3dQqddvTdqxt0AJGFBDChmSssEi6ORVKIQ4KKuvaGBwin02xSNbYFOsUTqL9wfCZDbK:1nubB9:DEvKdoFuKrPgoAY0vkqdciVbnPmYx_usYSyEyXIJrs0','2022-06-10 14:43:03.544354'),('a34ca6329k2s7cugzytrbr48vvby6d8u','.eJxVjEEOwiAQRe_C2pCBggMu3fcMhGFAqoYmpV0Z765NutDtf-_9lwhxW2vYel7CxOIilDj9bhTTI7cd8D222yzT3NZlIrkr8qBdjjPn5_Vw_w5q7PVbI9jsEM7Os4PkjBpIZyhEqAeVgC2bVErWqAp6JG-iKcVYAGTNCb14fwDP_Tev:1nmi1i:gXp1oH_fvSX_zGsJMbaj7x4_Jn2cgdd9jf-OZYTTA2Y','2022-05-19 20:24:42.914344');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_favorites`
--

DROP TABLE IF EXISTS `home_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_favorites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stars` decimal(2,1) NOT NULL,
  `pokemon_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_favorites_pokemon_id_a0cab241_fk_home_pokemon_id` (`pokemon_id`),
  KEY `home_favorites_user_id_7c9bc254_fk_auth_user_id` (`user_id`),
  CONSTRAINT `home_favorites_pokemon_id_a0cab241_fk_home_pokemon_id` FOREIGN KEY (`pokemon_id`) REFERENCES `home_pokemon` (`id`),
  CONSTRAINT `home_favorites_user_id_7c9bc254_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_favorites`
--

LOCK TABLES `home_favorites` WRITE;
/*!40000 ALTER TABLE `home_favorites` DISABLE KEYS */;
INSERT INTO `home_favorites` VALUES (11,3.6,460,4),(13,3.2,142,4),(14,0.0,460,6);
/*!40000 ALTER TABLE `home_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_pokemon`
--

DROP TABLE IF EXISTS `home_pokemon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_pokemon` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `url_image` varchar(150) NOT NULL,
  `abilities` longtext NOT NULL,
  `evolutions` longtext NOT NULL,
  `height` int NOT NULL,
  `moves` longtext NOT NULL,
  `types` longtext NOT NULL,
  `weight` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_pokemon`
--

LOCK TABLES `home_pokemon` WRITE;
/*!40000 ALTER TABLE `home_pokemon` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_pokemon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-30 14:48:59