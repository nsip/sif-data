-- First attempt at mapping permissions

-- SIF Zones
--	A SIF Zone could be mapped 1:1 to a perm group below

-- EXAMPLES
--	* SIF user. User has Identity and secret. And a perm_id. This chooses which
--		Schools they can see, and which objects

-- A set of permissions - this could be assigned to a user, or SIF Environment
CREATE TABLE perm IF NOT EXISTS (
	id varchar(36) UNIQUE,
	title varchar(200),
	description TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- A way to limit the schools in permission group
-- HOW: Use this inside each object to work out if they have access
--	NOTE: This is difficult if they are accessing something not necessarily a school
-- XXX not flexible enough. What if a principal only wants to add a specific class.
--		SIFAU/SchoolInfo/XYZ
--		SIFAU/TeachingGroup/XYZ
--		SIFAU/StudentPersonal/XYZ
CREATE TABLE perm_school IF NOT EXISTS (
	perm_id varchar(36),
	school_id VARCHAR(36),	-- NOTE: Which table depends on Schema used
	FOREIGN KEY (perm_id) REFERENCES perm(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Object Types
-- HOW: Use this at the top level of SIF API to check if they have access to an object class.
CREATE TABLE perm_sif_object IF NOT EXISTS (
	perm_id varchar(36),
	object VARCHAR(200)	-- Direct mapped SIF object, such as SchoolInfo or StaffPersonal
	read_restriction TEXT,		-- Optional restrictinos. E.g. fields to restrict? XSL? etc
	write_restriction TEXT,		-- Optional restrictinos. E.g. fields that can be writtne, create ?
	FOREIGN KEY (perm_id) REFERENCES perm(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- What APIs can they access ?
-- HOW: Use this when logging in for the first time
CREATE TABLE perm_api IF NOT EXISTS (
	perm_id VARCHAR(36),
	api_id VARCHAR(36),
	FOREIGN KEY (perm_id) REFERENCES perm(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


