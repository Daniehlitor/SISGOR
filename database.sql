CREATE DATABASE  IF NOT EXISTS `restaurante` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurante`;
-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restaurante
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `ingredientes_id` int NOT NULL AUTO_INCREMENT,
  `ingredientes_nombre` varchar(50) NOT NULL,
  `ingredientes_descripcion` varchar(250) NOT NULL,
  `ingredientes_cantidad` double NOT NULL,
  `ingredientes_precio` double NOT NULL,
  PRIMARY KEY (`ingredientes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES (1,'Tomate','Tomate',101000,1200000),(2,'Cebolla','Cebolla',20000,10000000);
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedidos_id` int NOT NULL AUTO_INCREMENT,
  `pedidos_users_id` int NOT NULL,
  `pedidos_active` tinyint NOT NULL DEFAULT '1',
  `pedidos_date` datetime NOT NULL,
  PRIMARY KEY (`pedidos_id`),
  KEY `fk_users_users_id_idx` (`pedidos_users_id`),
  CONSTRAINT `fk_pedidos_users_users_id` FOREIGN KEY (`pedidos_users_id`) REFERENCES `users` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `platos_id` int NOT NULL AUTO_INCREMENT,
  `platos_nombre` varchar(50) NOT NULL,
  `platos_descripcion` varchar(250) NOT NULL,
  `platos_precio` double NOT NULL,
  PRIMARY KEY (`platos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos_ingredientes`
--

DROP TABLE IF EXISTS `platos_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos_ingredientes` (
  `platos_ingredientes_id` int NOT NULL AUTO_INCREMENT,
  `platos_ingredientes_platos_id` int NOT NULL,
  `platos_ingredientes_ingredientes_id` int NOT NULL,
  `platos_ingredientes_cantiad` double NOT NULL,
  PRIMARY KEY (`platos_ingredientes_id`),
  KEY `fk_platos_id_idx` (`platos_ingredientes_platos_id`),
  KEY `fk_ingredientes_ingredientes_id_idx` (`platos_ingredientes_ingredientes_id`),
  CONSTRAINT `fk_platos_ingredientes_ingredientes_ingredientes_id` FOREIGN KEY (`platos_ingredientes_ingredientes_id`) REFERENCES `ingredientes` (`ingredientes_id`),
  CONSTRAINT `fk_platos_ingredientes_platos_platos_id` FOREIGN KEY (`platos_ingredientes_platos_id`) REFERENCES `platos` (`platos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos_ingredientes`
--

LOCK TABLES `platos_ingredientes` WRITE;
/*!40000 ALTER TABLE `platos_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `platos_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos_pedidos`
--

DROP TABLE IF EXISTS `platos_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos_pedidos` (
  `platos_pedidos_id` int NOT NULL AUTO_INCREMENT,
  `platos_pedidos_pedidos_id` int NOT NULL,
  `platos_pedidos_platos_id` int NOT NULL,
  `platos_pedidos_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`platos_pedidos_id`),
  KEY `fk_pedidos_pedidos_id_idx` (`platos_pedidos_pedidos_id`),
  KEY `fk_platos_platos_id_idx` (`platos_pedidos_platos_id`),
  CONSTRAINT `fk_platos_pedidos_pedidos_pedidos_id` FOREIGN KEY (`platos_pedidos_pedidos_id`) REFERENCES `pedidos` (`pedidos_id`),
  CONSTRAINT `fk_platos_pedidos_platos_platos_id` FOREIGN KEY (`platos_pedidos_platos_id`) REFERENCES `platos` (`platos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos_pedidos`
--

LOCK TABLES `platos_pedidos` WRITE;
/*!40000 ALTER TABLE `platos_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `platos_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `users_name` varchar(200) NOT NULL,
  `users_id_number` varchar(50) NOT NULL,
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `users_id_number_UNIQUE` (`users_id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-19 23:28:28
