-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: db.nsip.edu.au    Database: sifbddb58aa7e794b408b9e0c3da11595ad
-- ------------------------------------------------------
-- Server version	5.6.51-log

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
-- Table structure for table `AGRound`
--

DROP TABLE IF EXISTS `AGRound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AGRound` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CollectionRound_RefId` varchar(36) NOT NULL,
  `RoundCode` varchar(200) DEFAULT NULL,
  `RoundName` varchar(200) DEFAULT NULL,
  `StartDate` varchar(200) DEFAULT NULL,
  `DueDate` varchar(200) DEFAULT NULL,
  `EndDate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AGRound_CollectionRound_IX` (`CollectionRound_RefId`),
  CONSTRAINT `AGRound_CollectionRound_FK` FOREIGN KEY (`CollectionRound_RefId`) REFERENCES `CollectionRound` (`RefId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AGRound`
--

LOCK TABLES `AGRound` WRITE;
/*!40000 ALTER TABLE `AGRound` DISABLE KEYS */;
INSERT INTO `AGRound` VALUES (1,'E52D1EA0-54A0-455F-9706-4735146A54A3','COI 2022-01','Non-Government School Census 2022:01','2022-03-01','2022-03-30','2022-03-30'),(2,'E52D1EA0-54A0-455F-9706-4735146A54A3','COI 2022-02','Non-Government School Census 2022:02','2022-09-01','2022-09-30','2022-09-30'),(3,'AFDF2016-22F6-456F-A8A3-B5618879CBBA','FQ 2022-01','Financial Questionnaire 2022:01','2022-03-01','2022-03-30','2022-03-30'),(4,'AFDF2016-22F6-456F-A8A3-B5618879CBBA','FQ 2022-02','Financial Questionnaire 2022:02','2022-09-01','2022-09-30','2022-09-30'),(5,'5B1A2F2B-C850-4E20-8A53-AB286962A03B','SES 2022-01','Address Collection 2022:01','2022-03-01','2022-03-30','2022-03-30'),(6,'5B1A2F2B-C850-4E20-8A53-AB286962A03B','SES 2022-02','Address Collection 2022:02','2022-09-01','2022-09-30','2022-09-30'),(7,'FE14F44D-FA53-4781-95D0-6B21310E0AA3','STATS 2022-01','Student Attendance 2022:01','2022-03-01','2022-03-30','2022-03-30'),(8,'FE14F44D-FA53-4781-95D0-6B21310E0AA3','STATS 2022-02','Student Attendance 2022:02','2022-09-01','2022-09-30','2022-09-30');
/*!40000 ALTER TABLE `AGRound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `RecordNumber` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Person_RefId` varchar(36) DEFAULT NULL,
  `AddressType` varchar(200) DEFAULT NULL,
  `AddressRole` varchar(200) DEFAULT NULL,
  `StreetNumber` varchar(200) DEFAULT NULL,
  `StreetName` varchar(200) DEFAULT NULL,
  `Line1` varchar(200) DEFAULT NULL,
  `Line2` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `StateProvince` varchar(200) DEFAULT NULL,
  `PostalCode` varchar(200) DEFAULT NULL,
  `Longitude` varchar(200) DEFAULT NULL,
  `Latitude` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RecordNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_ContextualQuestion`
--

DROP TABLE IF EXISTS `AddressCR_ContextualQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_ContextualQuestion` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Id` mediumint(9) NOT NULL,
  `Context` varchar(200) DEFAULT NULL,
  `Answer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ContextualQuestion_AddressCR_IX` (`AddressCR_Id`),
  CONSTRAINT `ContextualQuestion_AddressCR_FK` FOREIGN KEY (`AddressCR_Id`) REFERENCES `AddressCollectionReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_ContextualQuestion`
--

LOCK TABLES `AddressCR_ContextualQuestion` WRITE;
/*!40000 ALTER TABLE `AddressCR_ContextualQuestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_ContextualQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_EntityContact`
--

DROP TABLE IF EXISTS `AddressCR_EntityContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_EntityContact` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Id` mediumint(9) NOT NULL,
  `PositionTitle` varchar(200) DEFAULT NULL,
  `Role` varchar(200) DEFAULT NULL,
  `RegistrationDetails` varchar(200) DEFAULT NULL,
  `Qualifications` varchar(200) DEFAULT NULL,
  `Email_Type` varchar(200) DEFAULT NULL,
  `Email_Value` varchar(200) DEFAULT NULL,
  `PhoneNumber_Type` varchar(200) DEFAULT NULL,
  `PhoneNumber_Number` varchar(200) DEFAULT NULL,
  `PhoneNumber_Extension` varchar(200) DEFAULT NULL,
  `PhoneNumber_ListedStatus` varchar(200) DEFAULT NULL,
  `PhoneNumber_Preference` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EntityContact_AddressCR_IX` (`AddressCR_Id`),
  CONSTRAINT `EntityContact_AddressCR_FK` FOREIGN KEY (`AddressCR_Id`) REFERENCES `AddressCollectionReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_EntityContact`
--

LOCK TABLES `AddressCR_EntityContact` WRITE;
/*!40000 ALTER TABLE `AddressCR_EntityContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_EntityContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_EntityContact_Address`
--

DROP TABLE IF EXISTS `AddressCR_EntityContact_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_EntityContact_Address` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_EntityContact_Id` mediumint(9) NOT NULL,
  `AddressType` varchar(200) DEFAULT NULL,
  `AddressRole` varchar(200) DEFAULT NULL,
  `EffectiveFromDate` varchar(200) DEFAULT NULL,
  `EffectiveToDate` varchar(200) DEFAULT NULL,
  `Street_Line1` varchar(200) DEFAULT NULL,
  `Street_Line2` varchar(200) DEFAULT NULL,
  `Street_Line3` varchar(200) DEFAULT NULL,
  `Street_Complex` varchar(200) DEFAULT NULL,
  `Street_StreetNumber` varchar(200) DEFAULT NULL,
  `Street_StreetPrefix` varchar(200) DEFAULT NULL,
  `Street_StreetName` varchar(200) DEFAULT NULL,
  `Street_StreetType` varchar(200) DEFAULT NULL,
  `Street_StreetSuffix` varchar(200) DEFAULT NULL,
  `Street_ApartmentType` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberPrefix` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumber` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberSuffix` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `StateProvince` varchar(200) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `PostalCode` varchar(200) DEFAULT NULL,
  `GridLocation_Latitude` varchar(200) DEFAULT NULL,
  `GridLocation_Longitude` varchar(200) DEFAULT NULL,
  `MapReference_Type` varchar(200) DEFAULT NULL,
  `MapReference_XCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_YCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_MapNumber` varchar(200) DEFAULT NULL,
  `RadioContact` varchar(200) DEFAULT NULL,
  `Community` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `AddressGlobalUID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Address_AddressCREntityContact_IX` (`AddressCR_EntityContact_Id`),
  CONSTRAINT `Address_AddressCREntityContact_FK` FOREIGN KEY (`AddressCR_EntityContact_Id`) REFERENCES `AddressCR_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_EntityContact_Address`
--

LOCK TABLES `AddressCR_EntityContact_Address` WRITE;
/*!40000 ALTER TABLE `AddressCR_EntityContact_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_EntityContact_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_EntityContact_Address_StatisticalArea`
--

DROP TABLE IF EXISTS `AddressCR_EntityContact_Address_StatisticalArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_EntityContact_Address_StatisticalArea` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_EntityContact_Address_Id` mediumint(9) NOT NULL,
  `spatialUnitType` varchar(200) DEFAULT NULL,
  `statisticalArea` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StatArea_AddressCREntityContactAddress_IX` (`AddressCR_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_AddressCREntityContactAddress_FK` FOREIGN KEY (`AddressCR_EntityContact_Address_Id`) REFERENCES `AddressCR_EntityContact_Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_EntityContact_Address_StatisticalArea`
--

LOCK TABLES `AddressCR_EntityContact_Address_StatisticalArea` WRITE;
/*!40000 ALTER TABLE `AddressCR_EntityContact_Address_StatisticalArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_EntityContact_Address_StatisticalArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_EntityContact_Name`
--

DROP TABLE IF EXISTS `AddressCR_EntityContact_Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_EntityContact_Name` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_EntityContact_Id` mediumint(9) NOT NULL,
  `NameType` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(200) DEFAULT NULL,
  `GivenName` varchar(200) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `FamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `PreferredFamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `Suffix` varchar(200) DEFAULT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Name_AddressCREntityContact_IX` (`AddressCR_EntityContact_Id`),
  CONSTRAINT `Name_AddressCREntityContact_FK` FOREIGN KEY (`AddressCR_EntityContact_Id`) REFERENCES `AddressCR_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_EntityContact_Name`
--

LOCK TABLES `AddressCR_EntityContact_Name` WRITE;
/*!40000 ALTER TABLE `AddressCR_EntityContact_Name` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_EntityContact_Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_Parent`
--

DROP TABLE IF EXISTS `AddressCR_Parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_Parent` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Student_Id` mediumint(9) NOT NULL,
  `ParentNumber` mediumint(9) DEFAULT NULL,
  `AddressSameAsStudent` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Parent_AddressCRStudent_IX` (`AddressCR_Student_Id`),
  CONSTRAINT `Parent_AddressCRStudent_FK` FOREIGN KEY (`AddressCR_Student_Id`) REFERENCES `AddressCR_Student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_Parent`
--

