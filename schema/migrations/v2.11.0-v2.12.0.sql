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

create table CensusCollection (
    RefId VARCHAR(36) NOT NULL PRIMARY KEY,
    CensusYear VARCHAR(200) NULL,
    RoundCode VARCHAR(200) NULL,
    ReportingAuthorityCommonwealthId VARCHAR(200) NULL,
    SoftwareVendorInfo_SoftwareProduct VARCHAR(200) NULL,
    SoftwareVendorInfo_SoftwareVersion VARCHAR(200) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    CensusCollection_RefId VARCHAR(36) NOT NULL,
    EntityLevel VARCHAR(200) DEFAULT NULL,
    CommonwealthId VARCHAR(200) DEFAULT NULL,
    EntityName VARCHAR(200) DEFAULT NULL,
    INDEX `CensusReporting_CensusCollection_IX` (`CensusCollection_RefId`),
    CONSTRAINT `CensusReporting_CensusCollection_FK` FOREIGN KEY (`CensusCollection_RefId`) REFERENCES `CensusCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    CensusCollection_RefId VARCHAR(36) NOT NULL,
    EntityLevel VARCHAR(200) DEFAULT NULL,
    CommonwealthId VARCHAR(200) DEFAULT NULL,
    EntityName VARCHAR(200) DEFAULT NULL,
    INDEX `CensusReporting_CensusCollection_IX` (`CensusCollection_RefId`),
    CONSTRAINT `CensusReporting_CensusCollection_FK` FOREIGN KEY (`CensusCollection_RefId`) REFERENCES `CensusCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting_EntityContact (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  CensusReporting_Id MEDIUMINT NOT NULL,
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
  INDEX `EntityContact_CensusReporting_IX` (`CensusReporting_Id`),
  CONSTRAINT `EntityContact_CensusReporting_FK` FOREIGN KEY (`CensusReporting_Id`) REFERENCES `CensusReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting_EntityContact_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  CensusReporting_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Name_CensusReportingEntityContact_IX` (`CensusReporting_EntityContact_Id`),
  CONSTRAINT `Name_CensusReportingEntityContact_FK` FOREIGN KEY (`CensusReportingEntityContact_Id`) REFERENCES `CensusReporting_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting_Staff (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  CensusReporting_Id MEDIUMINT NOT NULL,
  StaffCohortId VARCHAR(200) DEFAULT NULL,
  StaffActivity VARCHAR(200) DEFAULT NULL,
  CohortGender VARCHAR(200) DEFAULT NULL,
  CohortIndigenousType VARCHAR(200) DEFAULT NULL,
  PrimaryFTE VARCHAR(200) DEFAULT NULL,
  SecondaryFTE VARCHAR(200) DEFAULT NULL,
  JobFTE VARCHAR(200) DEFAULT NULL,
  HeadCount VARCHAR(200) DEFAULT NULL,
  INDEX `Staff_CensusReporting_IX` (`CensusReporting_Id`),
  CONSTRAINT `Staff_CensusReporting_FK` FOREIGN KEY (`CensusReporting_Id`) REFERENCES `CensusReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting_Staff_ActivityOtherCode (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  CensusReporting_Staff_Id MEDIUMINT NOT NULL,
  OtherCode VARCHAR(200) DEFAULT NULL,
  Codeset VARCHAR(200) DEFAULT NULL,
  INDEX `ActivityOtherCode_CensusReportingStaff_IX` (`CensusReporting_Staff_Id`),
  CONSTRAINT `ActivityOtherCode_CensusReportingStaff_FK` FOREIGN KEY (`CensusReporting_Staff_Id`) REFERENCES `CensusReporting_Staff` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting_Student (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  CensusReporting_Id MEDIUMINT NOT NULL,
  StudentCohortId VARCHAR(200) DEFAULT NULL,
  YearLevel VARCHAR(200) DEFAULT NULL,
  CensusAge VARCHAR(200) DEFAULT NULL,
  CohortGender VARCHAR(200) DEFAULT NULL,
  CohortIndigenousType VARCHAR(200) DEFAULT NULL,
  EducationMode VARCHAR(200) DEFAULT NULL,
  StudentOnVisa VARCHAR(200) DEFAULT NULL,
  OverseasStudent VARCHAR(200) DEFAULT NULL,
  DisabilityLevelOfAdjustment VARCHAR(200) DEFAULT NULL,
  DisabilityCategory VARCHAR(200) DEFAULT NULL,
  Fte VARCHAR(200) DEFAULT NULL,
  Headcount VARCHAR(200) DEFAULT NULL,
  INDEX `Student_CensusReporting_IX` (`CensusReporting_Id`),
  CONSTRAINT `Student_CensusReporting_FK` FOREIGN KEY (`CensusReporting_Id`) REFERENCES `CensusReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CollectionRound (
    RefId VARCHAR(36) NOT NULL PRIMARY KEY,
    AGCollection VARCHAR(200) NULL,
    CollectionYear VARCHAR(200) NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CollectionRound_LocalCode (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    CollectionRound_RefId varchar(36) NOT NULL,
    LocalisedCode varchar(200) NULL,
    Description varchar(200) NULL,
    Element varchar(200) NULL,
    ListIndex MEDIUMINT NULL,
    INDEX `LocalCode_CollectionRound_IX` (`CollectionRound_RefId`),
    CONSTRAINT `LocalCode_CollectionRound_FK` FOREIGN KEY (`CollectionRound_RefId`) REFERENCES `CollectionRound` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table AGRound (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    CollectionRound_RefId varchar(36) NOT NULL,
    RoundCode VARCHAR(200) DEFAULT NULL,
    RoundName VARCHAR(200) DEFAULT NULL,
    StartDate VARCHAR(200) DEFAULT NULL,
    DueDate VARCHAR(200) DEFAULT NULL,
    EndDate VARCHAR(200) DEFAULT NULL,
    INDEX `AGRound_CollectionRound_IX` (`CollectionRound_RefId`),
    CONSTRAINT `AGRound_CollectionRound_FK` FOREIGN KEY (`CollectionRound_RefId`) REFERENCES `CollectionRound` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CollectionStatus (
    RefId VARCHAR(36) NOT NULL PRIMARY KEY,
    ReportingAuthority VARCHAR(200) DEFAULT NULL,
    ReportingAuthoritySystem VARCHAR(200) DEFAULT NULL,
    ReportingAuthorityCommonwealthId VARCHAR(200) DEFAULT NULL,
    SubmittedBy VARCHAR(200) DEFAULT NULL,
    SubmissionTimestamp VARCHAR(200) DEFAULT NULL,
    AgCollection VARCHAR(200) DEFAULT NULL,
    CollectionYear VARCHAR(200) DEFAULT NULL,
    RoundCode VARCHAR(200) DEFAULT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CollectionStatus_LocalCode (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    CollectionStatus_RefId varchar(36) NOT NULL,
    LocalisedCode varchar(200) NULL,
    Description varchar(200) NULL,
    Element varchar(200) NULL,
    ListIndex MEDIUMINT NULL,
    INDEX `LocalCode_CollectionStatus_IX` (`CollectionStatus_RefId`),
    CONSTRAINT `LocalCode_CollectionStatus_FK` FOREIGN KEY (`CollectionStatus_RefId`) REFERENCES `CollectionStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CollectionStatus_AGReportingObjectReponse (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    CollectionStatus_RefId varchar(36) NOT NULL,
    SubmittedRefId VARCHAR(200) DEFAULT NULL,
    SifRefId VARCHAR(200) DEFAULT NULL,
    HttpStatusCode VARCHAR(200) DEFAULT NULL,
    ErrorText VARCHAR(200) DEFAULT NULL,
    CommonwealthId VARCHAR(200) DEFAULT NULL,
    EntityName VARCHAR(200) DEFAULT NULL,
    AgSubmissionStatusCode VARCHAR(200) DEFAULT NULL,
    INDEX `AGReportingObjectReponse_CollectionStatus_IX` (`CollectionStatus_RefId`),
    CONSTRAINT `AGReportingObjectReponse_CollectionStatus_FK` FOREIGN KEY (`CollectionStatus_RefId`) REFERENCES `CollectionStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CollectionStatus_AGROResponse_AGRule (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    AGReportingObjectResponse_Id mediumint NOT NULL,
    AGRuleCode VARCHAR(200) DEFAULT NULL,
    AGRuleComment VARCHAR(200) DEFAULT NULL,
    AGRuleResponse VARCHAR(200) DEFAULT NULL,
    AGRuleStatus VARCHAR(200) DEFAULT NULL,
    INDEX `AGRule_CollectionStatusAGROResponse_IX` (`AGReportingObjectResponse_Id`),
    CONSTRAINT `AGRule_CollectionStatusAGROResponse_FK` FOREIGN KEY (`AGReportingObjectResponse_Id`) REFERENCES `CollectionStatus_AGReportingObjectReponse` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;