ALTER TABLE StudentSchoolEnrollment ADD LocalId VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD EntryType VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Homeroom_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Advisor_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Counselor_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Homegroup VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD AcaraSchoolId VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD TestLevel VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD House VARCHAR(200) NULL;
ALTER TABLE StudentSchoolEnrollment ADD IndividualLearningPlan VARCHAR(10) NULL;
ALTER TABLE StudentSchoolEnrollment ADD Calendar_RefId VARCHAR(36) NULL;
ALTER TABLE StudentSchoolEnrollment ADD ExitStatus VARCHAR(10) NULL;
ALTER TABLE StudentSchoolEnrollment ADD ExitType VARCHAR(10) NULL;
ALTER TABLE StudentSchoolEnrollment ADD FTPTStatus VARCHAR(10) NULL;
ALTER TABLE StudentSchoolEnrollment ADD FFPOS VARCHAR(10) NULL;
ALTER TABLE StudentSchoolEnrollment ADD CatchmentStatus VARCHAR(10) NULL;
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

ALTER TABLE StudentPersonal_OtherId ADD id INT PRIMARY KEY NOT NULL AUTO_INCREMENT FIRST;

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