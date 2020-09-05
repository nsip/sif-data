-- EXAMPLE - This example is a SCHEMA we created for SIF REST Server Perl version

SHOW ERRORS;

-- ----------------------------------------------------------------------
-- NON SIF Objects required
-- ----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CodeSet (
	CodeSet varchar(100),
	CodeKey varchar(250),
	CodeValue varchar(1000)
	-- TODO unique CodeSet,Key and CodeSet,Value?
) ENGINE=InnoDB DEFAULT CHARSET = utf8;

-- ----------------------------------------------------------------------
-- SIF AU Objects
-- ----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SchoolInfo (
	RefId varchar(36) UNIQUE,
	LocalId varchar(200),
	ACARAId varchar(200) default null,
	SchoolName varchar(2000),
	StateProvinceId varchar(200),
	CommonwealthId varchar(200),
	CampusSchoolCampusId varchar(200),
	CampusAdminStatus varchar(100),
	CampusCampusType varchar(100),
	CampusParentSchoolId varchar(100),
	SchoolSector varchar(200),
	OperationalStatus varchar(200),
	IndependentSchool varchar(200),
	SchoolType varchar(200),
	Address_StateProvince varchar(200),
	Address_City varchar(200),
	Address_PostalCode varchar(200),
	Address_Street_StreetNumber varchar(200),
	Address_Street_StreetName varchar(200),
	Address_GridLocation_Longitude varchar(200),
	Address_GridLocation_Latitude varchar(200),
	Address_SchoolGeographicLocation varchar(200),
	Address_ARIA varchar(200),
	Entity_Open varchar(200),
	Entity_Close varchar(200),
	ZoneId varchar(36)
) ENGINE=InnoDB DEFAULT CHARSET = utf8;

-- TODO: Multiple entries
-- SchoolFocusList
-- SchoolFocusList/SchoolFocus
-- SchoolGroupList
-- SchoolGroupList/SchoolGroup
-- AddressList
-- AddressList/Address
-- OtherIdList
-- OtherIdList/OtherId

