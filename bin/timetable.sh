#!/bin/sh
export PERL5LIB=lib

#cd /home/scottp/nsip/sif-data
#export HOME=/home/scottp

echo "CREATE DB"
perl bin/create_sif_data.pl --create-database=$1
echo "CREATE SCHOOLS, STUDENTS, STAFF, ROOMS, TEACHING GROUPS"
perl bin/create_sif_data.pl --database=$1 --create-schools=1 --create-students=50..150 --create-staff=5..20 --create-rooms=3..5 --create-teaching-groups=7..20
echo "CREATE TIME TABLE"
perl bin/create_sif_data.pl --database=$1 --create-time-table=first
echo "CREATE GRADING"
perl bin/create_sif_data.pl --database=$1 --create-grading

