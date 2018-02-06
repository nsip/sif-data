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

By default, configuration is read from /etc/nsip/nsip_sif_data; to override:
````
setenv NSIP_SIF_DATA "./nsip_sif_data"
````

 Create a new database containing students etc
 * bin/create_sif_data.pl --create-database=MyNewDemo
 * bin/create_sif_data.pl --database=MyNewDemo --create-schools=1 --create-students=50..150


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
