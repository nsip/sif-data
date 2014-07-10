#!/bin/sh

# TODO - Load the database & 

perl make_schools.pl 10
#make_roominfo.pl
perl make_staff.pl 25
perl make_students.pl 100
perl make_teaching_group.pl 10
perl make_timetable.pl 10

perl fix_data.pl
