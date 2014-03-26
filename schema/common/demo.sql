-- Some demo data for permissions


-- Permission id of a group who can access all schools, all object types, read and write

INSERT INTO perm (id, title, description)
	VALUES ('all', 'Full access', 'Full to all schools and objets');

INSERT INTO perm_school (perm_id, schoold_id)
	VALUES ('all', 'SPECIAL/ALLSCHOOLS');

INSERT INTO perm_sif_object (perm_id, object)
	VALUES ('all', 'match(.)');

INSERT INTO perm_api (perm_id, api_id)
	VALUES ('aĺl', 'sif3');


-- Permissions of restricted application, such as Mathletics (3 schools)
INSERT INTO perm (id, title, description)
	VALUES ('mathletics', 'Mathletics', 'Mathletics');

INSERT INTO perm_school (perm_id, schoold_id)
	VALUES ('mathletics', 'ABC-111');
INSERT INTO perm_school (perm_id, schoold_id)
	VALUES ('mathletics', 'ABC-222');
INSERT INTO perm_school (perm_id, schoold_id)
	VALUES ('mathletics', 'ABC-333');

INSERT INTO perm_sif_object (perm_id, object, read_restriction, write_restriction)
	VALUES ('mathletics', 'SchoolInfo', 'SPECIAL/MINIMUM', 'SPECIAL/NONE');
INSERT INTO perm_sif_object (perm_id, object, read_restriction, write_restriction)
	VALUES ('mathletics', 'StudentPersonal', 'SPECIAL/MINIMUM', 'SPECIAL/NONE');

INSERT INTO perm_api (perm_id, api_id)
	VALUES ('mathletics', 'sif3');


