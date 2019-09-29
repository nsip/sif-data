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