#!/bin/sh
export PERL5LIB=lib

echo "DEPRECATED timetable"
exit 1;

# XXX /var/sif/sif-data
#cd /home/scottp/nsip/sif-data
#export HOME=/home/scottp

echo "CREATE DB"
perl bin/create_sif_data.pl --create-database="$1"
echo "CREATE SCHOOLS, STUDENTS, STAFF, ROOMS, TEACHING GROUPS"
perl bin/create_sif_data.pl --database="$1" --create-schools=1 --create-students=50..150 --create-staff=5..20 --create-rooms=3..5 --create-teaching-groups
# =7..20
echo "CREATE TIME TABLE"
perl bin/create_sif_data.pl --database="$1" --create-time-table=first
echo "CREATE GRADING"
perl bin/create_sif_data.pl --database="$1" --create-grading
echo "CREATE CONTACTS"
perl bin/create_sif_data.pl --database="$1" --create-student-contacts
echo "CREATE ACCOUNTS"
perl bin/create_sif_data.pl --database="$1" --create-accounts=8..16 --create-vendors=8..16 --create-debtors=8..16