LOCK TABLES `AddressCR_Parent` WRITE;
/*!40000 ALTER TABLE `AddressCR_Parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_Parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_Parent_Address`
--

DROP TABLE IF EXISTS `AddressCR_Parent_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_Parent_Address` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Parent_Id` mediumint(9) NOT NULL,
  `AddressType` varchar(200) DEFAULT NULL,
  `AddressRole` varchar(200) DEFAULT NULL,
  `EffectiveFromDate` varchar(200) DEFAULT NULL,
  `EffectiveToDate` varchar(200) DEFAULT NULL,
  `Street_Line1` varchar(200) DEFAULT NULL,
  `Street_Line2` varchar(200) DEFAULT NULL,
  `Street_Line3` varchar(200) DEFAULT NULL,
  `Street_Complex` varchar(200) DEFAULT NULL,
  `Street_StreetNumber` varchar(200) DEFAULT NULL,
  `Street_StreetPrefix` varchar(200) DEFAULT NULL,
  `Street_StreetName` varchar(200) DEFAULT NULL,
  `Street_StreetType` varchar(200) DEFAULT NULL,
  `Street_StreetSuffix` varchar(200) DEFAULT NULL,
  `Street_ApartmentType` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberPrefix` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumber` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberSuffix` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `StateProvince` varchar(200) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `PostalCode` varchar(200) DEFAULT NULL,
  `GridLocation_Latitude` varchar(200) DEFAULT NULL,
  `GridLocation_Longitude` varchar(200) DEFAULT NULL,
  `MapReference_Type` varchar(200) DEFAULT NULL,
  `MapReference_XCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_YCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_MapNumber` varchar(200) DEFAULT NULL,
  `RadioContact` varchar(200) DEFAULT NULL,
  `Community` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `AddressGlobalUID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Address_AddressCRParent_IX` (`AddressCR_Parent_Id`),
  CONSTRAINT `Address_AddressCRParent_FK` FOREIGN KEY (`AddressCR_Parent_Id`) REFERENCES `AddressCR_Parent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_Parent_Address`
--

LOCK TABLES `AddressCR_Parent_Address` WRITE;
/*!40000 ALTER TABLE `AddressCR_Parent_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_Parent_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_Parent_Address_StatisticalArea`
--

DROP TABLE IF EXISTS `AddressCR_Parent_Address_StatisticalArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_Parent_Address_StatisticalArea` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Parent_Address_Id` mediumint(9) NOT NULL,
  `spatialUnitType` varchar(200) DEFAULT NULL,
  `statisticalArea` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StatArea_AddressCRParentAddress_IX` (`AddressCR_Parent_Address_Id`),
  CONSTRAINT `StatArea_AddressCRParentAddress_FK` FOREIGN KEY (`AddressCR_Parent_Address_Id`) REFERENCES `AddressCR_Parent_Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_Parent_Address_StatisticalArea`
--

LOCK TABLES `AddressCR_Parent_Address_StatisticalArea` WRITE;
/*!40000 ALTER TABLE `AddressCR_Parent_Address_StatisticalArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_Parent_Address_StatisticalArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_Parent_Name`
--

DROP TABLE IF EXISTS `AddressCR_Parent_Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_Parent_Name` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Parent_Id` mediumint(9) NOT NULL,
  `NameType` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(200) DEFAULT NULL,
  `GivenName` varchar(200) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `FamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `PreferredFamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `Suffix` varchar(200) DEFAULT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Name_AddressCRParent_IX` (`AddressCR_Parent_Id`),
  CONSTRAINT `Name_AddressCRParent_FK` FOREIGN KEY (`AddressCR_Parent_Id`) REFERENCES `AddressCR_Parent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_Parent_Name`
--

LOCK TABLES `AddressCR_Parent_Name` WRITE;
/*!40000 ALTER TABLE `AddressCR_Parent_Name` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_Parent_Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_Student`
--

DROP TABLE IF EXISTS `AddressCR_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_Student` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Id` mediumint(9) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `EducationLevel` varchar(200) DEFAULT NULL,
  `BoardingStatus` varchar(200) DEFAULT NULL,
  `ReportingParent2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Student_AddressCR_IX` (`AddressCR_Id`),
  CONSTRAINT `Student_AddressCR_FK` FOREIGN KEY (`AddressCR_Id`) REFERENCES `AddressCollectionReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_Student`
--

LOCK TABLES `AddressCR_Student` WRITE;
/*!40000 ALTER TABLE `AddressCR_Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_Student_Address`
--

DROP TABLE IF EXISTS `AddressCR_Student_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_Student_Address` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Student_Id` mediumint(9) NOT NULL,
  `AddressType` varchar(200) DEFAULT NULL,
  `AddressRole` varchar(200) DEFAULT NULL,
  `EffectiveFromDate` varchar(200) DEFAULT NULL,
  `EffectiveToDate` varchar(200) DEFAULT NULL,
  `Street_Line1` varchar(200) DEFAULT NULL,
  `Street_Line2` varchar(200) DEFAULT NULL,
  `Street_Line3` varchar(200) DEFAULT NULL,
  `Street_Complex` varchar(200) DEFAULT NULL,
  `Street_StreetNumber` varchar(200) DEFAULT NULL,
  `Street_StreetPrefix` varchar(200) DEFAULT NULL,
  `Street_StreetName` varchar(200) DEFAULT NULL,
  `Street_StreetType` varchar(200) DEFAULT NULL,
  `Street_StreetSuffix` varchar(200) DEFAULT NULL,
  `Street_ApartmentType` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberPrefix` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumber` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberSuffix` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `StateProvince` varchar(200) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `PostalCode` varchar(200) DEFAULT NULL,
  `GridLocation_Latitude` varchar(200) DEFAULT NULL,
  `GridLocation_Longitude` varchar(200) DEFAULT NULL,
  `MapReference_Type` varchar(200) DEFAULT NULL,
  `MapReference_XCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_YCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_MapNumber` varchar(200) DEFAULT NULL,
  `RadioContact` varchar(200) DEFAULT NULL,
  `Community` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `AddressGlobalUID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Address_AddressCRStudent_IX` (`AddressCR_Student_Id`),
  CONSTRAINT `Address_AddressCRStudent_FK` FOREIGN KEY (`AddressCR_Student_Id`) REFERENCES `AddressCR_Student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_Student_Address`
--

LOCK TABLES `AddressCR_Student_Address` WRITE;
/*!40000 ALTER TABLE `AddressCR_Student_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_Student_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCR_Student_Address_StatisticalArea`
--

DROP TABLE IF EXISTS `AddressCR_Student_Address_StatisticalArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCR_Student_Address_StatisticalArea` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCR_Student_Address_Id` mediumint(9) NOT NULL,
  `spatialUnitType` varchar(200) DEFAULT NULL,
  `statisticalArea` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StatArea_AddressCRStudentAddress_IX` (`AddressCR_Student_Address_Id`),
  CONSTRAINT `StatArea_AddressCRStudentAddress_FK` FOREIGN KEY (`AddressCR_Student_Address_Id`) REFERENCES `AddressCR_Student_Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCR_Student_Address_StatisticalArea`
--

LOCK TABLES `AddressCR_Student_Address_StatisticalArea` WRITE;
/*!40000 ALTER TABLE `AddressCR_Student_Address_StatisticalArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCR_Student_Address_StatisticalArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCollection`
--

DROP TABLE IF EXISTS `AddressCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCollection` (
  `RefId` varchar(36) NOT NULL,
  `AddressCollectionYear` varchar(200) DEFAULT NULL,
  `RoundCode` varchar(200) DEFAULT NULL,
  `ReportingAuthorityCommonwealthId` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareProduct` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareVersion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCollection`
--

LOCK TABLES `AddressCollection` WRITE;
/*!40000 ALTER TABLE `AddressCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCollectionReporting`
--

DROP TABLE IF EXISTS `AddressCollectionReporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCollectionReporting` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCollection_RefId` varchar(36) NOT NULL,
  `EntityLevel` varchar(200) DEFAULT NULL,
  `SchoolInfoRefId` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `StateProvinceId` varchar(200) DEFAULT NULL,
  `CommonwealthId` varchar(200) DEFAULT NULL,
  `AcaraId` varchar(200) DEFAULT NULL,
  `EntityName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AddressCollectionReporting_AddressCollection_IX` (`AddressCollection_RefId`),
  CONSTRAINT `AddressCollectionReporting_AddressCollection_FK` FOREIGN KEY (`AddressCollection_RefId`) REFERENCES `AddressCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCollectionReporting`
--

LOCK TABLES `AddressCollectionReporting` WRITE;
/*!40000 ALTER TABLE `AddressCollectionReporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCollectionReporting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AddressCollection_LocalCode`
--

DROP TABLE IF EXISTS `AddressCollection_LocalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AddressCollection_LocalCode` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AddressCollection_RefId` varchar(36) NOT NULL,
  `LocalisedCode` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Element` varchar(200) DEFAULT NULL,
  `ListIndex` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocalCode_AddressCollection_IX` (`AddressCollection_RefId`),
  CONSTRAINT `LocalCode_AddressCollection_FK` FOREIGN KEY (`AddressCollection_RefId`) REFERENCES `AddressCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddressCollection_LocalCode`
--

LOCK TABLES `AddressCollection_LocalCode` WRITE;
/*!40000 ALTER TABLE `AddressCollection_LocalCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddressCollection_LocalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarDate`
--

DROP TABLE IF EXISTS `CalendarDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CalendarDate` (
  `CalendarDate` varchar(200) DEFAULT NULL,
  `CalendarSummary_RefId` varchar(36) DEFAULT NULL,
  `RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `CalendarDateType_Code` varchar(200) DEFAULT NULL,
  `CalendarDateNumber` varchar(200) DEFAULT NULL,
  `StudentAttendance_CountsTowardsAttendance` varchar(200) DEFAULT NULL,
  `StudentAttendance_AttendanceValue` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `CalendarSummary_RefId` (`CalendarSummary_RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `CalendarDate_ibfk_1` FOREIGN KEY (`CalendarSummary_RefId`) REFERENCES `CalendarSummary` (`RefId`),
  CONSTRAINT `CalendarDate_ibfk_2` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarDate`
--

LOCK TABLES `CalendarDate` WRITE;
/*!40000 ALTER TABLE `CalendarDate` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarDate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarDateType_OtherCodeList`
--

DROP TABLE IF EXISTS `CalendarDateType_OtherCodeList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CalendarDateType_OtherCodeList` (
  `CalendarDate_RefId` varchar(36) DEFAULT NULL,
  `OtherCode` varchar(100) DEFAULT NULL,
  `OtherCode_CodeSet` varchar(100) DEFAULT NULL,
  KEY `CalendarDate_RefId` (`CalendarDate_RefId`),
  CONSTRAINT `CalendarDateType_OtherCodeList_ibfk_1` FOREIGN KEY (`CalendarDate_RefId`) REFERENCES `CalendarDate` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarDateType_OtherCodeList`
--

LOCK TABLES `CalendarDateType_OtherCodeList` WRITE;
/*!40000 ALTER TABLE `CalendarDateType_OtherCodeList` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarDateType_OtherCodeList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarSummary`
--

DROP TABLE IF EXISTS `CalendarSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CalendarSummary` (
  `RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `CalendarSummary_LocalId` varchar(200) DEFAULT NULL,
  `DaysInSession` varchar(200) DEFAULT NULL,
  `StartDate` varchar(200) DEFAULT NULL,
  `EndDate` varchar(200) DEFAULT NULL,
  `FirstInstructionDate` varchar(200) DEFAULT NULL,
  `LastInstructionDate` varchar(200) DEFAULT NULL,
  `InstructionalMinutes` varchar(200) DEFAULT NULL,
  `MinutesPerDay` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `CalendarSummary_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarSummary`
--

LOCK TABLES `CalendarSummary` WRITE;
/*!40000 ALTER TABLE `CalendarSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CalendarSummary_YearLevel`
--

DROP TABLE IF EXISTS `CalendarSummary_YearLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CalendarSummary_YearLevel` (
  `CalendarSummary_RefId` varchar(36) DEFAULT NULL,
  `YearLevel` varchar(200) DEFAULT NULL,
  KEY `CalendarSummary_YearLevel_ibfk_1_idx` (`CalendarSummary_RefId`),
  CONSTRAINT `CalendarSummary_YearLevel_ibfk_1` FOREIGN KEY (`CalendarSummary_RefId`) REFERENCES `CalendarSummary` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CalendarSummary_YearLevel`
--

LOCK TABLES `CalendarSummary_YearLevel` WRITE;
/*!40000 ALTER TABLE `CalendarSummary_YearLevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `CalendarSummary_YearLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusCollection`
--

DROP TABLE IF EXISTS `CensusCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusCollection` (
  `RefId` varchar(36) NOT NULL,
  `CensusYear` varchar(200) DEFAULT NULL,
  `RoundCode` varchar(200) DEFAULT NULL,
  `ReportingAuthorityCommonwealthId` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareProduct` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareVersion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusCollection`
--

LOCK TABLES `CensusCollection` WRITE;
/*!40000 ALTER TABLE `CensusCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting`
--

DROP TABLE IF EXISTS `CensusReporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusCollection_RefId` varchar(36) NOT NULL,
  `EntityLevel` varchar(200) DEFAULT NULL,
  `CommonwealthId` varchar(200) DEFAULT NULL,
  `EntityName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CensusReporting_CensusCollection_IX` (`CensusCollection_RefId`),
  CONSTRAINT `CensusReporting_CensusCollection_FK` FOREIGN KEY (`CensusCollection_RefId`) REFERENCES `CensusCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting`
--

LOCK TABLES `CensusReporting` WRITE;
/*!40000 ALTER TABLE `CensusReporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting_EntityContact`
--

DROP TABLE IF EXISTS `CensusReporting_EntityContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting_EntityContact` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusReporting_Id` mediumint(9) NOT NULL,
  `PositionTitle` varchar(200) DEFAULT NULL,
  `Role` varchar(200) DEFAULT NULL,
  `RegistrationDetails` varchar(200) DEFAULT NULL,
  `Qualifications` varchar(200) DEFAULT NULL,
  `Email_Type` varchar(200) DEFAULT NULL,
  `Email_Value` varchar(200) DEFAULT NULL,
  `PhoneNumber_Type` varchar(200) DEFAULT NULL,
  `PhoneNumber_Number` varchar(200) DEFAULT NULL,
  `PhoneNumber_Extension` varchar(200) DEFAULT NULL,
  `PhoneNumber_ListedStatus` varchar(200) DEFAULT NULL,
  `PhoneNumber_Preference` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EntityContact_CensusReporting_IX` (`CensusReporting_Id`),
  CONSTRAINT `EntityContact_CensusReporting_FK` FOREIGN KEY (`CensusReporting_Id`) REFERENCES `CensusReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting_EntityContact`
--

LOCK TABLES `CensusReporting_EntityContact` WRITE;
/*!40000 ALTER TABLE `CensusReporting_EntityContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting_EntityContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting_EntityContact_Address`
--

DROP TABLE IF EXISTS `CensusReporting_EntityContact_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting_EntityContact_Address` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusReporting_EntityContact_Id` mediumint(9) NOT NULL,
  `AddressType` varchar(200) DEFAULT NULL,
  `AddressRole` varchar(200) DEFAULT NULL,
  `EffectiveFromDate` varchar(200) DEFAULT NULL,
  `EffectiveToDate` varchar(200) DEFAULT NULL,
  `Street_Line1` varchar(200) DEFAULT NULL,
  `Street_Line2` varchar(200) DEFAULT NULL,
  `Street_Line3` varchar(200) DEFAULT NULL,
  `Street_Complex` varchar(200) DEFAULT NULL,
  `Street_StreetNumber` varchar(200) DEFAULT NULL,
  `Street_StreetPrefix` varchar(200) DEFAULT NULL,
  `Street_StreetName` varchar(200) DEFAULT NULL,
  `Street_StreetType` varchar(200) DEFAULT NULL,
  `Street_StreetSuffix` varchar(200) DEFAULT NULL,
  `Street_ApartmentType` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberPrefix` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumber` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberSuffix` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `StateProvince` varchar(200) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `PostalCode` varchar(200) DEFAULT NULL,
  `GridLocation_Latitude` varchar(200) DEFAULT NULL,
  `GridLocation_Longitude` varchar(200) DEFAULT NULL,
  `MapReference_Type` varchar(200) DEFAULT NULL,
  `MapReference_XCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_YCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_MapNumber` varchar(200) DEFAULT NULL,
  `RadioContact` varchar(200) DEFAULT NULL,
  `Community` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `AddressGlobalUID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Address_CensusReportingEntityContact_IX` (`CensusReporting_EntityContact_Id`),
  CONSTRAINT `Address_CensusReportingEntityContact_FK` FOREIGN KEY (`CensusReporting_EntityContact_Id`) REFERENCES `CensusReporting_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting_EntityContact_Address`
--

LOCK TABLES `CensusReporting_EntityContact_Address` WRITE;
/*!40000 ALTER TABLE `CensusReporting_EntityContact_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting_EntityContact_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting_EntityContact_Address_StatisticalArea`
--

DROP TABLE IF EXISTS `CensusReporting_EntityContact_Address_StatisticalArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting_EntityContact_Address_StatisticalArea` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusReporting_EntityContact_Address_Id` mediumint(9) NOT NULL,
  `spatialUnitType` varchar(200) DEFAULT NULL,
  `statisticalArea` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StatArea_CensusReportingEntityContactAddress_IX` (`CensusReporting_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_CensusReportingEntityContactAddress_FK` FOREIGN KEY (`CensusReporting_EntityContact_Address_Id`) REFERENCES `CensusReporting_EntityContact_Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting_EntityContact_Address_StatisticalArea`
--

LOCK TABLES `CensusReporting_EntityContact_Address_StatisticalArea` WRITE;
/*!40000 ALTER TABLE `CensusReporting_EntityContact_Address_StatisticalArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting_EntityContact_Address_StatisticalArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting_EntityContact_Name`
--

DROP TABLE IF EXISTS `CensusReporting_EntityContact_Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting_EntityContact_Name` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusReporting_EntityContact_Id` mediumint(9) NOT NULL,
  `NameType` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(200) DEFAULT NULL,
  `GivenName` varchar(200) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `FamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `PreferredFamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `Suffix` varchar(200) DEFAULT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Name_CensusReportingEntityContact_IX` (`CensusReporting_EntityContact_Id`),
  CONSTRAINT `Name_CensusReportingEntityContact_FK` FOREIGN KEY (`CensusReporting_EntityContact_Id`) REFERENCES `CensusReporting_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting_EntityContact_Name`
--

LOCK TABLES `CensusReporting_EntityContact_Name` WRITE;
/*!40000 ALTER TABLE `CensusReporting_EntityContact_Name` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting_EntityContact_Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting_Staff`
--

DROP TABLE IF EXISTS `CensusReporting_Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting_Staff` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusReporting_Id` mediumint(9) NOT NULL,
  `StaffCohortId` varchar(200) DEFAULT NULL,
  `StaffActivity` varchar(200) DEFAULT NULL,
  `CohortGender` varchar(200) DEFAULT NULL,
  `CohortIndigenousType` varchar(200) DEFAULT NULL,
  `PrimaryFTE` varchar(200) DEFAULT NULL,
  `SecondaryFTE` varchar(200) DEFAULT NULL,
  `JobFTE` varchar(200) DEFAULT NULL,
  `HeadCount` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Staff_CensusReporting_IX` (`CensusReporting_Id`),
  CONSTRAINT `Staff_CensusReporting_FK` FOREIGN KEY (`CensusReporting_Id`) REFERENCES `CensusReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting_Staff`
--

LOCK TABLES `CensusReporting_Staff` WRITE;
/*!40000 ALTER TABLE `CensusReporting_Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting_Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting_Staff_ActivityOtherCode`
--

DROP TABLE IF EXISTS `CensusReporting_Staff_ActivityOtherCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting_Staff_ActivityOtherCode` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusReporting_Staff_Id` mediumint(9) NOT NULL,
  `OtherCode` varchar(200) DEFAULT NULL,
  `Codeset` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ActivityOtherCode_CensusReportingStaff_IX` (`CensusReporting_Staff_Id`),
  CONSTRAINT `ActivityOtherCode_CensusReportingStaff_FK` FOREIGN KEY (`CensusReporting_Staff_Id`) REFERENCES `CensusReporting_Staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting_Staff_ActivityOtherCode`
--

LOCK TABLES `CensusReporting_Staff_ActivityOtherCode` WRITE;
/*!40000 ALTER TABLE `CensusReporting_Staff_ActivityOtherCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting_Staff_ActivityOtherCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CensusReporting_Student`
--

DROP TABLE IF EXISTS `CensusReporting_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CensusReporting_Student` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CensusReporting_Id` mediumint(9) NOT NULL,
  `StudentCohortId` varchar(200) DEFAULT NULL,
  `YearLevel` varchar(200) DEFAULT NULL,
  `CensusAge` varchar(200) DEFAULT NULL,
  `CohortGender` varchar(200) DEFAULT NULL,
  `CohortIndigenousType` varchar(200) DEFAULT NULL,
  `EducationMode` varchar(200) DEFAULT NULL,
  `StudentOnVisa` varchar(200) DEFAULT NULL,
  `OverseasStudent` varchar(200) DEFAULT NULL,
  `DisabilityLevelOfAdjustment` varchar(200) DEFAULT NULL,
  `DisabilityCategory` varchar(200) DEFAULT NULL,
  `Fte` varchar(200) DEFAULT NULL,
  `Headcount` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Student_CensusReporting_IX` (`CensusReporting_Id`),
  CONSTRAINT `Student_CensusReporting_FK` FOREIGN KEY (`CensusReporting_Id`) REFERENCES `CensusReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CensusReporting_Student`
--

LOCK TABLES `CensusReporting_Student` WRITE;
/*!40000 ALTER TABLE `CensusReporting_Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `CensusReporting_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CodeSet`
--

DROP TABLE IF EXISTS `CodeSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CodeSet` (
  `CodeSet` varchar(100) DEFAULT NULL,
  `CodeKey` varchar(250) DEFAULT NULL,
  `CodeValue` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodeSet`
--

LOCK TABLES `CodeSet` WRITE;
/*!40000 ALTER TABLE `CodeSet` DISABLE KEYS */;
/*!40000 ALTER TABLE `CodeSet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionRound`
--

DROP TABLE IF EXISTS `CollectionRound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionRound` (
  `RefId` varchar(36) NOT NULL,
  `AGCollection` varchar(200) DEFAULT NULL,
  `CollectionYear` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionRound`
--

LOCK TABLES `CollectionRound` WRITE;
/*!40000 ALTER TABLE `CollectionRound` DISABLE KEYS */;
INSERT INTO `CollectionRound` VALUES ('5B1A2F2B-C850-4E20-8A53-AB286962A03B','SES','2022'),('AFDF2016-22F6-456F-A8A3-B5618879CBBA','FQ','2022'),('E52D1EA0-54A0-455F-9706-4735146A54A3','COI','2022'),('FE14F44D-FA53-4781-95D0-6B21310E0AA3','STATS','2022');
/*!40000 ALTER TABLE `CollectionRound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionRound_LocalCode`
--

DROP TABLE IF EXISTS `CollectionRound_LocalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionRound_LocalCode` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CollectionRound_RefId` varchar(36) NOT NULL,
  `LocalisedCode` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Element` varchar(200) DEFAULT NULL,
  `ListIndex` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocalCode_CollectionRound_IX` (`CollectionRound_RefId`),
  CONSTRAINT `LocalCode_CollectionRound_FK` FOREIGN KEY (`CollectionRound_RefId`) REFERENCES `CollectionRound` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionRound_LocalCode`
--

LOCK TABLES `CollectionRound_LocalCode` WRITE;
/*!40000 ALTER TABLE `CollectionRound_LocalCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionRound_LocalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionStatus`
--

DROP TABLE IF EXISTS `CollectionStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionStatus` (
  `RefId` varchar(36) NOT NULL,
  `ReportingAuthority` varchar(200) DEFAULT NULL,
  `ReportingAuthoritySystem` varchar(200) DEFAULT NULL,
  `ReportingAuthorityCommonwealthId` varchar(200) DEFAULT NULL,
  `SubmittedBy` varchar(200) DEFAULT NULL,
  `SubmissionTimestamp` varchar(200) DEFAULT NULL,
  `AgCollection` varchar(200) DEFAULT NULL,
  `CollectionYear` varchar(200) DEFAULT NULL,
  `RoundCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionStatus`
--

LOCK TABLES `CollectionStatus` WRITE;
/*!40000 ALTER TABLE `CollectionStatus` DISABLE KEYS */;
INSERT INTO `CollectionStatus` VALUES ('00A496EB-026D-4216-9E7F-B4ED2A8C91DA','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('01EE051F-3581-45C8-97FF-04D030E33C14','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('035D7658-6C8D-4897-AEF4-3381AE9B61BA','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('052960D7-C072-4C0B-936D-FE7629900C8C','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('06C19839-D0F6-4528-A01E-9EC572758AB3','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('0EB42EEF-3314-46A3-9E81-A62AAD851F7B','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('15EF8205-46C6-4C3C-95ED-8A9C23AB1CF5','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('18BD5BC8-F216-4BB8-876B-4AECCF679C63','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('19A4ACF4-DF59-47F7-BC9D-BDF29D7BE39F','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('19AAD574-C5BC-4323-81DA-FCC277439171','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('1CFB2593-DA60-4901-8312-0A2918B8512A','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('1E80272F-495E-444D-8E0F-F16F3484213B','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('202DC365-A03E-4B5E-9D91-47D44B2CB936','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('242DB82A-A3A6-4614-BC7C-87C8979F1DFD','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('2BD77E44-D6A4-404D-B176-82EB231BB382','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('2E36ED20-CA50-42AB-AC35-807F72618CD0','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('337E2614-069F-4AD5-817A-1BFB6CDBCB32','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('37D7514A-89B3-4587-9F9A-DB45D4962171','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('39F2E1F2-1F36-46C2-B908-36A3FDFCC144','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('3A060E49-CD6C-43AB-ACAA-1DC0DDD9E212','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('3D052139-DC99-4E63-A43A-4B1E16430F62','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('3EA6E355-9510-4333-BC0E-2E5D43C38E5F','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('4001DDFC-EED0-4532-93ED-FA0B4402B9F1','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('40D87C51-279C-4DC0-8E3D-763843C7D7C1','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('42BC0E03-F4C1-4939-83BD-99F88A2196A3','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('4A5D0B98-C040-459F-83F1-96B81615514F','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('4B8A078D-A496-4C99-B7FC-C29E22446D6F','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('4C6099B1-290F-42FA-84A6-16B96FA987C8','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('5188E1CD-D268-4E00-9E2C-C8D3CCD9AAFC','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('53FB31C9-C13B-4344-ACEC-3F5957EB641E','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('59C94FB2-0EB1-4F2F-9EA3-0E3C638E9860','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('5A48E36F-2612-4118-A782-6AE46352525E','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('5BC36D74-B7D1-4D72-AA30-7949B6E5375F','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('5FB2FB97-0F67-451E-873D-1EB722DE9F31','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('63BF4705-F3AD-4C43-8ED6-8C05B61F06C4','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('63FC5CFA-2DA6-4D42-BDA8-C2FC0C74D147','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('66AA9E29-B6D5-4938-8010-C8F0D85183F0','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('6BE8FD50-7FC2-4D8B-880C-CF3A5B07C51C','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('6DBA9B90-64B0-4D2E-A1BB-DEAD5C551524','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('706C8A9C-9294-4753-A404-3A1A9CF1D2BF','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('76241934-023D-4425-9B01-0A18435D8121','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('78A12339-C929-4EE5-A8E7-732050DBF951','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('7D424D46-CF77-4807-A3B2-02CDC395FA07','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('7F2D5FCD-11D7-4BE0-9194-4708490E4E94','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('890D0D03-0E68-4EC4-862B-57B3C249D7D9','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('8AE7C2FF-A76D-4174-8BE0-21946B3ADA49','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('8BDC10DA-23A4-4661-B1BC-AE7E0100D089','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('91837860-6257-4D0B-BD59-378A9E0989D8','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('925C5BBF-D810-4FD6-A488-CA19EF6BFA7C','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('9417926B-5580-4F57-B1B2-EF2D1CDC2F64','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('96D05E7E-E6F3-4C6C-840E-FAFA6EF9A919','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('9E2AD5AF-D646-4515-A454-49FA43AC9F3B','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('A77381DA-9FF2-404C-A540-07DC9712E1AD','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('AE3B00A8-2972-4673-98E2-7C04CE87CF50','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('B2F04E40-75FC-4C47-BEB0-417E301F0391','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('B59FBEC8-678C-497C-BC0F-1BDBDC400D69','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('B5C8618B-805A-49FF-8A2F-DF8C8BA67E66','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('B6065AC0-22CB-42AF-BAC2-B20F98FA43C1','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','COI','2022','COI 2022-02'),('B7F21C34-092E-437C-8540-E6E5859FE6F3','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('BE524351-C02D-4DA2-A0A8-80F0E6CE4235','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('BFD1EF63-79CE-47B4-9781-9F66A7CB9E7A','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('C07F1F93-EB8B-4769-BD2E-885584694275','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('C3A266E1-E6BF-40D0-828E-B3A473DC8A44','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('C409E71D-9C2E-4589-98D0-4623A15961E7','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('C5CB7C1C-B780-48E4-AC0E-4BFCCA2ED79A','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('C5E2B48E-4730-4195-A94D-4FF106AC6F67','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('C6DFEB3F-A1C6-4EFC-AD02-DC113A73BED0','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('C87BCEA8-F106-4910-AA10-318BF5E3C4CD','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','STATS','2022','STATS 2022-01'),('C8903870-B902-4B3A-A0AF-9C8968B0DCF9','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('D8DAF393-DFFB-4DAC-A1C5-DA89D5D526DB','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('DA9C4E60-621F-4A32-A64A-A9AFBEE38911','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','COI','2022','COI 2022-01'),('DF874AF0-A93D-479A-8BBF-29D45809D3F1','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('E3844547-F29F-404E-9297-FA9E6E53A65A','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('E4582BFF-7D2D-46C8-BA0B-A813474361E5','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('E8125B87-C605-4D0E-8022-B776CE2E6147','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','FQ','2022','FQ 2022-02'),('ED641535-6662-4702-BB00-1C2C8BA848CE','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01'),('F3EB4A7C-CCC5-4F95-9479-FAB606E1FCBE','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','STATS','2022','STATS 2022-02'),('F4783973-3D6A-4F36-8055-0476026A6694','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','SES','2022','SES 2022-01'),('F78823D2-3463-4767-9714-FF7325D9CFD1','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220930090000000+00:00','SES','2022','SES 2022-02'),('FF74ECEC-62EB-4ED9-AA6E-F42ECBAD30FE','Systemic School Reporting Authority','Systemic Reporting Authority System B','1234','John Smith','20220330090000000+00:00','FQ','2022','FQ 2022-01');
/*!40000 ALTER TABLE `CollectionStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionStatus_AGROResponse_AGRule`
--

DROP TABLE IF EXISTS `CollectionStatus_AGROResponse_AGRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionStatus_AGROResponse_AGRule` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AGReportingObjectResponse_Id` mediumint(9) NOT NULL,
  `AGRuleCode` varchar(200) DEFAULT NULL,
  `AGRuleComment` varchar(200) DEFAULT NULL,
  `AGRuleResponse` varchar(200) DEFAULT NULL,
  `AGRuleStatus` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AGRule_CollectionStatusAGROResponse_IX` (`AGReportingObjectResponse_Id`),
  CONSTRAINT `AGRule_CollectionStatusAGROResponse_FK` FOREIGN KEY (`AGReportingObjectResponse_Id`) REFERENCES `CollectionStatus_AGReportingObjectResponse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionStatus_AGROResponse_AGRule`
--

LOCK TABLES `CollectionStatus_AGROResponse_AGRule` WRITE;
/*!40000 ALTER TABLE `CollectionStatus_AGROResponse_AGRule` DISABLE KEYS */;
INSERT INTO `CollectionStatus_AGROResponse_AGRule` VALUES (1,1,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(2,1,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(3,1,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(4,2,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(5,2,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(6,2,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(7,3,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(8,3,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(9,3,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(10,4,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(11,4,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(12,4,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(13,5,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(14,5,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(15,5,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(16,7,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(17,7,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(18,7,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(19,8,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(20,8,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(21,8,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(22,9,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(23,9,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(24,9,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(25,10,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(26,10,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(27,10,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(28,11,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(29,11,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(30,11,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(31,13,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(32,13,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(33,13,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(34,15,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(35,15,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(36,15,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(37,17,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(38,17,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(39,17,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(40,18,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(41,18,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(42,18,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(43,20,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(44,20,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(45,20,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(46,22,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(47,22,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(48,22,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(49,24,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(50,24,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(51,24,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(52,25,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(53,25,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(54,25,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(55,26,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(56,26,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(57,26,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(58,27,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(59,27,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(60,27,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(61,28,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(62,28,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(63,28,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(64,30,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(65,30,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(66,30,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(67,31,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(68,31,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(69,31,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(70,35,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(71,35,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(72,35,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(73,38,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(74,38,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(75,38,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(76,40,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(77,40,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(78,40,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(79,41,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(80,41,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(81,41,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(82,42,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(83,42,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(84,42,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(85,43,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(86,43,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(87,43,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(88,45,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(89,45,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(90,45,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(91,48,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(92,48,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(93,48,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(94,50,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(95,50,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(96,50,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(97,51,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(98,51,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(99,51,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(100,52,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(101,52,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(102,52,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(103,58,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(104,58,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(105,58,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(106,60,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(107,60,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(108,60,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(109,61,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(110,61,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(111,61,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(112,63,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(113,63,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(114,63,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(115,65,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(116,65,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(117,65,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(118,66,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(119,66,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(120,66,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(121,73,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(122,73,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(123,73,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(124,74,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(125,74,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(126,74,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(127,75,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(128,75,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(129,75,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(130,76,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(131,76,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(132,76,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(133,77,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(134,77,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(135,77,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(136,78,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(137,78,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(138,78,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(139,79,'WR-001','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(140,79,'WR-002','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail'),(141,79,'WR-003','Cannot be ignored because Components do not add up to Total - Fix','Rejected','Fail');
/*!40000 ALTER TABLE `CollectionStatus_AGROResponse_AGRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionStatus_AGReportingObjectResponse`
--

DROP TABLE IF EXISTS `CollectionStatus_AGReportingObjectResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionStatus_AGReportingObjectResponse` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CollectionStatus_RefId` varchar(36) NOT NULL,
  `SubmittedRefId` varchar(200) DEFAULT NULL,
  `SifRefId` varchar(200) DEFAULT NULL,
  `HttpStatusCode` varchar(200) DEFAULT NULL,
  `ErrorText` varchar(200) DEFAULT NULL,
  `CommonwealthId` varchar(200) DEFAULT NULL,
  `EntityName` varchar(200) DEFAULT NULL,
  `AgSubmissionStatusCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AGReportingObjectReponse_CollectionStatus_IX` (`CollectionStatus_RefId`),
  CONSTRAINT `AGReportingObjectReponse_CollectionStatus_FK` FOREIGN KEY (`CollectionStatus_RefId`) REFERENCES `CollectionStatus` (`RefId`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionStatus_AGReportingObjectResponse`
--

LOCK TABLES `CollectionStatus_AGReportingObjectResponse` WRITE;
/*!40000 ALTER TABLE `CollectionStatus_AGReportingObjectResponse` DISABLE KEYS */;
INSERT INTO `CollectionStatus_AGReportingObjectResponse` VALUES (1,'53FB31C9-C13B-4344-ACEC-3F5957EB641E',NULL,NULL,'500','Internal Server Error','907','Powlowskimouth College','In Error'),(2,'8AE7C2FF-A76D-4174-8BE0-21946B3ADA49',NULL,NULL,'422','Unprocessable Entity','907','Powlowskimouth College','In Error'),(3,'3A060E49-CD6C-43AB-ACAA-1DC0DDD9E212',NULL,NULL,'422','Unprocessable Entity','907','Powlowskimouth College','In Error'),(4,'925C5BBF-D810-4FD6-A488-CA19EF6BFA7C',NULL,NULL,'422','Unprocessable Entity','907','Powlowskimouth College','In Error'),(5,'706C8A9C-9294-4753-A404-3A1A9CF1D2BF',NULL,NULL,'422','Unprocessable Entity','907','Powlowskimouth College','In Error'),(6,'B7F21C34-092E-437C-8540-E6E5859FE6F3',NULL,NULL,'201','Created','907','Powlowskimouth College','In Review'),(7,'C5E2B48E-4730-4195-A94D-4FF106AC6F67',NULL,NULL,'422','Unprocessable Entity','907','Powlowskimouth College','In Error'),(8,'37D7514A-89B3-4587-9F9A-DB45D4962171',NULL,NULL,'422','Unprocessable Entity','907','Powlowskimouth College','In Error'),(9,'76241934-023D-4425-9B01-0A18435D8121',NULL,NULL,'422','Unprocessable Entity','2142','Heathcotemouth College','In Error'),(10,'00A496EB-026D-4216-9E7F-B4ED2A8C91DA',NULL,NULL,'500','Internal Server Error','2142','Heathcotemouth College','In Error'),(11,'B59FBEC8-678C-497C-BC0F-1BDBDC400D69',NULL,NULL,'422','Unprocessable Entity','2142','Heathcotemouth College','In Error'),(12,'E4582BFF-7D2D-46C8-BA0B-A813474361E5',NULL,NULL,'201','Created','2142','Heathcotemouth College','Not Started'),(13,'BFD1EF63-79CE-47B4-9781-9F66A7CB9E7A',NULL,NULL,'500','Internal Server Error','2142','Heathcotemouth College','In Error'),(14,'F78823D2-3463-4767-9714-FF7325D9CFD1',NULL,NULL,'201','Created','2142','Heathcotemouth College','Not Started'),(15,'59C94FB2-0EB1-4F2F-9EA3-0E3C638E9860',NULL,NULL,'500','Internal Server Error','2142','Heathcotemouth College','In Error'),(16,'1CFB2593-DA60-4901-8312-0A2918B8512A',NULL,NULL,'201','Created','2142','Heathcotemouth College','Reopened'),(17,'1E80272F-495E-444D-8E0F-F16F3484213B',NULL,NULL,'500','Internal Server Error','4022','West Johnson College','In Error'),(18,'06C19839-D0F6-4528-A01E-9EC572758AB3',NULL,NULL,'500','Internal Server Error','4022','West Johnson College','In Error'),(19,'0EB42EEF-3314-46A3-9E81-A62AAD851F7B',NULL,NULL,'201','Created','4022','West Johnson College','In Review'),(20,'242DB82A-A3A6-4614-BC7C-87C8979F1DFD',NULL,NULL,'500','Internal Server Error','4022','West Johnson College','In Error'),(21,'3D052139-DC99-4E63-A43A-4B1E16430F62',NULL,NULL,'201','Created','4022','West Johnson College','Reopened'),(22,'18BD5BC8-F216-4BB8-876B-4AECCF679C63',NULL,NULL,'422','Unprocessable Entity','4022','West Johnson College','In Error'),(23,'63BF4705-F3AD-4C43-8ED6-8C05B61F06C4',NULL,NULL,'201','Created','4022','West Johnson College','Finalised'),(24,'5188E1CD-D268-4E00-9E2C-C8D3CCD9AAFC',NULL,NULL,'500','Internal Server Error','4022','West Johnson College','In Error'),(25,'BE524351-C02D-4DA2-A0A8-80F0E6CE4235',NULL,NULL,'422','Unprocessable Entity','1021','West Cummerata College','In Error'),(26,'B2F04E40-75FC-4C47-BEB0-417E301F0391',NULL,NULL,'500','Internal Server Error','1021','West Cummerata College','In Error'),(27,'66AA9E29-B6D5-4938-8010-C8F0D85183F0',NULL,NULL,'422','Unprocessable Entity','1021','West Cummerata College','In Error'),(28,'15EF8205-46C6-4C3C-95ED-8A9C23AB1CF5',NULL,NULL,'500','Internal Server Error','1021','West Cummerata College','In Error'),(29,'42BC0E03-F4C1-4939-83BD-99F88A2196A3',NULL,NULL,'201','Created','1021','West Cummerata College','Declaration Pending'),(30,'E3844547-F29F-404E-9297-FA9E6E53A65A',NULL,NULL,'500','Internal Server Error','1021','West Cummerata College','In Error'),(31,'C87BCEA8-F106-4910-AA10-318BF5E3C4CD',NULL,NULL,'500','Internal Server Error','1021','West Cummerata College','In Error'),(32,'40D87C51-279C-4DC0-8E3D-763843C7D7C1',NULL,NULL,'201','Created','1021','West Cummerata College','Processing'),(33,'DA9C4E60-621F-4A32-A64A-A9AFBEE38911',NULL,NULL,'201','Created','6690','Mosciskiton College','Exempt'),(34,'96D05E7E-E6F3-4C6C-840E-FAFA6EF9A919',NULL,NULL,'201','Created','6690','Mosciskiton College','Exempt'),(35,'FF74ECEC-62EB-4ED9-AA6E-F42ECBAD30FE',NULL,NULL,'500','Internal Server Error','6690','Mosciskiton College','In Error'),(36,'7F2D5FCD-11D7-4BE0-9194-4708490E4E94',NULL,NULL,'201','Created','6690','Mosciskiton College','Processing'),(37,'01EE051F-3581-45C8-97FF-04D030E33C14',NULL,NULL,'201','Created','6690','Mosciskiton College','Not Started'),(38,'C6DFEB3F-A1C6-4EFC-AD02-DC113A73BED0',NULL,NULL,'422','Unprocessable Entity','6690','Mosciskiton College','In Error'),(39,'202DC365-A03E-4B5E-9D91-47D44B2CB936',NULL,NULL,'201','Created','6690','Mosciskiton College','Not Started'),(40,'DF874AF0-A93D-479A-8BBF-29D45809D3F1',NULL,NULL,'500','Internal Server Error','6690','Mosciskiton College','In Error'),(41,'9E2AD5AF-D646-4515-A454-49FA43AC9F3B',NULL,NULL,'422','Unprocessable Entity','5884','East Stoltenberg College','In Error'),(42,'4B8A078D-A496-4C99-B7FC-C29E22446D6F',NULL,NULL,'500','Internal Server Error','5884','East Stoltenberg College','In Error'),(43,'ED641535-6662-4702-BB00-1C2C8BA848CE',NULL,NULL,'422','Unprocessable Entity','5884','East Stoltenberg College','In Error'),(44,'C07F1F93-EB8B-4769-BD2E-885584694275',NULL,NULL,'201','Created','5884','East Stoltenberg College','Not Started'),(45,'78A12339-C929-4EE5-A8E7-732050DBF951',NULL,NULL,'422','Unprocessable Entity','5884','East Stoltenberg College','In Error'),(46,'3EA6E355-9510-4333-BC0E-2E5D43C38E5F',NULL,NULL,'201','Created','5884','East Stoltenberg College','Declared'),(47,'C5CB7C1C-B780-48E4-AC0E-4BFCCA2ED79A',NULL,NULL,'201','Created','5884','East Stoltenberg College','In Progress'),(48,'6DBA9B90-64B0-4D2E-A1BB-DEAD5C551524',NULL,NULL,'500','Internal Server Error','5884','East Stoltenberg College','In Error'),(49,'AE3B00A8-2972-4673-98E2-7C04CE87CF50',NULL,NULL,'201','Created','128','South Bins College','Declaration Pending'),(50,'19AAD574-C5BC-4323-81DA-FCC277439171',NULL,NULL,'500','Internal Server Error','128','South Bins College','In Error'),(51,'337E2614-069F-4AD5-817A-1BFB6CDBCB32',NULL,NULL,'422','Unprocessable Entity','128','South Bins College','In Error'),(52,'E8125B87-C605-4D0E-8022-B776CE2E6147',NULL,NULL,'500','Internal Server Error','128','South Bins College','In Error'),(53,'2BD77E44-D6A4-404D-B176-82EB231BB382',NULL,NULL,'201','Created','128','South Bins College','Exempt'),(54,'C8903870-B902-4B3A-A0AF-9C8968B0DCF9',NULL,NULL,'201','Created','128','South Bins College','Declaration Pending'),(55,'035D7658-6C8D-4897-AEF4-3381AE9B61BA',NULL,NULL,'201','Created','128','South Bins College','Not Started'),(56,'8BDC10DA-23A4-4661-B1BC-AE7E0100D089',NULL,NULL,'201','Created','128','South Bins College','In Progress'),(57,'63FC5CFA-2DA6-4D42-BDA8-C2FC0C74D147',NULL,NULL,'201','Created','8041','Okunevaberg College','Reopened'),(58,'B6065AC0-22CB-42AF-BAC2-B20F98FA43C1',NULL,NULL,'500','Internal Server Error','8041','Okunevaberg College','In Error'),(59,'4C6099B1-290F-42FA-84A6-16B96FA987C8',NULL,NULL,'201','Created','8041','Okunevaberg College','Processing'),(60,'5BC36D74-B7D1-4D72-AA30-7949B6E5375F',NULL,NULL,'500','Internal Server Error','8041','Okunevaberg College','In Error'),(61,'9417926B-5580-4F57-B1B2-EF2D1CDC2F64',NULL,NULL,'422','Unprocessable Entity','8041','Okunevaberg College','In Error'),(62,'7D424D46-CF77-4807-A3B2-02CDC395FA07',NULL,NULL,'201','Created','8041','Okunevaberg College','Reopened'),(63,'A77381DA-9FF2-404C-A540-07DC9712E1AD',NULL,NULL,'422','Unprocessable Entity','8041','Okunevaberg College','In Error'),(64,'91837860-6257-4D0B-BD59-378A9E0989D8',NULL,NULL,'201','Created','8041','Okunevaberg College','Processing'),(65,'5FB2FB97-0F67-451E-873D-1EB722DE9F31',NULL,NULL,'422','Unprocessable Entity','5991','Kovacekland College','In Error'),(66,'890D0D03-0E68-4EC4-862B-57B3C249D7D9',NULL,NULL,'422','Unprocessable Entity','5991','Kovacekland College','In Error'),(67,'5A48E36F-2612-4118-A782-6AE46352525E',NULL,NULL,'201','Created','5991','Kovacekland College','Processing'),(68,'D8DAF393-DFFB-4DAC-A1C5-DA89D5D526DB',NULL,NULL,'201','Created','5991','Kovacekland College','Declared'),(69,'2E36ED20-CA50-42AB-AC35-807F72618CD0',NULL,NULL,'201','Created','5991','Kovacekland College','In Review'),(70,'B5C8618B-805A-49FF-8A2F-DF8C8BA67E66',NULL,NULL,'201','Created','5991','Kovacekland College','Reopened'),(71,'C3A266E1-E6BF-40D0-828E-B3A473DC8A44',NULL,NULL,'201','Created','5991','Kovacekland College','Cancelled'),(72,'19A4ACF4-DF59-47F7-BC9D-BDF29D7BE39F',NULL,NULL,'201','Created','5991','Kovacekland College','Processing'),(73,'C409E71D-9C2E-4589-98D0-4623A15961E7',NULL,NULL,'500','Internal Server Error','5470','Rutherfordton College','In Error'),(74,'6BE8FD50-7FC2-4D8B-880C-CF3A5B07C51C',NULL,NULL,'422','Unprocessable Entity','5470','Rutherfordton College','In Error'),(75,'4001DDFC-EED0-4532-93ED-FA0B4402B9F1',NULL,NULL,'500','Internal Server Error','5470','Rutherfordton College','In Error'),(76,'052960D7-C072-4C0B-936D-FE7629900C8C',NULL,NULL,'422','Unprocessable Entity','5470','Rutherfordton College','In Error'),(77,'F4783973-3D6A-4F36-8055-0476026A6694',NULL,NULL,'422','Unprocessable Entity','5470','Rutherfordton College','In Error'),(78,'39F2E1F2-1F36-46C2-B908-36A3FDFCC144',NULL,NULL,'500','Internal Server Error','5470','Rutherfordton College','In Error'),(79,'4A5D0B98-C040-459F-83F1-96B81615514F',NULL,NULL,'422','Unprocessable Entity','5470','Rutherfordton College','In Error'),(80,'F3EB4A7C-CCC5-4F95-9479-FAB606E1FCBE',NULL,NULL,'201','Created','5470','Rutherfordton College','In Progress');
/*!40000 ALTER TABLE `CollectionStatus_AGReportingObjectResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionStatus_LocalCode`
--

DROP TABLE IF EXISTS `CollectionStatus_LocalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionStatus_LocalCode` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `CollectionStatus_RefId` varchar(36) NOT NULL,
  `LocalisedCode` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Element` varchar(200) DEFAULT NULL,
  `ListIndex` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocalCode_CollectionStatus_IX` (`CollectionStatus_RefId`),
  CONSTRAINT `LocalCode_CollectionStatus_FK` FOREIGN KEY (`CollectionStatus_RefId`) REFERENCES `CollectionStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionStatus_LocalCode`
--

LOCK TABLES `CollectionStatus_LocalCode` WRITE;
/*!40000 ALTER TABLE `CollectionStatus_LocalCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionStatus_LocalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Debtor`
--

DROP TABLE IF EXISTS `Debtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Debtor` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `BilledEntity` varchar(36) DEFAULT NULL,
  `BilledEntity_SIFRefObject` varchar(200) DEFAULT NULL,
  `BillingName` varchar(200) DEFAULT NULL,
  `BillingNote` varchar(200) DEFAULT NULL,
  `Discount` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Debtor`
--

LOCK TABLES `Debtor` WRITE;
/*!40000 ALTER TABLE `Debtor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Debtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQCollection_LocalCode`
--

DROP TABLE IF EXISTS `FQCollection_LocalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQCollection_LocalCode` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQCollection_RefId` varchar(36) NOT NULL,
  `LocalisedCode` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Element` varchar(200) DEFAULT NULL,
  `ListIndex` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocalCode_FQCollection_IX` (`FQCollection_RefId`),
  CONSTRAINT `LocalCode_FQCollection_FK` FOREIGN KEY (`FQCollection_RefId`) REFERENCES `FinancialQuestionnaireCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQCollection_LocalCode`
--

LOCK TABLES `FQCollection_LocalCode` WRITE;
/*!40000 ALTER TABLE `FQCollection_LocalCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQCollection_LocalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting`
--

DROP TABLE IF EXISTS `FQReporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQCollection_RefId` varchar(36) NOT NULL,
  `EntityLevel` varchar(200) DEFAULT NULL,
  `SchoolInfoRefId` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `StateProvinceId` varchar(200) DEFAULT NULL,
  `CommonwealthId` varchar(200) DEFAULT NULL,
  `AcaraId` varchar(200) DEFAULT NULL,
  `EntityName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FQReporting_FQCollection_IX` (`FQCollection_RefId`),
  CONSTRAINT `FQReporting_FQCollection_FK` FOREIGN KEY (`FQCollection_RefId`) REFERENCES `FinancialQuestionnaireCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting`
--

LOCK TABLES `FQReporting` WRITE;
/*!40000 ALTER TABLE `FQReporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting_AGRule`
--

DROP TABLE IF EXISTS `FQReporting_AGRule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting_AGRule` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQReporting_Id` mediumint(9) NOT NULL,
  `AGRuleCode` varchar(200) DEFAULT NULL,
  `AGRuleComment` varchar(200) DEFAULT NULL,
  `AGRuleResponse` varchar(200) DEFAULT NULL,
  `AGRuleStatus` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AGRule_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `AGRule_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting_AGRule`
--

LOCK TABLES `FQReporting_AGRule` WRITE;
/*!40000 ALTER TABLE `FQReporting_AGRule` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting_AGRule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting_ContextualQuestion`
--

DROP TABLE IF EXISTS `FQReporting_ContextualQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting_ContextualQuestion` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQReporting_Id` mediumint(9) NOT NULL,
  `Context` varchar(200) DEFAULT NULL,
  `Answer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ContextualQuestion_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `ContextualQuestion_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting_ContextualQuestion`
--

LOCK TABLES `FQReporting_ContextualQuestion` WRITE;
/*!40000 ALTER TABLE `FQReporting_ContextualQuestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting_ContextualQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting_EntityContact`
--

DROP TABLE IF EXISTS `FQReporting_EntityContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting_EntityContact` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQReporting_Id` mediumint(9) NOT NULL,
  `PositionTitle` varchar(200) DEFAULT NULL,
  `Role` varchar(200) DEFAULT NULL,
  `RegistrationDetails` varchar(200) DEFAULT NULL,
  `Qualifications` varchar(200) DEFAULT NULL,
  `Email_Type` varchar(200) DEFAULT NULL,
  `Email_Value` varchar(200) DEFAULT NULL,
  `PhoneNumber_Type` varchar(200) DEFAULT NULL,
  `PhoneNumber_Number` varchar(200) DEFAULT NULL,
  `PhoneNumber_Extension` varchar(200) DEFAULT NULL,
  `PhoneNumber_ListedStatus` varchar(200) DEFAULT NULL,
  `PhoneNumber_Preference` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EntityContact_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `EntityContact_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting_EntityContact`
--

LOCK TABLES `FQReporting_EntityContact` WRITE;
/*!40000 ALTER TABLE `FQReporting_EntityContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting_EntityContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting_EntityContact_Address`
--

DROP TABLE IF EXISTS `FQReporting_EntityContact_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting_EntityContact_Address` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQReporting_EntityContact_Id` mediumint(9) NOT NULL,
  `AddressType` varchar(200) DEFAULT NULL,
  `AddressRole` varchar(200) DEFAULT NULL,
  `EffectiveFromDate` varchar(200) DEFAULT NULL,
  `EffectiveToDate` varchar(200) DEFAULT NULL,
  `Street_Line1` varchar(200) DEFAULT NULL,
  `Street_Line2` varchar(200) DEFAULT NULL,
  `Street_Line3` varchar(200) DEFAULT NULL,
  `Street_Complex` varchar(200) DEFAULT NULL,
  `Street_StreetNumber` varchar(200) DEFAULT NULL,
  `Street_StreetPrefix` varchar(200) DEFAULT NULL,
  `Street_StreetName` varchar(200) DEFAULT NULL,
  `Street_StreetType` varchar(200) DEFAULT NULL,
  `Street_StreetSuffix` varchar(200) DEFAULT NULL,
  `Street_ApartmentType` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberPrefix` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumber` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberSuffix` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `StateProvince` varchar(200) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `PostalCode` varchar(200) DEFAULT NULL,
  `GridLocation_Latitude` varchar(200) DEFAULT NULL,
  `GridLocation_Longitude` varchar(200) DEFAULT NULL,
  `MapReference_Type` varchar(200) DEFAULT NULL,
  `MapReference_XCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_YCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_MapNumber` varchar(200) DEFAULT NULL,
  `RadioContact` varchar(200) DEFAULT NULL,
  `Community` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `AddressGlobalUID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Address_FQReportingEntityContact_IX` (`FQReporting_EntityContact_Id`),
  CONSTRAINT `Address_FQReportingEntityContact_FK` FOREIGN KEY (`FQReporting_EntityContact_Id`) REFERENCES `FQReporting_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting_EntityContact_Address`
--

LOCK TABLES `FQReporting_EntityContact_Address` WRITE;
/*!40000 ALTER TABLE `FQReporting_EntityContact_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting_EntityContact_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting_EntityContact_Address_StatisticalArea`
--

DROP TABLE IF EXISTS `FQReporting_EntityContact_Address_StatisticalArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting_EntityContact_Address_StatisticalArea` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQReporting_EntityContact_Address_Id` mediumint(9) NOT NULL,
  `SpatialUnitType` varchar(200) DEFAULT NULL,
  `StatisticalArea` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StatArea_FQReportingEntityContactAddress_IX` (`FQReporting_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_FQReportingEntityContactAddress_FK` FOREIGN KEY (`FQReporting_EntityContact_Address_Id`) REFERENCES `FQReporting_EntityContact_Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting_EntityContact_Address_StatisticalArea`
--

LOCK TABLES `FQReporting_EntityContact_Address_StatisticalArea` WRITE;
/*!40000 ALTER TABLE `FQReporting_EntityContact_Address_StatisticalArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting_EntityContact_Address_StatisticalArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting_EntityContact_Name`
--

DROP TABLE IF EXISTS `FQReporting_EntityContact_Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting_EntityContact_Name` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQReporting_EntityContact_Id` mediumint(9) NOT NULL,
  `NameType` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(200) DEFAULT NULL,
  `GivenName` varchar(200) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `FamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `PreferredFamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `Suffix` varchar(200) DEFAULT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Name_FQReportingEntityContact_IX` (`FQReporting_EntityContact_Id`),
  CONSTRAINT `Name_FQReportingEntityContact_FK` FOREIGN KEY (`FQReporting_EntityContact_Id`) REFERENCES `FQReporting_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting_EntityContact_Name`
--

LOCK TABLES `FQReporting_EntityContact_Name` WRITE;
/*!40000 ALTER TABLE `FQReporting_EntityContact_Name` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting_EntityContact_Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FQReporting_FQItem`
--

DROP TABLE IF EXISTS `FQReporting_FQItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FQReporting_FQItem` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `FQReporting_Id` mediumint(9) NOT NULL,
  `FqItemCode` varchar(200) DEFAULT NULL,
  `TuitionAmount` varchar(200) DEFAULT NULL,
  `BoardingAmount` varchar(200) DEFAULT NULL,
  `SystemAmount` varchar(200) DEFAULT NULL,
  `DioceseAmount` varchar(200) DEFAULT NULL,
  `FqComments` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FQItem_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `FQItem_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FQReporting_FQItem`
--

LOCK TABLES `FQReporting_FQItem` WRITE;
/*!40000 ALTER TABLE `FQReporting_FQItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `FQReporting_FQItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FinancialAccount`
--

DROP TABLE IF EXISTS `FinancialAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FinancialAccount` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `SubAccount_RefId` varchar(36) DEFAULT NULL,
  `LocationInfo_RefId` varchar(36) DEFAULT NULL,
  `AccountNumber` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `FinancialClass_RefId` varchar(36) DEFAULT NULL,
  `CreationDate` varchar(200) DEFAULT NULL,
  `CreationTime` varchar(200) DEFAULT NULL,
  `ClassType` varchar(200) DEFAULT NULL,
  `AccountCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `LocationInfo_RefId` (`LocationInfo_RefId`),
  KEY `SubAccount_RefId` (`SubAccount_RefId`),
  KEY `FinancialClass_RefId` (`FinancialClass_RefId`),
  CONSTRAINT `FinancialAccount_ibfk_1` FOREIGN KEY (`LocationInfo_RefId`) REFERENCES `LocationInfo` (`RefId`),
  CONSTRAINT `FinancialAccount_ibfk_2` FOREIGN KEY (`SubAccount_RefId`) REFERENCES `FinancialAccount` (`RefId`),
  CONSTRAINT `FinancialAccount_ibfk_3` FOREIGN KEY (`FinancialClass_RefId`) REFERENCES `FinancialClass` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FinancialAccount`
--

LOCK TABLES `FinancialAccount` WRITE;
/*!40000 ALTER TABLE `FinancialAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `FinancialAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FinancialClass`
--

DROP TABLE IF EXISTS `FinancialClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FinancialClass` (
  `RefId` varchar(36) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `ClassType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FinancialClass`
--

LOCK TABLES `FinancialClass` WRITE;
/*!40000 ALTER TABLE `FinancialClass` DISABLE KEYS */;
/*!40000 ALTER TABLE `FinancialClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FinancialQuestionnaireCollection`
--

DROP TABLE IF EXISTS `FinancialQuestionnaireCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FinancialQuestionnaireCollection` (
  `RefId` varchar(36) NOT NULL,
  `FqYear` varchar(200) DEFAULT NULL,
  `RoundCode` varchar(200) DEFAULT NULL,
  `ReportingAuthorityCommonwealthId` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareProduct` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareVersion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FinancialQuestionnaireCollection`
--

LOCK TABLES `FinancialQuestionnaireCollection` WRITE;
/*!40000 ALTER TABLE `FinancialQuestionnaireCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `FinancialQuestionnaireCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GradingAssignment`
--

DROP TABLE IF EXISTS `GradingAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GradingAssignment` (
  `RefId` varchar(36) NOT NULL,
  `TeachingGroup_RefId` varchar(36) DEFAULT NULL,
  `GradingCategory` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `PointsPossible` varchar(200) DEFAULT NULL,
  `CreateDate` varchar(200) DEFAULT NULL,
  `DueDate` varchar(200) DEFAULT NULL,
  `Weight` varchar(200) DEFAULT NULL,
  `MaxAttemptsAllowed` varchar(200) DEFAULT NULL,
  `DetailedDescriptionURL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `TeachingGroup_RefId` (`TeachingGroup_RefId`),
  CONSTRAINT `GradingAssignment_ibfk_1` FOREIGN KEY (`TeachingGroup_RefId`) REFERENCES `TeachingGroup` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GradingAssignment`
--

LOCK TABLES `GradingAssignment` WRITE;
/*!40000 ALTER TABLE `GradingAssignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `GradingAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GradingAssignmentScore`
--

DROP TABLE IF EXISTS `GradingAssignmentScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GradingAssignmentScore` (
  `RefId` varchar(36) NOT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `TeachingGroup_RefId` varchar(36) DEFAULT NULL,
  `GradingAssignment_RefId` varchar(36) DEFAULT NULL,
  `ScorePoints` varchar(200) DEFAULT NULL,
  `ScorePercent` varchar(200) DEFAULT NULL,
  `ScoreLetter` varchar(200) DEFAULT NULL,
  `ScoreDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  KEY `TeachingGroup_RefId` (`TeachingGroup_RefId`),
  KEY `GradingAssignment_RefId` (`GradingAssignment_RefId`),
  CONSTRAINT `GradingAssignmentScore_ibfk_1` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`),
  CONSTRAINT `GradingAssignmentScore_ibfk_2` FOREIGN KEY (`TeachingGroup_RefId`) REFERENCES `TeachingGroup` (`RefId`),
  CONSTRAINT `GradingAssignmentScore_ibfk_3` FOREIGN KEY (`GradingAssignment_RefId`) REFERENCES `GradingAssignment` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GradingAssignmentScore`
--

LOCK TABLES `GradingAssignmentScore` WRITE;
/*!40000 ALTER TABLE `GradingAssignmentScore` DISABLE KEYS */;
/*!40000 ALTER TABLE `GradingAssignmentScore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Identity`
--

DROP TABLE IF EXISTS `Identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Identity` (
  `RefId` varchar(36) DEFAULT NULL,
  `SIF_RefId` varchar(36) DEFAULT NULL,
  `SIF_RefObject` varchar(50) DEFAULT NULL,
  `AuthenticationSource` varchar(200) DEFAULT NULL,
  `IdentityAssertions_IdentityAssertion` varchar(200) DEFAULT NULL,
  `SchemaName` varchar(200) DEFAULT NULL,
  `Algorithm` varchar(200) DEFAULT NULL,
  `KeyName` varchar(200) DEFAULT NULL,
  `AuthenticationSourceGlobalUID` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Identity`
--

LOCK TABLES `Identity` WRITE;
/*!40000 ALTER TABLE `Identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `Identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `InvoicedEntity` varchar(36) DEFAULT NULL,
  `InvoicedEntity_SIFRefObject` varchar(200) DEFAULT NULL,
  `BillingDate` varchar(200) DEFAULT NULL,
  `TransactionDescription` varchar(200) DEFAULT NULL,
  `BilledAmount` varchar(200) DEFAULT NULL,
  `BilledAmountType` varchar(200) DEFAULT NULL,
  `Ledger` varchar(200) DEFAULT NULL,
  `LocationInfo_RefId` varchar(36) DEFAULT NULL,
  `TaxRate` varchar(200) DEFAULT NULL,
  `TaxType` varchar(200) DEFAULT NULL,
  `TaxAmount` varchar(200) DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `ApprovedBy` varchar(200) DEFAULT NULL,
  `ItemDetail` varchar(200) DEFAULT NULL,
  `DueDate` varchar(200) DEFAULT NULL,
  `AccountingPeriod` varchar(200) DEFAULT NULL,
  `Related_PurchaseOrder_RefId` varchar(36) DEFAULT NULL,
  `Voluntary` varchar(200) DEFAULT NULL,
  `FormNumber` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `LocationInfo_RefId` (`LocationInfo_RefId`),
  KEY `Related_PurchaseOrder_RefId` (`Related_PurchaseOrder_RefId`),
  CONSTRAINT `Invoice_ibfk_1` FOREIGN KEY (`LocationInfo_RefId`) REFERENCES `LocationInfo` (`RefId`),
  CONSTRAINT `Invoice_ibfk_2` FOREIGN KEY (`Related_PurchaseOrder_RefId`) REFERENCES `PurchaseOrder` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice_AccountCode`
--

DROP TABLE IF EXISTS `Invoice_AccountCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice_AccountCode` (
  `Invoice_RefId` varchar(36) DEFAULT NULL,
  `AccountCode` varchar(200) DEFAULT NULL,
  KEY `Invoice_RefId` (`Invoice_RefId`),
  CONSTRAINT `Invoice_AccountCode_ibfk_1` FOREIGN KEY (`Invoice_RefId`) REFERENCES `Invoice` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice_AccountCode`
--

LOCK TABLES `Invoice_AccountCode` WRITE;
/*!40000 ALTER TABLE `Invoice_AccountCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice_AccountCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice_FinancialAccount`
--

DROP TABLE IF EXISTS `Invoice_FinancialAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoice_FinancialAccount` (
  `Invoice_RefId` varchar(36) DEFAULT NULL,
  `FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  KEY `Invoice_RefId` (`Invoice_RefId`),
  KEY `FinancialAccount_RefId` (`FinancialAccount_RefId`),
  CONSTRAINT `Invoice_FinancialAccount_ibfk_1` FOREIGN KEY (`Invoice_RefId`) REFERENCES `Invoice` (`RefId`),
  CONSTRAINT `Invoice_FinancialAccount_ibfk_2` FOREIGN KEY (`FinancialAccount_RefId`) REFERENCES `FinancialAccount` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice_FinancialAccount`
--

LOCK TABLES `Invoice_FinancialAccount` WRITE;
/*!40000 ALTER TABLE `Invoice_FinancialAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice_FinancialAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemSubstitutedFor_PNPCode`
--

DROP TABLE IF EXISTS `ItemSubstitutedFor_PNPCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemSubstitutedFor_PNPCode` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemSubstitutedFor_Id` int(11) NOT NULL,
  `Code` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ItemSubstitutedFor_FK_idx` (`ItemSubstitutedFor_Id`),
  CONSTRAINT `ItemSubstitutedFor_FK` FOREIGN KEY (`ItemSubstitutedFor_Id`) REFERENCES `NAPTestItem_SubstituteItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemSubstitutedFor_PNPCode`
--

LOCK TABLES `ItemSubstitutedFor_PNPCode` WRITE;
/*!40000 ALTER TABLE `ItemSubstitutedFor_PNPCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItemSubstitutedFor_PNPCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Journal`
--

DROP TABLE IF EXISTS `Journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Journal` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `Debit_FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  `Debit_AccountCode` varchar(200) DEFAULT NULL,
  `Credit_FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  `Credit_AccountCode` varchar(200) DEFAULT NULL,
  `OriginatingTransaction_RefId` varchar(36) DEFAULT NULL,
  `OriginatingTransaction_RefId_SIFRefObject` varchar(200) DEFAULT NULL,
  `Amount` varchar(200) DEFAULT NULL,
  `GSTCodeOriginal` varchar(200) DEFAULT NULL,
  `GSTCodeReplacement` varchar(200) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL,
  `CreatedDate` varchar(200) DEFAULT NULL,
  `ApprovedDate` varchar(200) DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `ApprovedBy` varchar(200) DEFAULT NULL,
  `FinancialClass_RefId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `Debit_FinancialAccount_RefId` (`Debit_FinancialAccount_RefId`),
  KEY `Credit_FinancialAccount_RefId` (`Credit_FinancialAccount_RefId`),
  CONSTRAINT `Journal_ibfk_1` FOREIGN KEY (`Debit_FinancialAccount_RefId`) REFERENCES `FinancialAccount` (`RefId`),
  CONSTRAINT `Journal_ibfk_2` FOREIGN KEY (`Credit_FinancialAccount_RefId`) REFERENCES `FinancialAccount` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Journal`
--

LOCK TABLES `Journal` WRITE;
/*!40000 ALTER TABLE `Journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Journal_JournalAdjustment`
--

DROP TABLE IF EXISTS `Journal_JournalAdjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Journal_JournalAdjustment` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Journal_RefId` varchar(36) DEFAULT NULL,
  `Debit_FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  `Credit_FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  `DebitAccountCode` varchar(200) DEFAULT NULL,
  `CreditAccountCode` varchar(200) DEFAULT NULL,
  `GSTCodeOriginal` varchar(200) DEFAULT NULL,
  `GSTCodeReplacement` varchar(200) DEFAULT NULL,
  `LineAdjustmentAmount` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Journal_RefId` (`Journal_RefId`),
  CONSTRAINT `Journal_JournalAdjustment_ibfk_1` FOREIGN KEY (`Journal_RefId`) REFERENCES `Journal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Journal_JournalAdjustment`
--

LOCK TABLES `Journal_JournalAdjustment` WRITE;
/*!40000 ALTER TABLE `Journal_JournalAdjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Journal_JournalAdjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Language`
--

DROP TABLE IF EXISTS `Language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Language` (
  `RecordNumber` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Person_RefId` varchar(36) DEFAULT NULL,
  `LanguageCode` varchar(200) DEFAULT NULL,
  `LanguageType` varchar(200) DEFAULT NULL,
  `LanguageDialect` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RecordNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Language`
--

LOCK TABLES `Language` WRITE;
/*!40000 ALTER TABLE `Language` DISABLE KEYS */;
/*!40000 ALTER TABLE `Language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus`
--

DROP TABLE IF EXISTS `LibraryPatronStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus` (
  `RefId` varchar(36) NOT NULL,
  `LibraryType` varchar(200) DEFAULT NULL,
  `PatronRefId` varchar(200) DEFAULT NULL,
  `PatronLocalId` varchar(200) DEFAULT NULL,
  `PatronRefObject` varchar(200) DEFAULT NULL,
  `NumberOfCheckouts` varchar(200) DEFAULT NULL,
  `NumberOfHoldItems` varchar(200) DEFAULT NULL,
  `NumberOfOverdues` varchar(200) DEFAULT NULL,
  `NumberOfFines` varchar(200) DEFAULT NULL,
  `FineAmount_Amount` varchar(200) DEFAULT NULL,
  `FineAmount_Currency` varchar(200) DEFAULT NULL,
  `NumberOfRefunds` varchar(200) DEFAULT NULL,
  `RefundAmount_Amount` varchar(200) DEFAULT NULL,
  `RefundAmount_Currency` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus`
--

LOCK TABLES `LibraryPatronStatus` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_ElectronicId`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_ElectronicId`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_ElectronicId` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `LibraryPatronStatus_RefId` varchar(36) NOT NULL,
  `ElectronicId` varchar(200) DEFAULT NULL,
  `ElectronicIdType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ElectronicId_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `ElectronicId_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_ElectronicId`
--

LOCK TABLES `LibraryPatronStatus_ElectronicId` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_ElectronicId` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_ElectronicId` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_LocalCode`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_LocalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_LocalCode` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `LibraryPatronStatus_RefId` varchar(36) NOT NULL,
  `LocalisedCode` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Element` varchar(200) DEFAULT NULL,
  `ListIndex` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocalCode_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `LocalCode_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_LocalCode`
--

LOCK TABLES `LibraryPatronStatus_LocalCode` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_LocalCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_LocalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_Message`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_Message` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `LibraryPatronStatus_RefId` varchar(36) NOT NULL,
  `Sent` varchar(200) DEFAULT NULL,
  `MessageText` varchar(2000) DEFAULT NULL,
  `Priority` varchar(200) DEFAULT NULL,
  `PriorityCodeset` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Message_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `Message_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_Message`
--

LOCK TABLES `LibraryPatronStatus_Message` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_Message` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_PatronName`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_PatronName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_PatronName` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `LibraryPatronStatus_RefId` varchar(36) NOT NULL,
  `NameType` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(200) DEFAULT NULL,
  `GivenName` varchar(200) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `FamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `PreferredFamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `Suffix` varchar(200) DEFAULT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PatronName_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `PatronName_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_PatronName`
--

LOCK TABLES `LibraryPatronStatus_PatronName` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_PatronName` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_PatronName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_Transaction`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_Transaction` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `LibraryPatronStatus_RefId` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Transaction_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `Transaction_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_Transaction`
--

LOCK TABLES `LibraryPatronStatus_Transaction` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_Transaction_Checkout`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_Transaction_Checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_Transaction_Checkout` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Transaction_Id` mediumint(9) NOT NULL,
  `CheckedOutOn` varchar(200) DEFAULT NULL,
  `ReturnBy` varchar(200) DEFAULT NULL,
  `RenewalCount` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Checkout_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `Checkout_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_Transaction_Checkout`
--

LOCK TABLES `LibraryPatronStatus_Transaction_Checkout` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_Checkout` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_Checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_Transaction_FineInfo`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_Transaction_FineInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_Transaction_FineInfo` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Transaction_Id` mediumint(9) NOT NULL,
  `Assessed` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Amount` varchar(200) DEFAULT NULL,
  `Currency` varchar(200) DEFAULT NULL,
  `Reference` varchar(200) DEFAULT NULL,
  `FineType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FineInfo_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `FineInfo_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_Transaction_FineInfo`
--

LOCK TABLES `LibraryPatronStatus_Transaction_FineInfo` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_FineInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_FineInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_Transaction_HoldInfo`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_Transaction_HoldInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_Transaction_HoldInfo` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Transaction_Id` mediumint(9) NOT NULL,
  `DatePlaced` varchar(200) DEFAULT NULL,
  `DateNeeded` varchar(200) DEFAULT NULL,
  `ReservationExpiry` varchar(200) DEFAULT NULL,
  `MadeAvailable` varchar(200) DEFAULT NULL,
  `Expires` varchar(200) DEFAULT NULL,
  `HoldType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `HoldInfo_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `HoldInfo_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_Transaction_HoldInfo`
--

LOCK TABLES `LibraryPatronStatus_Transaction_HoldInfo` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_HoldInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_HoldInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibraryPatronStatus_Transaction_Item`
--

DROP TABLE IF EXISTS `LibraryPatronStatus_Transaction_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibraryPatronStatus_Transaction_Item` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `Transaction_Id` mediumint(9) NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Author` varchar(200) DEFAULT NULL,
  `ElectronicId` varchar(200) DEFAULT NULL,
  `ElectronicIdType` varchar(200) DEFAULT NULL,
  `CallNumber` varchar(200) DEFAULT NULL,
  `ISBN` varchar(200) DEFAULT NULL,
  `Cost_Amount` varchar(200) DEFAULT NULL,
  `Cost_Currency` varchar(200) DEFAULT NULL,
  `ReplacementCost_Amount` varchar(200) DEFAULT NULL,
  `ReplacementCost_Currency` varchar(200) DEFAULT NULL,
  `ItemType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Item_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `Item_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibraryPatronStatus_Transaction_Item`
--

LOCK TABLES `LibraryPatronStatus_Transaction_Item` WRITE;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `LibraryPatronStatus_Transaction_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LocationInfo`
--

DROP TABLE IF EXISTS `LocationInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LocationInfo` (
  `RefId` varchar(36) NOT NULL,
  `LocationType` varchar(200) DEFAULT NULL,
  `SiteCategory` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `StateProvinceId` varchar(200) DEFAULT NULL,
  `Parent_LocationInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `PhoneNumber` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `Parent_LocationInfo_RefId` (`Parent_LocationInfo_RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `LocationInfo_ibfk_1` FOREIGN KEY (`Parent_LocationInfo_RefId`) REFERENCES `LocationInfo` (`RefId`),
  CONSTRAINT `LocationInfo_ibfk_2` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LocationInfo`
--

LOCK TABLES `LocationInfo` WRITE;
/*!40000 ALTER TABLE `LocationInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `LocationInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPCodeFrame`
--

DROP TABLE IF EXISTS `NAPCodeFrame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPCodeFrame` (
  `RefId` varchar(36) NOT NULL,
  `NAPTest_RefId` varchar(36) NOT NULL,
  PRIMARY KEY (`RefId`),
  KEY `NAPCodeFrame_NAPTest_FK_idx` (`NAPTest_RefId`),
  CONSTRAINT `NAPCodeFrame_NAPTest_FK` FOREIGN KEY (`NAPTest_RefId`) REFERENCES `NAPTest` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPCodeFrame`
--

LOCK TABLES `NAPCodeFrame` WRITE;
/*!40000 ALTER TABLE `NAPCodeFrame` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPCodeFrame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPEventStudentLink`
--

DROP TABLE IF EXISTS `NAPEventStudentLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPEventStudentLink` (
  `RefId` varchar(36) NOT NULL,
  `ExemptionReason` varchar(2000) DEFAULT NULL,
  `ParticipationCode` varchar(200) DEFAULT NULL,
  `ParticipationText` varchar(2000) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `NAPTest_RefId` varchar(36) DEFAULT NULL,
  `EventDate` varchar(45) DEFAULT NULL,
  `Device` varchar(2000) DEFAULT NULL,
  `DOBRange` varchar(45) DEFAULT NULL,
  `LapsedTimeTest` varchar(200) DEFAULT NULL,
  `NAPJurisdiction` varchar(200) DEFAULT NULL,
  `PersonalDetailsChanged` varchar(45) DEFAULT NULL,
  `PossibleDuplicate` varchar(45) DEFAULT NULL,
  `PSIOtherIdMatch` varchar(45) DEFAULT NULL,
  `StartTime` varchar(45) DEFAULT NULL,
  `System` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `NAPEventStudentLink_SchoolInfo_FK_idx` (`SchoolInfo_RefId`),
  KEY `NAPEventStudentLink_NAPTest_FK_idx` (`NAPTest_RefId`),
  KEY `NAPEventStudentLink_StudentPersonal_FK_idx` (`StudentPersonal_RefId`),
  CONSTRAINT `NAPEventStudentLink_NAPTest_FK` FOREIGN KEY (`NAPTest_RefId`) REFERENCES `NAPTest` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPEventStudentLink`
--

LOCK TABLES `NAPEventStudentLink` WRITE;
/*!40000 ALTER TABLE `NAPEventStudentLink` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPEventStudentLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPEventStudentLink_Adjustment`
--

DROP TABLE IF EXISTS `NAPEventStudentLink_Adjustment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPEventStudentLink_Adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPEventStudentLink_RefId` varchar(36) NOT NULL,
  `BookletType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NAPEventStudentLink_Adjustment_FK_idx` (`NAPEventStudentLink_RefId`),
  CONSTRAINT `NAPEventStudentLink_Adjustment_FK` FOREIGN KEY (`NAPEventStudentLink_RefId`) REFERENCES `NAPEventStudentLink` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPEventStudentLink_Adjustment`
--

LOCK TABLES `NAPEventStudentLink_Adjustment` WRITE;
/*!40000 ALTER TABLE `NAPEventStudentLink_Adjustment` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPEventStudentLink_Adjustment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPEventStudentLink_Adjustment_PNPCode`
--

DROP TABLE IF EXISTS `NAPEventStudentLink_Adjustment_PNPCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPEventStudentLink_Adjustment_PNPCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Adjustment_Id` int(11) DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Adjustment_PNPCode_FK_idx` (`Adjustment_Id`),
  CONSTRAINT `Adjustment_PNPCode_FK` FOREIGN KEY (`Adjustment_Id`) REFERENCES `NAPEventStudentLink_Adjustment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPEventStudentLink_Adjustment_PNPCode`
--

LOCK TABLES `NAPEventStudentLink_Adjustment_PNPCode` WRITE;
/*!40000 ALTER TABLE `NAPEventStudentLink_Adjustment_PNPCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPEventStudentLink_Adjustment_PNPCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPEventStudentLink_TestDisruption`
--

DROP TABLE IF EXISTS `NAPEventStudentLink_TestDisruption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPEventStudentLink_TestDisruption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPEventStudentLink_RefId` varchar(36) NOT NULL,
  `Event` varchar(2000) DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NAPEventStudentLink_TestDisruption_IX` (`NAPEventStudentLink_RefId`),
  CONSTRAINT `NAPEventStudentLink_TestDisruption_FK` FOREIGN KEY (`NAPEventStudentLink_RefId`) REFERENCES `NAPEventStudentLink` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPEventStudentLink_TestDisruption`
--

LOCK TABLES `NAPEventStudentLink_TestDisruption` WRITE;
/*!40000 ALTER TABLE `NAPEventStudentLink_TestDisruption` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPEventStudentLink_TestDisruption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPStudentResponseSet`
--

DROP TABLE IF EXISTS `NAPStudentResponseSet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPStudentResponseSet` (
  `RefId` varchar(36) NOT NULL,
  `NAPTest_RefId` varchar(36) NOT NULL,
  `StudentPersonal_RefId` varchar(36) NOT NULL,
  `CalibrationSampleFlag` varchar(200) DEFAULT NULL,
  `EquatingSampleFlag` varchar(200) DEFAULT NULL,
  `PathTakenForDomain` varchar(2000) DEFAULT NULL,
  `ReportExclusionFlag` varchar(200) DEFAULT NULL,
  `ParallelTest` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `NAPStudentResponseSet_NAPTest_FK_idx` (`NAPTest_RefId`),
  CONSTRAINT `NAPStudentResponseSet_NAPTest_FK` FOREIGN KEY (`NAPTest_RefId`) REFERENCES `NAPTest` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPStudentResponseSet`
--

LOCK TABLES `NAPStudentResponseSet` WRITE;
/*!40000 ALTER TABLE `NAPStudentResponseSet` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPStudentResponseSet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPStudentResponseSet_DomainScore`
--

DROP TABLE IF EXISTS `NAPStudentResponseSet_DomainScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPStudentResponseSet_DomainScore` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPStudentResponseSet_RefId` varchar(36) NOT NULL,
  `RawScore` varchar(200) DEFAULT NULL,
  `ScaledScoreStandardError` varchar(200) DEFAULT NULL,
  `StudentDomainBand` varchar(200) DEFAULT NULL,
  `StudentProficiency` varchar(200) DEFAULT NULL,
  `ScaledScoreValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `DomainScore_NAPStudentResponseSet_FK_idx` (`NAPStudentResponseSet_RefId`),
  CONSTRAINT `DomainScore_NAPStudentResponseSet_FK` FOREIGN KEY (`NAPStudentResponseSet_RefId`) REFERENCES `NAPStudentResponseSet` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPStudentResponseSet_DomainScore`
--

LOCK TABLES `NAPStudentResponseSet_DomainScore` WRITE;
/*!40000 ALTER TABLE `NAPStudentResponseSet_DomainScore` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPStudentResponseSet_DomainScore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPStudentResponseSet_Testlet`
--

DROP TABLE IF EXISTS `NAPStudentResponseSet_Testlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPStudentResponseSet_Testlet` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPStudentResponseSet_RefId` varchar(36) NOT NULL,
  `NAPTestlet_RefId` varchar(36) NOT NULL,
  `TestletScore` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `TestletResponse_NAPStudentResponseSet_FK_idx` (`NAPStudentResponseSet_RefId`),
  KEY `TestletResponse_NAPTestlet_FK_idx` (`NAPTestlet_RefId`),
  CONSTRAINT `TestletResponse_NAPStudentResponseSet_FK` FOREIGN KEY (`NAPStudentResponseSet_RefId`) REFERENCES `NAPStudentResponseSet` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TestletResponse_NAPTestlet_FK` FOREIGN KEY (`NAPTestlet_RefId`) REFERENCES `NAPTestlet` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPStudentResponseSet_Testlet`
--

LOCK TABLES `NAPStudentResponseSet_Testlet` WRITE;
/*!40000 ALTER TABLE `NAPStudentResponseSet_Testlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPStudentResponseSet_Testlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPStudentResponseSet_Testlet_TestItem`
--

DROP TABLE IF EXISTS `NAPStudentResponseSet_Testlet_TestItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPStudentResponseSet_Testlet_TestItem` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ResponseTestlet_Id` int(11) NOT NULL,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `ItemWeight` varchar(200) DEFAULT NULL,
  `Response` varchar(2000) DEFAULT NULL,
  `ResponseCorrectness` varchar(200) DEFAULT NULL,
  `Score` varchar(200) DEFAULT NULL,
  `SequenceNumber` int(11) DEFAULT NULL,
  `LapsedTimeItem` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ResponseTestItem_ResponseTestlet_FK_idx` (`ResponseTestlet_Id`),
  KEY `ResponseTestItem_NAPTestItem_FK_idx` (`NAPTestItem_RefId`),
  CONSTRAINT `ResponseTestItem_NAPTestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ResponseTestItem_ResponseTestlet_FK` FOREIGN KEY (`ResponseTestlet_Id`) REFERENCES `NAPStudentResponseSet_Testlet` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPStudentResponseSet_Testlet_TestItem`
--

LOCK TABLES `NAPStudentResponseSet_Testlet_TestItem` WRITE;
/*!40000 ALTER TABLE `NAPStudentResponseSet_Testlet_TestItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPStudentResponseSet_Testlet_TestItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPStudentResponseSet_Testlet_TestItem_Subscore`
--

DROP TABLE IF EXISTS `NAPStudentResponseSet_Testlet_TestItem_Subscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPStudentResponseSet_Testlet_TestItem_Subscore` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ResponseTestItem_Id` int(11) NOT NULL,
  `SubscoreType` varchar(200) DEFAULT NULL,
  `SubscoreValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Subscore_ResponseTestItem_FK_idx` (`ResponseTestItem_Id`),
  CONSTRAINT `Subscore_ResponseTestItem_FK` FOREIGN KEY (`ResponseTestItem_Id`) REFERENCES `NAPStudentResponseSet_Testlet_TestItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPStudentResponseSet_Testlet_TestItem_Subscore`
--

LOCK TABLES `NAPStudentResponseSet_Testlet_TestItem_Subscore` WRITE;
/*!40000 ALTER TABLE `NAPStudentResponseSet_Testlet_TestItem_Subscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPStudentResponseSet_Testlet_TestItem_Subscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTest`
--

DROP TABLE IF EXISTS `NAPTest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTest` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `TestName` varchar(2000) DEFAULT NULL,
  `TestLevel` varchar(200) DEFAULT NULL,
  `TestType` varchar(200) DEFAULT NULL,
  `Domain` varchar(200) DEFAULT NULL,
  `TestYear` varchar(200) DEFAULT NULL,
  `StagesCount` varchar(45) DEFAULT NULL,
  `BandProficiency_Level1Lower` varchar(45) DEFAULT NULL,
  `BandProficiency_Level1Upper` varchar(45) DEFAULT NULL,
  `BandProficiency_Level2Lower` varchar(45) DEFAULT NULL,
  `BandProficiency_Level2Upper` varchar(45) DEFAULT NULL,
  `BandProficiency_Level3Lower` varchar(45) DEFAULT NULL,
  `BandProficiency_Level3Upper` varchar(45) DEFAULT NULL,
  `BandProficiency_Level4Lower` varchar(45) DEFAULT NULL,
  `BandProficiency_Level4Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band1Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band1Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band2Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band2Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band3Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band3Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band4Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band4Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band5Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band5Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band6Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band6Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band7Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band7Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band8Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band8Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band9Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band9Upper` varchar(45) DEFAULT NULL,
  `DomainBands_Band10Lower` varchar(45) DEFAULT NULL,
  `DomainBands_Band10Upper` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTest`
--

LOCK TABLES `NAPTest` WRITE;
/*!40000 ALTER TABLE `NAPTest` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestItem`
--

DROP TABLE IF EXISTS `NAPTestItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestItem` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `CorrectAnswer` varchar(2000) DEFAULT NULL,
  `ExemplarURL` varchar(2000) DEFAULT NULL,
  `ItemType` varchar(200) DEFAULT NULL,
  `ItemDescriptor` varchar(2000) DEFAULT NULL,
  `ItemDifficulty` varchar(200) DEFAULT NULL,
  `ItemDifficultyLogit5` varchar(200) DEFAULT NULL,
  `ItemDifficultyLogit5SE` varchar(200) DEFAULT NULL,
  `ItemDifficultyLogit62` varchar(200) DEFAULT NULL,
  `ItemDifficultyLogit62SE` varchar(200) DEFAULT NULL,
  `ItemProficiencyBand` varchar(200) DEFAULT NULL,
  `ItemProficiencyLevel` varchar(200) DEFAULT NULL,
  `MarkingType` varchar(200) DEFAULT NULL,
  `MaximumScore` varchar(200) DEFAULT NULL,
  `MultipleChoiceOptionCount` varchar(200) DEFAULT NULL,
  `ReleasedStatus` varchar(45) DEFAULT NULL,
  `Subdomain` varchar(200) DEFAULT NULL,
  `WritingGenre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestItem`
--

LOCK TABLES `NAPTestItem` WRITE;
/*!40000 ALTER TABLE `NAPTestItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestItem_ContentDescription`
--

DROP TABLE IF EXISTS `NAPTestItem_ContentDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestItem_ContentDescription` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `ContentDescription` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ContentDescription_TestItem_FK_idx` (`NAPTestItem_RefId`),
  CONSTRAINT `ContentDescription_TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestItem_ContentDescription`
--

LOCK TABLES `NAPTestItem_ContentDescription` WRITE;
/*!40000 ALTER TABLE `NAPTestItem_ContentDescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestItem_ContentDescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestItem_NAPWritingRubric`
--

DROP TABLE IF EXISTS `NAPTestItem_NAPWritingRubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestItem_NAPWritingRubric` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `Descriptor` varchar(2000) DEFAULT NULL,
  `RubricType` varchar(200) DEFAULT NULL,
  `RubricName` varchar(200) DEFAULT NULL,
  `ScoringGuideReference` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WritingRubric_TestItem_FK_idx` (`NAPTestItem_RefId`),
  CONSTRAINT `WritingRubric_TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestItem_NAPWritingRubric`
--

LOCK TABLES `NAPTestItem_NAPWritingRubric` WRITE;
/*!40000 ALTER TABLE `NAPTestItem_NAPWritingRubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestItem_NAPWritingRubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestItem_NAPWritingRubric_Score`
--

DROP TABLE IF EXISTS `NAPTestItem_NAPWritingRubric_Score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestItem_NAPWritingRubric_Score` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPWritingRubric_Id` int(11) NOT NULL,
  `MaxScoreValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Score_WritingRubric_FK_idx` (`NAPWritingRubric_Id`),
  CONSTRAINT `Score_WritingRubric_FK` FOREIGN KEY (`NAPWritingRubric_Id`) REFERENCES `NAPTestItem_NAPWritingRubric` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestItem_NAPWritingRubric_Score`
--

LOCK TABLES `NAPTestItem_NAPWritingRubric_Score` WRITE;
/*!40000 ALTER TABLE `NAPTestItem_NAPWritingRubric_Score` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestItem_NAPWritingRubric_Score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestItem_NAPWritingRubric_Score_ScoreDescription`
--

DROP TABLE IF EXISTS `NAPTestItem_NAPWritingRubric_Score_ScoreDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestItem_NAPWritingRubric_Score_ScoreDescription` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Score_Id` int(11) NOT NULL,
  `Descriptor` varchar(2000) DEFAULT NULL,
  `ScoreValue` varchar(200) DEFAULT NULL,
  `ScoreCommentCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ScoreDescription_Score_FK_idx` (`Score_Id`),
  CONSTRAINT `ScoreDescription_Score_FK` FOREIGN KEY (`Score_Id`) REFERENCES `NAPTestItem_NAPWritingRubric_Score` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestItem_NAPWritingRubric_Score_ScoreDescription`
--

LOCK TABLES `NAPTestItem_NAPWritingRubric_Score_ScoreDescription` WRITE;
/*!40000 ALTER TABLE `NAPTestItem_NAPWritingRubric_Score_ScoreDescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestItem_NAPWritingRubric_Score_ScoreDescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestItem_Stimulus`
--

DROP TABLE IF EXISTS `NAPTestItem_Stimulus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestItem_Stimulus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `Content` varchar(2000) DEFAULT NULL,
  `Descriptor` varchar(2000) DEFAULT NULL,
  `Domain` varchar(200) DEFAULT NULL,
  `StimulusType` varchar(200) DEFAULT NULL,
  `TextGenre` varchar(200) DEFAULT NULL,
  `TextType` varchar(200) DEFAULT NULL,
  `WordCount` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Stimulus_TestItem_FK_idx` (`NAPTestItem_RefId`),
  CONSTRAINT `Stimulus_TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestItem_Stimulus`
--

LOCK TABLES `NAPTestItem_Stimulus` WRITE;
/*!40000 ALTER TABLE `NAPTestItem_Stimulus` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestItem_Stimulus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestItem_SubstituteItem`
--

DROP TABLE IF EXISTS `NAPTestItem_SubstituteItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestItem_SubstituteItem` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `SubstituteItem_RefId` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TestItem_FK_idx` (`NAPTestItem_RefId`),
  KEY `SubstituteItem_FK_idx` (`SubstituteItem_RefId`),
  CONSTRAINT `SubstituteItem_FK` FOREIGN KEY (`SubstituteItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestItem_SubstituteItem`
--

LOCK TABLES `NAPTestItem_SubstituteItem` WRITE;
/*!40000 ALTER TABLE `NAPTestItem_SubstituteItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestItem_SubstituteItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestScoreSummary`
--

DROP TABLE IF EXISTS `NAPTestScoreSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestScoreSummary` (
  `RefId` varchar(36) NOT NULL,
  `NAPTest_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `DomainNationalAverage` varchar(45) DEFAULT NULL,
  `DomainSchoolAverage` varchar(45) DEFAULT NULL,
  `DomainJurisdictionAverage` varchar(45) DEFAULT NULL,
  `DomainTopNational60Percent` varchar(45) DEFAULT NULL,
  `DomainBottomNational60Percent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `TestScoreSummary_Test_FK_idx` (`NAPTest_RefId`),
  KEY `TestScoreSummary_School_FK_idx` (`SchoolInfo_RefId`),
  CONSTRAINT `TestScoreSummary_Test_FK` FOREIGN KEY (`NAPTest_RefId`) REFERENCES `NAPTest` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestScoreSummary`
--

LOCK TABLES `NAPTestScoreSummary` WRITE;
/*!40000 ALTER TABLE `NAPTestScoreSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestScoreSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestlet`
--

DROP TABLE IF EXISTS `NAPTestlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestlet` (
  `RefId` varchar(36) NOT NULL,
  `NAPTest_RefId` varchar(36) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `TestletName` varchar(2000) DEFAULT NULL,
  `TestletMaximumScore` varchar(200) DEFAULT NULL,
  `Node` varchar(200) DEFAULT NULL,
  `LocationInStage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `NAPTestlet_NAPTest_FK_idx` (`NAPTest_RefId`),
  CONSTRAINT `NAPTestlet_NAPTest_FK` FOREIGN KEY (`NAPTest_RefId`) REFERENCES `NAPTest` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestlet`
--

LOCK TABLES `NAPTestlet` WRITE;
/*!40000 ALTER TABLE `NAPTestlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NAPTestlet_TestItem`
--

DROP TABLE IF EXISTS `NAPTestlet_TestItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NAPTestlet_TestItem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestlet_RefId` varchar(36) NOT NULL,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `NAPTestlet_NAPTestItem_Sequence` int(11) DEFAULT NULL,
  `NAPTestItem_NAPTestlet_Sequence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TestletTestItem_Testlet_FK_idx` (`NAPTestlet_RefId`),
  KEY `TestletTestItem_TestItem_FK_idx` (`NAPTestItem_RefId`),
  CONSTRAINT `TestletTestItem_TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TestletTestItem_Testlet_FK` FOREIGN KEY (`NAPTestlet_RefId`) REFERENCES `NAPTestlet` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NAPTestlet_TestItem`
--

LOCK TABLES `NAPTestlet_TestItem` WRITE;
/*!40000 ALTER TABLE `NAPTestlet_TestItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `NAPTestlet_TestItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentReceipt`
--

DROP TABLE IF EXISTS `PaymentReceipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentReceipt` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `TransactionType` varchar(200) DEFAULT NULL,
  `Invoice_RefId` varchar(36) DEFAULT NULL,
  `VendorInfo_RefId` varchar(36) DEFAULT NULL,
  `Debtor_RefId` varchar(36) DEFAULT NULL,
  `PurchaseOrder_RefId` varchar(36) DEFAULT NULL,
  `LocationInfo_RefId` varchar(36) DEFAULT NULL,
  `TransactionDate` varchar(200) DEFAULT NULL,
  `ReceivedAmount` varchar(200) DEFAULT NULL,
  `ReceivedAmountType` varchar(200) DEFAULT NULL,
  `ReceivedTransactionId` varchar(200) DEFAULT NULL,
  `TransactionDescription` varchar(200) DEFAULT NULL,
  `TaxRate` varchar(200) DEFAULT NULL,
  `TaxAmount` varchar(200) DEFAULT NULL,
  `TransactionMethod` varchar(200) DEFAULT NULL,
  `ChequeNumber` varchar(200) DEFAULT NULL,
  `TransactionNote` varchar(200) DEFAULT NULL,
  `AccountingPeriod` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `Invoice_RefId` (`Invoice_RefId`),
  KEY `VendorInfo_RefId` (`VendorInfo_RefId`),
  KEY `Debtor_RefId` (`Debtor_RefId`),
  CONSTRAINT `PaymentReceipt_ibfk_1` FOREIGN KEY (`Invoice_RefId`) REFERENCES `Invoice` (`RefId`),
  CONSTRAINT `PaymentReceipt_ibfk_2` FOREIGN KEY (`VendorInfo_RefId`) REFERENCES `VendorInfo` (`RefId`),
  CONSTRAINT `PaymentReceipt_ibfk_3` FOREIGN KEY (`Debtor_RefId`) REFERENCES `Debtor` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentReceipt`
--

LOCK TABLES `PaymentReceipt` WRITE;
/*!40000 ALTER TABLE `PaymentReceipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentReceipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentReceipt_AccountCode`
--

DROP TABLE IF EXISTS `PaymentReceipt_AccountCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentReceipt_AccountCode` (
  `PaymentReceipt_RefId` varchar(36) DEFAULT NULL,
  `AccountCode` varchar(200) DEFAULT NULL,
  KEY `PaymentReceipt_RefId` (`PaymentReceipt_RefId`),
  CONSTRAINT `PaymentReceipt_AccountCode_ibfk_1` FOREIGN KEY (`PaymentReceipt_RefId`) REFERENCES `PaymentReceipt` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentReceipt_AccountCode`
--

LOCK TABLES `PaymentReceipt_AccountCode` WRITE;
/*!40000 ALTER TABLE `PaymentReceipt_AccountCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentReceipt_AccountCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentReceipt_FinancialAccount`
--

DROP TABLE IF EXISTS `PaymentReceipt_FinancialAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentReceipt_FinancialAccount` (
  `PaymentReceipt_RefId` varchar(36) DEFAULT NULL,
  `FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  KEY `PaymentReceipt_RefId` (`PaymentReceipt_RefId`),
  KEY `FinancialAccount_RefId` (`FinancialAccount_RefId`),
  CONSTRAINT `PaymentReceipt_FinancialAccount_ibfk_1` FOREIGN KEY (`PaymentReceipt_RefId`) REFERENCES `PaymentReceipt` (`RefId`),
  CONSTRAINT `PaymentReceipt_FinancialAccount_ibfk_2` FOREIGN KEY (`FinancialAccount_RefId`) REFERENCES `FinancialAccount` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentReceipt_FinancialAccount`
--

LOCK TABLES `PaymentReceipt_FinancialAccount` WRITE;
/*!40000 ALTER TABLE `PaymentReceipt_FinancialAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentReceipt_FinancialAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentReceipt_PaymentReceiptLine`
--

DROP TABLE IF EXISTS `PaymentReceipt_PaymentReceiptLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentReceipt_PaymentReceiptLine` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `PaymentReceipt_RefId` varchar(36) DEFAULT NULL,
  `Invoice_RefId` varchar(36) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `LocalPaymentReceiptLineId` varchar(200) DEFAULT NULL,
  `TransactionAmount_Value` varchar(200) DEFAULT NULL,
  `TransactionAmount_Type` varchar(200) DEFAULT NULL,
  `FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  `AccountCode` varchar(200) DEFAULT NULL,
  `TransactionDescription` varchar(200) DEFAULT NULL,
  `TaxRate` varchar(200) DEFAULT NULL,
  `TaxAmount` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PaymentReceipt_RefId` (`PaymentReceipt_RefId`),
  CONSTRAINT `PaymentReceipt_PaymentReceiptLine_ibfk_1` FOREIGN KEY (`PaymentReceipt_RefId`) REFERENCES `PaymentReceipt` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentReceipt_PaymentReceiptLine`
--

LOCK TABLES `PaymentReceipt_PaymentReceiptLine` WRITE;
/*!40000 ALTER TABLE `PaymentReceipt_PaymentReceiptLine` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentReceipt_PaymentReceiptLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonPicture`
--

DROP TABLE IF EXISTS `PersonPicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonPicture` (
  `RefId` varchar(36) NOT NULL,
  `ParentObject_RefId` varchar(36) DEFAULT NULL,
  `ParentObjectRefId_SIF_RefObject` varchar(200) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `PictureSource` text,
  `PictureSourceType` varchar(200) DEFAULT NULL,
  `OKToPublish` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonPicture`
--

LOCK TABLES `PersonPicture` WRITE;
/*!40000 ALTER TABLE `PersonPicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonPicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonPicture_PublishingPermission`
--

DROP TABLE IF EXISTS `PersonPicture_PublishingPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonPicture_PublishingPermission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PersonPicture_RefId` varchar(36) NOT NULL,
  `PermissionCategory` varchar(200) DEFAULT NULL,
  `PermissionValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PP_PublishingPermission_IX` (`PersonPicture_RefId`),
  CONSTRAINT `PP_PublishingPermission_FK` FOREIGN KEY (`PersonPicture_RefId`) REFERENCES `PersonPicture` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonPicture_PublishingPermission`
--

LOCK TABLES `PersonPicture_PublishingPermission` WRITE;
/*!40000 ALTER TABLE `PersonPicture_PublishingPermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonPicture_PublishingPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonalisedPlan`
--

DROP TABLE IF EXISTS `PersonalisedPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonalisedPlan` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `PersonalisedPlanCategory` varchar(200) DEFAULT NULL,
  `PersonalisedPlanStartDate` varchar(200) DEFAULT NULL,
  `PersonalisedPlanEndDate` varchar(200) DEFAULT NULL,
  `PersonalisedPlanReviewDate` varchar(200) DEFAULT NULL,
  `PersonalisedPlanNotes` varchar(1000) DEFAULT NULL,
  `AssociatedAttachment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonalisedPlan`
--

LOCK TABLES `PersonalisedPlan` WRITE;
/*!40000 ALTER TABLE `PersonalisedPlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonalisedPlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonalisedPlan_Document`
--

DROP TABLE IF EXISTS `PersonalisedPlan_Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonalisedPlan_Document` (
  `PersonalisedPlan_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(200) DEFAULT NULL,
  `Sensitivity` varchar(200) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `DocumentType` varchar(200) DEFAULT NULL,
  `DocumentReviewDate` varchar(200) DEFAULT NULL,
  `DocumentDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PersonalisedPlan_Document_IX` (`PersonalisedPlan_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonalisedPlan_Document`
--

LOCK TABLES `PersonalisedPlan_Document` WRITE;
/*!40000 ALTER TABLE `PersonalisedPlan_Document` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonalisedPlan_Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrder`
--

DROP TABLE IF EXISTS `PurchaseOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PurchaseOrder` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `FormNumber` varchar(200) DEFAULT NULL,
  `VendorInfo_RefId` varchar(36) DEFAULT NULL,
  `LocationInfo_RefId` varchar(36) DEFAULT NULL,
  `EmployeePersonal_RefId` varchar(36) DEFAULT NULL,
  `CreationDate` varchar(200) DEFAULT NULL,
  `TaxRate` varchar(200) DEFAULT NULL,
  `TaxAmount` varchar(200) DEFAULT NULL,
  `AmountDelivered` varchar(200) DEFAULT NULL,
  `UpdateDate` varchar(200) DEFAULT NULL,
  `FullyDelivered` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `EmployeePersonal_RefId` (`EmployeePersonal_RefId`),
  KEY `LocationInfo_RefId` (`LocationInfo_RefId`),
  CONSTRAINT `PurchaseOrder_ibfk_1` FOREIGN KEY (`EmployeePersonal_RefId`) REFERENCES `StaffPersonal` (`RefId`),
  CONSTRAINT `PurchaseOrder_ibfk_2` FOREIGN KEY (`LocationInfo_RefId`) REFERENCES `LocationInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrder`
--

LOCK TABLES `PurchaseOrder` WRITE;
/*!40000 ALTER TABLE `PurchaseOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrder_PurchasingItem_ExpenseAccount`
--

DROP TABLE IF EXISTS `PurchaseOrder_PurchasingItem_ExpenseAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PurchaseOrder_PurchasingItem_ExpenseAccount` (
  `PurchasingItemId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `AccountCode` varchar(200) DEFAULT NULL,
  `Amount` varchar(200) DEFAULT NULL,
  `FinancialAccount_RefId` varchar(36) DEFAULT NULL,
  `AccountingPeriod` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PurchasingItemId`),
  KEY `FinancialAccount_RefId` (`FinancialAccount_RefId`),
  CONSTRAINT `PurchaseOrder_PurchasingItem_ExpenseAccount_ibfk_1` FOREIGN KEY (`FinancialAccount_RefId`) REFERENCES `FinancialAccount` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrder_PurchasingItem_ExpenseAccount`
--

LOCK TABLES `PurchaseOrder_PurchasingItem_ExpenseAccount` WRITE;
/*!40000 ALTER TABLE `PurchaseOrder_PurchasingItem_ExpenseAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseOrder_PurchasingItem_ExpenseAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PurchaseOrder_PurchasingItems`
--

DROP TABLE IF EXISTS `PurchaseOrder_PurchasingItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PurchaseOrder_PurchasingItems` (
  `PurchaseOrder_RefId` varchar(36) DEFAULT NULL,
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `LocalItemId` varchar(200) DEFAULT NULL,
  `ItemNumber` varchar(200) DEFAULT NULL,
  `ItemDescription` varchar(200) DEFAULT NULL,
  `Quantity` varchar(200) DEFAULT NULL,
  `UnitCost` varchar(200) DEFAULT NULL,
  `QuantityDelivered` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `PurchaseOrder_RefId` (`PurchaseOrder_RefId`),
  CONSTRAINT `PurchaseOrder_PurchasingItems_ibfk_1` FOREIGN KEY (`PurchaseOrder_RefId`) REFERENCES `PurchaseOrder` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseOrder_PurchasingItems`
--

LOCK TABLES `PurchaseOrder_PurchasingItems` WRITE;
/*!40000 ALTER TABLE `PurchaseOrder_PurchasingItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseOrder_PurchasingItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoomInfo`
--

DROP TABLE IF EXISTS `RoomInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoomInfo` (
  `RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `RoomNumber` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Capacity` varchar(100) DEFAULT NULL,
  `RoomSize` varchar(100) DEFAULT NULL,
  `RoomType` varchar(100) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `AvailableForTimetable` varchar(20) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `RoomInfo_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoomInfo`
--

LOCK TABLES `RoomInfo` WRITE;
/*!40000 ALTER TABLE `RoomInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoomInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledActivity`
--

DROP TABLE IF EXISTS `ScheduledActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ScheduledActivity` (
  `RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `TimeTableCell_RefId` varchar(36) DEFAULT NULL,
  `TimeTable_RefId` varchar(36) DEFAULT NULL,
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  `DayId` varchar(100) DEFAULT NULL,
  `PeriodId` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `StartTime` varchar(100) DEFAULT NULL,
  `FinishTime` varchar(100) DEFAULT NULL,
  `CellType` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  `YearLevels` varchar(100) DEFAULT NULL,
  `Override` varchar(100) DEFAULT NULL,
  `DateOfOverride` varchar(100) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  KEY `TimeTableCell_RefId` (`TimeTableCell_RefId`),
  KEY `TimeTable_RefId` (`TimeTable_RefId`),
  KEY `TimeTableSubject_RefId` (`TimeTableSubject_RefId`),
  CONSTRAINT `ScheduledActivity_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`),
  CONSTRAINT `ScheduledActivity_ibfk_2` FOREIGN KEY (`TimeTableCell_RefId`) REFERENCES `TimeTableCell` (`RefId`),
  CONSTRAINT `ScheduledActivity_ibfk_3` FOREIGN KEY (`TimeTable_RefId`) REFERENCES `TimeTable` (`RefId`),
  CONSTRAINT `ScheduledActivity_ibfk_4` FOREIGN KEY (`TimeTableSubject_RefId`) REFERENCES `TimeTableSubject` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledActivity`
--

LOCK TABLES `ScheduledActivity` WRITE;
/*!40000 ALTER TABLE `ScheduledActivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledActivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledActivity_Room`
--

DROP TABLE IF EXISTS `ScheduledActivity_Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ScheduledActivity_Room` (
  `ScheduledActivity_RefId` varchar(36) DEFAULT NULL,
  `RoomInfo_RefId` varchar(36) DEFAULT NULL,
  KEY `ScheduledActivity_RefId` (`ScheduledActivity_RefId`),
  KEY `RoomInfo_RefId` (`RoomInfo_RefId`),
  CONSTRAINT `ScheduledActivity_Room_ibfk_1` FOREIGN KEY (`ScheduledActivity_RefId`) REFERENCES `ScheduledActivity` (`RefId`),
  CONSTRAINT `ScheduledActivity_Room_ibfk_2` FOREIGN KEY (`RoomInfo_RefId`) REFERENCES `RoomInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledActivity_Room`
--

LOCK TABLES `ScheduledActivity_Room` WRITE;
/*!40000 ALTER TABLE `ScheduledActivity_Room` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledActivity_Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledActivity_Student`
--

DROP TABLE IF EXISTS `ScheduledActivity_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ScheduledActivity_Student` (
  `ScheduledActivity_RefId` varchar(36) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  KEY `ScheduledActivity_RefId` (`ScheduledActivity_RefId`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  CONSTRAINT `ScheduledActivity_Student_ibfk_1` FOREIGN KEY (`ScheduledActivity_RefId`) REFERENCES `ScheduledActivity` (`RefId`),
  CONSTRAINT `ScheduledActivity_Student_ibfk_2` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledActivity_Student`
--

LOCK TABLES `ScheduledActivity_Student` WRITE;
/*!40000 ALTER TABLE `ScheduledActivity_Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledActivity_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledActivity_Teacher`
--

DROP TABLE IF EXISTS `ScheduledActivity_Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ScheduledActivity_Teacher` (
  `ScheduledActivity_RefId` varchar(36) DEFAULT NULL,
  `StaffPersonal_RefId` varchar(36) DEFAULT NULL,
  `TeacherLocalId` varchar(100) DEFAULT NULL,
  `StartTime` varchar(100) DEFAULT NULL,
  `FinishTime` varchar(100) DEFAULT NULL,
  `Credit` varchar(100) DEFAULT NULL,
  `Supervision` varchar(100) DEFAULT NULL,
  `Weighting` varchar(100) DEFAULT NULL,
  KEY `ScheduledActivity_RefId` (`ScheduledActivity_RefId`),
  KEY `StaffPersonal_RefId` (`StaffPersonal_RefId`),
  CONSTRAINT `ScheduledActivity_Teacher_ibfk_1` FOREIGN KEY (`ScheduledActivity_RefId`) REFERENCES `ScheduledActivity` (`RefId`),
  CONSTRAINT `ScheduledActivity_Teacher_ibfk_2` FOREIGN KEY (`StaffPersonal_RefId`) REFERENCES `StaffPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledActivity_Teacher`
--

LOCK TABLES `ScheduledActivity_Teacher` WRITE;
/*!40000 ALTER TABLE `ScheduledActivity_Teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledActivity_Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScheduledActivity_TeachingGroup`
--

DROP TABLE IF EXISTS `ScheduledActivity_TeachingGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ScheduledActivity_TeachingGroup` (
  `ScheduledActivity_RefId` varchar(36) DEFAULT NULL,
  `TeachingGroup_RefId` varchar(36) DEFAULT NULL,
  KEY `ScheduledActivity_RefId` (`ScheduledActivity_RefId`),
  KEY `TeachingGroup_RefId` (`TeachingGroup_RefId`),
  CONSTRAINT `ScheduledActivity_TeachingGroup_ibfk_1` FOREIGN KEY (`ScheduledActivity_RefId`) REFERENCES `ScheduledActivity` (`RefId`),
  CONSTRAINT `ScheduledActivity_TeachingGroup_ibfk_2` FOREIGN KEY (`TeachingGroup_RefId`) REFERENCES `TeachingGroup` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScheduledActivity_TeachingGroup`
--

LOCK TABLES `ScheduledActivity_TeachingGroup` WRITE;
/*!40000 ALTER TABLE `ScheduledActivity_TeachingGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScheduledActivity_TeachingGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolCourseInfo`
--

DROP TABLE IF EXISTS `SchoolCourseInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SchoolCourseInfo` (
  `RefId` varchar(36) NOT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolLocalId` varchar(200) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `TermInfo_RefId` varchar(36) DEFAULT NULL,
  `CourseCode` varchar(200) DEFAULT NULL,
  `StateCourseCode` varchar(200) DEFAULT NULL,
  `DistrictCourseCode` varchar(200) DEFAULT NULL,
  `CourseTitle` varchar(200) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `InstructionalLevel` varchar(200) DEFAULT NULL,
  `CourseCredits` varchar(200) DEFAULT NULL,
  `CoreAcademicCourse` varchar(200) DEFAULT NULL,
  `GraduationRequirement` varchar(200) DEFAULT NULL,
  `Department` varchar(200) DEFAULT NULL,
  `CourseContent` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolCourseInfo`
--

LOCK TABLES `SchoolCourseInfo` WRITE;
/*!40000 ALTER TABLE `SchoolCourseInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolCourseInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolCourseInfo_SubjectArea`
--

DROP TABLE IF EXISTS `SchoolCourseInfo_SubjectArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SchoolCourseInfo_SubjectArea` (
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `SchoolCourseInfo_RefId` varchar(36) NOT NULL,
  `Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SchoolCourseInfo_IX` (`SchoolCourseInfo_RefId`),
  CONSTRAINT `SchoolCourseInfo_FK` FOREIGN KEY (`SchoolCourseInfo_RefId`) REFERENCES `SchoolCourseInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolCourseInfo_SubjectArea`
--

LOCK TABLES `SchoolCourseInfo_SubjectArea` WRITE;
/*!40000 ALTER TABLE `SchoolCourseInfo_SubjectArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolCourseInfo_SubjectArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolCourseInfo_SubjectArea_Code`
--

DROP TABLE IF EXISTS `SchoolCourseInfo_SubjectArea_Code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SchoolCourseInfo_SubjectArea_Code` (
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `SubjectArea_Id` mediumint(9) NOT NULL,
  `Value` varchar(200) DEFAULT NULL,
  `Codeset` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `SubjectArea_IX` (`SubjectArea_Id`),
  CONSTRAINT `SubjectArea_FK` FOREIGN KEY (`SubjectArea_Id`) REFERENCES `SchoolCourseInfo_SubjectArea` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolCourseInfo_SubjectArea_Code`
--

LOCK TABLES `SchoolCourseInfo_SubjectArea_Code` WRITE;
/*!40000 ALTER TABLE `SchoolCourseInfo_SubjectArea_Code` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolCourseInfo_SubjectArea_Code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolInfo`
--

DROP TABLE IF EXISTS `SchoolInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SchoolInfo` (
  `RefId` varchar(36) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `ACARAId` varchar(200) DEFAULT NULL,
  `SchoolName` varchar(2000) DEFAULT NULL,
  `StateProvinceId` varchar(200) DEFAULT NULL,
  `CommonwealthId` varchar(200) DEFAULT NULL,
  `CampusSchoolCampusId` varchar(200) DEFAULT NULL,
  `CampusAdminStatus` varchar(100) DEFAULT NULL,
  `CampusCampusType` varchar(100) DEFAULT NULL,
  `CampusParentSchoolId` varchar(100) DEFAULT NULL,
  `SchoolSector` varchar(200) DEFAULT NULL,
  `OperationalStatus` varchar(200) DEFAULT NULL,
  `IndependentSchool` varchar(200) DEFAULT NULL,
  `SchoolType` varchar(200) DEFAULT NULL,
  `Address_StateProvince` varchar(200) DEFAULT NULL,
  `Address_City` varchar(200) DEFAULT NULL,
  `Address_PostalCode` varchar(200) DEFAULT NULL,
  `Address_Street_StreetNumber` varchar(200) DEFAULT NULL,
  `Address_Street_StreetName` varchar(200) DEFAULT NULL,
  `Address_GridLocation_Longitude` varchar(200) DEFAULT NULL,
  `Address_GridLocation_Latitude` varchar(200) DEFAULT NULL,
  `Address_SchoolGeographicLocation` varchar(200) DEFAULT NULL,
  `Address_ARIA` varchar(200) DEFAULT NULL,
  `Entity_Open` varchar(200) DEFAULT NULL,
  `Entity_Close` varchar(200) DEFAULT NULL,
  `ZoneId` varchar(36) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolInfo`
--

LOCK TABLES `SchoolInfo` WRITE;
/*!40000 ALTER TABLE `SchoolInfo` DISABLE KEYS */;
INSERT INTO `SchoolInfo` VALUES ('97E104E8-5E93-45F0-9E01-05AD04C4036C','1',NULL,'Powlowskimouth College','6274','907','3','Y','Pri/Sec','1','Gov','O','N','Pri/Sec','SA','Francoview','5349','834','Harbor',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('CF14DEE0-11E7-4D6C-A328-7DB92F69DF32','2',NULL,'Heathcotemouth College','8429','2142','1','N','Pri/Sec','2','Gov','O','N','Pri/Sec','VIC','Mullerview','3119','965','Crescent',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('B627CBC5-44F0-4D06-ACFF-B77A5E657543','3',NULL,'West Johnson College','110','4022','3','N','Pri/Sec','3','Gov','O','N','Pri/Sec','TAS','Serenityville','7306','1928','Stravenue',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('C9F82F14-8279-4718-B1D8-484627B32C75','4',NULL,'West Cummerata College','5122','1021','2','Y','Pri/Sec','4','Gov','O','N','Pri/Sec','QLD','Watsonville','4498','55219','Haven',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('AD96027D-73BB-4EDB-B476-CAFB1EA3DED8','5',NULL,'Mosciskiton College','1352','6690','4','Y','Pri/Sec','5','Gov','O','N','Pri/Sec','QLD','Ronnychester','4828','642','Branch',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('89AED2A5-E8D6-4AD3-B99C-3D89CA5886D4','6',NULL,'East Stoltenberg College','2989','5884','1','N','Pri/Sec','6','Gov','O','N','Pri/Sec','WA','Dachtown','6709','504','Road',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('19457ACF-B1B0-46FA-A301-9B6505710B87','7',NULL,'South Bins College','7875','128','4','N','Pri/Sec','7','Gov','O','N','Pri/Sec','NSW','Goldnerport','2145','5990','Bridge',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('4C814862-4949-4858-A5C8-D7A39DFEA55D','8',NULL,'Okunevaberg College','3479','8041','4','Y','Pri/Sec','8','Gov','O','N','Pri/Sec','VIC','Naomiton','3820','2838','Drive',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('024C1627-8994-4173-BE31-0465FB7D2808','9',NULL,'Kovacekland College','568','5991','1','Y','Pri/Sec','9','Gov','O','N','Pri/Sec','WA','Breitenbergborough','6488','430','Locks',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL),('8797085C-DE56-4310-ACC4-E71D756F5F36','10',NULL,'Rutherfordton College','7956','5470','2','Y','Pri/Sec','10','Gov','O','N','Pri/Sec','VIC','Wildermanburgh','3959','53750','Falls',NULL,NULL,NULL,'1','1990-01-01',NULL,NULL);
/*!40000 ALTER TABLE `SchoolInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SessionInfo`
--

DROP TABLE IF EXISTS `SessionInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SessionInfo` (
  `RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `TimeTableCell_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `TimeTableSubjectLocalId` varchar(200) DEFAULT NULL,
  `TeachingGroupLocalId` varchar(200) DEFAULT NULL,
  `SchoolLocalId` varchar(200) DEFAULT NULL,
  `StaffPersonalLocalId` varchar(200) DEFAULT NULL,
  `RoomNumber` varchar(200) DEFAULT NULL,
  `DayId` varchar(200) DEFAULT NULL,
  `PeriodId` varchar(200) DEFAULT NULL,
  `SessionDate` varchar(200) DEFAULT NULL,
  `StartTime` varchar(200) DEFAULT NULL,
  `FinishTime` varchar(200) DEFAULT NULL,
  `RollMarked` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SessionInfo_ibfk_1_idx` (`SchoolInfo_RefId`),
  KEY `SessionInfo_ibfk_2_idx` (`TimeTableCell_RefId`),
  CONSTRAINT `SessionInfo_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SessionInfo_ibfk_2` FOREIGN KEY (`TimeTableCell_RefId`) REFERENCES `TimeTableCell` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SessionInfo`
--

LOCK TABLES `SessionInfo` WRITE;
/*!40000 ALTER TABLE `SessionInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `SessionInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffAssignment`
--

DROP TABLE IF EXISTS `StaffAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffAssignment` (
  `RefId` varchar(36) NOT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `StaffPersonal_RefId` varchar(36) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `PrimaryAssignment` varchar(200) DEFAULT NULL,
  `JobStartDate` varchar(200) DEFAULT NULL,
  `JobEndDate` varchar(200) DEFAULT NULL,
  `JobFunction` varchar(200) DEFAULT NULL,
  `StaffActivity_Code` varchar(200) DEFAULT NULL,
  `JobFTE` varchar(20) DEFAULT NULL,
  `EmploymentStatus` varchar(20) DEFAULT NULL,
  `CasualReliefTeacher` varchar(20) DEFAULT NULL,
  `Homegroup` varchar(200) DEFAULT NULL,
  `House` varchar(200) DEFAULT NULL,
  `PreviousSchoolName` varchar(200) DEFAULT NULL,
  `AvailableForTimetable` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `SchoolInfo_RefId_IX` (`SchoolInfo_RefId`),
  KEY `StaffPersonal_RefId_IX` (`StaffPersonal_RefId`),
  CONSTRAINT `StaffAssignment_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`),
  CONSTRAINT `StaffAssignment_ibfk_2` FOREIGN KEY (`StaffPersonal_RefId`) REFERENCES `StaffPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffAssignment`
--

LOCK TABLES `StaffAssignment` WRITE;
/*!40000 ALTER TABLE `StaffAssignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffAssignment_CalendarSummary`
--

DROP TABLE IF EXISTS `StaffAssignment_CalendarSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffAssignment_CalendarSummary` (
  `StaffAssignment_RefId` varchar(36) NOT NULL,
  `CalendarSummary_RefId` varchar(36) NOT NULL,
  PRIMARY KEY (`StaffAssignment_RefId`,`CalendarSummary_RefId`),
  KEY `SA_CalendarSummary_FKX` (`StaffAssignment_RefId`),
  CONSTRAINT `SA_CalendarSummary_FK` FOREIGN KEY (`StaffAssignment_RefId`) REFERENCES `StaffAssignment` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffAssignment_CalendarSummary`
--

LOCK TABLES `StaffAssignment_CalendarSummary` WRITE;
/*!40000 ALTER TABLE `StaffAssignment_CalendarSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffAssignment_CalendarSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffAssignment_StaffSubject`
--

DROP TABLE IF EXISTS `StaffAssignment_StaffSubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffAssignment_StaffSubject` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffAssignment_RefId` varchar(36) NOT NULL,
  `PreferenceNumber` varchar(200) DEFAULT NULL,
  `SubjectLocalId` varchar(200) DEFAULT NULL,
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SA_StaffSubject_IX` (`StaffAssignment_RefId`),
  CONSTRAINT `SA_StaffSubject_FK` FOREIGN KEY (`StaffAssignment_RefId`) REFERENCES `StaffAssignment` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffAssignment_StaffSubject`
--

LOCK TABLES `StaffAssignment_StaffSubject` WRITE;
/*!40000 ALTER TABLE `StaffAssignment_StaffSubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffAssignment_StaffSubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffAssignment_YearLevel`
--

DROP TABLE IF EXISTS `StaffAssignment_YearLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffAssignment_YearLevel` (
  `StaffAssignment_RefId` varchar(36) NOT NULL,
  `YearLevel` varchar(20) NOT NULL,
  PRIMARY KEY (`StaffAssignment_RefId`,`YearLevel`),
  KEY `SA_YearLevel_FKX` (`StaffAssignment_RefId`),
  CONSTRAINT `SA_YearLevel_FK` FOREIGN KEY (`StaffAssignment_RefId`) REFERENCES `StaffAssignment` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffAssignment_YearLevel`
--

LOCK TABLES `StaffAssignment_YearLevel` WRITE;
/*!40000 ALTER TABLE `StaffAssignment_YearLevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffAssignment_YearLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffPersonal`
--

DROP TABLE IF EXISTS `StaffPersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffPersonal` (
  `RefId` varchar(36) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(2000) DEFAULT NULL,
  `GivenName` varchar(2000) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `StateProvinceId` varchar(200) DEFAULT NULL,
  `Sex` varchar(200) DEFAULT NULL,
  `EmploymentStatus` varchar(200) DEFAULT NULL,
  `PhoneNumber` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `BirthDate` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `FullName` varchar(2000) DEFAULT NULL,
  `Salutation` varchar(25) DEFAULT NULL,
  `MostRecent_SchoolACARAId` varchar(200) DEFAULT NULL,
  `MostRecent_SchoolLocalId` varchar(200) DEFAULT NULL,
  `MostRecent_LocalCampusId` varchar(200) DEFAULT NULL,
  `InterpreterRequired` varchar(20) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `StaffPersonal_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffPersonal`
--

LOCK TABLES `StaffPersonal` WRITE;
/*!40000 ALTER TABLE `StaffPersonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffPersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffPersonal_OtherId`
--

DROP TABLE IF EXISTS `StaffPersonal_OtherId`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StaffPersonal_OtherId` (
  `StaffPersonal_RefId` varchar(36) DEFAULT NULL,
  `OtherId` varchar(200) DEFAULT NULL,
  `OtherIdType` varchar(200) DEFAULT NULL,
  KEY `StaffPersonal_RefId` (`StaffPersonal_RefId`),
  CONSTRAINT `StaffPersonal_OtherId_ibfk_1` FOREIGN KEY (`StaffPersonal_RefId`) REFERENCES `StaffPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffPersonal_OtherId`
--

LOCK TABLES `StaffPersonal_OtherId` WRITE;
/*!40000 ALTER TABLE `StaffPersonal_OtherId` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffPersonal_OtherId` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCR_EntityContact`
--

DROP TABLE IF EXISTS `StudentAttendanceCR_EntityContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCR_EntityContact` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceCR_Id` mediumint(9) NOT NULL,
  `PositionTitle` varchar(200) DEFAULT NULL,
  `Role` varchar(200) DEFAULT NULL,
  `RegistrationDetails` varchar(200) DEFAULT NULL,
  `Qualifications` varchar(200) DEFAULT NULL,
  `Email_Type` varchar(200) DEFAULT NULL,
  `Email_Value` varchar(200) DEFAULT NULL,
  `PhoneNumber_Type` varchar(200) DEFAULT NULL,
  `PhoneNumber_Number` varchar(200) DEFAULT NULL,
  `PhoneNumber_Extension` varchar(200) DEFAULT NULL,
  `PhoneNumber_ListedStatus` varchar(200) DEFAULT NULL,
  `PhoneNumber_Preference` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EntityContact_StudentAttendanceCR_IX` (`StudentAttendanceCR_Id`),
  CONSTRAINT `EntityContact_StudentAttendanceCR_FK` FOREIGN KEY (`StudentAttendanceCR_Id`) REFERENCES `StudentAttendanceCollectionReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCR_EntityContact`
--

LOCK TABLES `StudentAttendanceCR_EntityContact` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCR_EntityContact_Address`
--

DROP TABLE IF EXISTS `StudentAttendanceCR_EntityContact_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCR_EntityContact_Address` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceCR_EntityContact_Id` mediumint(9) NOT NULL,
  `AddressType` varchar(200) DEFAULT NULL,
  `AddressRole` varchar(200) DEFAULT NULL,
  `EffectiveFromDate` varchar(200) DEFAULT NULL,
  `EffectiveToDate` varchar(200) DEFAULT NULL,
  `Street_Line1` varchar(200) DEFAULT NULL,
  `Street_Line2` varchar(200) DEFAULT NULL,
  `Street_Line3` varchar(200) DEFAULT NULL,
  `Street_Complex` varchar(200) DEFAULT NULL,
  `Street_StreetNumber` varchar(200) DEFAULT NULL,
  `Street_StreetPrefix` varchar(200) DEFAULT NULL,
  `Street_StreetName` varchar(200) DEFAULT NULL,
  `Street_StreetType` varchar(200) DEFAULT NULL,
  `Street_StreetSuffix` varchar(200) DEFAULT NULL,
  `Street_ApartmentType` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberPrefix` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumber` varchar(200) DEFAULT NULL,
  `Street_ApartmentNumberSuffix` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `StateProvince` varchar(200) DEFAULT NULL,
  `Country` varchar(200) DEFAULT NULL,
  `PostalCode` varchar(200) DEFAULT NULL,
  `GridLocation_Latitude` varchar(200) DEFAULT NULL,
  `GridLocation_Longitude` varchar(200) DEFAULT NULL,
  `MapReference_Type` varchar(200) DEFAULT NULL,
  `MapReference_XCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_YCoordinate` varchar(200) DEFAULT NULL,
  `MapReference_MapNumber` varchar(200) DEFAULT NULL,
  `RadioContact` varchar(200) DEFAULT NULL,
  `Community` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `AddressGlobalUID` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Address_StudentAttendanceCREntityContact_IX` (`StudentAttendanceCR_EntityContact_Id`),
  CONSTRAINT `Address_StudentAttendanceCREntityContact_FK` FOREIGN KEY (`StudentAttendanceCR_EntityContact_Id`) REFERENCES `StudentAttendanceCR_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCR_EntityContact_Address`
--

LOCK TABLES `StudentAttendanceCR_EntityContact_Address` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCR_EntityContact_Address_StatisticalArea`
--

DROP TABLE IF EXISTS `StudentAttendanceCR_EntityContact_Address_StatisticalArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCR_EntityContact_Address_StatisticalArea` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceCR_EntityContact_Address_Id` mediumint(9) NOT NULL,
  `spatialUnitType` varchar(200) DEFAULT NULL,
  `statisticalArea` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StatArea_StudentAttendanceCREntityContactAddress_IX` (`StudentAttendanceCR_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_StudentAttendanceCREntityContactAddress_FK` FOREIGN KEY (`StudentAttendanceCR_EntityContact_Address_Id`) REFERENCES `StudentAttendanceCR_EntityContact_Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCR_EntityContact_Address_StatisticalArea`
--

LOCK TABLES `StudentAttendanceCR_EntityContact_Address_StatisticalArea` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact_Address_StatisticalArea` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact_Address_StatisticalArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCR_EntityContact_Name`
--

DROP TABLE IF EXISTS `StudentAttendanceCR_EntityContact_Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCR_EntityContact_Name` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceCR_EntityContact_Id` mediumint(9) NOT NULL,
  `NameType` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(200) DEFAULT NULL,
  `GivenName` varchar(200) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `FamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `PreferredFamilyNameFirst` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `Suffix` varchar(200) DEFAULT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Name_StudentAttendanceCREntityContact_IX` (`StudentAttendanceCR_EntityContact_Id`),
  CONSTRAINT `Name_StudentAttendanceCREntityContact_FK` FOREIGN KEY (`StudentAttendanceCR_EntityContact_Id`) REFERENCES `StudentAttendanceCR_EntityContact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCR_EntityContact_Name`
--

LOCK TABLES `StudentAttendanceCR_EntityContact_Name` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact_Name` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCR_EntityContact_Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCR_StatsCohortYearLevel`
--

DROP TABLE IF EXISTS `StudentAttendanceCR_StatsCohortYearLevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCR_StatsCohortYearLevel` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceCR_Id` mediumint(9) NOT NULL,
  `YearLevel` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `YearLevel_StudentAttendanceCR_IX` (`StudentAttendanceCR_Id`),
  CONSTRAINT `YearLevel_StudentAttendanceCR_FK` FOREIGN KEY (`StudentAttendanceCR_Id`) REFERENCES `StudentAttendanceCollectionReporting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCR_StatsCohortYearLevel`
--

LOCK TABLES `StudentAttendanceCR_StatsCohortYearLevel` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCR_StatsCohortYearLevel` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCR_StatsCohortYearLevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCR_YearLevel_StatsCohort`
--

DROP TABLE IF EXISTS `StudentAttendanceCR_YearLevel_StatsCohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCR_YearLevel_StatsCohort` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StatsCohortYearLevel_Id` mediumint(9) NOT NULL,
  `StatsCohortId` varchar(200) DEFAULT NULL,
  `StatsIndigenousStudentType` varchar(200) DEFAULT NULL,
  `CohortGender` varchar(200) DEFAULT NULL,
  `DaysInReferencePeriod` varchar(200) DEFAULT NULL,
  `PossibleSchoolDays` varchar(200) DEFAULT NULL,
  `AttendanceDays` varchar(200) DEFAULT NULL,
  `AttendanceLess90Percent` varchar(200) DEFAULT NULL,
  `AttendanceGTE90Percent` varchar(200) DEFAULT NULL,
  `PossibleSchoolDaysGT90PercentAttendance` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StatsCohort_YearLevel_IX` (`StatsCohortYearLevel_Id`),
  CONSTRAINT `StatsCohort_YearLevel_FK` FOREIGN KEY (`StatsCohortYearLevel_Id`) REFERENCES `StudentAttendanceCR_StatsCohortYearLevel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCR_YearLevel_StatsCohort`
--

LOCK TABLES `StudentAttendanceCR_YearLevel_StatsCohort` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCR_YearLevel_StatsCohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCR_YearLevel_StatsCohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCollection`
--

DROP TABLE IF EXISTS `StudentAttendanceCollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCollection` (
  `RefId` varchar(36) NOT NULL,
  `StudentAttendanceCollectionYear` varchar(200) DEFAULT NULL,
  `RoundCode` varchar(200) DEFAULT NULL,
  `ReportingAuthorityCommonwealthId` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareProduct` varchar(200) DEFAULT NULL,
  `SoftwareVendorInfo_SoftwareVersion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCollection`
--

LOCK TABLES `StudentAttendanceCollection` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCollectionReporting`
--

DROP TABLE IF EXISTS `StudentAttendanceCollectionReporting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCollectionReporting` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceCollection_RefId` varchar(36) NOT NULL,
  `EntityLevel` varchar(200) NOT NULL,
  `SchoolInfo_RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) NOT NULL,
  `StateProvinceId` varchar(200) NOT NULL,
  `CommonwealthId` varchar(200) NOT NULL,
  `AcaraId` varchar(200) NOT NULL,
  `EntityName` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `SACReporting_SACollection_IX` (`StudentAttendanceCollection_RefId`),
  CONSTRAINT `SACReporting_SACollection_FK` FOREIGN KEY (`StudentAttendanceCollection_RefId`) REFERENCES `StudentAttendanceCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCollectionReporting`
--

LOCK TABLES `StudentAttendanceCollectionReporting` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCollectionReporting` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCollectionReporting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceCollection_LocalCode`
--

DROP TABLE IF EXISTS `StudentAttendanceCollection_LocalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceCollection_LocalCode` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceCollection_RefId` varchar(36) NOT NULL,
  `LocalisedCode` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Element` varchar(200) DEFAULT NULL,
  `ListIndex` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocalCode_SACollection_IX` (`StudentAttendanceCollection_RefId`),
  CONSTRAINT `LocalCode_SACollection_FK` FOREIGN KEY (`StudentAttendanceCollection_RefId`) REFERENCES `StudentAttendanceCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceCollection_LocalCode`
--

LOCK TABLES `StudentAttendanceCollection_LocalCode` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceCollection_LocalCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceCollection_LocalCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceSummary`
--

DROP TABLE IF EXISTS `StudentAttendanceSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceSummary` (
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `StartDate` varchar(200) DEFAULT NULL,
  `EndDate` varchar(200) DEFAULT NULL,
  `RefId` varchar(36) DEFAULT NULL,
  `StartDay` varchar(200) DEFAULT NULL,
  `EndDay` varchar(200) DEFAULT NULL,
  `FTE` varchar(200) DEFAULT NULL,
  `DaysAttended` varchar(200) DEFAULT NULL,
  `ExcusedAbsences` varchar(200) DEFAULT NULL,
  `UnexcusedAbsences` varchar(200) DEFAULT NULL,
  `DaysTardy` varchar(200) DEFAULT NULL,
  `DaysInMembership` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `StudentAttendanceSummary_ibfk_1` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`),
  CONSTRAINT `StudentAttendanceSummary_ibfk_2` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceSummary`
--

LOCK TABLES `StudentAttendanceSummary` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceTimeList`
--

DROP TABLE IF EXISTS `StudentAttendanceTimeList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceTimeList` (
  `RefId` varchar(36) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(10) DEFAULT NULL,
  `AttendanceTimeListDate` varchar(100) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `StudentAttendanceTimeList_ibfk_1` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`),
  CONSTRAINT `StudentAttendanceTimeList_ibfk_2` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceTimeList`
--

LOCK TABLES `StudentAttendanceTimeList` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceTimeList` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceTimeList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceTimeList_AttendanceTime`
--

DROP TABLE IF EXISTS `StudentAttendanceTimeList_AttendanceTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceTimeList_AttendanceTime` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceTimeList_RefId` varchar(36) DEFAULT '',
  `AttendanceStatus` varchar(100) DEFAULT NULL,
  `StartTime` varchar(100) DEFAULT NULL,
  `EndTime` varchar(100) DEFAULT NULL,
  `AttendanceNote` varchar(100) DEFAULT NULL,
  `AttendanceType` varchar(200) DEFAULT NULL,
  `DurationValue` varchar(200) DEFAULT NULL,
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StudentAttendanceTimeList_RefId` (`StudentAttendanceTimeList_RefId`),
  KEY `TimeTableSubject_RefId` (`TimeTableSubject_RefId`),
  CONSTRAINT `StudentAttendanceTimeList_AttendanceTime_ibfk_1` FOREIGN KEY (`StudentAttendanceTimeList_RefId`) REFERENCES `StudentAttendanceTimeList` (`RefId`),
  CONSTRAINT `StudentAttendanceTimeList_AttendanceTime_ibfk_2` FOREIGN KEY (`TimeTableSubject_RefId`) REFERENCES `TimeTableSubject` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceTimeList_AttendanceTime`
--

LOCK TABLES `StudentAttendanceTimeList_AttendanceTime` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_AttendanceTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_AttendanceTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceTimeList_AttendanceTime_OtherCode`
--

DROP TABLE IF EXISTS `StudentAttendanceTimeList_AttendanceTime_OtherCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceTimeList_AttendanceTime_OtherCode` (
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceTimeList_AttendanceTime_id` mediumint(9) NOT NULL,
  `OtherCode` varchar(100) DEFAULT NULL,
  `OtherCode_CodeSet` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `StudentAttendanceTimeList_AttendanceTime_id` (`StudentAttendanceTimeList_AttendanceTime_id`),
  CONSTRAINT `StudentAttendanceTimeList_AttendanceTime_OtherCode_ibfk_1` FOREIGN KEY (`StudentAttendanceTimeList_AttendanceTime_id`) REFERENCES `StudentAttendanceTimeList_AttendanceTime` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceTimeList_AttendanceTime_OtherCode`
--

LOCK TABLES `StudentAttendanceTimeList_AttendanceTime_OtherCode` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_AttendanceTime_OtherCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_AttendanceTime_OtherCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceTimeList_PeriodAttendance`
--

DROP TABLE IF EXISTS `StudentAttendanceTimeList_PeriodAttendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceTimeList_PeriodAttendance` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceTimeList_RefId` varchar(36) DEFAULT NULL,
  `AttendanceType` varchar(200) DEFAULT NULL,
  `AttendanceCode` varchar(200) DEFAULT NULL,
  `AttendanceStatus` varchar(200) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL,
  `SessionInfo_RefId` varchar(36) DEFAULT NULL,
  `ScheduledActivity_RefId` varchar(36) DEFAULT NULL,
  `TimetablePeriod` varchar(200) DEFAULT NULL,
  `DayId` varchar(200) DEFAULT NULL,
  `StartTime` varchar(200) DEFAULT NULL,
  `EndTime` varchar(200) DEFAULT NULL,
  `TimeIn` varchar(200) DEFAULT NULL,
  `TimeOut` varchar(200) DEFAULT NULL,
  `TimeTableCell_RefId` varchar(36) DEFAULT NULL,
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  `AttendanceNote` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceTimeList_PeriodAttendance`
--

LOCK TABLES `StudentAttendanceTimeList_PeriodAttendance` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceTimeList_PeriodAttendance_OtherCode`
--

DROP TABLE IF EXISTS `StudentAttendanceTimeList_PeriodAttendance_OtherCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceTimeList_PeriodAttendance_OtherCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceTimeList_PeriodAttendance_Id` int(11) NOT NULL,
  `OtherCode` varchar(200) DEFAULT NULL,
  `CodeSet` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceTimeList_PeriodAttendance_OtherCode`
--

LOCK TABLES `StudentAttendanceTimeList_PeriodAttendance_OtherCode` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance_OtherCode` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance_OtherCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceTimeList_PeriodAttendance_RoomInfo`
--

DROP TABLE IF EXISTS `StudentAttendanceTimeList_PeriodAttendance_RoomInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceTimeList_PeriodAttendance_RoomInfo` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceTimeList_PeriodAttendance_id` mediumint(9) NOT NULL,
  `RoomInfo_RefId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceTimeList_PeriodAttendance_RoomInfo`
--

LOCK TABLES `StudentAttendanceTimeList_PeriodAttendance_RoomInfo` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance_RoomInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance_RoomInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentAttendanceTimeList_PeriodAttendance_TeacherCover`
--

DROP TABLE IF EXISTS `StudentAttendanceTimeList_PeriodAttendance_TeacherCover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentAttendanceTimeList_PeriodAttendance_TeacherCover` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceTimeList_PeriodAttendance_id` mediumint(9) NOT NULL,
  `StaffPersonal_RefId` varchar(36) DEFAULT NULL,
  `StaffLocalId` varchar(200) DEFAULT NULL,
  `StartTime` varchar(200) DEFAULT NULL,
  `FinishTime` varchar(200) DEFAULT NULL,
  `Credit` varchar(200) DEFAULT NULL,
  `Supervision` varchar(200) DEFAULT NULL,
  `Weighting` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentAttendanceTimeList_PeriodAttendance_TeacherCover`
--

LOCK TABLES `StudentAttendanceTimeList_PeriodAttendance_TeacherCover` WRITE;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance_TeacherCover` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentAttendanceTimeList_PeriodAttendance_TeacherCover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentContactPersonal`
--

DROP TABLE IF EXISTS `StudentContactPersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentContactPersonal` (
  `RefId` varchar(36) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(200) DEFAULT NULL,
  `GivenName` varchar(200) DEFAULT NULL,
  `PreferredGivenName` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(200) DEFAULT NULL,
  `MiddleName` varchar(200) DEFAULT NULL,
  `Sex` varchar(200) DEFAULT NULL,
  `PhoneNumberType` varchar(200) DEFAULT NULL,
  `PhoneNumber` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `EmailType` varchar(200) DEFAULT NULL,
  `SchoolEducationLevel` varchar(200) DEFAULT NULL,
  `NonSchoolEducation` varchar(200) DEFAULT NULL,
  `EmploymentType` varchar(200) DEFAULT NULL,
  `InterpreterRequired` varchar(20) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentContactPersonal`
--

LOCK TABLES `StudentContactPersonal` WRITE;
/*!40000 ALTER TABLE `StudentContactPersonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentContactPersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentContactRelationship`
--

DROP TABLE IF EXISTS `StudentContactRelationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentContactRelationship` (
  `RefId` varchar(36) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `StudentContactPersonal_RefId` varchar(36) DEFAULT NULL,
  `Relationship` varchar(200) DEFAULT NULL,
  `ParentLegalGuardian` varchar(200) DEFAULT NULL,
  `PickupRights` varchar(200) DEFAULT NULL,
  `LivesWith` varchar(200) DEFAULT NULL,
  `AccessToRecords` varchar(200) DEFAULT NULL,
  `EmergencyContact` varchar(200) DEFAULT NULL,
  `HasCustody` varchar(200) DEFAULT NULL,
  `DisciplinaryContact` varchar(200) DEFAULT NULL,
  `PrimaryCareProvider` varchar(200) DEFAULT NULL,
  `FeesBilling` varchar(200) DEFAULT NULL,
  `FamilyMail` varchar(200) DEFAULT NULL,
  `InterventionOrder` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  KEY `StudentContactPersonal_RefId` (`StudentContactPersonal_RefId`),
  CONSTRAINT `StudentContactRelationship_ibfk_1` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`),
  CONSTRAINT `StudentContactRelationship_ibfk_2` FOREIGN KEY (`StudentContactPersonal_RefId`) REFERENCES `StudentContactPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentContactRelationship`
--

LOCK TABLES `StudentContactRelationship` WRITE;
/*!40000 ALTER TABLE `StudentContactRelationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentContactRelationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentDailyAttendance`
--

DROP TABLE IF EXISTS `StudentDailyAttendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentDailyAttendance` (
  `RefId` varchar(36) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `CalendarDate` varchar(200) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `DayValue` varchar(200) DEFAULT NULL,
  `AttendanceCode` varchar(200) DEFAULT NULL,
  `AttendanceStatus` varchar(200) DEFAULT NULL,
  `TimeIn` varchar(200) DEFAULT NULL,
  `TimeOut` varchar(200) DEFAULT NULL,
  `AbsenceValue` varchar(200) DEFAULT NULL,
  `AttendanceNote` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `StudentDailyAttendance_ibfk_1` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`),
  CONSTRAINT `StudentDailyAttendance_ibfk_2` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentDailyAttendance`
--

LOCK TABLES `StudentDailyAttendance` WRITE;
/*!40000 ALTER TABLE `StudentDailyAttendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentDailyAttendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentPeriodAttendance`
--

DROP TABLE IF EXISTS `StudentPeriodAttendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentPeriodAttendance` (
  `RefId` varchar(36) DEFAULT '',
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `CalendarDate` varchar(200) DEFAULT NULL,
  `SessionInfo_RefId` varchar(36) DEFAULT NULL,
  `TimetablePeriod` varchar(200) DEFAULT NULL,
  `TimeIn` varchar(200) DEFAULT NULL,
  `TimeOut` varchar(200) DEFAULT NULL,
  `AttendanceCode` varchar(200) DEFAULT NULL,
  `AttendanceStatus` varchar(200) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `CreationUser_Type` varchar(200) DEFAULT NULL,
  `AuditInfo_CreationUser_UserId` varchar(200) DEFAULT NULL,
  `AuditInfo_CreationDateTime` varchar(200) DEFAULT NULL,
  `AttendanceComment` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `StudentPeriodAttendance_ibfk_1_idx` (`StudentPersonal_RefId`),
  KEY `StudentPeriodAttendance_ibfk_2_idx` (`SchoolInfo_RefId`),
  KEY `StudentPeriodAttendance_ibfk_3_idx` (`SessionInfo_RefId`),
  CONSTRAINT `StudentPeriodAttendance_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`),
  CONSTRAINT `StudentPeriodAttendance_ibfk_2` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`),
  CONSTRAINT `StudentPeriodAttendance_ibfk_3` FOREIGN KEY (`SessionInfo_RefId`) REFERENCES `SessionInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentPeriodAttendance`
--

LOCK TABLES `StudentPeriodAttendance` WRITE;
/*!40000 ALTER TABLE `StudentPeriodAttendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentPeriodAttendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentPersonal`
--

DROP TABLE IF EXISTS `StudentPersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentPersonal` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `FamilyName` varchar(2000) DEFAULT NULL,
  `GivenName` varchar(2000) DEFAULT NULL,
  `MiddleName` varchar(2000) DEFAULT NULL,
  `FullName` varchar(2000) DEFAULT NULL,
  `PreferredGivenName` varchar(2000) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `YearLevel` varchar(100) DEFAULT NULL,
  `StateProvinceId` varchar(200) DEFAULT NULL,
  `Sex` varchar(200) DEFAULT NULL,
  `BirthDate` varchar(200) DEFAULT NULL,
  `IndigenousStatus` varchar(200) DEFAULT NULL,
  `CountryofBirth` varchar(200) DEFAULT NULL,
  `MostRecent_YearLevel` varchar(100) DEFAULT NULL,
  `MostRecent_Parent1Language` varchar(200) DEFAULT NULL,
  `MostRecent_Parent2Language` varchar(200) DEFAULT NULL,
  `MostRecent_Parent1SchoolEducation` varchar(200) DEFAULT NULL,
  `MostRecent_Parent2SchoolEducation` varchar(200) DEFAULT NULL,
  `MostRecent_Parent1NonSchoolEducation` varchar(200) DEFAULT NULL,
  `MostRecent_Parent2NonSchoolEducation` varchar(200) DEFAULT NULL,
  `MostRecent_Parent1EmploymentType` varchar(200) DEFAULT NULL,
  `MostRecent_Parent2EmploymentType` varchar(200) DEFAULT NULL,
  `LBOTE` varchar(200) DEFAULT NULL,
  `MostRecent_SchoolLocalId` varchar(200) DEFAULT NULL,
  `MostRecent_SchoolACARAId` varchar(200) DEFAULT NULL,
  `MostRecent_SchoolCampusId` varchar(200) DEFAULT NULL,
  `MostRecent_HomeroomLocalId` varchar(200) DEFAULT NULL,
  `MostRecent_FTE` varchar(200) DEFAULT NULL,
  `MostRecent_Homegroup` varchar(200) DEFAULT NULL,
  `MostRecent_ClassCode` varchar(200) DEFAULT NULL,
  `MostRecent_MembershipType` varchar(200) DEFAULT NULL,
  `MostRecent_OtherEnrollmentSchoolACARAId` varchar(200) DEFAULT NULL,
  `MostRecent_FFPOS` varchar(200) DEFAULT NULL,
  `MostRecent_ReportingSchool` varchar(200) DEFAULT NULL,
  `MostRecent_OtherSchoolName` varchar(200) DEFAULT NULL,
  `MostRecent_DisabilityLevelOfAdjustment` varchar(200) DEFAULT NULL,
  `MostRecent_DisabilityCategory` varchar(200) DEFAULT NULL,
  `MostRecent_CensusAge` varchar(200) DEFAULT NULL,
  `MostRecent_DistanceEducationStudent` varchar(200) DEFAULT NULL,
  `MostRecent_BoardingStatus` varchar(200) DEFAULT NULL,
  `EducationSupport` varchar(200) DEFAULT NULL,
  `HomeSchooledStudent` varchar(200) DEFAULT NULL,
  `SensitiveData` varchar(200) DEFAULT NULL,
  `ESL` varchar(200) DEFAULT NULL,
  `MostRecent_TestLevel` varchar(200) DEFAULT NULL,
  `OfflineDelivery` varchar(200) DEFAULT NULL,
  `PhoneNumber` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `OtherId` varchar(200) DEFAULT NULL,
  `OtherIdType` varchar(200) DEFAULT NULL,
  `Religion` varchar(200) DEFAULT NULL,
  `PreferredFamilyName` varchar(2000) DEFAULT NULL,
  `ESLSupport` varchar(20) DEFAULT NULL,
  `InterpreterRequired` varchar(20) DEFAULT NULL,
  `PrePrimaryEducation` varchar(200) DEFAULT NULL,
  `PrePrimaryEducationHours` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `StudentPersonal_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentPersonal`
--

LOCK TABLES `StudentPersonal` WRITE;
/*!40000 ALTER TABLE `StudentPersonal` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentPersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentPersonal_OtherId`
--

DROP TABLE IF EXISTS `StudentPersonal_OtherId`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentPersonal_OtherId` (
  `Id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `OtherId` varchar(200) DEFAULT NULL,
  `OtherIdType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  CONSTRAINT `StudentPersonal_OtherId_ibfk_1` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentPersonal_OtherId`
--

LOCK TABLES `StudentPersonal_OtherId` WRITE;
/*!40000 ALTER TABLE `StudentPersonal_OtherId` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentPersonal_OtherId` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentSchoolEnrollment`
--

DROP TABLE IF EXISTS `StudentSchoolEnrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentSchoolEnrollment` (
  `RefId` varchar(36) NOT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `MembershipType` varchar(10) DEFAULT NULL,
  `SchoolYear` varchar(10) DEFAULT NULL,
  `TimeFrame` varchar(10) DEFAULT NULL,
  `YearLevel` varchar(10) DEFAULT NULL,
  `FTE` varchar(5) DEFAULT NULL,
  `EntryDate` varchar(25) DEFAULT NULL,
  `ExitDate` varchar(25) DEFAULT NULL,
  `RecordClosureReason` varchar(200) DEFAULT NULL,
  `PromotionStatus` varchar(200) DEFAULT NULL,
  `ClassCode` varchar(200) DEFAULT NULL,
  `ReportingSchool` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `EntryType` varchar(200) DEFAULT NULL,
  `Homeroom_RefId` varchar(36) DEFAULT NULL,
  `Advisor_RefId` varchar(36) DEFAULT NULL,
  `Counselor_RefId` varchar(36) DEFAULT NULL,
  `Homegroup` varchar(200) DEFAULT NULL,
  `AcaraSchoolId` varchar(200) DEFAULT NULL,
  `TestLevel` varchar(200) DEFAULT NULL,
  `House` varchar(200) DEFAULT NULL,
  `IndividualLearningPlan` varchar(20) DEFAULT NULL,
  `Calendar_RefId` varchar(36) DEFAULT NULL,
  `ExitStatus` varchar(20) DEFAULT NULL,
  `ExitType` varchar(20) DEFAULT NULL,
  `FTPTStatus` varchar(20) DEFAULT NULL,
  `FFPOS` varchar(20) DEFAULT NULL,
  `CatchmentStatus` varchar(20) DEFAULT NULL,
  `PreviousSchool` varchar(200) DEFAULT NULL,
  `PreviousSchoolName` varchar(200) DEFAULT NULL,
  `DestinationSchool` varchar(200) DEFAULT NULL,
  `DestinationSchoolName` varchar(200) DEFAULT NULL,
  `StartedAtSchoolDate` varchar(25) DEFAULT NULL,
  `InternationalStudent` varchar(20) DEFAULT NULL,
  `DisabilityLevelOfAdjustment` varchar(20) DEFAULT NULL,
  `DisabilityCategory` varchar(20) DEFAULT NULL,
  `CensusAge` varchar(20) DEFAULT NULL,
  `DistanceEducationStudent` varchar(20) DEFAULT NULL,
  `BoardingStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RefId`),
  KEY `StudentSchoolEnrollment_StudentPersonal_RefId_IX` (`StudentPersonal_RefId`),
  KEY `StudentSchoolEnrollment_SchoolInfo_RefId_IX` (`SchoolInfo_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentSchoolEnrollment`
--

LOCK TABLES `StudentSchoolEnrollment` WRITE;
/*!40000 ALTER TABLE `StudentSchoolEnrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentSchoolEnrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentSchoolEnrollment_PublishingPermission`
--

DROP TABLE IF EXISTS `StudentSchoolEnrollment_PublishingPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentSchoolEnrollment_PublishingPermission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentSchoolEnrollment_RefId` varchar(36) NOT NULL,
  `PermissionCategory` varchar(200) DEFAULT NULL,
  `PermissionValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SSE_PublishingPermission_IX` (`StudentSchoolEnrollment_RefId`),
  CONSTRAINT `SSE_PublishingPermission_FK` FOREIGN KEY (`StudentSchoolEnrollment_RefId`) REFERENCES `StudentSchoolEnrollment` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentSchoolEnrollment_PublishingPermission`
--

LOCK TABLES `StudentSchoolEnrollment_PublishingPermission` WRITE;
/*!40000 ALTER TABLE `StudentSchoolEnrollment_PublishingPermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentSchoolEnrollment_PublishingPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentSchoolEnrollment_StudentGroup`
--

DROP TABLE IF EXISTS `StudentSchoolEnrollment_StudentGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentSchoolEnrollment_StudentGroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentSchoolEnrollment_RefId` varchar(36) NOT NULL,
  `GroupCategory` varchar(200) DEFAULT NULL,
  `GroupLocalId` varchar(200) DEFAULT NULL,
  `GroupDescription` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SSE_StudentGroup_IX` (`StudentSchoolEnrollment_RefId`),
  CONSTRAINT `SSE_StudentGroup_FK` FOREIGN KEY (`StudentSchoolEnrollment_RefId`) REFERENCES `StudentSchoolEnrollment` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentSchoolEnrollment_StudentGroup`
--

LOCK TABLES `StudentSchoolEnrollment_StudentGroup` WRITE;
/*!40000 ALTER TABLE `StudentSchoolEnrollment_StudentGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentSchoolEnrollment_StudentGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentSchoolEnrollment_StudentSubjectChoice`
--

DROP TABLE IF EXISTS `StudentSchoolEnrollment_StudentSubjectChoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentSchoolEnrollment_StudentSubjectChoice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentSchoolEnrollment_RefId` varchar(36) NOT NULL,
  `PreferenceNumber` varchar(200) DEFAULT NULL,
  `SubjectLocalId` varchar(200) DEFAULT NULL,
  `StudyDescription` varchar(200) DEFAULT NULL,
  `OtherSchoolLocalId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SSE_StudentSubjectChoice_PKX` (`ID`),
  KEY `SSE_StudentSubjectChoice_IX` (`StudentSchoolEnrollment_RefId`),
  CONSTRAINT `SSE_StudentSubjectChoice_FK` FOREIGN KEY (`StudentSchoolEnrollment_RefId`) REFERENCES `StudentSchoolEnrollment` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentSchoolEnrollment_StudentSubjectChoice`
--

LOCK TABLES `StudentSchoolEnrollment_StudentSubjectChoice` WRITE;
/*!40000 ALTER TABLE `StudentSchoolEnrollment_StudentSubjectChoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentSchoolEnrollment_StudentSubjectChoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentScoreJAS_LearningStandard`
--

DROP TABLE IF EXISTS `StudentScoreJAS_LearningStandard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentScoreJAS_LearningStandard` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `StudentScoreJudgementAgainstStandard_RefId` varchar(36) NOT NULL,
  `LearningStandardItem_RefId` varchar(36) DEFAULT NULL,
  `LearningStandardURL` varchar(256) DEFAULT NULL,
  `LearningStandardLocalId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `StudentScoreJudgementAgainstStandard_IX` (`StudentScoreJudgementAgainstStandard_RefId`),
  CONSTRAINT `StudentScoreJudgementAgainstStandard_FK` FOREIGN KEY (`StudentScoreJudgementAgainstStandard_RefId`) REFERENCES `StudentScoreJudgementAgainstStandard` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentScoreJAS_LearningStandard`
--

LOCK TABLES `StudentScoreJAS_LearningStandard` WRITE;
/*!40000 ALTER TABLE `StudentScoreJAS_LearningStandard` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentScoreJAS_LearningStandard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentScoreJudgementAgainstStandard`
--

DROP TABLE IF EXISTS `StudentScoreJudgementAgainstStandard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentScoreJudgementAgainstStandard` (
  `RefId` varchar(36) NOT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `TermInfo_RefId` varchar(36) DEFAULT NULL,
  `LocalTermCode` varchar(200) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `StudentStateProvinceId` varchar(200) DEFAULT NULL,
  `StudentLocalId` varchar(200) DEFAULT NULL,
  `YearLevel` varchar(200) DEFAULT NULL,
  `TeachingGroup_RefId` varchar(36) DEFAULT NULL,
  `ClassLocalId` varchar(200) DEFAULT NULL,
  `StaffPersonal_RefId` varchar(36) DEFAULT NULL,
  `StaffLocalId` varchar(200) DEFAULT NULL,
  `CurriculumCode` varchar(200) DEFAULT NULL,
  `CurriculumNodeCode` varchar(200) DEFAULT NULL,
  `Score` varchar(200) DEFAULT NULL,
  `SpecialCircumstanceLocalCode` varchar(200) DEFAULT NULL,
  `ManagedPathwayLocalCode` varchar(200) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolLocalId` varchar(200) DEFAULT NULL,
  `SchoolCommonwealthId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentScoreJudgementAgainstStandard`
--

LOCK TABLES `StudentScoreJudgementAgainstStandard` WRITE;
/*!40000 ALTER TABLE `StudentScoreJudgementAgainstStandard` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentScoreJudgementAgainstStandard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeachingGroup`
--

DROP TABLE IF EXISTS `TeachingGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeachingGroup` (
  `RefId` varchar(36) DEFAULT NULL,
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  `ShortName` varchar(200) DEFAULT NULL,
  `LongName` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `KLA` varchar(100) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `TeachingGroup_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeachingGroup`
--

LOCK TABLES `TeachingGroup` WRITE;
/*!40000 ALTER TABLE `TeachingGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `TeachingGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeachingGroup_Student`
--

DROP TABLE IF EXISTS `TeachingGroup_Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeachingGroup_Student` (
  `TeachingGroup_RefId` varchar(36) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  KEY `TeachingGroup_RefId` (`TeachingGroup_RefId`),
  KEY `StudentPersonal_RefId` (`StudentPersonal_RefId`),
  CONSTRAINT `TeachingGroup_Student_ibfk_1` FOREIGN KEY (`TeachingGroup_RefId`) REFERENCES `TeachingGroup` (`RefId`),
  CONSTRAINT `TeachingGroup_Student_ibfk_2` FOREIGN KEY (`StudentPersonal_RefId`) REFERENCES `StudentPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeachingGroup_Student`
--

LOCK TABLES `TeachingGroup_Student` WRITE;
/*!40000 ALTER TABLE `TeachingGroup_Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `TeachingGroup_Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeachingGroup_Teacher`
--

DROP TABLE IF EXISTS `TeachingGroup_Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeachingGroup_Teacher` (
  `TeachingGroup_RefId` varchar(36) DEFAULT NULL,
  `StaffPersonal_RefId` varchar(36) DEFAULT NULL,
  `TeacherAssociation` varchar(100) DEFAULT NULL,
  `TeacherLocalId` varchar(100) DEFAULT NULL,
  KEY `TeachingGroup_RefId` (`TeachingGroup_RefId`),
  KEY `StaffPersonal_RefId` (`StaffPersonal_RefId`),
  CONSTRAINT `TeachingGroup_Teacher_ibfk_1` FOREIGN KEY (`TeachingGroup_RefId`) REFERENCES `TeachingGroup` (`RefId`),
  CONSTRAINT `TeachingGroup_Teacher_ibfk_2` FOREIGN KEY (`StaffPersonal_RefId`) REFERENCES `StaffPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeachingGroup_Teacher`
--

LOCK TABLES `TeachingGroup_Teacher` WRITE;
/*!40000 ALTER TABLE `TeachingGroup_Teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `TeachingGroup_Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TermInfo`
--

DROP TABLE IF EXISTS `TermInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TermInfo` (
  `RefId` varchar(36) NOT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `StartDate` varchar(200) DEFAULT NULL,
  `EndDate` varchar(200) DEFAULT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `RelativeDuration` varchar(200) DEFAULT NULL,
  `TermCode` varchar(200) DEFAULT NULL,
  `Track` varchar(200) DEFAULT NULL,
  `TermSpan` varchar(200) DEFAULT NULL,
  `MarkingTerm` varchar(200) DEFAULT NULL,
  `SchedulingTerm` varchar(200) DEFAULT NULL,
  `AttendanceTerm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TermInfo`
--

LOCK TABLES `TermInfo` WRITE;
/*!40000 ALTER TABLE `TermInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `TermInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeTable`
--

DROP TABLE IF EXISTS `TimeTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimeTable` (
  `RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `DaysPerCycle` varchar(200) DEFAULT NULL,
  `PeriodsPerCycle` varchar(200) DEFAULT NULL,
  `TimeTableCreationDate` varchar(100) DEFAULT NULL,
  `StartDate` varchar(100) DEFAULT NULL,
  `EndDate` varchar(100) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `TimeTable_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeTable`
--

LOCK TABLES `TimeTable` WRITE;
/*!40000 ALTER TABLE `TimeTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeTableCell`
--

DROP TABLE IF EXISTS `TimeTableCell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimeTableCell` (
  `RefId` varchar(36) DEFAULT NULL,
  `TimeTable_RefId` varchar(36) DEFAULT NULL,
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  `TeachingGroup_RefId` varchar(36) DEFAULT NULL,
  `RoomInfo_RefId` varchar(36) DEFAULT NULL,
  `CellType` varchar(200) DEFAULT NULL,
  `PeriodId` varchar(200) DEFAULT NULL,
  `DayId` varchar(200) DEFAULT NULL,
  `StaffPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_LocalId` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `TimeTable_RefId` (`TimeTable_RefId`),
  KEY `TimeTableSubject_RefId` (`TimeTableSubject_RefId`),
  KEY `TeachingGroup_RefId` (`TeachingGroup_RefId`),
  KEY `RoomInfo_RefId` (`RoomInfo_RefId`),
  KEY `StaffPersonal_RefId` (`StaffPersonal_RefId`),
  CONSTRAINT `TimeTableCell_ibfk_1` FOREIGN KEY (`TimeTable_RefId`) REFERENCES `TimeTable` (`RefId`),
  CONSTRAINT `TimeTableCell_ibfk_2` FOREIGN KEY (`TimeTableSubject_RefId`) REFERENCES `TimeTableSubject` (`RefId`),
  CONSTRAINT `TimeTableCell_ibfk_3` FOREIGN KEY (`TeachingGroup_RefId`) REFERENCES `TeachingGroup` (`RefId`),
  CONSTRAINT `TimeTableCell_ibfk_4` FOREIGN KEY (`RoomInfo_RefId`) REFERENCES `RoomInfo` (`RefId`),
  CONSTRAINT `TimeTableCell_ibfk_5` FOREIGN KEY (`StaffPersonal_RefId`) REFERENCES `StaffPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeTableCell`
--

LOCK TABLES `TimeTableCell` WRITE;
/*!40000 ALTER TABLE `TimeTableCell` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeTableCell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeTableCell_TeacherCover`
--

DROP TABLE IF EXISTS `TimeTableCell_TeacherCover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimeTableCell_TeacherCover` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `TimeTableCell_RefId` varchar(36) NOT NULL,
  `StaffPersonal_RefId` varchar(36) NOT NULL,
  `StaffLocalId` varchar(200) DEFAULT NULL,
  `StartTime` varchar(200) DEFAULT NULL,
  `FinishTime` varchar(200) DEFAULT NULL,
  `Credit` varchar(200) DEFAULT NULL,
  `Supervision` varchar(200) DEFAULT NULL,
  `Weighting` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeTableCell_TeacherCover`
--

LOCK TABLES `TimeTableCell_TeacherCover` WRITE;
/*!40000 ALTER TABLE `TimeTableCell_TeacherCover` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeTableCell_TeacherCover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeTableSubject`
--

DROP TABLE IF EXISTS `TimeTableSubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimeTableSubject` (
  `RefId` varchar(36) DEFAULT NULL,
  `SubjectLocalId` varchar(200) DEFAULT NULL,
  `AcademicYear` varchar(36) DEFAULT NULL,
  `Faculty` varchar(200) DEFAULT NULL,
  `SubjectShortName` varchar(200) DEFAULT NULL,
  `SubjectLongName` varchar(200) DEFAULT NULL,
  `SubjectType` varchar(200) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `ProposedMinClassSize` varchar(100) DEFAULT NULL,
  `ProposedMaxClassSize` varchar(100) DEFAULT NULL,
  `Semester` varchar(100) DEFAULT NULL,
  `SchoolYear` varchar(100) DEFAULT NULL,
  `academicYearStart` varchar(200) DEFAULT NULL,
  `academicYearEnd` varchar(200) DEFAULT NULL,
  UNIQUE KEY `RefId` (`RefId`),
  KEY `SchoolInfo_RefId` (`SchoolInfo_RefId`),
  CONSTRAINT `TimeTableSubject_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeTableSubject`
--

LOCK TABLES `TimeTableSubject` WRITE;
/*!40000 ALTER TABLE `TimeTableSubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeTableSubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeTableSubject_OtherCodeList`
--

DROP TABLE IF EXISTS `TimeTableSubject_OtherCodeList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimeTableSubject_OtherCodeList` (
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  `OtherCode` varchar(100) DEFAULT NULL,
  `OtherCode_CodeSet` varchar(100) DEFAULT NULL,
  KEY `TimeTableSubject_RefId` (`TimeTableSubject_RefId`),
  CONSTRAINT `TimeTableSubject_OtherCodeList_ibfk_1` FOREIGN KEY (`TimeTableSubject_RefId`) REFERENCES `TimeTableSubject` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeTableSubject_OtherCodeList`
--

LOCK TABLES `TimeTableSubject_OtherCodeList` WRITE;
/*!40000 ALTER TABLE `TimeTableSubject_OtherCodeList` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeTableSubject_OtherCodeList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeTable_Day`
--

DROP TABLE IF EXISTS `TimeTable_Day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimeTable_Day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TimeTable_RefId` varchar(36) NOT NULL,
  `DayId` varchar(200) NOT NULL,
  `DayTitle` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TimeTable_RefId` (`TimeTable_RefId`),
  CONSTRAINT `TimeTable_Day_ibfk_1` FOREIGN KEY (`TimeTable_RefId`) REFERENCES `TimeTable` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeTable_Day`
--

LOCK TABLES `TimeTable_Day` WRITE;
/*!40000 ALTER TABLE `TimeTable_Day` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeTable_Day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeTable_Period`
--

DROP TABLE IF EXISTS `TimeTable_Period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TimeTable_Period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TimeTable_Day_Id` int(11) NOT NULL,
  `TimeTable_RefId` varchar(36) NOT NULL,
  `DayId` varchar(200) NOT NULL,
  `PeriodId` varchar(200) NOT NULL,
  `PeriodTitle` varchar(200) NOT NULL,
  `BellPeriod` varchar(100) DEFAULT NULL,
  `StartTime` varchar(100) DEFAULT NULL,
  `EndTime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TimeTable_Day_Id` (`TimeTable_Day_Id`),
  CONSTRAINT `TimeTable_Period_ibfk_1` FOREIGN KEY (`TimeTable_Day_Id`) REFERENCES `TimeTable_Day` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeTable_Period`
--

LOCK TABLES `TimeTable_Period` WRITE;
/*!40000 ALTER TABLE `TimeTable_Period` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeTable_Period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VendorInfo`
--

DROP TABLE IF EXISTS `VendorInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VendorInfo` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `ContactInfo_FamilyName` varchar(200) DEFAULT NULL,
  `ContactInfo_GivenName` varchar(200) DEFAULT NULL,
  `ContactInfo_MiddleName` varchar(200) DEFAULT NULL,
  `ContactInfo_PositionTitle` varchar(200) DEFAULT NULL,
  `ContactInfo_Role` varchar(200) DEFAULT NULL,
  `ContactInfo_Email` varchar(200) DEFAULT NULL,
  `ContactInfo_PhoneNumber` varchar(200) DEFAULT NULL,
  `CustomerId` varchar(200) DEFAULT NULL,
  `ABN` varchar(200) DEFAULT NULL,
  `RegisteredForGST` varchar(200) DEFAULT NULL,
  `PaymentTerms` varchar(200) DEFAULT NULL,
  `BPay` varchar(200) DEFAULT NULL,
  `BSB` varchar(200) DEFAULT NULL,
  `AccountNumber` varchar(200) DEFAULT NULL,
  `AccountName` varchar(200) DEFAULT NULL,
  `ContactInfo_Qualifications` varchar(200) DEFAULT NULL,
  `ContactInfo_RegistrationDetails` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VendorInfo`
--

LOCK TABLES `VendorInfo` WRITE;
/*!40000 ALTER TABLE `VendorInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `VendorInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingAlert`
--

DROP TABLE IF EXISTS `WellbeingAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingAlert` (
  `RefId` varchar(36) NOT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL,
  `WellbeingAlertStartDate` varchar(200) DEFAULT NULL,
  `WellbeingAlertEndDate` varchar(200) DEFAULT NULL,
  `WellbeingAlertCategory` varchar(200) DEFAULT NULL,
  `WellbeingAlertDescription` varchar(200) DEFAULT NULL,
  `EnrolmentRestricted` varchar(200) DEFAULT NULL,
  `AlertAudience` varchar(200) DEFAULT NULL,
  `AlertSeverity` varchar(200) DEFAULT NULL,
  `AlertKeyContact` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingAlert`
--

LOCK TABLES `WellbeingAlert` WRITE;
/*!40000 ALTER TABLE `WellbeingAlert` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingAlert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingAppeal`
--

DROP TABLE IF EXISTS `WellbeingAppeal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingAppeal` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `WellbeingResponse_RefId` varchar(36) DEFAULT NULL,
  `LocalAppealId` varchar(200) DEFAULT NULL,
  `AppealStatusCode` varchar(200) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL,
  `AppealNotes` varchar(1000) DEFAULT NULL,
  `AppealOutcome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingAppeal`
--

LOCK TABLES `WellbeingAppeal` WRITE;
/*!40000 ALTER TABLE `WellbeingAppeal` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingAppeal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingAppeal_Document`
--

DROP TABLE IF EXISTS `WellbeingAppeal_Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingAppeal_Document` (
  `WellbeingAppeal_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(200) DEFAULT NULL,
  `Sensitivity` varchar(200) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `DocumentType` varchar(200) DEFAULT NULL,
  `DocumentReviewDate` varchar(200) DEFAULT NULL,
  `DocumentDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingAppeal_Document`
--

LOCK TABLES `WellbeingAppeal_Document` WRITE;
/*!40000 ALTER TABLE `WellbeingAppeal_Document` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingAppeal_Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingCharacteristic`
--

DROP TABLE IF EXISTS `WellbeingCharacteristic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingCharacteristic` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `WellbeingCharacteristicClassification` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicStartDate` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicEndDate` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicReviewDate` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicNotes` varchar(1000) DEFAULT NULL,
  `WellbeingCharacteristicCategory` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicSubcategory` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicLocalCharacteristicCode` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicCharacteristicSeverity` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicDailyManagement` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicEmergencyManagement` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicEmergencyResponsePlan` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicTrigger` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicConfidentialFlag` varchar(200) DEFAULT NULL,
  `WellbeingCharacteristicAlert` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingCharacteristic`
--

LOCK TABLES `WellbeingCharacteristic` WRITE;
/*!40000 ALTER TABLE `WellbeingCharacteristic` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingCharacteristic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingCharacteristic_Document`
--

DROP TABLE IF EXISTS `WellbeingCharacteristic_Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingCharacteristic_Document` (
  `WellbeingCharacteristic_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(200) DEFAULT NULL,
  `Sensitivity` varchar(200) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `DocumentType` varchar(200) DEFAULT NULL,
  `DocumentReviewDate` varchar(200) DEFAULT NULL,
  `DocumentDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingCharacteristic_Document`
--

LOCK TABLES `WellbeingCharacteristic_Document` WRITE;
/*!40000 ALTER TABLE `WellbeingCharacteristic_Document` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingCharacteristic_Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingCharacteristic_Medication`
--

DROP TABLE IF EXISTS `WellbeingCharacteristic_Medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingCharacteristic_Medication` (
  `WellbeingCharacteristic_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MedicationName` varchar(200) DEFAULT NULL,
  `Dosage` varchar(200) DEFAULT NULL,
  `Frequency` varchar(200) DEFAULT NULL,
  `AdministrationInformation` varchar(200) DEFAULT NULL,
  `Method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingCharacteristic_Medication`
--

LOCK TABLES `WellbeingCharacteristic_Medication` WRITE;
/*!40000 ALTER TABLE `WellbeingCharacteristic_Medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingCharacteristic_Medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingCharacteristic_Symptom`
--

DROP TABLE IF EXISTS `WellbeingCharacteristic_Symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingCharacteristic_Symptom` (
  `WellbeingCharacteristic_RefId` varchar(36) NOT NULL,
  `Symptom` varchar(200) NOT NULL,
  PRIMARY KEY (`WellbeingCharacteristic_RefId`,`Symptom`),
  KEY `WC_Symptom_FKX` (`WellbeingCharacteristic_RefId`),
  CONSTRAINT `WC_Symptom_FK` FOREIGN KEY (`WellbeingCharacteristic_RefId`) REFERENCES `WellbeingCharacteristic` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingCharacteristic_Symptom`
--

LOCK TABLES `WellbeingCharacteristic_Symptom` WRITE;
/*!40000 ALTER TABLE `WellbeingCharacteristic_Symptom` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingCharacteristic_Symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingEvent`
--

DROP TABLE IF EXISTS `WellbeingEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingEvent` (
  `RefId` varchar(36) NOT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `EventId` varchar(200) DEFAULT NULL,
  `WellbeingEventNotes` varchar(1000) DEFAULT NULL,
  `WellbeingEventCategoryClass` varchar(200) DEFAULT NULL,
  `ReportingStaffRefId` varchar(36) DEFAULT NULL,
  `WellbeingEventCreationTimeStamp` varchar(200) DEFAULT NULL,
  `WellbeingEventDate` varchar(200) DEFAULT NULL,
  `WellbeingEventTime` varchar(200) DEFAULT NULL,
  `WellbeingEventDescription` varchar(200) DEFAULT NULL,
  `WellbeingEventTimePeriod` varchar(200) DEFAULT NULL,
  `WellbeingEventLocationDetails_EventLocation` varchar(200) DEFAULT NULL,
  `WellbeingEventLocationDetails_Class` varchar(200) DEFAULT NULL,
  `WellbeingEventLocationDetails_FurtherLocationNotes` varchar(1000) DEFAULT NULL,
  `ConfidentialFlag` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `GroupIndicator` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingEvent`
--

LOCK TABLES `WellbeingEvent` WRITE;
/*!40000 ALTER TABLE `WellbeingEvent` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingEvent_Category`
--

DROP TABLE IF EXISTS `WellbeingEvent_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingEvent_Category` (
  `WellbeingEvent_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EventCategory` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingEvent_Category_IX` (`WellbeingEvent_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingEvent_Category`
--

LOCK TABLES `WellbeingEvent_Category` WRITE;
/*!40000 ALTER TABLE `WellbeingEvent_Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingEvent_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingEvent_Document`
--

DROP TABLE IF EXISTS `WellbeingEvent_Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingEvent_Document` (
  `WellbeingEvent_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(200) DEFAULT NULL,
  `Sensitivity` varchar(200) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `DocumentType` varchar(200) DEFAULT NULL,
  `DocumentReviewDate` varchar(200) DEFAULT NULL,
  `DocumentDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingEvent_Document_IX` (`WellbeingEvent_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingEvent_Document`
--

LOCK TABLES `WellbeingEvent_Document` WRITE;
/*!40000 ALTER TABLE `WellbeingEvent_Document` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingEvent_Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingEvent_FollowupAction`
--

DROP TABLE IF EXISTS `WellbeingEvent_FollowupAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingEvent_FollowupAction` (
  `WellbeingEvent_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WellbeingResponse_RefId` varchar(36) DEFAULT NULL,
  `FollowUpDetails` varchar(1000) DEFAULT NULL,
  `FollowUpActionCategory` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingEvent_FollowupAction_IX` (`WellbeingEvent_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingEvent_FollowupAction`
--

LOCK TABLES `WellbeingEvent_FollowupAction` WRITE;
/*!40000 ALTER TABLE `WellbeingEvent_FollowupAction` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingEvent_FollowupAction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingEvent_PersonInvolvement`
--

DROP TABLE IF EXISTS `WellbeingEvent_PersonInvolvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingEvent_PersonInvolvement` (
  `WellbeingEvent_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PersonRefId` varchar(36) DEFAULT NULL,
  `PersonRefId_SIF_RefObject` varchar(200) DEFAULT NULL,
  `ShortName` varchar(200) DEFAULT NULL,
  `HowInvolved` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingEvent_PersonInvolvement_IX` (`WellbeingEvent_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingEvent_PersonInvolvement`
--

LOCK TABLES `WellbeingEvent_PersonInvolvement` WRITE;
/*!40000 ALTER TABLE `WellbeingEvent_PersonInvolvement` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingEvent_PersonInvolvement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingEvent_Subcategory`
--

DROP TABLE IF EXISTS `WellbeingEvent_Subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingEvent_Subcategory` (
  `WellbeingEvent_RefId` varchar(36) NOT NULL,
  `WellbeingEvent_CategoryId` int(11) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EventCategory` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingEvent_Subcategory_IX` (`WellbeingEvent_RefId`),
  KEY `WellbeingEvent_Subcategory_Category_IX` (`WellbeingEvent_CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingEvent_Subcategory`
--

LOCK TABLES `WellbeingEvent_Subcategory` WRITE;
/*!40000 ALTER TABLE `WellbeingEvent_Subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingEvent_Subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingPersonLink`
--

DROP TABLE IF EXISTS `WellbeingPersonLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingPersonLink` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `WellbeingEvent_RefId` varchar(36) DEFAULT NULL,
  `WellbeingResponse_RefId` varchar(36) DEFAULT NULL,
  `GroupId` varchar(200) DEFAULT NULL,
  `Person_RefId` varchar(36) DEFAULT NULL,
  `Person_RefId_SIF_RefObject` varchar(200) DEFAULT NULL,
  `ShortName` varchar(200) DEFAULT NULL,
  `HowInvolved` varchar(200) DEFAULT NULL,
  `OtherPersonId` varchar(200) DEFAULT NULL,
  `OtherPersonContactDetails` varchar(200) DEFAULT NULL,
  `PersonRole` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingPersonLink`
--

LOCK TABLES `WellbeingPersonLink` WRITE;
/*!40000 ALTER TABLE `WellbeingPersonLink` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingPersonLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingPersonLink_FollowupAction`
--

DROP TABLE IF EXISTS `WellbeingPersonLink_FollowupAction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingPersonLink_FollowupAction` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WellbeingPersonLink_RefId` varchar(36) NOT NULL,
  `WellbeingResponse_RefId` varchar(36) DEFAULT NULL,
  `FollowUpDetails` varchar(1000) DEFAULT NULL,
  `FollowUpActionCategory` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingPersonLink_FollowupAction_IX` (`WellbeingPersonLink_RefId`),
  CONSTRAINT `WellbeingEvent_FollowupAction_FK` FOREIGN KEY (`WellbeingPersonLink_RefId`) REFERENCES `WellbeingPersonLink` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingPersonLink_FollowupAction`
--

LOCK TABLES `WellbeingPersonLink_FollowupAction` WRITE;
/*!40000 ALTER TABLE `WellbeingPersonLink_FollowupAction` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingPersonLink_FollowupAction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingResponse`
--

DROP TABLE IF EXISTS `WellbeingResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingResponse` (
  `RefId` varchar(36) NOT NULL,
  `LocalId` varchar(200) DEFAULT NULL,
  `StudentPersonal_RefId` varchar(36) DEFAULT NULL,
  `SchoolInfo_RefId` varchar(36) DEFAULT NULL,
  `Date` varchar(200) DEFAULT NULL,
  `WellbeingResponseStartDate` varchar(200) DEFAULT NULL,
  `WellbeingResponseEndDate` varchar(200) DEFAULT NULL,
  `WellbeingResponseCategory` varchar(200) DEFAULT NULL,
  `WellbeingResponseNotes` varchar(1000) DEFAULT NULL,
  `SuspensionContainer_SuspensionCategory` varchar(200) DEFAULT NULL,
  `SuspensionContainer_Duration` varchar(200) DEFAULT NULL,
  `SuspensionContainer_AdvisementDate` varchar(200) DEFAULT NULL,
  `SuspensionContainer_ResolutionMeetingTime` varchar(200) DEFAULT NULL,
  `SuspensionContainer_ResolutionNotes` varchar(1000) DEFAULT NULL,
  `SuspensionContainer_EarlyReturnDate` varchar(200) DEFAULT NULL,
  `SuspensionContainer_Status` varchar(200) DEFAULT NULL,
  `SuspensionContainer_SuspensionNotes` varchar(1000) DEFAULT NULL,
  `DetentionContainer_DetentionCategory` varchar(200) DEFAULT NULL,
  `DetentionContainer_DetentionDate` varchar(200) DEFAULT NULL,
  `DetentionContainer_DetentionLocation` varchar(200) DEFAULT NULL,
  `DetentionContainer_DetentionNotes` varchar(1000) DEFAULT NULL,
  `DetentionContainer_Status` varchar(200) DEFAULT NULL,
  `PlanRequiredContainer_Status` varchar(200) DEFAULT NULL,
  `AwardContainer_AwardDate` varchar(200) DEFAULT NULL,
  `AwardContainer_AwardType` varchar(200) DEFAULT NULL,
  `AwardContainer_AwardDescription` varchar(200) DEFAULT NULL,
  `AwardContainer_AwardNotes` varchar(1000) DEFAULT NULL,
  `AwardContainer_Status` varchar(200) DEFAULT NULL,
  `OtherWellbeingResponseContainer_OtherResponseDate` varchar(200) DEFAULT NULL,
  `OtherWellbeingResponseContainer_OtherResponseType` varchar(200) DEFAULT NULL,
  `OtherWellbeingResponseContainer_OtherResponseDescription` varchar(200) DEFAULT NULL,
  `OtherWellbeingResponseContainer_OtherResponseNotes` varchar(1000) DEFAULT NULL,
  `OtherWellbeingResponseContainer_Status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingResponse`
--

LOCK TABLES `WellbeingResponse` WRITE;
/*!40000 ALTER TABLE `WellbeingResponse` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingResponse_Document`
--

DROP TABLE IF EXISTS `WellbeingResponse_Document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingResponse_Document` (
  `WellbeingResponse_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(200) DEFAULT NULL,
  `Sensitivity` varchar(200) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `DocumentType` varchar(200) DEFAULT NULL,
  `DocumentReviewDate` varchar(200) DEFAULT NULL,
  `DocumentDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingResponse_Document_IX` (`WellbeingResponse_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingResponse_Document`
--

LOCK TABLES `WellbeingResponse_Document` WRITE;
/*!40000 ALTER TABLE `WellbeingResponse_Document` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingResponse_Document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingResponse_PersonInvolvement`
--

DROP TABLE IF EXISTS `WellbeingResponse_PersonInvolvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingResponse_PersonInvolvement` (
  `WellbeingResponse_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PersonRefId` varchar(36) DEFAULT NULL,
  `PersonRefId_SIF_RefObject` varchar(200) DEFAULT NULL,
  `ShortName` varchar(200) DEFAULT NULL,
  `HowInvolved` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingResponse_Document_IX` (`WellbeingResponse_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingResponse_PersonInvolvement`
--

LOCK TABLES `WellbeingResponse_PersonInvolvement` WRITE;
/*!40000 ALTER TABLE `WellbeingResponse_PersonInvolvement` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingResponse_PersonInvolvement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingResponse_PlanRequiredContainer_PlanRequired`
--

DROP TABLE IF EXISTS `WellbeingResponse_PlanRequiredContainer_PlanRequired`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingResponse_PlanRequiredContainer_PlanRequired` (
  `WellbeingResponse_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PersonalisedPlan_RefId` varchar(36) DEFAULT NULL,
  `PlanNotes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingResponse_Document_IX` (`WellbeingResponse_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingResponse_PlanRequiredContainer_PlanRequired`
--

LOCK TABLES `WellbeingResponse_PlanRequiredContainer_PlanRequired` WRITE;
/*!40000 ALTER TABLE `WellbeingResponse_PlanRequiredContainer_PlanRequired` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingResponse_PlanRequiredContainer_PlanRequired` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WellbeingResponse_SuspensionContainer_WithdrawalTime`
--

DROP TABLE IF EXISTS `WellbeingResponse_SuspensionContainer_WithdrawalTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WellbeingResponse_SuspensionContainer_WithdrawalTime` (
  `WellbeingResponse_RefId` varchar(36) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WithdrawalDate` varchar(200) DEFAULT NULL,
  `WithdrawalStartTime` varchar(200) DEFAULT NULL,
  `WithdrawalEndTime` varchar(200) DEFAULT NULL,
  `TimeTableSubject_RefId` varchar(36) DEFAULT NULL,
  `ScheduledActivity_RefId` varchar(36) DEFAULT NULL,
  `TimeTableCell_RefId` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `WellbeingResponse_Document_IX` (`WellbeingResponse_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WellbeingResponse_SuspensionContainer_WithdrawalTime`
--

LOCK TABLES `WellbeingResponse_SuspensionContainer_WithdrawalTime` WRITE;
/*!40000 ALTER TABLE `WellbeingResponse_SuspensionContainer_WithdrawalTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `WellbeingResponse_SuspensionContainer_WithdrawalTime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22  1:53:59
