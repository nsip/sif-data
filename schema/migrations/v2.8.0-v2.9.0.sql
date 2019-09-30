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
    WellbeingResponse_RefId VARCHAR(36) NULL,
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
    KEY WellbeingPersonLink_FollowupAction_IX (WellbeingPersonLink_RefId),
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

ALTER TABLE WellbeingEvent ADD GroupIndicator VARCHAR(20) DEFAULT NULL;

create table AGAddressCollectionSubmission (
    RefId VARCHAR(36) NOT NULL PRIMARY KEY,
    AddressCollectionYear VARCHAR(200) NULL,
    ReportingAuthority VARCHAR(200) NULL,
    ReportingAuthoritySystem VARCHAR(200) NULL,
    ReportingAuthorityCommonwealthId VARCHAR(200) NULL,
    SystemSubmission VARCHAR(20) NULL,
    SoftwareVendorInfo_SoftwareProduct VARCHAR(200) NULL,
    SoftwareVendorInfo_SoftwareVersion VARCHAR(200) NULL,
    AddressCollectionComments VARCHAR(1000) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCS_EntityContact (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCS_RefId varchar(36) NOT NULL,
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
  INDEX `EntityContact_AGAddressCS_IX` (`AGAddressCS_RefId`),
  CONSTRAINT `EntityContact_AGAddressCS_FK` FOREIGN KEY (`AGAddressCS_RefId`) REFERENCES `AGAddressCollectionSubmission` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCS_EntityContact_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCS_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Name_AGAddressCSEntityContact_IX` (`AGAddressCS_EntityContact_Id`),
  CONSTRAINT `Name_AGAddressCSEntityContact_FK` FOREIGN KEY (`AGAddressCS_EntityContact_Id`) REFERENCES `AGAddressCS_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCS_EntityContact_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCS_EntityContact_Id MEDIUMINT NOT NULL,
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
  MapReference_MapNumber varchar(200) DEFAULT NULL,
  RadioContact varchar(200) DEFAULT NULL,
  Community varchar(200) DEFAULT NULL,
  LocalId varchar(200) DEFAULT NULL,
  AddressGlobalUID varchar(200) DEFAULT NULL,
  INDEX `Address_AGAddressCSEntityContact_IX` (`AGAddressCS_EntityContact_Id`),
  CONSTRAINT `Address_AGAddressCSEntityContact_FK` FOREIGN KEY (`AGAddressCS_EntityContact_Id`) REFERENCES `AGAddressCS_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
create table AGAddressCS_EntityContact_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCS_EntityContact_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_AGAddressCSEntityContactAddress_IX` (`AGAddressCS_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_AGAddressCSEntityContactAddress_FK` FOREIGN KEY (`AGAddressCS_EntityContact_Address_Id`) REFERENCES `AGAddressCS_EntityContact_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCS_AGAddressCollectionReporting (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCS_RefId varchar(36) NOT NULL,
  AddressCollectionRefId VARCHAR(200) NULL,
  EntityLevel VARCHAR(200) NULL,
  SchoolInfoRefId VARCHAR(200) NULL,
  LocalId VARCHAR(200) NULL,
  StateProvinceId VARCHAR(200) NULL,
  CommonwealthId VARCHAR(200) NULL,
  AcaraId VARCHAR(200) NULL,
  EntityName VARCHAR(200) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_EntityContact (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Id MEDIUMINT NOT NULL,
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
  INDEX `EntityContact_AGAddressCR_IX` (`AGAddressCR_Id`),
  CONSTRAINT `EntityContact_AGAddressCR_FK` FOREIGN KEY (`AGAddressCR_Id`) REFERENCES `AGAddressCS_AGAddressCollectionReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_EntityContact_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Name_AGAddressCREntityContact_IX` (`AGAddressCR_EntityContact_Id`),
  CONSTRAINT `Name_AGAddressCREntityContact_FK` FOREIGN KEY (`AGAddressCR_EntityContact_Id`) REFERENCES `AGAddressCR_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_EntityContact_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_EntityContact_Id MEDIUMINT NOT NULL,
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
  MapReference_MapNumber varchar(200) DEFAULT NULL,
  RadioContact varchar(200) DEFAULT NULL,
  Community varchar(200) DEFAULT NULL,
  LocalId varchar(200) DEFAULT NULL,
  AddressGlobalUID varchar(200) DEFAULT NULL,
  INDEX `Address_AGAddressCREntityContact_IX` (`AGAddressCR_EntityContact_Id`),
  CONSTRAINT `Address_AGAddressCREntityContact_FK` FOREIGN KEY (`AGAddressCR_EntityContact_Id`) REFERENCES `AGAddressCR_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
create table AGAddressCR_EntityContact_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_EntityContact_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_AGAddressCREntityContactAddress_IX` (`AGAddressCR_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_AGAddressCREntityContactAddress_FK` FOREIGN KEY (`AGAddressCR_EntityContact_Address_Id`) REFERENCES `AGAddressCR_EntityContact_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_Student (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Id MEDIUMINT NOT NULL,
  LocalId VARCHAR(200) NULL,
  EducationLevel VARCHAR(200) NULL,
  BoardingStatus VARCHAR(200) NULL,
  INDEX `Student_AGAddressCR_IX` (`AGAddressCR_Id`),
  CONSTRAINT `Student_AGAddressCR_FK` FOREIGN KEY (`AGAddressCR_Id`) REFERENCES `AGAddressCS_AGAddressCollectionReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_Student_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Student_Id MEDIUMINT NOT NULL,
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
  MapReference_MapNumber varchar(200) DEFAULT NULL,
  RadioContact varchar(200) DEFAULT NULL,
  Community varchar(200) DEFAULT NULL,
  LocalId varchar(200) DEFAULT NULL,
  AddressGlobalUID varchar(200) DEFAULT NULL,
  INDEX `Address_AGAddressCRStudent_IX` (`AGAddressCR_Student_Id`),
  CONSTRAINT `Address_AGAddressCRStudent_FK` FOREIGN KEY (`AGAddressCR_Student_Id`) REFERENCES `AGAddressCR_Student` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
create table AGAddressCR_Student_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Student_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_AGAddressCRStudentAddress_IX` (`AGAddressCR_Student_Address_Id`),
  CONSTRAINT `StatArea_AGAddressCRStudentAddress_FK` FOREIGN KEY (`AGAddressCR_Student_Address_Id`) REFERENCES `AGAddressCR_Student_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_Parent (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Student_Id MEDIUMINT NOT NULL,
  ParentNumber MEDIUMINT NOT NULL,
  AddressSameAsStudent VARCHAR(20) NULL,
  INDEX `Student_AGAddressCRStudent_IX` (`AGAddressCR_Student_Id`),
  CONSTRAINT `Student_AGAddressCRStudent_FK` FOREIGN KEY (`AGAddressCR_Student_Id`) REFERENCES `AGAddressCR_Student` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_Parent_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Parent_Id MEDIUMINT NOT NULL,
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
  INDEX `Name_AGAddressCRParent_IX` (`AGAddressCR_Parent_Id`),
  CONSTRAINT `Name_AGAddressCRParent_FK` FOREIGN KEY (`AGAddressCR_Parent_Id`) REFERENCES `AGAddressCR_Parent` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGAddressCR_Parent_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Parent_Id MEDIUMINT NOT NULL,
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
  MapReference_MapNumber varchar(200) DEFAULT NULL,
  RadioContact varchar(200) DEFAULT NULL,
  Community varchar(200) DEFAULT NULL,
  LocalId varchar(200) DEFAULT NULL,
  AddressGlobalUID varchar(200) DEFAULT NULL,
  INDEX `Address_AGAddressCRParent_IX` (`AGAddressCR_Parent_Id`),
  CONSTRAINT `Address_AGAddressCRParent_FK` FOREIGN KEY (`AGAddressCR_Parent_Id`) REFERENCES `AGAddressCR_Parent` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
create table AGAddressCR_Parent_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AGAddressCR_Parent_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_AGAddressCRParentAddress_IX` (`AGAddressCR_Parent_Address_Id`),
  CONSTRAINT `StatArea_AGAddressCRParentAddress_FK` FOREIGN KEY (`AGAddressCR_Parent_Address_Id`) REFERENCES `AGAddressCR_Parent_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;