#!/bin/sh
export PERL5LIB=lib

echo "DEPRECATED large"
exit 1;

#cd /home/scottp/nsip/sif-data
#export HOME=/home/scottp

echo "CREATE DB"
perl bin/create_sif_data.pl --create-database=$1
echo "CREATE SCHOOLS, STUDENTS, STAFF, ROOMS, TEACHING GROUPS"
perl bin/create_sif_data.pl --database=$1 --create-schools=3..7 --create-students=150..400 --create-staff=5..20 --create-rooms=5..15 --create-teaching-groups=7..30 
echo "CREATE TIME TABLE"
perl bin/create_sif_data.pl --database=$1 --create-time-table=first

