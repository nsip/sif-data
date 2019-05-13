/*
 * Simplify link between StudentPersonal_OtherId and Student
 */
ALTER TABLE StudentPersonal_OtherId ADD id INT PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;
ALTER TABLE StudentAttendanceTimeList_AttendanceTime_OtherCode ADD id INT PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;

/*
 * Changes to StudentSchoolEnrollment
 */
ALTER TABLE StudentSchoolEnrollment ADD LocalId VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD EntryType VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Homeroom_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Advisor_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Counselor_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Homegroup VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD AcaraSchoolId VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD TestLevel VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD House VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD IndividualLearningPlan VARCHAR(20) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Calendar_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD ExitStatus VARCHAR(20) NULL;
ALTER TABLE StudentSchoolEnrollment ADD ExitType VARCHAR(20) NULL;
ALTER TABLE StudentSchoolEnrollment ADD FTPTStatus VARCHAR(20) NULL;
ALTER TABLE StudentSchoolEnrollment ADD FFPOS VARCHAR(20) NULL;
ALTER TABLE StudentSchoolEnrollment ADD CatchmentStatus VARCHAR(20) NULL;
ALTER TABLE StudentSchoolEnrollment ADD PreviousSchool VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD PreviousSchoolName VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD DestinationSchool VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD DestinationSchoolName VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD StartedAtSchoolDate VARCHAR(25) NULL;
ALTER TABLE StudentSchoolEnrollment DROP FOREIGN KEY StudentSchoolEnrollment_ibfk_1;
ALTER TABLE StudentSchoolEnrollment DROP FOREIGN KEY StudentSchoolEnrollment_ibfk_2;
ALTER TABLE StudentSchoolEnrollment MODIFY COLUMN RefId varchar(36) NOT NULL;
ALTER TABLE StudentSchoolEnrollment DROP KEY RefId;
ALTER TABLE StudentSchoolEnrollment ADD CONSTRAINT StudentSchoolEnrollment_PK PRIMARY KEY (RefId);
ALTER TABLE StudentSchoolEnrollment DROP INDEX SchoolInfo_RefId;
ALTER TABLE StudentSchoolEnrollment DROP INDEX StudentPersonal_RefId;
CREATE INDEX StudentSchoolEnrollment_StudentPersonal_RefId_IX ON StudentSchoolEnrollment (StudentPersonal_RefId);
CREATE INDEX StudentSchoolEnrollment_SchoolInfo_RefId_IX ON StudentSchoolEnrollment (SchoolInfo_RefId);

