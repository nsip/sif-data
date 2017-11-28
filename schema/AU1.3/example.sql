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
	RefId varchar(36) UNIQUE,
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
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS StudentPersonal_OtherId (
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


CREATE TABLE IF NOT EXISTS StudentSchoolEnrollment (
	RefId varchar(36) UNIQUE,
	StudentPersonal_RefId varchar(36),
	SchoolInfo_RefId varchar(36),
	MembershipType varchar(10),
	SchoolYear varchar(10),
	TimeFrame varchar(10),
	YearLevel varchar(10),
	FTE varchar(5),
	EntryDate varchar(25),
	ExitDate Varchar(25),
	RecordClosureReason VARCHAR(200),
	PromotionStatus VARCHAR(200),
	ClassCode varchar(200),
	ReportingSchool varchar(200),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId),
	FOREIGN KEY (StudentPersonal_RefId) REFERENCES StudentPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE IF NOT EXISTS StaffAssignment (
	RefId varchar(36) UNIQUE,
	SchoolInfo_RefId varchar(36),
	SchoolYear varchar(200),
	StaffPersonal_RefId varchar(36),
	Description varchar(200),
	PrimaryAssignment varchar(200),
	JobStartDate varchar(200),
	JobEndDate varchar(200),
	JobFunction varchar(200),
	StaffActivity_Code varchar(200),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId),
	FOREIGN KEY (StaffPersonal_RefId) REFERENCES StaffPersonal(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
	EmploymentType VARCHAR(200)
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
	Code varchar(100),
	AttendanceStatus varchar(100),
	StartTime varchar(100),
	EndTime varchar(100),
	AbsenceValue varchar(100),
	AttendanceNote varchar(100),
	FOREIGN KEY (StudentAttendanceTimeList_RefId) REFERENCES StudentAttendanceTimeList(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS StudentAttendanceTimeList_AttendanceTime_OtherCode (
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
	FOREIGN KEY (LocationInfo_RefId) REFERENCES LocationInfo(RefId),
	FOREIGN KEY (Related_PurchaseOrder_RefId) REFERENCES PurchaseOrder(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FinancialClass (
	RefId VARCHAR(36) PRIMARY KEY,
	Name VARCHAR(200),
	Description VARCHAR(200),
	ClassType  VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS FinancialAccount (
	RefId  VARCHAR(36) PRIMARY KEY,
	SubAccount_RefId  VARCHAR(36), -- joins to FinancialAccount/RefId?,
	LocationInfo_RefId  VARCHAR(36), -- joins to LocationInfo/RefId?,
	AccountNumber  VARCHAR(200),
	Name VARCHAR(200),
	Description VARCHAR(200),
	FinancialClass_RefId  VARCHAR(36), -- joins to FinancialClass/RefId?,
	CreationDate  VARCHAR(200),
	CreationTime  VARCHAR(200),
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
	BilledEntity  VARCHAR(36), -- — joins to either VendorInfo/RefId or StudentContactPersonal/RefId?,
	BilledEntity_SIFRefObject VARCHAR(200),	-- XXX Bad DB structure for SQL (see above too)
	BillingName  VARCHAR(200),
	BillingNote  VARCHAR(200),
	Discount VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS VendorInfo (
	-- Note: address information in LocationInfo/ContactInfo should go into the new Address table created in #128
	RefId  VARCHAR(36) PRIMARY KEY,
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
	AccountName  VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS PaymentReceipt (
	RefId  VARCHAR(36) PRIMARY KEY,
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

CREATE TABLE IF NOT EXISTS PurchaseOrder_PurchasingItems (
	-- This is a 1:n join of PurchaseOrder to the PurchaseOrder/PurchasingItems/PurchasingItem entry
	PurchaseOrder_RefId  VARCHAR(36), -- — joins to PurchaseOrder/RefId?,
	Id MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
	Debit_FinancialAccount_RefId  VARCHAR(36), -- — joins to FinancialAccount/RefId?,
	Credit_FinancialAccount_RefId  VARCHAR(36), -- — joins to FinancialAccount/RefId?,
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

CREATE TABLE PersonPicture (
	RefId VARCHAR(36),
	ParentObject_RefId VARCHAR(36),
	ParentObjectRefId_SIF_RefObject VARCHAR(200),
	SchoolYear varchar(200),
	PictureSource TEXT,
	PictureSourceType varchar(200),
	OKToPublish varchar(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `NAPEventStudentLink_TestDisruption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPEventStudentLink_RefId` varchar(36) NOT NULL,
  `Event` varchar(2000) DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NAPEventStudentLink_TestDisruption_IX` (`NAPEventStudentLink_RefId`),
  CONSTRAINT `NAPEventStudentLink_TestDisruption_FK` FOREIGN KEY (`NAPEventStudentLink_RefId`) REFERENCES `NAPEventStudentLink` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `NAPEventStudentLink_Adjustment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPEventStudentLink_RefId` varchar(36) NOT NULL,
  `BookletType` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NAPEventStudentLink_Adjustment_FK_idx` (`NAPEventStudentLink_RefId`),
  CONSTRAINT `NAPEventStudentLink_Adjustment_FK` FOREIGN KEY (`NAPEventStudentLink_RefId`) REFERENCES `NAPEventStudentLink` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `NAPEventStudentLink_Adjustment_PNPCode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Adjustment_Id` int(11) DEFAULT NULL,
  `Code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Adjustment_PNPCode_FK_idx` (`Adjustment_Id`),
  CONSTRAINT `Adjustment_PNPCode_FK` FOREIGN KEY (`Adjustment_Id`) REFERENCES `NAPEventStudentLink_Adjustment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `NAPTestItem_ContentDescription` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `ContentDescription` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ContentDescription_TestItem_FK_idx` (`NAPTestItem_RefId`),
  CONSTRAINT `ContentDescription_TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `NAPTestItem_SubstituteItem` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPTestItem_RefId` varchar(36) NOT NULL,
  `SubstituteItem_RefId` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TestItem_FK_idx` (`NAPTestItem_RefId`),
  KEY `SubstituteItem_FK_idx` (`SubstituteItem_RefId`),
  CONSTRAINT `SubstituteItem_FK` FOREIGN KEY (`SubstituteItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TestItem_FK` FOREIGN KEY (`NAPTestItem_RefId`) REFERENCES `NAPTestItem` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ItemSubstitutedFor_PNPCode` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemSubstitutedFor_Id` int(11) NOT NULL,
  `Code` varchar(200) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ItemSubstitutedFor_FK_idx` (`ItemSubstitutedFor_Id`),
  CONSTRAINT `ItemSubstitutedFor_FK` FOREIGN KEY (`ItemSubstitutedFor_Id`) REFERENCES `NAPTestItem_SubstituteItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `NAPTestItem_NAPWritingRubric_Score` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NAPWritingRubric_Id` int(11) NOT NULL,
  `MaxScoreValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Score_WritingRubric_FK_idx` (`NAPWritingRubric_Id`),
  CONSTRAINT `Score_WritingRubric_FK` FOREIGN KEY (`NAPWritingRubric_Id`) REFERENCES `NAPTestItem_NAPWritingRubric` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `NAPTestItem_NAPWritingRubric_Score_ScoreDescription` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Score_Id` int(11) NOT NULL,
  `Descriptor` varchar(2000) DEFAULT NULL,
  `ScoreValue` varchar(200) DEFAULT NULL,
  `ScoreCommentCode` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `ScoreDescription_Score_FK_idx` (`Score_Id`),
  CONSTRAINT `ScoreDescription_Score_FK` FOREIGN KEY (`Score_Id`) REFERENCES `NAPTestItem_NAPWritingRubric_Score` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `NAPStudentResponseSet_Testlet_TestItem_Subscore` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ResponseTestItem_Id` int(11) NOT NULL,
  `SubscoreType` varchar(200) DEFAULT NULL,
  `SubscoreValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Subscore_ResponseTestItem_FK_idx` (`ResponseTestItem_Id`),
  CONSTRAINT `Subscore_ResponseTestItem_FK` FOREIGN KEY (`ResponseTestItem_Id`) REFERENCES `NAPStudentResponseSet_Testlet_TestItem` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `NAPCodeFrame` (
  `RefId` varchar(36) NOT NULL,
  `NAPTest_RefId` varchar(36) NOT NULL,
  PRIMARY KEY (`RefId`),
  KEY `NAPCodeFrame_NAPTest_FK_idx` (`NAPTest_RefId`),
  CONSTRAINT `NAPCodeFrame_NAPTest_FK` FOREIGN KEY (`NAPTest_RefId`) REFERENCES `NAPTest` (`RefId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
