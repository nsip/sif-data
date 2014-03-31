-- EXAMPLE - This example is a SCHEMA we created for SIF REST Server Perl version

SHOW ERRORS;

-- ----------------------------------------------------------------------
-- SIF AU Objects
-- ----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SchoolInfo (
	RefId varchar(36) UNIQUE,
	LocalId varchar(200),
	SchoolName varchar(2000),
	StateProvinceId varchar(200),
	CommonwealthId varchar(200),
	-- Campus (and associated elements)
	-- Campus/SchoolCampusId
	-- Campus/AdminStatus 
	-- Campus/CampusType
	SchoolSector varchar(200),
	OperationalStatus varchar(200),
	IndependentSchool varchar(200),
	SchoolType  varchar(200),
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
	Entity_Close varchar(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
	PreferredGivenName varchar(2000),
	SchoolInfo_RefId varchar(36), -- TODO: Might use StudentSchoolEnrollment
	YearLevel varchar(2000),
	StateProvinceId varchar(200),
	Sex varchar(200),
	BirthDate varchar(200),
	IndigenousStatusvarchar(200),
	CountryofBirthvarchar(200),
	MostRecent_YearLevel varchar(200),
	MostRecent_Parent1Language varchar(200),
	MostRecent_Parent2Language varchar(200),
	MostRecent_Parent1SchoolEducation varchar(200),
	MostRecent_Parent2SchoolEducation varchar(200),
	MostRecent_Parent1NonSchoolEducation varchar(200),
	MostRecent_Parent2NonSchoolEducation varchar(200),
	MostRecent_Parent1EmploymentType varchar(200),
	MostRecent_Parent2EmploymentType varchar(200),
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
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

-- TODO: StudentSchoolEnrollment

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
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
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

-- TODO StudentContactPersonal

-- TODO StudentContactRelationship

CREATE TABLE IF NOT EXISTS RoomInfo (
	RefId varchar(36) UNIQUE,
	SchoolInfo_RefId varchar(36),
	RoomNumber varchar(100),
	Description varchar(100),
	Capacity varchar(100),
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
	FOREIGN KEY (SchoolInfo_RefId) REFERENCES SchoolInfo(RefId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS TeachingGroup (
	RefId varchar(36) UNIQUE,
	-- ShortName, LongName etc?
	ShortName varchar(200),
	LongName varchar(200),
	LocalId varchar(200),
	SchoolYear varchar(200),
	SchoolInfo_RefId varchar(36),
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
	AuthenticationSourceGlobalUID varchar(200),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- TODO: List (mutlipel passwords? but only one identity - lets just do one?)
--	PasswordList varchar(200),
--	PasswordList/Password varchar(200),