CREATE TABLE StudentSchoolEnrollment_PublishingPermission (
   ID INT(11) NOT NULL AUTO_INCREMENT,
   StudentSchoolEnrollment_RefId VARCHAR(36) NOT NULL,
   PermissionCategory VARCHAR(200),
   PermissionValue VARCHAR(200),
   PRIMARY KEY (id),
   INDEX SSE_PublishingPermission_IX (StudentSchoolEnrollment_RefId),
   CONSTRAINT SSE_PublishingPermission_FK FOREIGN KEY (StudentSchoolEnrollment_RefId) REFERENCES StudentSchoolEnrollment (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

CREATE TABLE StudentSchoolEnrollment_StudentGroup (
   ID INT(11) NOT NULL AUTO_INCREMENT,
   StudentSchoolEnrollment_RefId VARCHAR(36) NOT NULL,
   GroupCategory VARCHAR(200),
   GroupLocalId VARCHAR(200),
   GroupDescription VARCHAR(2000),
   PRIMARY KEY (id),
   INDEX SSE_StudentGroup_IX (StudentSchoolEnrollment_RefId),
   CONSTRAINT SSE_StudentGroup_FK FOREIGN KEY (StudentSchoolEnrollment_RefId) REFERENCES StudentSchoolEnrollment (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

CREATE TABLE StudentSchoolEnrollment_StudentSubjectChoice (
   ID INT(11) NOT NULL AUTO_INCREMENT,
   StudentSchoolEnrollment_RefId VARCHAR(36) NOT NULL,
   PreferenceNumber VARCHAR(200),
   SubjectLocalId VARCHAR(200),
   StudyDescription VARCHAR(200),
   OtherSchoolLocalId VARCHAR(200),
   PRIMARY KEY (id),
   INDEX SSE_StudentSubjectChoice_IX (StudentSchoolEnrollment_RefId),
   CONSTRAINT SSE_StudentSubjectChoice_FK FOREIGN KEY (StudentSchoolEnrollment_RefId) REFERENCES StudentSchoolEnrollment (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;


/**
 * Changes to PersonPicture
 */
ALTER TABLE PersonPicture MODIFY COLUMN RefId varchar(36) NOT NULL;
ALTER TABLE PersonPicture ADD CONSTRAINT PersonPicture_PK PRIMARY KEY (RefId);

CREATE TABLE PersonPicture_PublishingPermission (
   ID INT(11) NOT NULL AUTO_INCREMENT,
   PersonPicture_RefId VARCHAR(36) NOT NULL,
   PermissionCategory VARCHAR(200),
   PermissionValue VARCHAR(200),
   PRIMARY KEY (id),
   UNIQUE INDEX PP_PublishingPermission_PKX (ID),
   INDEX PP_PublishingPermission_IX (PersonPicture_RefId),
   CONSTRAINT PP_PublishingPermission_FK FOREIGN KEY (PersonPicture_RefId) REFERENCES PersonPicture (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

/**
 * Changes to StaffAssignment
 */
ALTER TABLE StaffAssignment MODIFY COLUMN RefId varchar(36) NOT NULL;
ALTER TABLE StaffAssignment ADD CONSTRAINT StaffAssignment_PK PRIMARY KEY (RefId); 
ALTER TABLE StaffAssignment ADD JobFTE VARCHAR(20) NULL;
ALTER TABLE StaffAssignment ADD EmploymentStatus VARCHAR(20) NULL;
ALTER TABLE StaffAssignment ADD CasualReliefTeacher VARCHAR(20) NULL;
ALTER TABLE StaffAssignment ADD Homegroup VARCHAR(200) NULL;
ALTER TABLE StaffAssignment ADD House VARCHAR(200) NULL;
ALTER TABLE StaffAssignment ADD PreviousSchoolName VARCHAR(200) NULL;

CREATE TABLE StaffAssignment_YearLevel (
   StaffAssignment_RefId VARCHAR(36) NOT NULL,
   YearLevel VARCHAR(20) NOT NULL,
   PRIMARY KEY (StaffAssignment_RefId, YearLevel),
   INDEX SA_YearLevel_FKX (StaffAssignment_RefId),
   CONSTRAINT SA_YearLevel_FK FOREIGN KEY (StaffAssignment_RefId) REFERENCES StaffAssignment (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

CREATE TABLE StaffAssignment_CalendarSummary (
   StaffAssignment_RefId VARCHAR(36) NOT NULL,
   CalendarSummary_RefId VARCHAR(36) NOT NULL,
   PRIMARY KEY (StaffAssignment_RefId, CalendarSummary_RefId),
   INDEX SA_CalendarSummary_FKX (StaffAssignment_RefId),
   CONSTRAINT SA_CalendarSummary_FK FOREIGN KEY (StaffAssignment_RefId) REFERENCES StaffAssignment (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

CREATE TABLE StaffAssignment_StaffSubject (
   ID INT(11) NOT NULL AUTO_INCREMENT,
   StaffAssignment_RefId VARCHAR(36) NOT NULL,
   PreferenceNumber VARCHAR(200),
   SubjectLocalId VARCHAR(200),
   TimeTableSubject_RefId VARCHAR(36),
   PRIMARY KEY (id),
   INDEX SA_StaffSubject_IX (StaffAssignment_RefId),
   CONSTRAINT SA_StaffSubject_FK FOREIGN KEY (StaffAssignment_RefId) REFERENCES StaffAssignment (RefId)  
) Engine=InnoDB DEFAULT Charset=utf8;

/** 
 * Changes to StudentPersonal
 */
ALTER TABLE StudentPersonal ADD CONSTRAINT StudentPersonal_PK PRIMARY KEY (RefId);
ALTER TABLE StudentPersonal ADD ESLSupport VARCHAR(20) NULL;

/**
 * Changes for FQ Reporting
 */
DROP TABLE FQReporting_FQRule;
DROP TABLE FQReporting_FQItem;
DROP TABLE FQReporting_ContextualQuestion;
DROP TABLE FQReporting_EntityContact_Address_StatisticalArea;
DROP TABLE FQReporting_EntityContact_Address;
DROP TABLE FQReporting_EntityContact_Name;
DROP TABLE FQReporting_EntityContact;
DROP TABLE FQReporting;

CREATE TABLE AGStatusReport (
   RefId VARCHAR(36) NOT NULL PRIMARY KEY,
   ReportingAuthority VARCHAR(200),
   ReportingAuthoritySystem VARCHAR(200),
   ReportingAuthorityCommonwealthId VARCHAR(200),
   SubmittedBy VARCHAR(200),
   SubmissionTimestamp VARCHAR(200),
   AGCollection VARCHAR(200),
   CollectionYear VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE AGStatusReport_ReportingObjectResponse (
   Id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   AGStatusReport_RefId VARCHAR(36) NOT NULL,
   SubmittedRefId VARCHAR(36),
   SIFRefId VARCHAR(36),
   HTTPStatusCode VARCHAR(200),
   ErrorText VARCHAR(200),
   CommonwealthId VARCHAR(200),
   EntityName VARCHAR(200),
   AGSubmissionStatusCode VARCHAR(200),
   INDEX `ReportingObjectResponse_AGStatusReport_IX` (`AGStatusReport_RefId`),
   CONSTRAINT `ReportingObjectResponse_AGStatusReport_FK` FOREIGN KEY (`AGStatusReport_RefId`) REFERENCES `AGStatusReport` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE AGStatusReport_AGRule (
   Id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   ReportingObjectResponse_Id MEDIUMINT NOT NULL,
   AGRuleCode VARCHAR(200),
   AGRuleComment VARCHAR(200),
   AGRuleResponse VARCHAR(200),
   AGRuleStatus VARCHAR(200),
   INDEX `Rule_ReportingObjectResponse_IX` (`ReportingObjectResponse_Id`),
   CONSTRAINT `Rule_ReportingObjectResponse_FK` FOREIGN KEY (`ReportingObjectResponse_Id`) REFERENCES `AGStatusReport_ReportingObjectResponse` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FinancialQuestionnaireSubmission (
  RefId varchar(36) NOT NULL,
  FQYear varchar(200) DEFAULT NULL,
  ReportingAuthority varchar(200) DEFAULT NULL,
  ReportingAuthoritySystem varchar(200) DEFAULT NULL,
  ReportingAuthorityCommonwealthId varchar(200) DEFAULT NULL,
  SystemSubmission varchar(200) DEFAULT NULL,
  SoftwareVendorInfo_SoftwareProduct varchar(200) DEFAULT NULL,
  SoftwareVendorInfo_SoftwareVersion varchar(200) DEFAULT NULL,
  FQReportComments varchar(200) DEFAULT NULL,
  PRIMARY KEY (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQSubmission_EntityContact (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQSubmission_RefId varchar(36) NOT NULL,
  PositionTitle varchar(200) DEFAULT NULL,
  Role varchar(200) DEFAULT NULL,
  RegistrationDetails varchar(200) DEFAULT NULL,
  Qualifications varchar(200) DEFAULT NULL,
  Email_Type varchar(200) DEFAULT NULL,
  Email_Value varchar(200) DEFAULT NULL,
  PhoneNumber_Type varchar(200) DEFAULT NULL,
  PhoneNumber_Number varchar(200) DEFAULT NULL,
  PhoneNumber_Extension varchar(200) DEFAULT NULL,
  PhoneNumber_ListedStatus varchar(200) DEFAULT NULL,
  PhoneNumber_Preference varchar(200) DEFAULT NULL,
  INDEX `EntityContact_FQSubmission_IX` (`FQSubmission_RefId`),
  CONSTRAINT `EntityContact_FQSubmission_FK` FOREIGN KEY (`FQSubmission_RefId`) REFERENCES `FinancialQuestionnaireSubmission` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQSubmission_EntityContact_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQSubmission_EntityContact_Id MEDIUMINT NOT NULL,
  NameType varchar(200) DEFAULT NULL,
  Title varchar(200) DEFAULT NULL,
  FamilyName varchar(200) DEFAULT NULL,
  GivenName varchar(200) DEFAULT NULL,
  MiddleName varchar(200) DEFAULT NULL,
  FamilyNameFirst varchar(200) DEFAULT NULL,
  PreferredFamilyName varchar(200) DEFAULT NULL,
  PreferredFamilyNameFirst varchar(200) DEFAULT NULL,
  PreferredGivenName varchar(200) DEFAULT NULL,
  Suffix varchar(200) DEFAULT NULL,
  FullName varchar(200) DEFAULT NULL,
  INDEX `Name_FQSubmissionEntityContact_IX` (`FQSubmission_EntityContact_Id`),
  CONSTRAINT `Name_FQSubmissionEntityContact_FK` FOREIGN KEY (`FQSubmission_EntityContact_Id`) REFERENCES `FQSubmission_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQSubmission_EntityContact_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQSubmission_EntityContact_Id MEDIUMINT NOT NULL,
  AddressType varchar(200) DEFAULT NULL,
  AddressRole varchar(200) DEFAULT NULL,
  EffectiveFromDate varchar(200) DEFAULT NULL,
  EffectiveToDate varchar(200) DEFAULT NULL,
  Street_Line1 varchar(200) DEFAULT NULL,
  Street_Line2 varchar(200) DEFAULT NULL,
  Street_Line3 varchar(200) DEFAULT NULL,
  Street_Complex varchar(200) DEFAULT NULL,
  Street_StreetNumber varchar(200) DEFAULT NULL,
  Street_StreetPrefix varchar(200) DEFAULT NULL,
  Street_StreetName varchar(200) DEFAULT NULL,
  Street_StreetType varchar(200) DEFAULT NULL,
  Street_StreetSuffix varchar(200) DEFAULT NULL,
  Street_ApartmentType varchar(200) DEFAULT NULL,
  Street_ApartmentNumberPrefix varchar(200) DEFAULT NULL,
  Street_ApartmentNumber varchar(200) DEFAULT NULL,
  Street_ApartmentNumberSuffix varchar(200) DEFAULT NULL,
  City varchar(200) DEFAULT NULL,
  StateProvince varchar(200) DEFAULT NULL,
  Country varchar(200) DEFAULT NULL,
  PostalCode varchar(200) DEFAULT NULL,
  GridLocation_Latitude varchar(200) DEFAULT NULL,
  GridLocation_Longitude varchar(200) DEFAULT NULL,
  MapReference_Type varchar(200) DEFAULT NULL,
  MapReference_XCoordinate varchar(200) DEFAULT NULL,
  MapReference_YCoordinate varchar(200) DEFAULT NULL,
  RadioContact varchar(200) DEFAULT NULL,
  Community varchar(200) DEFAULT NULL,
  LocalId varchar(200) DEFAULT NULL,
  AddressGlobalUID varchar(200) DEFAULT NULL,
  INDEX `Address_FQSubmissionEntityContact_IX` (`FQSubmission_EntityContact_Id`),
  CONSTRAINT `Address_FQSubmissionEntityContact_FK` FOREIGN KEY (`FQSubmission_EntityContact_Id`) REFERENCES `FQSubmission_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
create table FQSubmission_EntityContact_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQSubmission_EntityContact_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_FQSubmissionEntityContactAddress_IX` (`FQSubmission_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_FQSubmissionEntityContactAddress_FK` FOREIGN KEY (`FQSubmission_EntityContact_Address_Id`) REFERENCES `FQSubmission_EntityContact_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQSubmission_RefId varchar(36) NOT NULL,
  FQRefId varchar(36) DEFAULT NULL,
  EntityLevel varchar(200) DEFAULT NULL,
  SchoolInfo_RefId varchar(36) DEFAULT NULL,
  LocalId varchar(200) DEFAULT NULL,
  StateProvinceId varchar(200) DEFAULT NULL,
  CommonwealthId varchar(200) DEFAULT NULL,
  AcaraId varchar(200) DEFAULT NULL,
  EntityName varchar(200) DEFAULT NULL,
  INDEX `FQReporting_FQSubmission_IX` (`FQSubmission_RefId`),
  CONSTRAINT `FQReporting_FQSubmission_FK` FOREIGN KEY (`FQSubmission_RefId`) REFERENCES `FinancialQuestionnaireSubmission` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_EntityContact (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQReporting_Id MEDIUMINT NOT NULL,
  PositionTitle varchar(200) DEFAULT NULL,
  Role varchar(200) DEFAULT NULL,
  RegistrationDetails varchar(200) DEFAULT NULL,
  Qualifications varchar(200) DEFAULT NULL,
  Email_Type varchar(200) DEFAULT NULL,
  Email_Value varchar(200) DEFAULT NULL,
  PhoneNumber_Type varchar(200) DEFAULT NULL,
  PhoneNumber_Number varchar(200) DEFAULT NULL,
  PhoneNumber_Extension varchar(200) DEFAULT NULL,
  PhoneNumber_ListedStatus varchar(200) DEFAULT NULL,
  PhoneNumber_Preference varchar(200) DEFAULT NULL,
  INDEX `EntityContact_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `EntityContact_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_EntityContact_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQReporting_EntityContact_Id MEDIUMINT NOT NULL,
  NameType varchar(200) DEFAULT NULL,
  Title varchar(200) DEFAULT NULL,
  FamilyName varchar(200) DEFAULT NULL,
  GivenName varchar(200) DEFAULT NULL,
  MiddleName varchar(200) DEFAULT NULL,
  FamilyNameFirst varchar(200) DEFAULT NULL,
  PreferredFamilyName varchar(200) DEFAULT NULL,
  PreferredFamilyNameFirst varchar(200) DEFAULT NULL,
  PreferredGivenName varchar(200) DEFAULT NULL,
  Suffix varchar(200) DEFAULT NULL,
  FullName varchar(200) DEFAULT NULL,
  INDEX `Name_FQReportingEntityContact_IX` (`FQReporting_EntityContact_Id`),
  CONSTRAINT `Name_FQReportingEntityContact_FK` FOREIGN KEY (`FQReporting_EntityContact_Id`) REFERENCES `FQReporting_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_EntityContact_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQReporting_EntityContact_Id MEDIUMINT NOT NULL,
  AddressType varchar(200) DEFAULT NULL,
  AddressRole varchar(200) DEFAULT NULL,
  EffectiveFromDate varchar(200) DEFAULT NULL,
  EffectiveToDate varchar(200) DEFAULT NULL,
  Street_Line1 varchar(200) DEFAULT NULL,
  Street_Line2 varchar(200) DEFAULT NULL,
  Street_Line3 varchar(200) DEFAULT NULL,
  Street_Complex varchar(200) DEFAULT NULL,
  Street_StreetNumber varchar(200) DEFAULT NULL,
  Street_StreetPrefix varchar(200) DEFAULT NULL,
  Street_StreetName varchar(200) DEFAULT NULL,
  Street_StreetType varchar(200) DEFAULT NULL,
  Street_StreetSuffix varchar(200) DEFAULT NULL,
  Street_ApartmentType varchar(200) DEFAULT NULL,
  Street_ApartmentNumberPrefix varchar(200) DEFAULT NULL,
  Street_ApartmentNumber varchar(200) DEFAULT NULL,
  Street_ApartmentNumberSuffix varchar(200) DEFAULT NULL,
  City varchar(200) DEFAULT NULL,
  StateProvince varchar(200) DEFAULT NULL,
  Country varchar(200) DEFAULT NULL,
  PostalCode varchar(200) DEFAULT NULL,
  GridLocation_Latitude varchar(200) DEFAULT NULL,
  GridLocation_Longitude varchar(200) DEFAULT NULL,
  MapReference_Type varchar(200) DEFAULT NULL,
  MapReference_XCoordinate varchar(200) DEFAULT NULL,
  MapReference_YCoordinate varchar(200) DEFAULT NULL,
  RadioContact varchar(200) DEFAULT NULL,
  Community varchar(200) DEFAULT NULL,
  LocalId varchar(200) DEFAULT NULL,
  AddressGlobalUID varchar(200) DEFAULT NULL,
  INDEX `Address_FQReportingEntityContact_IX` (`FQReporting_EntityContact_Id`),
  CONSTRAINT `Address_FQReportingEntityContact_FK` FOREIGN KEY (`FQReporting_EntityContact_Id`) REFERENCES `FQReporting_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
create table FQReporting_EntityContact_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQReporting_EntityContact_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_FQReportingEntityContactAddress_IX` (`FQReporting_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_FQReportingEntityContactAddress_FK` FOREIGN KEY (`FQReporting_EntityContact_Address_Id`) REFERENCES `FQReporting_EntityContact_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_ContextualQuestion (
  id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FQReporting_Id MEDIUMINT NOT NULL,
  Context varchar(200) DEFAULT NULL,
  Answer varchar(200) DEFAULT NULL,
  INDEX `ContextualQuestion_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `ContextualQuestion_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_FQItem (
  id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FQReporting_Id MEDIUMINT NOT NULL,
  FQItemCode varchar(200) DEFAULT NULL,
  TuitionAmount varchar(200) DEFAULT NULL,
  BoardingAmount varchar(200) DEFAULT NULL,
  SystemAmount varchar(200) DEFAULT NULL,
  DioceseAmount varchar(200) DEFAULT NULL,
  FQComments varchar(200) DEFAULT NULL,
  INDEX `FQItem_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `FQItem_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE FQReporting_AGRule (
   Id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   FQReporting_Id MEDIUMINT NOT NULL,
   AGRuleCode VARCHAR(200),
   AGRuleComment VARCHAR(200),
   AGRuleResponse VARCHAR(200),
   AGRuleStatus VARCHAR(200),
   INDEX `Rule_FQReporting_IX` (`FQReporting_Id`),
   CONSTRAINT `Rule_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
 * ContactInfo changes
 */
ALTER TABLE VendorInfo add ContactInfo_Qualifications VARCHAR(200) NULL;
ALTER TABLE VendorInfo add ContactInfo_RegistrationDetails VARCHAR(200) NULL;

/**
 * Demographics changes
 */
ALTER TABLE StudentPersonal add InterpreterRequired VARCHAR(20) null;
ALTER TABLE StaffPersonal add InterpreterRequired VARCHAR(20) null;
ALTER TABLE StudentContactPersonal add InterpreterRequired VARCHAR(20) null;

