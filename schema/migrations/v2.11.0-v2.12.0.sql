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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
    Context VARCHAR(200) NULL,
    Answer VARCHAR(200) NULL,
    INDEX `ContextualQuestion_AddressCR_IX` (`AddressCR_Id`),
    CONSTRAINT `ContextualQuestion_AddressCR_FK` FOREIGN KEY (`AddressCR_Id`) REFERENCES `AddressCollectionReporting` (`Id`)
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
  CONSTRAINT `Name_CensusReportingEntityContact_FK` FOREIGN KEY (`CensusReporting_EntityContact_Id`) REFERENCES `CensusReporting_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting_EntityContact_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  CensusReporting_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Address_CensusReportingEntityContact_IX` (`CensusReporting_EntityContact_Id`),
  CONSTRAINT `Address_CensusReportingEntityContact_FK` FOREIGN KEY (`CensusReporting_EntityContact_Id`) REFERENCES `CensusReporting_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table CensusReporting_EntityContact_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  CensusReporting_EntityContact_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_CensusReportingEntityContactAddress_IX` (`CensusReporting_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_CensusReportingEntityContactAddress_FK` FOREIGN KEY (`CensusReporting_EntityContact_Address_Id`) REFERENCES `CensusReporting_EntityContact_Address` (`Id`)
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
    CollectionYear VARCHAR(200) NULL
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
    RoundCode VARCHAR(200) DEFAULT NULL
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

create table CollectionStatus_AGReportingObjectResponse (
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
    CONSTRAINT `AGRule_CollectionStatusAGROResponse_FK` FOREIGN KEY (`AGReportingObjectResponse_Id`) REFERENCES `CollectionStatus_AGReportingObjectResponse` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FinancialQuestionnaireCollection (
  RefId VARCHAR(36) NOT NULL PRIMARY KEY,
  FqYear VARCHAR(200) DEFAULT NULL,
  RoundCode VARCHAR(200) DEFAULT NULL,
  ReportingAuthorityCommonwealthId VARCHAR(200) DEFAULT NULL,
  SoftwareVendorInfo_SoftwareProduct VARCHAR(200) DEFAULT NULL,
  SoftwareVendorInfo_SoftwareVersion VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQCollection_LocalCode (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQCollection_RefId varchar(36) NOT NULL,
  LocalisedCode varchar(200) NULL,
  Description varchar(200) NULL,
  Element varchar(200) NULL,
  ListIndex MEDIUMINT NULL,
  INDEX `LocalCode_FQCollection_IX` (`FQCollection_RefId`),
  CONSTRAINT `LocalCode_FQCollection_FK` FOREIGN KEY (`FQCollection_RefId`) REFERENCES `FinancialQuestionnaireCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQCollection_RefId varchar(36) NOT NULL,
  EntityLevel VARCHAR(200) DEFAULT NULL,
  SchoolInfoRefId VARCHAR(200) DEFAULT NULL,
  LocalId VARCHAR(200) DEFAULT NULL,
  StateProvinceId VARCHAR(200) DEFAULT NULL,
  CommonwealthId VARCHAR(200) DEFAULT NULL,
  AcaraId VARCHAR(200) DEFAULT NULL,
  EntityName VARCHAR(200) DEFAULT NULL,
  INDEX `FQReporting_FQCollection_IX` (`FQCollection_RefId`),
  CONSTRAINT `FQReporting_FQCollection_FK` FOREIGN KEY (`FQCollection_RefId`) REFERENCES `FinancialQuestionnaireCollection` (`RefId`)
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
  MapReference_MapNumber varchar(200) DEFAULT NULL,
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
  SpatialUnitType varchar(200) DEFAULT NULL,
  StatisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_FQReportingEntityContactAddress_IX` (`FQReporting_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_FQReportingEntityContactAddress_FK` FOREIGN KEY (`FQReporting_EntityContact_Address_Id`) REFERENCES `FQReporting_EntityContact_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_ContextualQuestion (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQReporting_Id MEDIUMINT NOT NULL,
  Context VARCHAR(200) NULL,
  Answer VARCHAR(200) NULL,
  INDEX `ContextualQuestion_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `ContextualQuestion_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_FQItem (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQReporting_Id MEDIUMINT NOT NULL,
  FqItemCode VARCHAR(200) DEFAULT NULL,
  TuitionAmount VARCHAR(200) DEFAULT NULL,
  BoardingAmount VARCHAR(200) DEFAULT NULL,
  SystemAmount VARCHAR(200) DEFAULT NULL,
  DioceseAmount VARCHAR(200) DEFAULT NULL,
  FqComments VARCHAR(2000) DEFAULT NULL,
  INDEX `FQItem_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `FQItem_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table FQReporting_AGRule (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  FQReporting_Id mediumint NOT NULL,
  AGRuleCode VARCHAR(200) DEFAULT NULL,
  AGRuleComment VARCHAR(200) DEFAULT NULL,
  AGRuleResponse VARCHAR(200) DEFAULT NULL,
  AGRuleStatus VARCHAR(200) DEFAULT NULL,
  INDEX `AGRule_FQReporting_IX` (`FQReporting_Id`),
  CONSTRAINT `AGRule_FQReporting_FK` FOREIGN KEY (`FQReporting_Id`) REFERENCES `FQReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCollection (
  RefId VARCHAR(36) NOT NULL PRIMARY KEY,
  StudentAttendanceCollectionYear VARCHAR(200) DEFAULT NULL,
  RoundCode VARCHAR(200) DEFAULT NULL,
  ReportingAuthorityCommonwealthId VARCHAR(200) DEFAULT NULL,
  SoftwareVendorInfo_SoftwareProduct VARCHAR(200) DEFAULT NULL,
  SoftwareVendorInfo_SoftwareVersion VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCollection_LocalCode (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentAttendanceCollection_RefId varchar(36) NOT NULL,
  LocalisedCode varchar(200) NULL,
  Description varchar(200) NULL,
  Element varchar(200) NULL,
  ListIndex MEDIUMINT NULL,
  INDEX `LocalCode_SACollection_IX` (`StudentAttendanceCollection_RefId`),
  CONSTRAINT `LocalCode_SACollection_FK` FOREIGN KEY (`StudentAttendanceCollection_RefId`) REFERENCES `StudentAttendanceCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCollectionReporting (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentAttendanceCollection_RefId varchar(36) NOT NULL,
  EntityLevel VARCHAR(200) NOT NULL,
  SchoolInfo_RefId VARCHAR(36) NOT NULL,
  LocalId VARCHAR(200) NOT NULL,
  StateProvinceId VARCHAR(200) NOT NULL,
  CommonwealthId VARCHAR(200) NOT NULL,
  AcaraId VARCHAR(200) NOT NULL,
  EntityName VARCHAR(200) NOT NULL,
  INDEX `SACReporting_SACollection_IX` (`StudentAttendanceCollection_RefId`),
  CONSTRAINT `SACReporting_SACollection_FK` FOREIGN KEY (`StudentAttendanceCollection_RefId`) REFERENCES `StudentAttendanceCollection` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCR_EntityContact (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentAttendanceCR_Id MEDIUMINT NOT NULL,
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
  INDEX `EntityContact_StudentAttendanceCR_IX` (`StudentAttendanceCR_Id`),
  CONSTRAINT `EntityContact_StudentAttendanceCR_FK` FOREIGN KEY (`StudentAttendanceCR_Id`) REFERENCES `StudentAttendanceCollectionReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCR_EntityContact_Name (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentAttendanceCR_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Name_StudentAttendanceCREntityContact_IX` (`StudentAttendanceCR_EntityContact_Id`),
  CONSTRAINT `Name_StudentAttendanceCREntityContact_FK` FOREIGN KEY (`StudentAttendanceCR_EntityContact_Id`) REFERENCES `StudentAttendanceCR_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCR_EntityContact_Address (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentAttendanceCR_EntityContact_Id MEDIUMINT NOT NULL,
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
  INDEX `Address_StudentAttendanceCREntityContact_IX` (`StudentAttendanceCR_EntityContact_Id`),
  CONSTRAINT `Address_StudentAttendanceCREntityContact_FK` FOREIGN KEY (`StudentAttendanceCR_EntityContact_Id`) REFERENCES `StudentAttendanceCR_EntityContact` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCR_EntityContact_Address_StatisticalArea (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentAttendanceCR_EntityContact_Address_Id MEDIUMINT NOT NULL,
  spatialUnitType varchar(200) DEFAULT NULL,
  statisticalArea varchar(200) DEFAULT NULL,
  INDEX `StatArea_StudentAttendanceCREntityContactAddress_IX` (`StudentAttendanceCR_EntityContact_Address_Id`),
  CONSTRAINT `StatArea_StudentAttendanceCREntityContactAddress_FK` FOREIGN KEY (`StudentAttendanceCR_EntityContact_Address_Id`) REFERENCES `StudentAttendanceCR_EntityContact_Address` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCR_StatsCohortYearLevel (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentAttendanceCR_Id MEDIUMINT NOT NULL,
  YearLevel varchar(200) DEFAULT NULL,
  INDEX `YearLevel_StudentAttendanceCR_IX` (`StudentAttendanceCR_Id`),
  CONSTRAINT `YearLevel_StudentAttendanceCR_FK` FOREIGN KEY (`StudentAttendanceCR_Id`) REFERENCES `StudentAttendanceCollectionReporting` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceCR_YearLevel_StatsCohort (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StatsCohortYearLevel_Id MEDIUMINT NOT NULL,
  StatsCohortId VARCHAR(200) DEFAULT NULL,
  StatsIndigenousStudentType VARCHAR(200) DEFAULT NULL,
  CohortGender VARCHAR(200) DEFAULT NULL,
  DaysInReferencePeriod VARCHAR(200) DEFAULT NULL,
  PossibleSchoolDays VARCHAR(200) DEFAULT NULL,
  AttendanceDays VARCHAR(200) DEFAULT NULL,
  AttendanceLess90Percent VARCHAR(200) DEFAULT NULL,
  AttendanceGTE90Percent VARCHAR(200) DEFAULT NULL,
  PossibleSchoolDaysGT90PercentAttendance VARCHAR(200) DEFAULT NULL,
  INDEX `StatsCohort_YearLevel_IX` (`StatsCohortYearLevel_Id`),
  CONSTRAINT `StatsCohort_YearLevel_FK` FOREIGN KEY (`StatsCohortYearLevel_Id`) REFERENCES `StudentAttendanceCR_StatsCohortYearLevel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus (
  RefId VARCHAR(36) PRIMARY KEY,
  LibraryType VARCHAR(200) DEFAULT NULL,
  PatronRefId VARCHAR(200) DEFAULT NULL,
  PatronLocalId VARCHAR(200) DEFAULT NULL,
  PatronRefObject VARCHAR(200) DEFAULT NULL,
  NumberOfCheckouts VARCHAR(200) DEFAULT NULL,
  NumberOfHoldItems VARCHAR(200) DEFAULT NULL,
  NumberOfOverdues VARCHAR(200) DEFAULT NULL,
  NumberOfFines VARCHAR(200) DEFAULT NULL,
  FineAmount_Amount VARCHAR(200) DEFAULT NULL,
  FineAmount_Currency VARCHAR(200) DEFAULT NULL,
  NumberOfRefunds VARCHAR(200) DEFAULT NULL,
  RefundAmount_Amount VARCHAR(200) DEFAULT NULL,
  RefundAmount_Currency VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_PatronName (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  LibraryPatronStatus_RefId VARCHAR(36) NOT NULL,
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
  INDEX `PatronName_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `PatronName_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_ElectronicId (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  LibraryPatronStatus_RefId VARCHAR(36) NOT NULL,
  ElectronicId VARCHAR(200) DEFAULT NULL,
  ElectronicIdType VARCHAR(200) DEFAULT NULL,
  INDEX `ElectronicId_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `ElectronicId_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_Transaction (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  LibraryPatronStatus_RefId varchar(36) NOT NULL,
  INDEX `Transaction_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `Transaction_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_Transaction_Item (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  Transaction_Id MEDIUMINT NOT NULL,
  Title VARCHAR(200) DEFAULT NULL,
  Author VARCHAR(200) DEFAULT NULL,
  ElectronicId VARCHAR(200) DEFAULT NULL,
  ElectronicIdType VARCHAR(200) DEFAULT NULL,
  CallNumber VARCHAR(200) DEFAULT NULL,
  ISBN VARCHAR(200) DEFAULT NULL,
  Cost_Amount VARCHAR(200) DEFAULT NULL,
  Cost_Currency VARCHAR(200) DEFAULT NULL,
  ReplacementCost_Amount VARCHAR(200) DEFAULT NULL,
  ReplacementCost_Currency VARCHAR(200) DEFAULT NULL,
  ItemType VARCHAR(200) DEFAULT NULL,
  INDEX `Item_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `Item_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_Transaction_Checkout (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  Transaction_Id MEDIUMINT NOT NULL,
  CheckedOutOn VARCHAR(200) DEFAULT NULL,
  ReturnBy VARCHAR(200) DEFAULT NULL,
  RenewalCount VARCHAR(200) DEFAULT NULL,
  INDEX `Checkout_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `Checkout_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_Transaction_HoldInfo (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  Transaction_Id MEDIUMINT NOT NULL,
  DatePlaced VARCHAR(200) DEFAULT NULL,
  DateNeeded VARCHAR(200) DEFAULT NULL,
  ReservationExpiry VARCHAR(200) DEFAULT NULL,
  MadeAvailable VARCHAR(200) DEFAULT NULL,
  Expires VARCHAR(200) DEFAULT NULL,
  HoldType VARCHAR(200) DEFAULT NULL,
  INDEX `HoldInfo_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `HoldInfo_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_Transaction_FineInfo (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  Transaction_Id MEDIUMINT NOT NULL,
  Assessed VARCHAR(200) DEFAULT NULL,
  Description VARCHAR(200) DEFAULT NULL,
  Amount VARCHAR(200) DEFAULT NULL,
  Currency VARCHAR(200) DEFAULT NULL,
  Reference VARCHAR(200) DEFAULT NULL,
  FineType VARCHAR(200) DEFAULT NULL,
  INDEX `FineInfo_LibraryTransaction_IX` (`Transaction_Id`),
  CONSTRAINT `FineInfo_LibraryTransaction_FK` FOREIGN KEY (`Transaction_Id`) REFERENCES `LibraryPatronStatus_Transaction` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_Message (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  LibraryPatronStatus_RefId VARCHAR(36) NOT NULL,
  Sent VARCHAR(200) DEFAULT NULL,
  MessageText VARCHAR(2000) DEFAULT NULL,
  Priority VARCHAR(200) DEFAULT NULL,
  PriorityCodeset VARCHAR(200) DEFAULT NULL,
  INDEX `Message_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `Message_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table LibraryPatronStatus_LocalCode (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  LibraryPatronStatus_RefId varchar(36) NOT NULL,
  LocalisedCode varchar(200) NULL,
  Description varchar(200) NULL,
  Element varchar(200) NULL,
  ListIndex MEDIUMINT NULL,
  INDEX `LocalCode_LibraryPatronStatus_IX` (`LibraryPatronStatus_RefId`),
  CONSTRAINT `LocalCode_LibraryPatronStatus_FK` FOREIGN KEY (`LibraryPatronStatus_RefId`) REFERENCES `LibraryPatronStatus` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;