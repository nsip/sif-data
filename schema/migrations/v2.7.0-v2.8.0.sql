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
CREATE UNIQUE INDEX StudentSchoolEnrollment_RefId_IX ON StudentSchoolEnrollment (RefId);
CREATE INDEX StudentSchoolEnrollment_StudentPersonal_RefId_IX ON StudentSchoolEnrollment (StudentPersonal_RefId);
CREATE INDEX StudentSchoolEnrollment_SchoolInfo_RefId_IX ON StudentSchoolEnrollment (SchoolInfo_RefId);

CREATE TABLE StudentSchoolEnrollment_PublishingPermission (
   ID INT(11) NOT NULL AUTO_INCREMENT,
   StudentSchoolEnrollment_RefId VARCHAR(36) NOT NULL,
   PermissionCategory VARCHAR(200),
   PermissionValue VARCHAR(200),
   PRIMARY KEY (id),
   UNIQUE INDEX SSE_PublishingPermission_PKX (ID),
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
   UNIQUE INDEX SSE_StudentGroup_PKX (ID),
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
   UNIQUE INDEX SSE_StudentSubjectChoice_PKX (ID),
   INDEX SSE_StudentSubjectChoice_IX (StudentSchoolEnrollment_RefId),
   CONSTRAINT SSE_StudentSubjectChoice_FK FOREIGN KEY (StudentSchoolEnrollment_RefId) REFERENCES StudentSchoolEnrollment (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;


/**
 * Changes to PersonPicture
 */
ALTER TABLE PersonPicture MODIFY COLUMN RefId varchar(36) NOT NULL;
ALTER TABLE PersonPicture ADD CONSTRAINT PersonPicture_PK PRIMARY KEY (RefId);
CREATE UNIQUE INDEX PersonPicture_RefId_IX ON PersonPicture (RefId);

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
   UNIQUE INDEX SA_StaffSubject_PKX (ID),
   INDEX SA_StaffSubject_IX (StaffAssignment_RefId),
   CONSTRAINT SA_StaffSubject_FK FOREIGN KEY (StaffAssignment_RefId) REFERENCES StaffAssignment (RefId)  
) Engine=InnoDB DEFAULT Charset=utf8;

/** 
 * Changes to StudentPersonal
 */
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
); 

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
);

CREATE TABLE AGStatusReport_AGRule (
   Id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   ReportingObjectResponse_Id MEDIUMINT NOT NULL,
   AGRuleCode VARCHAR(200),
   AGRuleComment VARCHAR(200),
   AGRuleResponse VARCHAR(200),
   AGRuleStatus VARCHAR(200),
   INDEX `Rule_ReportingObjectResponse_IX` (`ReportingObjectResponse_Id`),
   CONSTRAINT `Rule_ReportingObjectResponse_FK` FOREIGN KEY (`ReportingObjectResponse_Id`) REFERENCES `AGStatusReport_ReportingObjectResponse` (`Id`)
);

