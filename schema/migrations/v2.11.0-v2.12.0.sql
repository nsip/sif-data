drop table AGAddressCR_Parent_Address_StatisticalArea;
drop table AGAddressCR_Parent_Address;
drop table AGAddressCR_Parent_Name;
drop table AGAddressCR_Parent;
drop table AGAddressCR_Student_Address_StatisticalArea;
drop table AGAddressCR_Student_Address;
drop table AGAddressCR_Student;
drop table FQReporting_AGRule;
drop table FQReporting_FQItem;
drop table FQReporting_ContextualQuestion;
drop table FQReporting_EntityContact_Address_StatisticalArea;
drop table FQReporting_EntityContact_Address;
drop table FQReporting_EntityContact_Name;
drop table FQReporting_EntityContact;
drop table FQReporting;
drop table FQSubmission_EntityContact_Address_StatisticalArea;
drop table FQSubmission_EntityContact_Address;
drop table FQSubmission_EntityContact_Name;
drop table FQSubmission_EntityContact;
drop table FinancialQuestionnaireSubmission;
drop table AGStatusReport_AGRule;
drop table AGStatusReport_ReportingObjectResponse;
drop table AGStatusReport;

create table AddressCollection (
    RefId VARCHAR(36) NOT NULL PRIMARY KEY,
    AddressCollectionYear VARCHAR(200) NULL,
    RoundCode VARCHAR(200) NULL,
    ReportingAuthorityCommonwealthId VARCHAR(200) NULL,
    SoftwareVendorInfo_SoftwareProduct VARCHAR(200) NULL,
    SoftwareVendorInfo_SoftwareVersion VARCHAR(200) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCollection_LocalCode (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    AddressCollection_RefId varchar(36) NOT NULL,
    LocalisedCode varchar(200) NULL,
    Description varchar(200) NULL,
    Element varchar(200) NULL,
    ListIndex MEDIUMINT NULL,
    INDEX `LocalCode_AddressCollection_IX` (`AddressCollection_RefId`),
    CONSTRAINT `LocalCode_AddressCollection_FK` FOREIGN KEY (`AddressCollection_RefId`) REFERENCES `AddressCollection` (`RefId`)
)

create table AddressCollectionReporting (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    AddressCollection_RefId varchar(36) NOT NULL,
    EntityLevel VARCHAR(200) NULL,
    SchoolInfoRefId VARCHAR(200) NULL,
    LocalId VARCHAR(200) NULL,
    StateProvinceId VARCHAR(200) NULL,
    CommonwealthId VARCHAR(200) NULL,
    AcaraId VARCHAR(200) NULL,
    EntityName VARCHAR(200) NULL,
    INDEX `AddressCollectionReporting_AddressCollection_IX` (`AddressCollection_RefId`),
    CONSTRAINT `AddressCollectionReporting_AddressCollection_FK` FOREIGN KEY (`AddressCollection_RefId`) REFERENCES `AddressCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_ContextualQuestion (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    AddressCR_Id MEDIUMINT NOT NULL,
    AGContextCode VARCHAR(200) NULL,
    AGAnswer VARCHAR(200) NULL,
    INDEX `ContextualQuestion_AdressCR_IX` (`AddressCR_Id`),
    CONSTRAINT `ContextualQuestion_AdressCR_FK` FOREIGN KEY (`AddressCR_Id`) REFERENCES `AddressCollectionReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_EntityContact (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Id MEDIUMINT NOT NULL,
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
  INDEX `EntityContact_AddressCR_IX` (`AddressCR_Id`),
  CONSTRAINT `EntityContact_AddressCR_FK` FOREIGN KEY (`AddressCR_Id`) REFERENCES `AddressCollectionReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_EntityContact_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Name_AddressCREntityContact_IX` (`AddressCR_EntityContact_Id`),
  CONSTRAINT `Name_AddressCREntityContact_FK` FOREIGN KEY (`AddressCR_EntityContact_Id`) REFERENCES `AddressCR_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_EntityContact_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Address_AddressCREntityContact_IX` (`AddressCR_EntityContact_Id`),
  CONSTRAINT `Address_AddressCREntityContact_FK` FOREIGN KEY (`AddressCR_EntityContact_Id`) REFERENCES `AddressCR_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_EntityContact_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_EntityContact_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_AddressCREntityContactAddress_IX` (`AddressCR_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_AddressCREntityContactAddress_FK` FOREIGN KEY (`AddressCR_EntityContact_Address_Id`) REFERENCES `AddressCR_EntityContact_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_Student (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Id MEDIUMINT NOT NULL,
  LocalId varchar(200) DEFAULT NULL,
  EducationLevel varchar(200) DEFAULT NULL,
  BoardingStatus varchar(200) DEFAULT NULL,
  ReportingParent2 varchar(20) DEFAULT NULL,
  INDEX `Student_AddressCR_IX` (`AddressCR_Id`),
  CONSTRAINT `Student_AddressCR_FK` FOREIGN KEY (`AddressCR_Id`) REFERENCES `AddressCollectionReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_Student_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Student_Id MEDIUMINT NOT NULL,
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
  INDEX `Address_AddressCRStudent_IX` (`AddressCR_Student_Id`),
  CONSTRAINT `Address_AddressCRStudent_FK` FOREIGN KEY (`AddressCR_Student_Id`) REFERENCES `AddressCR_Student` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_Student_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Student_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_AddressCRStudentAddress_IX` (`AddressCR_Student_Address_Id`),
  CONSTRAINT `StatArea_AddressCRStudentAddress_FK` FOREIGN KEY (`AddressCR_Student_Address_Id`) REFERENCES `AddressCR_Student_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_Parent (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Student_Id MEDIUMINT NOT NULL,
  ParentNumber MEDIUMINT DEFAULT NULL,
  AddressSameAsStudent VARCHAR(20) DEFAULT NULL,
  INDEX `Parent_AddressCRStudent_IX` (`AddressCR_Student_Id`),
  CONSTRAINT `Parent_AddressCRStudent_FK` FOREIGN KEY (`AddressCR_Student_Id`) REFERENCES `AddressCR_Student` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_Parent_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Parent_Id MEDIUMINT NOT NULL,
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
  INDEX `Name_AddressCRParent_IX` (`AddressCR_Parent_Id`),
  CONSTRAINT `Name_AddressCRParent_FK` FOREIGN KEY (`AddressCR_Parent_Id`) REFERENCES `AddressCR_Parent` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_Parent_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Parent_Id MEDIUMINT NOT NULL,
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
  INDEX `Address_AddressCRParent_IX` (`AddressCR_Parent_Id`),
  CONSTRAINT `Address_AddressCRParent_FK` FOREIGN KEY (`AddressCR_Parent_Id`) REFERENCES `AddressCR_Parent` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AddressCR_Parent_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  AddressCR_Parent_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_AddressCRParentAddress_IX` (`AddressCR_Parent_Address_Id`),
  CONSTRAINT `StatArea_AddressCRParentAddress_FK` FOREIGN KEY (`AddressCR_Parent_Address_Id`) REFERENCES `AddressCR_Parent_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;