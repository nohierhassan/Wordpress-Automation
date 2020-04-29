#/bin/bash 
##############################################
##	a script to automate the installation process of the wordpress
##	we'll have two modules one to handle the msql DB and one to install the wordpress
##	Exit codes
##	0: normal termination


# including the two modules
source DB_module.sh
source WP_module.sh
source Validations.sh
#############################################
echo	-n "Welcome , This script is to automate the installation and configuration of the WordPress "
read	l
echo	-n "Plese make sure to have the appache2 server and mysql DB installed on your machine "
read	l
echo	-n "we gonna need some details to configure everything for your :) " 
read	l
#################################################
##	get the DB name
while :
do 
	echo	"Enter the DB name, please! "
	read DB_NAME
	is_null $DB_NAME
	if [  $? -eq 0 ]
	then
###############################################
##      create the DB
		create_db $DB_NAME
		if [ $? -eq 0 ]
		then
  			echo "DB created Successfully."
			break
		else
  			echo "DB exists with this name, plsease choose a different name"
  			
		fi

	fi
done 

#############################################
##	get the DB username

while : ## the main loop for entering the username and password
do

	while : ## inner loop to enter the username
	do
        	echo    "Enter the DB username "
        	read DB_USER_NAME
        	is_null $DB_USER_NAME
        	if [  $? -eq 0 ]
        	then
                	break
       		 fi
	done
##############################################
##	get the user password
	while : ## inner loop to enter the password
	do
        	echo    "Enter the DB password "
        	read -s DB_USER_PASSWORD
        	is_null $DB_USER_PASSWORD
        	if [  $? -eq 0 ]
        	then
                	break
        	fi
	done

##############################################
##	create the user with the password and grant all privillages to him
	create_user $DB_NAME $DB_USER_NAME $DB_USER_PASSWORD
	retVal=$?
	if [ $retVal -ne 0 ]
	then
  		echo "User already existed, enter a different username"
 
	else
  		echo "USer added Successfully" 
		break
  		
	fi


done
#############################################
##	check internet connectivity
while :
do
	check_internet_connection 
	retVal=$?
	if [ $retVal -ne 0 ]
	then
		echo "Please check you internet connection"
	else
		echo "plsease fill in the next form with the same data you entered"
		break
	fi
done
##########################################
##	install WP
while : ## inner loop to enter the username
do
        echo    "Enter the Directory name to install the wordpress in "
        read DIR
        is_null $DIR
        if [  $? -eq 0 ]
        then
            break
       	fi
done

install_wp $DIR
#################################
##	create the cron job
crontab -l | { cat; echo "0 0 * * * exec /bin/bash backup.sh $DIR $DB_NAME"; } | crontab -

echo "bye"
exit 0
##################################
