#/bin/bash
######################################
##	a backup script to create a mysql dump of the wordpress in the passed directory and database name
YEAR=`date +%Y`
MONTH=`date +%m`	
DAY=`date +%d`
HOUR=`date +%H`
sudo mkdir -p /backup/$1/$YEAR/$MONTH/$DAY/$HOUR/
mysqldump -u root -p5449189 $2 > /backup/$1/$YEAR/$MONTH/$DAY/$HOUR/backup.sql
