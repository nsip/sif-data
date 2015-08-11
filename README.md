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
