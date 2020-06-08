/* TermInfo */
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

/* SchoolCourseInfo */
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
  Code VARCHAR(200) DEFAULT NULL
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
