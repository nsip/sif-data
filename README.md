README.md

 * bin/ 	Scripts to create and manage schema
 * lib/ 	Common or useful libraries
 * schema/ 	Generated Database schema
 * data/ 	Data that could be needed for generating data
 * xsd/		XSDs

Database Rules

 * id 		Unique ID created for every row
 * refId	TODO Should we just use id also as RefId?

Basic Usage

 Create a new database containing students etc
 * bin/create_sif_data.pl --create-database=MyNewDemo
 * bin/create_sif_data.pl --database=MyNewDemo --create-schools=1 --create-students=50..150

2016 Version move to hits.nsip.edu.au (dropping .dev)
* AWS:
  * Login = info@nsip.edu.au
  * Location = Asia Pacific (Sydney)
  * EC2
    * files - ownCloud = t1.micro = ?
      * Elastic IP = 54.66.143.89
    * niasdev = t2.medium = to be deprecated
    * admin = t2.micro = SSH server, not used much, could be turned off at times
    * hits = t2.medium = Primary Web server, Hits server, SIF server
      * Elastic IP = 54.66.142.11
    * red = t2.micro = Node Red server, could be disabled at this times
  * RDS
    * hitsdb = t2.small = Should consider bigger machine
      * 200GB Storage (should be heaps)
      * Automatic backup inside EC2
  * Route 53
    * nsip.edu.au
      *
* Backup ?
* New physical MySQL server =
  * (note: Old = db.dev.nsip.edu.au)
  * New = db.nsip.edu.au
  * Full = hitsdb.cjoyz8ynqohs.ap-southeast-2.rds.amazonaws.com:3306
  * User = hitsadmin
  * Password = foxcrowbaker
* Database for HITS = ?
* Database for Infrastructure (SIF) = ?
* Database rules for new SIF Accounts = ?

XML Version

* READ Data
	It is sometimes necessary to read a list of entries, such as the available
	set of schools. This is difficult as it depends on the service that
	is being read from.
	To start with, the system will write a local set of entries for reuse.

* Write XML
	Generating XML is done in two stages. First is to have an XML template.
	This could normally be done with an XSD (see sif-au-perl) to allow perfect
	creation of the XML from the XSD and objects.
	Or it can be done via templates with basic substitution.

* Output of XML
	XML could be written to
	- One file
	- Multiple files.
	- REST POST
		. Consider special URLs to allow for direct SIF posting
		. Test it works directly with SIF
	- Queue
		. Choose the