CREATE TABLE IF NOT EXISTS StudentPersonal (
	RefId varchar(36) PRIMARY KEY,
	LocalId varchar(200),
	FamilyName varchar(2000),
	GivenName varchar(2000),
	MiddleName varchar(2000),
	FullName varchar(2000),
	PreferredGivenName varchar(2000),
	SchoolInfo_RefId varchar(36), -- TODO: Might use StudentSchoolEnrollment
	YearLevel varchar(100),		-- DI
	StateProvinceId varchar(200),
	Sex varchar(200),		-- DI
	BirthDate varchar(200),		-- DI
	IndigenousStatus varchar(200),	-- DI - 1, 2, 3, 4 =
					-- 1  Aboriginal but not Torres Strait Islander Origin
					-- 2  Torres Strait Islander but Not Aboriginal Origin
					-- 3  Both Torres Strait and Aboriginal Origin
					-- 4  Neither Aboriginal or Torres Strait Origin
					-- 9  Not Stated/Unknown
	CountryofBirth varchar(200),
	MostRecent_YearLevel varchar(100),
	MostRecent_Parent1Language varchar(200),
	MostRecent_Parent2Language varchar(200),
	MostRecent_Parent1SchoolEducation varchar(200),
	MostRecent_Parent2SchoolEducation varchar(200),
	MostRecent_Parent1NonSchoolEducation varchar(200),
	MostRecent_Parent2NonSchoolEducation varchar(200),
	MostRecent_Parent1EmploymentType varchar(200),
	MostRecent_Parent2EmploymentType varchar(200),

	-- From #127 - Additions for NAPLAN
	LBOTE varchar(200),
	MostRecent_SchoolLocalId varchar(200),		-- Lookup
	MostRecent_SchoolACARAId varchar(200),
	MostRecent_SchoolCampusId varchar(200),
	MostRecent_HomeroomLocalId varchar(200),
	MostRecent_FTE varchar(200),
	MostRecent_Homegroup varchar(200),
	MostRecent_ClassCode varchar(200),
	MostRecent_MembershipType varchar(200),
	MostRecent_OtherEnrollmentSchoolACARAId varchar(200),
	MostRecent_FFPOS varchar(200),
	MostRecent_ReportingSchool varchar(200),
	MostRecent_OtherSchoolName VARCHAR(200) NULL,
	MostRecent_DisabilityLevelOfAdjustment VARCHAR(200) NULL,
	MostRecent_DisabilityCategory VARCHAR(200) NULL,
	MostRecent_CensusAge VARCHAR(200) NULL,
	MostRecent_DistanceEducationStudent VARCHAR(200) NULL,
	MostRecent_BoardingStatus VARCHAR(200) NULL,
	EducationSupport varchar(200),
	HomeSchooledStudent varchar(200),
	SensitiveData varchar(200),
	ESL varchar(200),

	-- From HITS-Internal/issues/3
	MostRecent_TestLevel varchar(200),
	OfflineDelivery varchar(200),

	PhoneNumber varchar(200),
	Email varchar(200),		-- DI
	OtherId VARCHAR(200),
	OtherIdType Varchar(200),
	Religion VARCHAR(200),
	PreferredFamilyName Varchar(2000),
	ESLSupport VARCHAR(20) NULL,
	InterpreterRequired VARCHAR(20) null,
    PrePrimaryEducation VARCHAR(200) NULL,
    PrePrimaryEducationHours VARCHAR(20) NULL,
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS StudentPersonal_OtherId (
	Id MEDIUMINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	StudentPersonal_RefId varchar(36) DEFAULT NULL,
	OtherId varchar(200) DEFAULT NULL,
	OtherIdType varchar(200) DEFAULT NULL,
	KEY StudentPersonal_RefId (StudentPersonal_RefId),
	CONSTRAINT StudentPersonal_OtherId_ibfk_1 FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- TODO: Lists
-- PersonInfo/Demographics/LanguageList
-- PersonInfo/Demographics/LanguageList/Language
-- OtherIdList
-- OtherIdList/OtherId
-- PersonInfo/AddressList
-- PersonInfo/AddressList/Address
-- PersonalInfo/AddressList/Street/StreetNumber
-- PersonalInfo/AddressList/Street/StreetName
-- PersonalInfo/AddressList/City
-- PersonalInfo/AddressList/StateProvince
-- PersonalInfo/AddressList/PostalCode
-- PersonalInfo/AddressList/GridLocation/Longitude
-- PersonalInfo/AddressList/GridLocation/Latitude
-- PersonInfo/EmailList
-- PersonInfo/EmailList/Email
-- PersonInfo/EmailList/Email/Type

CREATE TABLE IF NOT EXISTS Language (
	RecordNumber MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY, --  auto increment — please make this the primary key: there may be multiple addresses per person, so there is no intrinsic notion of a primary key in this table
	Person_RefId VARCHAR(36), -- joins to StudentPersonal/RefId or StudentContactPersonal/RefId?
	LanguageCode VARCHAR(200),
	LanguageType VARCHAR(200),
	LanguageDialect VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
  InternationalStudent VARCHAR(20) NULL,
  DisabilityLevelOfAdjustment VARCHAR(20) NULL,
  DisabilityCategory VARCHAR(20) NULL,
  CensusAge VARCHAR(20) NULL,
  DistanceEducationStudent VARCHAR(20) NULL,
  BoardingStatus VARCHAR(20) NULL,
  PRIMARY KEY (`RefId`),
  KEY `StudentSchoolEnrollment_StudentPersonal_RefId_IX` (`StudentPersonal_RefId`),
  KEY `StudentSchoolEnrollment_SchoolInfo_RefId_IX` (`SchoolInfo_RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
   UNIQUE INDEX SSE_StudentSubjectChoice_PKX (ID),
   INDEX SSE_StudentSubjectChoice_IX (StudentSchoolEnrollment_RefId),
   CONSTRAINT SSE_StudentSubjectChoice_FK FOREIGN KEY (StudentSchoolEnrollment_RefId) REFERENCES StudentSchoolEnrollment (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

CREATE TABLE IF NOT EXISTS StaffPersonal (
	RefId varchar(36) UNIQUE,
	LocalId varchar(200),
	FamilyName varchar(2000),
	GivenName varchar(2000),
	MiddleName varchar(200),
	PreferredGivenName varchar(200),
	SchoolInfo_RefId varchar(36),	-- Assignment ???
	StateProvinceId varchar(200),
	Sex varchar(200),
	EmploymentStatus varchar(200),
	PhoneNumber varchar(200),
	Email varchar(200),
	BirthDate varchar(200),
	PreferredFamilyName varchar(200),
	FullName varchar(2000),
	-- Check use of Salutation
	Salutation varchar(25),

	-- As per HITS-Internal/Issues/3
	MostRecent_SchoolACARAId varchar(200),
	MostRecent_SchoolLocalId varchar(200),
	MostRecent_LocalCampusId varchar(200),
	InterpreterRequired VARCHAR(20) null,
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StaffPersonal_OtherId (
	StaffPersonal_RefId varchar(36),
	OtherId VARCHAR(200),
	OtherIdType VARCHAR(200),
	FOREIGN KEY (StaffPersonal_RefId) REFERENCES StaffPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- TODO: Lists
-- PersonInfo/PhoneNumberList
-- PersonInfo/PhoneNumberList/PhoneNumber
-- PersonInfo/PhoneNumberList/PhoneNumber/Number
-- PersonInfo/PhoneNumberList/PhoneNumber/Type
-- OtherIdList
-- OtherIdList/OtherId
-- PersonInfo/EmailList
-- PersonInfo/EmailList/Email
-- PersonInfo/EmailList/Email/Type

-- CREATE TABLE IF NOT EXISTS PersonInfo (
--
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- PersonInfo/Address (XXX should this be AddressList ?)

CREATE TABLE IF NOT EXISTS Address (
	RecordNumber MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY, --  auto increment — please make this the primary key: there may be multiple addresses per person, so there is no intrinsic notion of a primary key in this table
	Person_RefId VARCHAR(36), -- joins to StudentPersonal/RefId or StudentContactPersonal/RefId?
	AddressType VARCHAR(200),
	AddressRole VARCHAR(200),
	StreetNumber VARCHAR(200),
	StreetName VARCHAR(200),
	Line1 VARCHAR(200),
	Line2 VARCHAR(200),
	City VARCHAR(200),
	StateProvince VARCHAR(200),
	PostalCode VARCHAR(200),
	Longitude VARCHAR(200),
	Latitude VARCHAR(200)
	-- XXX join to StudentPersonal or StaffPersonal or StudentContactPersonal...
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  AvailableForTimetable VARCHAR(20) NULL,
  PRIMARY KEY (`RefId`),
  KEY `SchoolInfo_RefId_IX` (`SchoolInfo_RefId`),
  KEY `StaffPersonal_RefId_IX` (`StaffPersonal_RefId`),
  CONSTRAINT `StaffAssignment_ibfk_1` FOREIGN KEY (`SchoolInfo_RefId`) REFERENCES `SchoolInfo` (`RefId`),
  CONSTRAINT `StaffAssignment_ibfk_2` FOREIGN KEY (`StaffPersonal_RefId`) REFERENCES `StaffPersonal` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS StudentContactPersonal (
	RefId VARCHAR(36) UNIQUE,
	LocalId VARCHAR(200),
	Title VARCHAR(200),
	FamilyName VARCHAR(200),
	GivenName VARCHAR(200),
	PreferredGivenName VARCHAR(200),
	PreferredFamilyName VARCHAR(200),
	MiddleName VARCHAR(200),
	Sex VARCHAR(200),
	PhoneNumberType VARCHAR(200),
	PhoneNumber VARCHAR(200),
	Email VARCHAR(200),
	EmailType VARCHAR(200),
	SchoolEducationLevel VARCHAR(200),
	NonSchoolEducation VARCHAR(200),
	EmploymentType VARCHAR(200),
	InterpreterRequired VARCHAR(20) null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentContactRelationship (
	RefId VARCHAR(36) UNIQUE,
	StudentPersonal_RefId VARCHAR(36), -- joins to StudentPersonal/RefId
	StudentContactPersonal_RefId VARCHAR(36), -- joins to StudentContactPersonal/RefId
	Relationship VARCHAR(200),
	ParentLegalGuardian VARCHAR(200),
	PickupRights VARCHAR(200),
	LivesWith VARCHAR(200),
	AccessToRecords VARCHAR(200),
	EmergencyContact VARCHAR(200),
	HasCustody VARCHAR(200),
	DisciplinaryContact VARCHAR(200),
	PrimaryCareProvider VARCHAR(200),
	FeesBilling VARCHAR(200),
	FamilyMail VARCHAR(200),
	InterventionOrder VARCHAR(200),
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId),
	FOREIGN KEY (StudentContactPersonal_RefId) REFERENCES StudentContactPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS RoomInfo (
	RefId varchar(36) UNIQUE,
	SchoolInfo_RefId varchar(36),
	RoomNumber varchar(100),
	Description varchar(100),
	Capacity varchar(100),
	RoomSize varchar(100),	-- NOTE: Size is a reserved word, using RoomSize
	RoomType varchar(100),
	LocalId varchar(200),
	AvailableForTimetable VARCHAR(20) NULL,
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TimeTableSubject (
	RefId varchar(36) UNIQUE,
	SubjectLocalId varchar(200),
	AcademicYear varchar(36),
	Faculty varchar(200),
	SubjectShortName varchar(200),
	SubjectLongName varchar(200),
	SubjectType varchar(200),
	SchoolInfo_RefId varchar(36),
	ProposedMinClassSize varchar(100),
	ProposedMaxClassSize varchar(100),
	Semester varchar(100),
	SchoolYear varchar(100),
	academicYearStart VARCHAR(200),
	academicYearEnd varchar(200),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- XXX This needs replacing. OtherCode is not meaningful.
CREATE TABLE IF NOT EXISTS TimeTableSubject_OtherCodeList (
	TimeTableSubject_RefId varchar(36),
	OtherCode varchar(100),
	OtherCode_CodeSet varchar(100),
	FOREIGN KEY (TimeTableSubject_RefId) REFERENCES TimeTableSubject(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TeachingGroup (
	RefId varchar(36) UNIQUE,
	-- ShortName, LongName etc?
	TimeTableSubject_RefId VARCHAR(36) NULL,
	ShortName varchar(200),
	LongName varchar(200),
	LocalId varchar(200),
	SchoolYear varchar(200),
	SchoolInfo_RefId varchar(36),
	KLA varchar(100),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS TeachingGroup_Student (
	TeachingGroup_RefId varchar(36),
	StudentPersonal_RefId varchar(36),
	FOREIGN KEY (TeachingGroup_RefId) REFERENCES TeachingGroup(RefId),
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TeachingGroup_Teacher (
	TeachingGroup_RefId varchar(36),
	StaffPersonal_RefId varchar(36),
	TeacherAssociation  varchar(100),   -- NOTE: This is NOT StaffPersonal.Association
	TeacherLocalId      varchar(100),   -- NOTE: This is NOT StaffPersonal.LocalId - this is a different LocalId
	FOREIGN KEY (TeachingGroup_RefId) REFERENCES TeachingGroup(RefId),
	FOREIGN KEY (StaffPersonal_RefId) REFERENCES StaffPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TimeTable (
	RefId varchar(36) UNIQUE,
	SchoolInfo_RefId varchar(36),
	SchoolYear varchar(200),
	LocalId varchar(200),
	Title varchar(200),
	DaysPerCycle varchar(200),
	PeriodsPerCycle varchar(200),
	TimeTableCreationDate varchar(100),
	StartDate varchar(100),
	EndDate varchar(100),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TimeTable_Day (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	TimeTable_RefId varchar(36) NOT NULL,
	DayId varchar(200) NOT NULL,
	DayTitle varchar(200) NOT NULL,
	FOREIGN KEY (TimeTable_RefId) REFERENCES TimeTable(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TimeTable_Period (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	TimeTable_Day_Id INT(11) NOT NULL,
	TimeTable_RefId varchar(36) NOT NULL,
	DayId varchar(200) NOT NULL,
	PeriodId varchar(200) NOT NULL,
	PeriodTitle varchar(200) NOT NULL,
	BellPeriod varchar(100),
	StartTime varchar(100),
	EndTime varchar(100),
	FOREIGN KEY (TimeTable_Day_Id) REFERENCES TimeTable_Day(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ALTER TABLE `TimeTable_Period`
-- DROP FOREIGN KEY `TimeTable_Period_ibfk_1`;
-- ADD INDEX `TimeTable_Period_ibfk_1_idx` (`TimeTable_Day_Id` ASC);

CREATE TABLE IF NOT EXISTS TimeTableCell (
	RefId varchar(36) UNIQUE,
	TimeTable_RefId varchar(36),
	TimeTableSubject_RefId varchar(36),
	TeachingGroup_RefId varchar(36),
	RoomInfo_RefId varchar(36),
	CellType varchar(200),
	PeriodId varchar(200),
	DayId varchar(200),
	StaffPersonal_RefId varchar(36),
	SchoolInfo_LocalId VARCHAR(200),
	FOREIGN KEY (TimeTable_RefId) REFERENCES TimeTable(RefId),
	FOREIGN KEY (TimeTableSubject_RefId) REFERENCES TimeTableSubject(RefId),
	FOREIGN KEY (TeachingGroup_RefId) REFERENCES TeachingGroup(RefId),
	FOREIGN KEY (RoomInfo_RefId) REFERENCES RoomInfo(RefId),
	FOREIGN KEY (StaffPersonal_RefId) REFERENCES StaffPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- TODO: Consider changing this to be more local styled
--	e.g. just drop SIF_RefId etc, and link one to one?
--	More like a users table in LDAP
CREATE TABLE IF NOT EXISTS Identity (
	RefId varchar(36) UNIQUE,
	SIF_RefId varchar(36),
	SIF_RefObject varchar(50),
	AuthenticationSource varchar(200),
	IdentityAssertions_IdentityAssertion varchar(200),
	SchemaName varchar(200),
	Algorithm varchar(200),
	KeyName varchar(200),
	AuthenticationSourceGlobalUID varchar(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- TODO: List (mutlipel passwords but only one identity - lets just do one?)
--	PasswordList varchar(200),
--	PasswordList/Password varchar(200),

CREATE TABLE IF NOT EXISTS ScheduledActivity (
	RefId varchar(36) UNIQUE,

	SchoolInfo_RefId varchar(36),
	TimeTableCell_RefId varchar(36),
	TimeTable_RefId varchar(36),
	TimeTableSubject_RefId varchar(36),

	DayId varchar(100),
	PeriodId varchar(100),
	Date varchar(100),
	StartTime varchar(100),
	FinishTime varchar(100),
	CellType varchar(100),
	Location varchar(100),
	Type varchar(100),
	Name varchar(100),
	Comment varchar(100),
	YearLevels varchar(100),
	Override varchar(100),
	DateOfOverride varchar(100),

	-- TODO
	-- Addresses
	-- Addresses/Address

	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId),
	FOREIGN KEY (TimeTableCell_RefId) REFERENCES TimeTableCell(RefId),
	FOREIGN KEY (TimeTable_RefId) REFERENCES TimeTable(RefId),
	FOREIGN KEY (TimeTableSubject_RefId) REFERENCES TimeTableSubject(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ScheduledActivity_Student (
	ScheduledActivity_RefId varchar(36),
	StudentPersonal_RefId varchar(36),
	FOREIGN KEY (ScheduledActivity_RefId) REFERENCES ScheduledActivity(RefId),
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ScheduledActivity_Teacher (
	ScheduledActivity_RefId varchar(36),
	StaffPersonal_RefId varchar(36),
	TeacherLocalId varchar(100),      -- LMM added because TT Vendors will supply this
	StartTime varchar(100),
	FinishTime varchar(100),
	Credit varchar(100),
	Supervision varchar(100),
	Weighting varchar(100),
	FOREIGN KEY (ScheduledActivity_RefId) REFERENCES ScheduledActivity(RefId),
	FOREIGN KEY (StaffPersonal_RefId) REFERENCES StaffPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ScheduledActivity_Room (
	ScheduledActivity_RefId varchar(36),
	RoomInfo_RefId varchar(36),
	FOREIGN KEY (ScheduledActivity_RefId) REFERENCES ScheduledActivity(RefId),
	FOREIGN KEY (RoomInfo_RefId) REFERENCES RoomInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS ScheduledActivity_TeachingGroup (
	ScheduledActivity_RefId varchar(36),
	TeachingGroup_RefId varchar(36),
	FOREIGN KEY (ScheduledActivity_RefId) REFERENCES ScheduledActivity(RefId),
	FOREIGN KEY (TeachingGroup_RefId) REFERENCES TeachingGroup(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- NN added 20141014 for Daily Attendance:

CREATE TABLE IF NOT EXISTS CalendarSummary (
	RefId varchar(36) UNIQUE,
	SchoolInfo_RefId varchar(36),
	SchoolYear varchar(200),
	CalendarSummary_LocalId varchar(200),
	DaysInSession varchar(200),
	StartDate varchar(200),
	EndDate varchar(200),
	FirstInstructionDate varchar(200) DEFAULT NULL,
	LastInstructionDate varchar(200) DEFAULT NULL,
	InstructionalMinutes varchar(200) DEFAULT NULL,
	MinutesPerDay varchar(200) DEFAULT NULL,
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS CalendarDate (
	CalendarDate varchar(200),
	CalendarSummary_RefId varchar(36),
	RefId varchar(36) UNIQUE,
	SchoolInfo_RefId varchar(36),
	SchoolYear varchar(200),
	CalendarDateType_Code varchar(200),
	CalendarDateNumber varchar(200),
	StudentAttendance_CountsTowardsAttendance varchar(200),
	StudentAttendance_AttendanceValue varchar(200),
	FOREIGN KEY (CalendarSummary_RefId) REFERENCES CalendarSummary(RefId),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS CalendarDateType_OtherCodeList (
	CalendarDate_RefId varchar(36),
	OtherCode varchar(100),
	OtherCode_CodeSet varchar(100),
	FOREIGN KEY (CalendarDate_RefId) REFERENCES CalendarDate(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS CalendarSummary_YearLevel (
	CalendarSummary_RefId varchar(36) DEFAULT NULL,
	YearLevel varchar(200) DEFAULT NULL,
	KEY CalendarSummary_YearLevel_ibfk_1_idx (CalendarSummary_RefId),
	CONSTRAINT CalendarSummary_YearLevel_ibfk_1
		FOREIGN KEY (CalendarSummary_RefId)
		REFERENCES CalendarSummary (RefId)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentDailyAttendance (
	RefId varchar(36) UNIQUE,
	StudentPersonal_RefId varchar(36),
	SchoolInfo_RefId varchar(36),
	CalendarDate varchar(200),
	SchoolYear varchar(200),
	DayValue varchar(200),
	AttendanceCode varchar(200),
	AttendanceStatus varchar(200),
	TimeIn varchar(200),
	TimeOut varchar(200),
	AbsenceValue varchar(200),
	AttendanceNote varchar(200),
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentAttendanceSummary (
	StudentPersonal_RefId varchar(36),
	SchoolInfo_RefId varchar(36),
	SchoolYear varchar(200),
	StartDate varchar(200),
	EndDate varchar(200),
	RefId varchar(36) UNIQUE,
	StartDay varchar(200),
	EndDay varchar(200),
	FTE varchar(200),
	DaysAttended varchar(200),
	ExcusedAbsences varchar(200),
	UnexcusedAbsences varchar(200),
	DaysTardy varchar(200),
	DaysInMembership varchar(200),
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS SessionInfo (
	RefId varchar(36) DEFAULT NULL,
	SchoolInfo_RefId varchar(36) DEFAULT NULL,
	TimeTableCell_RefId varchar(36) DEFAULT NULL,
	SchoolYear varchar(200) DEFAULT NULL,
	LocalId varchar(200) DEFAULT NULL,
	TimeTableSubjectLocalId varchar(200) DEFAULT NULL,
	TeachingGroupLocalId varchar(200) DEFAULT NULL,
	SchoolLocalId varchar(200) DEFAULT NULL,
	StaffPersonalLocalId varchar(200) DEFAULT NULL,
	RoomNumber varchar(200) DEFAULT NULL,
	DayId varchar(200) DEFAULT NULL,
	PeriodId varchar(200) DEFAULT NULL,
	SessionDate varchar(200) DEFAULT NULL,
	StartTime varchar(200) DEFAULT NULL,
	FinishTime varchar(200) DEFAULT NULL,
	RollMarked varchar(200) DEFAULT NULL,
	UNIQUE KEY RefId (RefId),
	KEY SessionInfo_ibfk_1_idx (SchoolInfo_RefId),
	KEY SessionInfo_ibfk_2_idx (TimeTableCell_RefId),
	CONSTRAINT SessionInfo_ibfk_1 FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo (RefId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT SessionInfo_ibfk_2 FOREIGN KEY (TimeTableCell_RefId) REFERENCES TimeTableCell (RefId) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentPeriodAttendance (
	RefId varchar(36) DEFAULT '',
	StudentPersonal_RefId varchar(36) DEFAULT NULL,
	SchoolInfo_RefId varchar(36) DEFAULT NULL,
	CalendarDate varchar(200) DEFAULT NULL,
	SessionInfo_RefId varchar(36) DEFAULT NULL,
	TimetablePeriod varchar(200) DEFAULT NULL,
	TimeIn varchar(200) DEFAULT NULL,
	TimeOut varchar(200) DEFAULT NULL,
	AttendanceCode varchar(200) DEFAULT NULL,
	AttendanceStatus varchar(200) DEFAULT NULL,
	SchoolYear varchar(200) DEFAULT NULL,
	CreationUser_Type varchar(200) DEFAULT NULL,
	AuditInfo_CreationUser_UserId varchar(200) DEFAULT NULL,
	AuditInfo_CreationDateTime varchar(200) DEFAULT NULL,
	AttendanceComment varchar(200) DEFAULT NULL,
	UNIQUE KEY RefId (RefId),
	KEY StudentPeriodAttendance_ibfk_1_idx (StudentPersonal_RefId),
	KEY StudentPeriodAttendance_ibfk_2_idx (SchoolInfo_RefId),
	KEY StudentPeriodAttendance_ibfk_3_idx (SessionInfo_RefId),
	CONSTRAINT StudentPeriodAttendance_ibfk_1 FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo (RefId),
	CONSTRAINT StudentPeriodAttendance_ibfk_2 FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal (RefId),
	CONSTRAINT StudentPeriodAttendance_ibfk_3 FOREIGN KEY (SessionInfo_RefId) REFERENCES SessionInfo (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentAttendanceTimeList (
	RefId varchar(36) UNIQUE,
	StudentPersonal_RefId varchar(36) DEFAULT NULL,
	SchoolInfo_RefId varchar(36) DEFAULT NULL,
	SchoolYear varchar(10),
	AttendanceTimeListDate varchar(100),	-- Note field change, Date not valid SQL
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentAttendanceTimeList_AttendanceTime (
	id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	StudentAttendanceTimeList_RefId varchar(36) DEFAULT '',
	AttendanceStatus varchar(100),
	StartTime varchar(100),
	EndTime varchar(100),
	AttendanceNote varchar(100),
	AttendanceType varchar(200) DEFAULT NULL,
	DurationValue varchar(200) DEFAULT NULL,
	TimeTableSubject_RefId varchar(36) DEFAULT NULL,

	FOREIGN KEY (StudentAttendanceTimeList_RefId) REFERENCES StudentAttendanceTimeList(RefId),
	FOREIGN KEY (TimeTableSubject_RefId) REFERENCES TimeTableSubject(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentAttendanceTimeList_AttendanceTime_OtherCode (
	Id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	StudentAttendanceTimeList_AttendanceTime_id MEDIUMINT NOT NULL,
	OtherCode varchar(100),
	OtherCode_CodeSet varchar(100),
	FOREIGN KEY (StudentAttendanceTimeList_AttendanceTime_id) REFERENCES StudentAttendanceTimeList_AttendanceTime(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------------------------------------------------
-- Financial
-- ----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS LocationInfo (
	-- Note: address information in LocationInfo should go into the new Address table created in #128
	RefId  VARCHAR(36) PRIMARY KEY,
	LocationType  VARCHAR(200),
	SiteCategory  VARCHAR(200),
	Name VARCHAR(200),
	Description VARCHAR(200),
	LocalId  VARCHAR(200),
	StateProvinceId  VARCHAR(200),
	Parent_LocationInfo_RefId  VARCHAR(36), -- — joins to LocationInfo/RefId?,
	SchoolInfo_RefId  VARCHAR(36), -- — joins to SchoolInfo/RefId?,
	PhoneNumber  VARCHAR(200),
	FOREIGN KEY (Parent_LocationInfo_RefId) REFERENCES LocationInfo(RefId),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PurchaseOrder (
	RefId  VARCHAR(36) PRIMARY KEY,
    LocalId VARCHAR(200) DEFAULT NULL,
	FormNumber  VARCHAR(200),
	VendorInfo_RefId  VARCHAR(36), -- — joins to VendorInfo/RefId?,
	LocationInfo_RefId  VARCHAR(36), -- — joins to LocationInfo/RefId?,
	EmployeePersonal_RefId  VARCHAR(36), -- — joins to StaffPersonal/RefId?,
	CreationDate  VARCHAR(200),
	TaxRate  VARCHAR(200),
	TaxAmount  VARCHAR(200),
	AmountDelivered  VARCHAR(200),
	UpdateDate  VARCHAR(200),
	FullyDelivered  VARCHAR(200),
	FOREIGN KEY (EmployeePersonal_RefId) REFERENCES StaffPersonal(RefId),
	FOREIGN KEY (LocationInfo_RefId) REFERENCES LocationInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Invoice (
	RefId  VARCHAR(36) PRIMARY KEY,
    LocalId VARCHAR(200) DEFAULT NULL,
	InvoicedEntity  VARCHAR(36), -- joins to either Debtor/RefId or PurchaseOrder/RefId?, (XXX see below)
	InvoicedEntity_SIFRefObject VARCHAR(200),	-- XXX Difficult SQL Referential Integrity !!!
	BillingDate  VARCHAR(200),
	TransactionDescription  VARCHAR(200),
	BilledAmount  VARCHAR(200),
	BilledAmountType  VARCHAR(200),
	Ledger VARCHAR(200),
	LocationInfo_RefId  VARCHAR(36), -- joins to LocationInfo?,
	TaxRate  VARCHAR(200),
	TaxType  VARCHAR(200),
	TaxAmount  VARCHAR(200),
	CreatedBy  VARCHAR(200),
	ApprovedBy  VARCHAR(200),
	ItemDetail  VARCHAR(200),
	DueDate  VARCHAR(200),
	AccountingPeriod  VARCHAR(200),
	Related_PurchaseOrder_RefId  VARCHAR(36), -- joins to PurchaseOrder/RefId?,
	Voluntary VARCHAR(200),
	FormNumber VARCHAR(200),
	FOREIGN KEY (LocationInfo_RefId) REFERENCES LocationInfo(RefId),
	FOREIGN KEY (Related_PurchaseOrder_RefId) REFERENCES PurchaseOrder(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Invoice_AccountCode (
    -- This is a 1:n join of Invoice to FinancialAccount?
    Invoice_RefId  VARCHAR(36), -- joins to Invoice/RefId?,
    AccountCode  VARCHAR(200),
    FOREIGN KEY (Invoice_RefId) REFERENCES Invoice(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FinancialClass (
	RefId VARCHAR(36) PRIMARY KEY,
	Name VARCHAR(200),
	Description VARCHAR(200),
	ClassType  VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FinancialAccount (
	RefId  VARCHAR(36) PRIMARY KEY,
    LocalId VARCHAR(200) DEFAULT NULL,
	SubAccount_RefId  VARCHAR(36), -- joins to FinancialAccount/RefId?,
	LocationInfo_RefId  VARCHAR(36), -- joins to LocationInfo/RefId?,
	AccountNumber  VARCHAR(200),
	Name VARCHAR(200),
	Description VARCHAR(200),
	FinancialClass_RefId  VARCHAR(36), -- joins to FinancialClass/RefId?,
	CreationDate  VARCHAR(200),
	CreationTime  VARCHAR(200),
	ClassType VARCHAR(200),
    AccountCode VARCHAR(200) DEFAULT NULL,
	FOREIGN KEY (LocationInfo_RefId) REFERENCES LocationInfo(RefId),
	FOREIGN KEY (SubAccount_RefId) REFERENCES FinancialAccount(RefId),
	FOREIGN KEY (FinancialClass_RefId) REFERENCES FinancialClass(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Invoice_FinancialAccount (
	-- This is a 1:n join of Invoice to FinancialAccount?
	Invoice_RefId  VARCHAR(36), -- joins to Invoice/RefId?,
	FinancialAccount_RefId  VARCHAR(36), -- joins to FinancialAccount/RefId?,
	FOREIGN KEY (Invoice_RefId) REFERENCES Invoice(RefId),
	FOREIGN KEY (FinancialAccount_RefId) REFERENCES FinancialAccount(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Debtor (
	-- Note: address information should go into the new Address table created in #128
	RefId  VARCHAR(36) PRIMARY KEY,
    LocalId VARCHAR(200) DEFAULT NULL,
	BilledEntity  VARCHAR(36), -- — joins to either VendorInfo/RefId or StudentContactPersonal/RefId?,
	BilledEntity_SIFRefObject VARCHAR(200),	-- XXX Bad DB structure for SQL (see above too)
	BillingName  VARCHAR(200),
	BillingNote  VARCHAR(200),
	Discount VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS VendorInfo (
	-- Note: address information in LocationInfo/ContactInfo should go into the new Address table created in #128
	RefId  VARCHAR(36) PRIMARY KEY,
    LocalId VARCHAR(200) DEFAULT NULL,
	Name VARCHAR(200),
	ContactInfo_FamilyName VARCHAR(200),
	ContactInfo_GivenName VARCHAR(200),
	ContactInfo_MiddleName VARCHAR(200),
	ContactInfo_PositionTitle VARCHAR(200),
	ContactInfo_Role VARCHAR(200),
	ContactInfo_Email VARCHAR(200),
	ContactInfo_PhoneNumber VARCHAR(200),
	CustomerId  VARCHAR(200),
	ABN VARCHAR(200),
	RegisteredForGST VARCHAR(200),
	PaymentTerms  VARCHAR(200),
	BPay VARCHAR(200),
	BSB VARCHAR(200),
	AccountNumber  VARCHAR(200),
	AccountName  VARCHAR(200),
    ContactInfo_Qualifications VARCHAR(200) NULL,
    ContactInfo_RegistrationDetails VARCHAR(200) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PaymentReceipt (
	RefId  VARCHAR(36) PRIMARY KEY,
    LocalId VARCHAR(200) DEFAULT NULL,
	TransactionType  VARCHAR(200),
	Invoice_RefId  VARCHAR(36), -- — joins to Invoice/RefId?,
	VendorInfo_RefId  VARCHAR(36), -- — joins to VendorInfo/RefId?,
	Debtor_RefId  VARCHAR(36), -- — joins to Debtor/RefId?,
	PurchaseOrder_RefId  VARCHAR(36), -- — joins to PurchaseOrder/RefId?,
	LocationInfo_RefId  VARCHAR(36), -- — joins to LocationInfo/RefId?,
	TransactionDate  VARCHAR(200),
	ReceivedAmount  VARCHAR(200),
	ReceivedAmountType  VARCHAR(200),
	ReceivedTransactionId  VARCHAR(200),
	TransactionDescription  VARCHAR(200),
	TaxRate  VARCHAR(200),
	TaxAmount  VARCHAR(200),
	TransactionMethod  VARCHAR(200),
	ChequeNumber  VARCHAR(200),
	TransactionNote  VARCHAR(200),
	AccountingPeriod  VARCHAR(200),
	FOREIGN KEY (Invoice_RefId) REFERENCES Invoice(RefId),
	FOREIGN KEY (VendorInfo_RefId) REFERENCES VendorInfo(RefId),
	FOREIGN KEY (Debtor_RefId) REFERENCES Debtor(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PaymentReceipt_FinancialAccount (
	-- This is a 1:n join of PaymentReceipt to FinancialAccount?
	PaymentReceipt_RefId  VARCHAR(36), -- — joins to PaymentReceipt/RefId?,
	FinancialAccount_RefId  VARCHAR(36), -- — joins to FinancialAccount/RefId?,
	FOREIGN KEY (PaymentReceipt_RefId) REFERENCES PaymentReceipt(RefId),
	FOREIGN KEY (FinancialAccount_RefId) REFERENCES FinancialAccount(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PaymentReceipt_AccountCode (
    PaymentReceipt_RefId  VARCHAR(36),
    AccountCode  VARCHAR(200),
    FOREIGN KEY (PaymentReceipt_RefId) REFERENCES PaymentReceipt(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PaymentReceipt_PaymentReceiptLine (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    PaymentReceipt_RefId  VARCHAR(36),
    Invoice_RefId  VARCHAR(36) DEFAULT NULL,
    LocalId    VARCHAR(200) DEFAULT NULL,
    LocalPaymentReceiptLineId    VARCHAR(200) DEFAULT NULL,
    TransactionAmount_Value VARCHAR(200) DEFAULT NULL,
    TransactionAmount_Type  VARCHAR(200) DEFAULT NULL,
    FinancialAccount_RefId  VARCHAR(36) DEFAULT NULL,
    AccountCode  VARCHAR(200) DEFAULT NULL,
    TransactionDescription VARCHAR(200) DEFAULT NULL,
    TaxRate VARCHAR(200) DEFAULT NULL,
    TaxAmount VARCHAR(200) DEFAULT NULL,
    FOREIGN KEY (PaymentReceipt_RefId) REFERENCES PaymentReceipt(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PurchaseOrder_PurchasingItems (
	-- This is a 1:n join of PurchaseOrder to the PurchaseOrder/PurchasingItems/PurchasingItem entry
	PurchaseOrder_RefId  VARCHAR(36), -- — joins to PurchaseOrder/RefId?,
	Id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    LocalItemId varchar(200) DEFAULT NULL,
	ItemNumber  VARCHAR(200),
	ItemDescription  VARCHAR(200),
	Quantity VARCHAR(200),
	UnitCost  VARCHAR(200),
	QuantityDelivered  VARCHAR(200),
	FOREIGN KEY (PurchaseOrder_RefId) REFERENCES PurchaseOrder(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PurchaseOrder_PurchasingItem_ExpenseAccount (
	-- This is a 1:n join of PurchaseOrder_PurchasingItems to the PurchaseOrder/PurchasingItems/PurchasingItem/ExpenseAccounts/ExpenseAccount entry
	PurchasingItemId MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- — joins to PurchaseOrder_PurchasingItems/Id
	AccountCode  VARCHAR(200),
	Amount VARCHAR(200),
	FinancialAccount_RefId  VARCHAR(36), -- — joins to FinancialAccount/RefId?,
	AccountingPeriod  VARCHAR(200),
	FOREIGN KEY (FinancialAccount_RefId) REFERENCES FinancialAccount(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Journal (
	RefId  VARCHAR(36) PRIMARY KEY,
    LocalId varchar(200) DEFAULT NULL,
	Debit_FinancialAccount_RefId  VARCHAR(36), -- — joins to FinancialAccount/RefId?,
    Debit_AccountCode varchar(200) DEFAULT NULL,
	Credit_FinancialAccount_RefId  VARCHAR(36), -- — joins to FinancialAccount/RefId?,
    Credit_AccountCode varchar(200) DEFAULT NULL,
	OriginatingTransaction_RefId  VARCHAR(36), -- — joins to either Invoice/RefId?, PaymentReceipt/RefId?, or PurchaseOrder/RefId?,
	OriginatingTransaction_RefId_SIFRefObject VARCHAR(200),	-- XXX SQL ref integrity issues
	Amount VARCHAR(200),
	GSTCodeOriginal VARCHAR(200),
	GSTCodeReplacement VARCHAR(200),
	Note VARCHAR(200),
	CreatedDate  VARCHAR(200),
	ApprovedDate  VARCHAR(200),
	CreatedBy  VARCHAR(200),
	ApprovedBy  VARCHAR(200),
	FinancialClass_RefId  VARCHAR(36), -- — joins to FinancialClass/RefId?,
	FOREIGN KEY (Debit_FinancialAccount_RefId) REFERENCES FinancialAccount(RefId),
	FOREIGN KEY (Credit_FinancialAccount_RefId) REFERENCES FinancialAccount(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS Journal_JournalAdjustment (
    id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
    Journal_RefId  VARCHAR(36),
    Debit_FinancialAccount_RefId  VARCHAR(36) DEFAULT NULL,
    Credit_FinancialAccount_RefId  VARCHAR(36) DEFAULT NULL,
    DebitAccountCode    VARCHAR(200) DEFAULT NULL,
    CreditAccountCode    VARCHAR(200) DEFAULT NULL,
    GSTCodeOriginal    VARCHAR(200) DEFAULT NULL,
    GSTCodeReplacement VARCHAR(200) DEFAULT NULL,
    LineAdjustmentAmount  VARCHAR(200) DEFAULT NULL,
    FOREIGN KEY (Journal_RefId) REFERENCES Journal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Gradding and Scores

CREATE TABLE IF NOT EXISTS GradingAssignment (
	RefId VARCHAR(36) PRIMARY KEY,
	TeachingGroup_RefId VARCHAR(36), -- joins to TeachingGroup/RefId?
	GradingCategory VARCHAR(200),
	Description VARCHAR(200),
	PointsPossible VARCHAR(200),
	CreateDate VARCHAR(200),
	DueDate VARCHAR(200),
	Weight VARCHAR(200),
	MaxAttemptsAllowed VARCHAR(200),
	DetailedDescriptionURL VARCHAR(200),
	FOREIGN KEY (TeachingGroup_RefId) REFERENCES TeachingGroup(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS GradingAssignmentScore (
	RefId VARCHAR(36) PRIMARY KEY,
	StudentPersonal_RefId VARCHAR(36), -- joins to StudentPersonal/RefId?
	TeachingGroup_RefId VARCHAR(36), -- joins to TeachingGroup/RefId?
	GradingAssignment_RefId VARCHAR(36), -- joins to GradingAssignment/RefId?
	ScorePoints VARCHAR(200),
	ScorePercent VARCHAR(200),
	ScoreLetter VARCHAR(200),
	ScoreDescription VARCHAR(200),
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId),
	FOREIGN KEY (TeachingGroup_RefId) REFERENCES TeachingGroup(RefId),
	FOREIGN KEY (GradingAssignment_RefId) REFERENCES GradingAssignment(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PersonPicture` (
  `RefId` varchar(36) NOT NULL,
  `ParentObject_RefId` varchar(36) DEFAULT NULL,
  `ParentObjectRefId_SIF_RefObject` varchar(200) DEFAULT NULL,
  `SchoolYear` varchar(200) DEFAULT NULL,
  `PictureSource` text DEFAULT NULL,
  `PictureSourceType` varchar(200) DEFAULT NULL,
  `OKToPublish` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PersonPicture_PublishingPermission (
   ID INT(11) NOT NULL AUTO_INCREMENT,
   PersonPicture_RefId VARCHAR(36) NOT NULL,
   PermissionCategory VARCHAR(200),
   PermissionValue VARCHAR(200),
   PRIMARY KEY (id),
   INDEX PP_PublishingPermission_IX (PersonPicture_RefId),
   CONSTRAINT PP_PublishingPermission_FK FOREIGN KEY (PersonPicture_RefId) REFERENCES PersonPicture (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;

-- NAPLAN start
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

CREATE TABLE `NAPEventStudentLink_TestDisruption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPEventStudentLink_RefId` varchar(36) NOT NULL,
  `Event` varchar(2000) DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NAPEventStudentLink_TestDisruption_IX` (`NAPEventStudentLink_RefId`),
  CONSTRAINT `NAPEventStudentLink_TestDisruption_FK` FOREIGN KEY (`NAPEventStudentLink_RefId`) REFERENCES `NAPEventStudentLink` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `NAPEventStudentLink_Adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPEventStudentLink_RefId` varchar(36) NOT NULL,
  `BookletType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NAPEventStudentLink_Adjustment_FK_idx` (`NAPEventStudentLink_RefId`),
  CONSTRAINT `NAPEventStudentLink_Adjustment_FK` FOREIGN KEY (`NAPEventStudentLink_RefId`) REFERENCES `NAPEventStudentLink` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `NAPEventStudentLink_Adjustment_PNPCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Adjustment_Id` int(11) DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Adjustment_PNPCode_FK_idx` (`Adjustment_Id`),
  CONSTRAINT `Adjustment_PNPCode_FK` FOREIGN KEY (`Adjustment_Id`) REFERENCES `NAPEventStudentLink_Adjustment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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

CREATE TABLE `NAPTestItem_ContentDescription` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `ContentDescription` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ContentDescription_TestItem_FK_idx` (`NAPTestItem_RefId`),
  CONSTRAINT `ContentDescription_TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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

CREATE TABLE `ItemSubstitutedFor_PNPCode` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemSubstitutedFor_Id` int(11) NOT NULL,
  `Code` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ItemSubstitutedFor_FK_idx` (`ItemSubstitutedFor_Id`),
  CONSTRAINT `ItemSubstitutedFor_FK` FOREIGN KEY (`ItemSubstitutedFor_Id`) REFERENCES `NAPTestItem_SubstituteItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `NAPTestItem_NAPWritingRubric_Score` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPWritingRubric_Id` int(11) NOT NULL,
  `MaxScoreValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Score_WritingRubric_FK_idx` (`NAPWritingRubric_Id`),
  CONSTRAINT `Score_WritingRubric_FK` FOREIGN KEY (`NAPWritingRubric_Id`) REFERENCES `NAPTestItem_NAPWritingRubric` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `NAPTestItem_NAPWritingRubric_Score_ScoreDescription` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Score_Id` int(11) NOT NULL,
  `Descriptor` varchar(2000) DEFAULT NULL,
  `ScoreValue` varchar(200) DEFAULT NULL,
  `ScoreCommentCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ScoreDescription_Score_FK_idx` (`Score_Id`),
  CONSTRAINT `ScoreDescription_Score_FK` FOREIGN KEY (`Score_Id`) REFERENCES `NAPTestItem_NAPWritingRubric_Score` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `NAPStudentResponseSet_Testlet_TestItem_Subscore` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ResponseTestItem_Id` int(11) NOT NULL,
  `SubscoreType` varchar(200) DEFAULT NULL,
  `SubscoreValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Subscore_ResponseTestItem_FK_idx` (`ResponseTestItem_Id`),
  CONSTRAINT `Subscore_ResponseTestItem_FK` FOREIGN KEY (`ResponseTestItem_Id`) REFERENCES `NAPStudentResponseSet_Testlet_TestItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `NAPCodeFrame` (
  `RefId` varchar(36) NOT NULL,
  `NAPTest_RefId` varchar(36) NOT NULL,
  PRIMARY KEY (`RefId`),
  KEY `NAPCodeFrame_NAPTest_FK_idx` (`NAPTest_RefId`),
  CONSTRAINT `NAPCodeFrame_NAPTest_FK` FOREIGN KEY (`NAPTest_RefId`) REFERENCES `NAPTest` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table PersonalisedPlan (
RefId varchar(36) NOT NULL,
LocalId varchar(200) DEFAULT NULL,
StudentPersonal_RefId varchar(36) DEFAULT NULL,
SchoolInfo_RefId varchar(36) DEFAULT NULL,
PersonalisedPlanCategory varchar(200) DEFAULT NULL,
PersonalisedPlanStartDate varchar(200) DEFAULT NULL,
PersonalisedPlanEndDate varchar(200) DEFAULT NULL,
PersonalisedPlanReviewDate varchar(200) DEFAULT NULL,
PersonalisedPlanNotes varchar(1000) DEFAULT NULL,
AssociatedAttachment varchar(200) DEFAULT NULL,
PRIMARY KEY (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table PersonalisedPlan_Document (
PersonalisedPlan_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
Location varchar(200) DEFAULT NULL,
Sensitivity varchar(200) DEFAULT NULL,
URL varchar(200) DEFAULT NULL,
DocumentType varchar(200) DEFAULT NULL,
DocumentReviewDate varchar(200) DEFAULT NULL,
DocumentDescription varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY PersonalisedPlan_Document_IX (PersonalisedPlan_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table WellbeingResponse (
RefId varchar(36) NOT NULL,
LocalId varchar(200) DEFAULT NULL,
StudentPersonal_RefId varchar(36) DEFAULT NULL,
SchoolInfo_RefId varchar(36) DEFAULT NULL,
Date varchar(200) DEFAULT NULL,
WellbeingResponseStartDate varchar(200) DEFAULT NULL,
WellbeingResponseEndDate varchar(200) DEFAULT NULL,
WellbeingResponseCategory varchar(200) DEFAULT NULL,
WellbeingResponseNotes varchar(1000) DEFAULT NULL,
SuspensionContainer_SuspensionCategory varchar(200) DEFAULT NULL,
SuspensionContainer_Duration varchar(200) DEFAULT NULL,
SuspensionContainer_AdvisementDate varchar(200) DEFAULT NULL,
SuspensionContainer_ResolutionMeetingTime varchar(200) DEFAULT NULL,
SuspensionContainer_ResolutionNotes varchar(1000) DEFAULT NULL,
SuspensionContainer_EarlyReturnDate varchar(200) DEFAULT NULL,
SuspensionContainer_Status varchar(200) DEFAULT NULL,
SuspensionContainer_SuspensionNotes varchar(1000) DEFAULT NULL,
DetentionContainer_DetentionCategory varchar(200) DEFAULT NULL,
DetentionContainer_DetentionDate varchar(200) DEFAULT NULL,
DetentionContainer_DetentionLocation varchar(200) DEFAULT NULL,
DetentionContainer_DetentionNotes varchar(1000) DEFAULT NULL,
DetentionContainer_Status varchar(200) DEFAULT NULL,
PlanRequiredContainer_Status varchar(200) DEFAULT NULL,
AwardContainer_AwardDate  varchar(200) DEFAULT NULL,
AwardContainer_AwardType  varchar(200) DEFAULT NULL,
AwardContainer_AwardDescription  varchar(200) DEFAULT NULL,
AwardContainer_AwardNotes  varchar(1000) DEFAULT NULL,
AwardContainer_Status varchar(200) DEFAULT NULL,
OtherWellbeingResponseContainer_OtherResponseDate  varchar(200) DEFAULT NULL,
OtherWellbeingResponseContainer_OtherResponseType  varchar(200) DEFAULT NULL,
OtherWellbeingResponseContainer_OtherResponseDescription  varchar(200) DEFAULT NULL,
OtherWellbeingResponseContainer_OtherResponseNotes  varchar(1000) DEFAULT NULL,
OtherWellbeingResponseContainer_Status  varchar(200) DEFAULT NULL,
PRIMARY KEY (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingResponse_SuspensionContainer_WithdrawalTime (
WellbeingResponse_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
WithdrawalDate  varchar(200) DEFAULT NULL,
WithdrawalStartTime  varchar(200) DEFAULT NULL,
WithdrawalEndTime  varchar(200) DEFAULT NULL,
TimeTableSubject_RefId  varchar(36) DEFAULT NULL,
ScheduledActivity_RefId  varchar(36) DEFAULT NULL,
TimeTableCell_RefId  varchar(36) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingResponse_Document_IX (WellbeingResponse_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingResponse_PlanRequiredContainer_PlanRequired (
WellbeingResponse_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
PersonalisedPlan_RefId  varchar(36) DEFAULT NULL,
PlanNotes  varchar(1000) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingResponse_Document_IX (WellbeingResponse_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingResponse_PersonInvolvement (
WellbeingResponse_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
PersonRefId varchar(36) DEFAULT NULL,
PersonRefId_SIF_RefObject varchar(200) DEFAULT NULL,
ShortName varchar(200) DEFAULT NULL,
HowInvolved varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingResponse_Document_IX (WellbeingResponse_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingResponse_Document (
WellbeingResponse_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
Location varchar(200) DEFAULT NULL,
Sensitivity varchar(200) DEFAULT NULL,
URL varchar(200) DEFAULT NULL,
DocumentType varchar(200) DEFAULT NULL,
DocumentReviewDate varchar(200) DEFAULT NULL,
DocumentDescription varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingResponse_Document_IX (WellbeingResponse_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




create table WellbeingEvent (
RefId varchar(36) NOT NULL,
StudentPersonal_RefId varchar(36) DEFAULT NULL,
SchoolInfo_RefId varchar(36) DEFAULT NULL,
EventId  varchar(200) DEFAULT NULL,
WellbeingEventNotes  varchar(1000) DEFAULT NULL,
WellbeingEventCategoryClass  varchar(200) DEFAULT NULL,
ReportingStaffRefId  varchar(36) DEFAULT NULL,
WellbeingEventCreationTimeStamp  varchar(200) DEFAULT NULL,
WellbeingEventDate  varchar(200) DEFAULT NULL,
WellbeingEventTime  varchar(200) DEFAULT NULL,
WellbeingEventDescription  varchar(200) DEFAULT NULL,
WellbeingEventTimePeriod  varchar(200) DEFAULT NULL,
WellbeingEventLocationDetails_EventLocation varchar(200) DEFAULT NULL,
WellbeingEventLocationDetails_Class varchar(200) DEFAULT NULL,
WellbeingEventLocationDetails_FurtherLocationNotes varchar(1000) DEFAULT NULL,
ConfidentialFlag  varchar(200) DEFAULT NULL,
Status  varchar(200) DEFAULT NULL,
GroupIndicator VARCHAR(20) DEFAULT NULL,
PRIMARY KEY (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingEvent_Document (
WellbeingEvent_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
Location varchar(200) DEFAULT NULL,
Sensitivity varchar(200) DEFAULT NULL,
URL varchar(200) DEFAULT NULL,
DocumentType varchar(200) DEFAULT NULL,
DocumentReviewDate varchar(200) DEFAULT NULL,
DocumentDescription varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingEvent_Document_IX (WellbeingEvent_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingEvent_Category (
WellbeingEvent_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
EventCategory varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingEvent_Category_IX (WellbeingEvent_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingEvent_Subcategory (
WellbeingEvent_RefId varchar(36) NOT NULL,
WellbeingEvent_CategoryId int(11) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
EventCategory varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingEvent_Subcategory_IX (WellbeingEvent_RefId),
KEY WellbeingEvent_Subcategory_Category_IX (WellbeingEvent_CategoryId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- CONSTRAINT WellbeingEvent_Subcategory_Category_IX FOREIGN KEY WellbeingEvent_CategoryId REFERENCES WellbeingEvent_Category

create table WellbeingEvent_PersonInvolvement (
WellbeingEvent_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
PersonRefId varchar(36) DEFAULT NULL,
PersonRefId_SIF_RefObject varchar(200) DEFAULT NULL,
ShortName varchar(200) DEFAULT NULL,
HowInvolved varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingEvent_PersonInvolvement_IX (WellbeingEvent_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingEvent_FollowupAction (
WellbeingEvent_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
WellbeingResponse_RefId varchar(36) DEFAULT NULL,
FollowUpDetails varchar(1000) DEFAULT NULL,
FollowUpActionCategory varchar(200) DEFAULT NULL,
PRIMARY KEY (id),
KEY WellbeingEvent_FollowupAction_IX (WellbeingEvent_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingCharacteristic (
RefId varchar(36) NOT NULL,
LocalId varchar(200) DEFAULT NULL,
StudentPersonal_RefId varchar(36) DEFAULT NULL,
SchoolInfo_RefId varchar(36) DEFAULT NULL,
WellbeingCharacteristicClassification varchar(200) DEFAULT NULL,
WellbeingCharacteristicStartDate varchar(200) DEFAULT NULL,
WellbeingCharacteristicEndDate varchar(200) DEFAULT NULL,
WellbeingCharacteristicReviewDate varchar(200) DEFAULT NULL,
WellbeingCharacteristicNotes varchar(1000) DEFAULT NULL,
WellbeingCharacteristicCategory varchar(200) DEFAULT NULL,
WellbeingCharacteristicSubcategory varchar(200) DEFAULT NULL,
WellbeingCharacteristicLocalCharacteristicCode varchar(200) DEFAULT NULL,
WellbeingCharacteristicCharacteristicSeverity varchar(200) DEFAULT NULL,
WellbeingCharacteristicDailyManagement varchar(200) DEFAULT NULL,
WellbeingCharacteristicEmergencyManagement varchar(200) DEFAULT NULL,
WellbeingCharacteristicEmergencyResponsePlan varchar(200) DEFAULT NULL,
WellbeingCharacteristicTrigger varchar(200) DEFAULT NULL,
WellbeingCharacteristicConfidentialFlag varchar(200) DEFAULT NULL,
WellbeingCharacteristicAlert varchar(200) DEFAULT NULL,
PRIMARY KEY (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingCharacteristic_Document (
WellbeingCharacteristic_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
Location varchar(200) DEFAULT NULL,
Sensitivity varchar(200) DEFAULT NULL,
URL varchar(200) DEFAULT NULL,
DocumentType varchar(200) DEFAULT NULL,
DocumentReviewDate varchar(200) DEFAULT NULL,
DocumentDescription varchar(200) DEFAULT NULL,
PRIMARY KEY (id)
-- KEY WellbeingCharacteristic_Document_IX (WellbeingEvent_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingCharacteristic_Medication (
WellbeingCharacteristic_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
MedicationName varchar(200) DEFAULT NULL,
Dosage varchar(200) DEFAULT NULL,
Frequency varchar(200) DEFAULT NULL,
AdministrationInformation varchar(200) DEFAULT NULL,
Method varchar(200) DEFAULT NULL,
PRIMARY KEY (id)
-- KEY WellbeingCharacteristic_Medication_IX (WellbeingEvent_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE WellbeingCharacteristic_Symptom (
   WellbeingCharacteristic_RefId VARCHAR(36) NOT NULL,
   Symptom VARCHAR(200) NOT NULL,
   PRIMARY KEY (WellbeingCharacteristic_RefId, Symptom),
   INDEX WC_Symptom_FKX (WellbeingCharacteristic_RefId),
   CONSTRAINT WC_Symptom_FK FOREIGN KEY (WellbeingCharacteristic_RefId) REFERENCES WellbeingCharacteristic (RefId)
) Engine=InnoDB DEFAULT Charset=utf8;




create table WellbeingAppeal (
RefId varchar(36) NOT NULL,
LocalId varchar(200) DEFAULT NULL,
StudentPersonal_RefId varchar(36) DEFAULT NULL,
SchoolInfo_RefId varchar(36) DEFAULT NULL,
WellbeingResponse_RefId varchar(36) DEFAULT NULL,
LocalAppealId  varchar(200) DEFAULT NULL,
AppealStatusCode  varchar(200) DEFAULT NULL,
Date  varchar(200) DEFAULT NULL,
AppealNotes  varchar(1000) DEFAULT NULL,
AppealOutcome  varchar(200) DEFAULT NULL,
PRIMARY KEY (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingAppeal_Document (
WellbeingAppeal_RefId varchar(36) NOT NULL,
Id int(11) NOT NULL AUTO_INCREMENT,
Location varchar(200) DEFAULT NULL,
Sensitivity varchar(200) DEFAULT NULL,
URL varchar(200) DEFAULT NULL,
DocumentType varchar(200) DEFAULT NULL,
DocumentReviewDate varchar(200) DEFAULT NULL,
DocumentDescription varchar(200) DEFAULT NULL,
PRIMARY KEY (id)
-- KEY WellbeingAppeal_Document_IX (WellbeingEvent_RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingAlert (
RefId varchar(36) NOT NULL,
StudentPersonal_RefId varchar(36) DEFAULT NULL,
SchoolInfo_RefId varchar(36) DEFAULT NULL,
Date  varchar(200) DEFAULT NULL,
WellbeingAlertStartDate varchar(200) DEFAULT NULL,
WellbeingAlertEndDate varchar(200) DEFAULT NULL,
WellbeingAlertCategory varchar(200) DEFAULT NULL,
WellbeingAlertDescription varchar(200) DEFAULT NULL,
EnrolmentRestricted varchar(200) DEFAULT NULL,
AlertAudience varchar(200) DEFAULT NULL,
AlertSeverity varchar(200) DEFAULT NULL,
AlertKeyContact varchar(200) DEFAULT NULL,
PRIMARY KEY (RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceTimeList_PeriodAttendance (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
StudentAttendanceTimeList_RefId varchar(36) DEFAULT NULL,
AttendanceType varchar(200) DEFAULT NULL,
AttendanceCode varchar(200) DEFAULT NULL,
AttendanceStatus varchar(200) DEFAULT NULL,
Date varchar(200) DEFAULT NULL,
SessionInfo_RefId varchar(36) DEFAULT NULL,
/* We're not creating SessionInfo table yet */
ScheduledActivity_RefId varchar(36) DEFAULT NULL,
TimetablePeriod varchar(200) DEFAULT NULL,
DayId varchar(200) DEFAULT NULL,
StartTime varchar(200) DEFAULT NULL,
EndTime varchar(200) DEFAULT NULL,
TimeIn varchar(200) DEFAULT NULL,
TimeOut varchar(200) DEFAULT NULL,
TimeTableCell_RefId varchar(36) DEFAULT NULL,
TimeTableSubject_RefId varchar(36) DEFAULT NULL,
AttendanceNote varchar(200) DEFAULT NULL,
PRIMARY KEY (id)
-- FOREIGN KEY StudentAttendanceTimeList_RefId REFERENCES StudentAttendanceTimeList(RefId),
-- FOREIGN KEY ScheduledActivity_RefId REFERENCES ScheduledActivity(RefId),
-- FOREIGN KEY TimeTableCell_RefId REFERENCES TimeTableCell(RefId),
-- FOREIGN KEY TimeTableSubject_RefId REFERENCES TimeTableSubject(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceTimeList_PeriodAttendance_RoomInfo (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
StudentAttendanceTimeList_PeriodAttendance_id MEDIUMINT NOT NULL,
RoomInfo_RefId varchar(36) DEFAULT NULL,
PRIMARY KEY (id)
-- FOREIGN KEY StudentAttendanceTimeList_PeriodAttendance_id REFERENCES StudentAttendanceTimeList_PeriodAttendance(id),
-- FOREIGN KEY RoomInfo_RefId REFERENCES RoomInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentAttendanceTimeList_PeriodAttendance_TeacherCover (
id MEDIUMINT NOT NULL AUTO_INCREMENT,
StudentAttendanceTimeList_PeriodAttendance_id MEDIUMINT NOT NULL,
StaffPersonal_RefId varchar(36) DEFAULT NULL,
StaffLocalId varchar(200) DEFAULT NULL,
StartTime varchar(200) DEFAULT NULL,
FinishTime varchar(200) DEFAULT NULL,
Credit varchar(200) DEFAULT NULL,
Supervision varchar(200) DEFAULT NULL,
Weighting varchar(200) DEFAULT NULL,
PRIMARY KEY (id)
-- FOREIGN KEY StudentAttendanceTimeList_PeriodAttendance_id REFERENCES StudentAttendanceTimeList_PeriodAttendance(id),
-- FOREIGN KEY StaffPersonal_RefId REFERENCES StaffPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `StudentAttendanceTimeList_PeriodAttendance_OtherCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StudentAttendanceTimeList_PeriodAttendance_Id` int(11) NOT NULL,
  `OtherCode` varchar(200) DEFAULT NULL,
  `CodeSet` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE TimeTableCell_TeacherCover (
    id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    TimeTableCell_RefId VARCHAR(36) NOT NULL,
    StaffPersonal_RefId VARCHAR(36) NOT NULL,
    StaffLocalId VARCHAR(200),
    StartTime VARCHAR(200),
    FinishTime VARCHAR(200),
    Credit VARCHAR(200),
    Supervision VARCHAR(200),
    Weighting VARCHAR(200)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table WellbeingPersonLink (
    RefId VARCHAR(36) NOT NULL PRIMARY KEY,
    LocalId varchar(200) DEFAULT NULL,
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

create table StudentScoreJudgementAgainstStandard (
  RefId VARCHAR(36) PRIMARY KEY,
  SchoolYear VARCHAR(200) DEFAULT NULL,
  TermInfo_RefId VARCHAR(36) DEFAULT NULL,
  LocalTermCode VARCHAR(200) DEFAULT NULL,
  StudentPersonal_RefId VARCHAR(36) DEFAULT NULL,
  StudentStateProvinceId VARCHAR(200) DEFAULT NULL,
  StudentLocalId VARCHAR(200) DEFAULT NULL,
  YearLevel VARCHAR(200) DEFAULT NULL,
  TeachingGroup_RefId VARCHAR(36) DEFAULT NULL,
  ClassLocalId VARCHAR(200) DEFAULT NULL,
  StaffPersonal_RefId VARCHAR(36) DEFAULT NULL,
  StaffLocalId VARCHAR(200) DEFAULT NULL,
  CurriculumCode VARCHAR(200) DEFAULT NULL,
  CurriculumNodeCode VARCHAR(200) DEFAULT NULL,
  Score VARCHAR(200) DEFAULT NULL,
  SpecialCircumstanceLocalCode VARCHAR(200) DEFAULT NULL,
  ManagedPathwayLocalCode VARCHAR(200) DEFAULT NULL,
  SchoolInfo_RefId VARCHAR(36) DEFAULT NULL,
  SchoolLocalId VARCHAR(200) DEFAULT NULL,
  SchoolCommonwealthId VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table StudentScoreJAS_LearningStandard (
  id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  StudentScoreJudgementAgainstStandard_RefId VARCHAR(36) NOT NULL,
  LearningStandardItem_RefId VARCHAR(36) DEFAULT NULL,
  LearningStandardURL VARCHAR(256) DEFAULT NULL,
  LearningStandardLocalId VARCHAR(200) DEFAULT NULL,
  INDEX `StudentScoreJudgementAgainstStandard_IX` (`StudentScoreJudgementAgainstStandard_RefId`),
  CONSTRAINT `StudentScoreJudgementAgainstStandard_FK` FOREIGN KEY (`StudentScoreJudgementAgainstStandard_RefId`) REFERENCES `StudentScoreJudgementAgainstStandard` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table TermInfo (
  RefId VARCHAR(36) PRIMARY KEY,
  SchoolInfo_RefId VARCHAR(36) DEFAULT NULL,
  SchoolYear VARCHAR(200) DEFAULT NULL,
  StartDate VARCHAR(200) DEFAULT NULL,
  EndDate VARCHAR(200) DEFAULT NULL,
  Description VARCHAR(2000) DEFAULT NULL,
  RelativeDuration VARCHAR(200) DEFAULT NULL,
  TermCode VARCHAR(200) DEFAULT NULL,
  Track VARCHAR(200) DEFAULT NULL,
  TermSpan VARCHAR(200) DEFAULT NULL,
  MarkingTerm VARCHAR(200) DEFAULT NULL,
  SchedulingTerm VARCHAR(200) DEFAULT NULL,
  AttendanceTerm VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table SchoolCourseInfo (
  RefId VARCHAR(36) PRIMARY KEY,
  SchoolInfo_RefId VARCHAR(36) DEFAULT NULL,
  SchoolLocalId VARCHAR(200) DEFAULT NULL,
  SchoolYear VARCHAR(200) DEFAULT NULL,
  TermInfo_RefId VARCHAR(36) DEFAULT NULL,
  CourseCode VARCHAR(200) DEFAULT NULL,
  StateCourseCode VARCHAR(200) DEFAULT NULL,
  DistrictCourseCode VARCHAR(200) DEFAULT NULL,
  CourseTitle VARCHAR(200) DEFAULT NULL,
  Description VARCHAR(2000) DEFAULT NULL,
  InstructionalLevel VARCHAR(200) DEFAULT NULL,
  CourseCredits VARCHAR(200) DEFAULT NULL,
  CoreAcademicCourse VARCHAR(200) DEFAULT NULL,
  GraduationRequirement VARCHAR(200) DEFAULT NULL,
  Department VARCHAR(200) DEFAULT NULL,
  CourseContent VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table SchoolCourseInfo_SubjectArea (
  Id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  SchoolCourseInfo_RefId VARCHAR(36) NOT NULL,
  Code VARCHAR(200) DEFAULT NULL,
  INDEX `SchoolCourseInfo_IX` (`SchoolCourseInfo_RefId`),
  CONSTRAINT `SchoolCourseInfo_FK` FOREIGN KEY (`SchoolCourseInfo_RefId`) REFERENCES `SchoolCourseInfo` (`RefId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table SchoolCourseInfo_SubjectArea_Code (
  Id MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
  SubjectArea_Id MEDIUMINT NOT NULL,
  Value VARCHAR(200) DEFAULT NULL,
  Codeset VARCHAR(200) DEFAULT NULL,
  INDEX `SubjectArea_IX` (`SubjectArea_Id`),
  CONSTRAINT `SubjectArea_FK` FOREIGN KEY (`SubjectArea_Id`) REFERENCES `SchoolCourseInfo_SubjectArea` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  CONSTRAINT `Name_CensusReportingEntityContact_FK` FOREIGN KEY (`CensusReportingEntityContact_Id`) REFERENCES `CensusReporting_EntityContact` (`Id`)
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
  CONSTRAINT `Name_FQReportingEntityContact_FK` FOREIGN KEY (`FQReportingEntityContact_Id`) REFERENCES `FQReporting_EntityContact` (`Id`)
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
  StatsCohortId VARCHAR(200) NOT NULL,
  StatsIndigenousStudentType VARCHAR(200) NOT NULL,
  CohortGender VARCHAR(200) NOT NULL,
  DaysInReferencePeriod VARCHAR(200) NOT NULL,
  PossibleSchoolDays VARCHAR(200) NOT NULL,
  AttendanceDays VARCHAR(200) NOT NULL,
  AttendanceLess90Percent VARCHAR(200) NOT NULL,
  AttendanceGTE90Percent VARCHAR(200) NOT NULL,
  PossibleSchoolDaysGT90PercentAttendance VARCHAR(200) NOT NULL,
  INDEX `StatsCohort_YearLevel_IX` (`StatsCohortYearLevel_Id`),
  CONSTRAINT `StatsCohort_YearLevel_FK` FOREIGN KEY (`StatsCohortYearLevel_Id`) REFERENCES `StudentAttendanceCR_StatsCohortYearLevel` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
