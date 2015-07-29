-- EXAMPLE - This example is a SCHEMA we created for SIF REST Server Perl version

-- XXX Cross refernce with "Timetable Baseline Profile v0.7.docx"

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
	Person_RefId VARCHAR(36), -- joins to StudentPersonal/RefId? or StudentContactPersonal/RefId?
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
	RecordClosureReason? VARCHAR(200),
	PromotionStatus? VARCHAR(200),
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

CREATE TABLE IF NOT EXISTS PersonInfo (

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- PersonInfo/Address (XXX should this be AddressList ?)

CREATE TABLE IF NOT EXISTS Address (
	RecordNumber MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY, --  auto increment — please make this the primary key: there may be multiple addresses per person, so there is no intrinsic notion of a primary key in this table
	Person_RefId VARCHAR(36), -- joins to StudentPersonal/RefId? or StudentContactPersonal/RefId?
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
	TimeTable_RefId varchar(36) NOT NULL,
	DayId varchar(200) NOT NULL,
	DayTitle varchar(200) NOT NULL,
	FOREIGN KEY (TimeTable_RefId) REFERENCES TimeTable(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TimeTable_Period (
	TimeTable_RefId varchar(36) NOT NULL,
	DayId varchar(200) NOT NULL,
	PeriodId varchar(200) NOT NULL,
	PeriodTitle varchar(200) NOT NULL,
	BellPeriod varchar(100),
	StartTime varchar(100),
	EndTime varchar(100),
	FOREIGN KEY (TimeTable_RefId) REFERENCES TimeTable(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- TODO: List (mutlipel passwords? but only one identity - lets just do one?)
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

-- end NN 20141014
