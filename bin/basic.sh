#!/bin/sh
export PERL5LIB=lib

#cd /home/scottp/nsip/sif-data
#export HOME=/home/scottp

echo "CREATE DB"
perl bin/create_sif_data.pl --create-database=$1
echo "CREATE SCHOOLS, STUDENTS, STAFF, ROOMS, TEACHING GROUPS"
perl bin/create_sif_data.pl --database=$1 --create-schools=1

