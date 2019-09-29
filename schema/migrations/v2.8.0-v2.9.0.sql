ALTER TABLE StudentPersonal ADD PrePrimaryEducation VARCHAR(200) NULL;
ALTER TABLE StudentPersonal ADD PrePrimaryEducationHours VARCHAR(20) NULL;

ALTER TABLE RoomInfo ADD AvailableForTimetable VARCHAR(20) NULL;
ALTER TABLE StaffAssignment ADD AvailableForTimetable VARCHAR(20) NULL;

CREATE TABLE WellbeingCharacteristic_Symptom (
   WellbeingCharacteristic_RefId VARCHAR(36) NOT NULL,
   Symptom VARCHAR(200) NOT NULL,
   PRIMARY KEY (WellbeingCharacteristic_RefId, Symptom),
   INDEX WC_Symptom_FKX (WellbeingCharacteristic_RefId),
   CONSTRAINT WC_Symptom_FK FOREIGN KEY (WellbeingCharacteristic_RefId) REFERENCES WellbeingCharacteristic (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

ALTER TABLE StudentSchoolEnrollment ADD InternationalStudent VARCHAR(20) NULL;

ALTER TABLE FQSubmission_EntityContact_Address ADD MapReference_MapNumber varchar(200) DEFAULT NULL;
ALTER TABLE FQReporting_EntityContact_Address ADD MapReference_MapNumber varchar(200) DEFAULT NULL;

ALTER TABLE WellbeingResponse ADD SuspensionContainer_SuspensionNotes varchar(1000) DEFAULT NULL after SuspensionContainer_Status;

create table WellbeingPersonLink (
    RefId VARCHAR(36) NOT NULL PRIMARY KEY,
    WellbeingEvent_RefId VARCHAR(36) NULL,
    WellbeingRespons_RefId VARCHAR(36) NULL,
    GroupId VARCHAR(200) NULL,
    Person_RefId VARCHAR(36) NULL,
    Person_RefId_SIF_RefObject VARCHAR(200) NULL,
    ShortName VARCHAR(200) NULL,
    HowInvolved VARCHAR(200) NULL,
    OtherPersonId VARCHAR(200) NULL,
    OtherPersonContactDetails VARCHAR(200) NULL,
    PersonRole VARCHAR(200) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingPersonLink_FollowupAction (
	Id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	WellbeingPersonLink_RefId varchar(36) NOT NULL,
	WellbeingResponse_RefId varchar(36) NULL,
    FollowUpDetails varchar(1000) DEFAULT NULL,
    FollowUpActionCategory varchar(200) DEFAULT NULL,
    KEY WellbeingEvent_FollowupAction_IX (WellbeingEvent_RefId),
    CONSTRAINT `WellbeingEvent_FollowupAction_FK` FOREIGN KEY (`WellbeingPersonLink_RefId`) REFERENCES `WellbeingPersonLink` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE StudentPersonal ADD MostRecent_OtherSchoolName VARCHAR(200) NULL AFTER MostRecent_ReportingSchool;
ALTER TABLE StudentPersonal ADD MostRecent_DisabilityLevelOfAdjustment VARCHAR(200) NULL AFTER MostRecent_OtherSchoolName;
ALTER TABLE StudentPersonal ADD MostRecent_DisabilityCategory VARCHAR(200) NULL AFTER MostRecent_DisabilityLevelOfAdjustment;
ALTER TABLE StudentPersonal ADD MostRecent_CensusAge VARCHAR(200) NULL AFTER MostRecent_DisabilityCategory;
ALTER TABLE StudentPersonal ADD MostRecent_DistanceEducationStudent VARCHAR(200) NULL AFTER MostRecent_CensusAge;
ALTER TABLE StudentPersonal ADD MostRecent_BoardingStatus VARCHAR(200) NULL AFTER MostRecent_DistanceEducationStudent;

ALTER TABLE StudentSchoolEnrollment ADD DisabilityLevelOfAdjustment VARCHAR(20) NULL AFTER InternationalStudent;
ALTER TABLE StudentSchoolEnrollment ADD DisabilityCategory VARCHAR(20) NULL AFTER DisabilityLevelOfAdjustment;
ALTER TABLE StudentSchoolEnrollment ADD CensusAge VARCHAR(20) NULL AFTER DisabilityCategory;
ALTER TABLE StudentSchoolEnrollment ADD DistanceEducationStudent VARCHAR(20) NULL AFTER CensusAge;
ALTER TABLE StudentSchoolEnrollment ADD BoardingStatus VARCHAR(20) NULL AFTER DistanceEducationStudent;

