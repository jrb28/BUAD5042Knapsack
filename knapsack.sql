CREATE DATABASE  IF NOT EXISTS `knapsack` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `knapsack`;
-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: knapsack
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `problem_id` bigint(20) NOT NULL,
  `data_id` bigint(20) NOT NULL,
  `volume` double NOT NULL,
  `value` double NOT NULL,
  KEY `fk_data_problem_id_idx` (`problem_id`),
  CONSTRAINT `fk_data_problem_id` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (0,0,1,1),(0,1,1,2),(0,2,1,3),(0,3,1,4),(0,4,1,5),(1,0,2,5),(1,1,2,5),(1,2,2,5),(1,3,2,5),(1,4,2,5),(1,5,2,5),(1,6,2,5),(1,7,2,5),(1,9,3,6),(2,0,23,92),(2,1,31,57),(2,2,29,49),(2,3,44,68),(2,4,53,60),(2,5,38,43),(2,6,63,67),(2,7,85,84),(2,8,89,87),(2,9,82,72),(3,0,12,24),(3,1,7,13),(3,2,11,23),(3,3,8,15),(3,4,9,16),(4,0,56,50),(4,1,59,50),(4,2,80,64),(4,3,64,46),(4,4,75,50),(4,5,17,5),(5,0,31,70),(5,1,10,20),(5,2,20,39),(5,3,19,37),(5,4,4,7),(5,5,3,5),(5,6,6,10),(6,0,25,350),(6,1,35,400),(6,2,45,450),(6,3,5,20),(6,4,25,70),(6,5,3,8),(6,6,2,5),(6,7,2,5),(7,0,41,442),(7,1,50,525),(7,2,49,511),(7,3,59,593),(7,4,55,546),(7,5,57,564),(7,6,60,617),(8,0,70,135),(8,1,73,139),(8,2,77,149),(8,3,80,150),(8,4,82,156),(8,5,87,163),(8,6,90,173),(8,7,94,184),(8,8,98,192),(8,9,106,201),(8,10,110,210),(8,11,113,214),(8,12,115,221),(8,13,118,229),(8,14,120,240),(9,0,382745,825594),(9,1,799601,1677009),(9,2,909247,1676628),(9,3,729069,1523970),(9,4,467902,943972),(9,5,44328,97426),(9,6,34610,69666),(9,7,698150,1296457),(9,8,823460,1679693),(9,9,903959,1902996),(9,10,853665,1844992),(9,11,551830,1049289),(9,12,610856,1252836),(9,13,670702,1319836),(9,14,488960,953277),(9,15,951111,2067538),(9,16,323046,675367),(9,17,446298,853655),(9,18,931161,1826027),(9,19,31385,65731),(9,20,496951,901489),(9,21,264724,577243),(9,22,224916,466257),(9,23,169684,369261);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `user_name` varchar(25) NOT NULL,
  `time_stamp` datetime NOT NULL,
  `status_action` varchar(1000) NOT NULL,
  `filename` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problems` (
  `id` bigint(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `knap_cap` double NOT NULL,
  `optimal_soln` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (0,'Initial debugging data',4,14),(1,'Trick problem where a low-value denisty item is optimal to include in knapsack',17,41),(2,'p01 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',165,309),(3,'p02 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',26,51),(4,'p03 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',190,150),(5,'p04 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',50,107),(6,'p05 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',104,895),(7,'p06 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',170,1735),(8,'p07 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',750,1458),(9,'p08 from http://people.sc.fsu.edu/~jburkardt/datasets/knapsack_01/knapsack_01.html',6404180,13549094);
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `problem_id` bigint(20) NOT NULL,
  `participant_id` varchar(45) NOT NULL,
  `knapsack_load` double NOT NULL,
  `timestamp` datetime NOT NULL,
  KEY `fk_results_problem_id` (`problem_id`),
  CONSTRAINT `fk_results_problem_id` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'knapsack'
--
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteLog`()
BEGIN
    DELETE FROM log;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteResults`()
BEGIN
    DELETE FROM results;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetKnapsackCap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetKnapsackCap`(IN problem_id BIGINT(20))
BEGIN
    SELECT knap_cap FROM problems WHERE id = problem_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetKnapsackData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetKnapsackData`(IN this_problem_id BIGINT(20))
BEGIN
	SELECT data_id, volume, `value` FROM `data` WHERE problem_id = this_problem_id
    ORDER BY data_id ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetLog`()
BEGIN
    SELECT user_name, filename, time_Stamp, status_action FROM knapsack.log ORDER BY time_stamp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetProblemIds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetProblemIds`()
BEGIN
    SELECT problem_id FROM `data` GROUP BY problem_id ORDER BY problem_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetResultsForProblem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetResultsForProblem`(IN this_problem_id BIGINT(20))
BEGIN
  DECLARE minScore DOUBLE;
  DECLARE numScores BIGINT(20);
  DECLARE keyIndex BIGINT(20);
  SELECT COUNT(knapsack_load) INTO numScores FROM results WHERE problem_id = this_problem_id;
  SET keyIndex = 20;
  IF numScores < 20 THEN SET keyIndex = numScores;
  END IF;
  SET keyIndex = keyIndex - 1;
  SELECT knapsack_load INTO minScore FROM results WHERE problem_id = this_problem_id ORDER BY knapsack_load DESC LIMIT keyIndex,1;
  
  SELECT participant_id, `timestamp`, knapsack_load FROM results
  WHERE knapsack_load >= minScore AND problem_id = this_problem_id
  ORDER BY knapsack_load DESC, `timestamp` ASC;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertLog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertLog`(IN this_user_name VARCHAR(45), IN this_status_action VARCHAR(1000), IN this_filename VARCHAR(200))
BEGIN
    INSERT INTO `log`(user_name, time_stamp, status_action, filename) VALUES(this_user_name, CURRENT_TIMESTAMP, this_status_action, this_filename);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsertResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertResults`(IN this_problem_id BIGINT(20), IN this_participant VARCHAR(45), IN this_result DOUBLE)
BEGIN
	INSERT INTO results (`problem_id`,`participant_id`,`knapsack_load`,`timestamp`) 
        VALUES(this_problem_id, this_participant, this_result, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-03  8:11:32
