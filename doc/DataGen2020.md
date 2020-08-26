+++
title = "NSIP: DataGen 2020"
description = "Replacement of the old sif-data SQL version of data generation"
weight = 1
+++

# TODO


# sif-data

sif-data, first commit 2014, but actually much older, generates interactive SQL to a well
definied mysql structured database used by "sif-hits", a NSIP SIF Java Framework implementation of the SIF 3 standard. It starts by creating a new database using the schema provided in the directory "schema/AU1.3/example.sql" and then perl (our own libraries and external ones) to generate random schools, teachers, students and more.

A lot of work over the past 6+ years has gone into the quality and meaninfulness of the data.

The two major limitations of this code are: SQL (and a very definied set) only and not all objects are created or filled.

## Sub Parts

* API - there is a REST like API to start and monitor the processing of the creation
* A number of tools in bin/ and other places are used to process data (eg in data/ or pulled remotely) as valid code sets or examples.
* Example on library use and test cases exist in examples/* and less in test/ and t/
* A well maintained migration SQL set has been kept between versions for easy upgrade.
* Many of the code sets are not just valid but also weighted to be reasonable (e.g. IndigenousStatus)

## Options for each create

```JSON
{
   "name" : "DataGen01",
   "options" : {
      "schools" : 1,
      "students" : [ 100, 200 ],
      "teachers" : [ 5, 10 ],
      "classrooms" : [ 3, 5 ],
      "scheduledactivities" : [ 8, 16 ],
      "accounts" : true,
      "contacts" : true,
      "grading" : true,
      "hmac" : true,
      "naplan" : true,
      "teachinggroups" : true,
      "timetable" : true
   },
   "type" : "custom"
}
```

* type: This isn't used by creation, it is used to define the fields below from a template, but we record it as part of create as useful information.
* name: Dataset name - not actually the DB which uses a uuid
* schools: Number of schools to create - fixed at 0 to 5 (practically anything)
* students: A range of students (randomly selected between those number) per school
* teachers: A range of teachers (randomly selected between those number) per school
* classrooms: A range of classrooms (randomly selected between those number) per school
* scheduledactivities: A range of scheduled activities (randomly selected between those number) per student
* contacts: Create the extra contact information for each teacher and student (including picture)
* accounts: Create a set of account data
* grading: Insert example grading data for Students
* teachinggroups: Create the teachinggroups and assign the teachers and students rougly evenly.
* timetable: Create timetable entries including use of rooms
* hmac: SIF 3 requires creation of these systems with or without internal use of HMAC - it won't be required for other implementations.
* naplan: An older tag used to insert a set of predefined naplan data to each school - not sure of current support

## Other details of create

* SIF HITS Implementation specific database changes are made - such as creation of necessary information for a SIF environment and status of create.

## Walk through key:

* Priority: These steps are prefixed with low, med, high for how important they are to the next version.
* Future: Bullet points along the lines of "FUTURE:" are added as useful tips or information
* Estimate: Small (1 effort day), Medium (1 effort week), Large (> 2 effort weeks) is added for future estimates.
* Helpers: are common code (or in this case, common text) to stop repetition

## Walk through specifics:

* (low) bin/create.cgi creates necessary starting data and starts a background process.
    * FUTURE: Move to hits-dashboard API but keep it as a REST request
    * ESTIMATE: small
* (med) Massages the data, making sure options that depend on each other are selected and ranges make sense.
    * ESTIMATE: small
* (low) it becomes its own background task, also writing to /tmp and the database each step
    * ESTIMATE: NA (part of hits-dashboard which is always running)
* (high) bin/create_sif_data.pl - called to create the database
    * This is effectively just a UUID that is then associated back to the user
    * FUTURE: version intention is some form of shared space (file, api, not sure yet)
* (high) create_sif_data.pl (spaced like this because run as single command for the associations)
    * NOTE: Intention is to allow every step to be separate to run at any time, by re-reading the data that is there.
	* (low) "--database=sif$name "
        * FUTURE: All code needs to be given the "root" (how old school fortran)
	* (high) "--create-schools=$schools "
        * Generate local_id - Random number 6 digit number starting with 9
            * No collision detection is used, as each DB is currently separate.
            * FUTURE: Would like to change that to allow interoperability
        * RefId - New UUID
        * Address
            * See Helper Random Address
            * Fields:
            	* Address_Street_StreetNumber
            	* Address_Street_StreetName
            	* Address_City
            	* Address_StateProvince
            	* Address_PostalCode
        * Hard Coded Fields
        	* SchoolSector = 'Gov';
        	* OperationalStatus = 'O';
        	* IndependentSchool = 'N';	# As per codeset
        	* Address_ARIA = '1.0';
        	* Entity_Open = '1990-01-01';
        * Random Numbers
        	* CampusSchoolCampusId = int(rand(4)) + 1;
        	* CampusAdminStatus = rand(10) > 8 ? 'N' : 'Y';
        	* StateProvinceId = int(rand(1000)) + 1;		# TODO Unique to each school
        	* CommonwealthId = int(rand(1000)) + 1;
        * CampusType & SchoolType
            * Random entry of:
        		* JunPri
        		* Middle
        		* Prim # * 5, aka 50% are Prim
        		* Sec # * 2, aka 20%
        		* Pri/Sec
        * School Name
            * Helper: Random Person
            * School Type - random
                * Academy
                * Grammar
                * College
            * Return Random Person Family Name + " " + School Type
	* (high) "--create-students=$students "
        * TODO
	* (high) "--create-staff=$teachers "
        * TODO
	* (high) "--create-rooms=$rooms "
        * TODO
	* (high) "--create-scheduled-activities=$scheduledactivities "
        * TODO
* (high) create_sif_data --create-time-table=first
    * TODO - not sure first?
* (high) create_sif_data --create-grading
    * TODO - not sure first?
* (high) create_sif_data --create-student-contact
    * Not staff??
    * TODO - not sure first?
* (high) create_sif_data --create-accounts
    * NOTE: These are fixed amounts - they should be optional passed in
    * "--create-accounts=8..16 "
    * "--create-vendors=8..16 "
    * "--create-debtors=8..16 "
* (med) update permissions
    * SIF HITS uses a permissions scheme that allows sharing or not of data between systems. This is updated at this point, but would be seen as being something internal to SIF.
    * FUTURE: In the data dir, a "sifhits" folder containing some form of config yaml would be ideal.
* (med) Finally the status of this creation is updated in the database.


## Helpers

* RandomPerson
    * TODO
* RandomAddress
    * Street Number = int(rand(300))+1;
    * Street Name = RandomPerson First Name + Random Street Type of:
		* Avenue
		* Boulevard
		* Cove
        * Court
        * Crescent
		* Drive
		* Esplanade
		* Lane
		* Place
		* Road
		* Square
        * Street
		* Terrace
		* Walk
        * Way
    * RandomPostCode
        * (RandomPostCode is loaded from real Australian data)
        * Postal code
        * State or Province
        * City
* RandomPostCode
    * Local copy of valid post codes with the following information:
    * Fields:
        * Pcode
        * Locality
        * State
        * Comments
        * DeliveryOffice
        * PresortIndicator
        * ParcelZone
        * BSPnumber
        * BSPname
        * Category

# The Future

## Ideals (from Meetings with Matt, Nick, Peter)

* Generate JSON, then use other tools for CSV, XML etc
* Don't force STRUCTS
* Should be reasonably fast (10s of seconds for multiple schools)

## Tasks

* Investigate existing JSON generation tools
*

# See Also
