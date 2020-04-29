#/bin/bash
###############################33
##	a script to handle the creation of the DB and the DB user and Grant all previlages to this user
##	Exit codes
##	0: normal execution
##	127: mysql error

function create_db()
{
	mysql  -u root -p5449189 -NB -e "CREATE DATABASE $1;" 2>> mysql_log
}
#################################################
##	a function to create the user with a password and grant privileges to him on the created DB
##      params : DB_NAME , USER_NAME, USER_PASSWORD 
function create_user()
{
	mysql -u root -p5449189 -NB -e "CREATE USER '$2'@'localhost' IDENTIFIED BY '$3';" 2>> mysql_log
	mysql -u root -p5449189 -NB -e "GRANT ALL PRIVILEGES ON $1.* TO $2@'localhost';"  2>> mysql_log
}

