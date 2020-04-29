#/bin/bash
###############################33
##      a script to validate data passed by the user


##############################
##      a function to return the number of passed arguments
##	return codes
##	1: wrong passed number of params
##	0: correct passed number of params
function check_number_of_params()
{
	NUM=$(($1+1))
        if [ ! $# -eq $NUM ]
        then
                echo "Invalid Number of  paramters"
                echo "please pass only $1 parameter"
                return 1
return 0
fi
}
####################################################
##	a function to check if the passed params is null
##	return codes
##	1: Null params
##	0: not Null params

function is_null()
{
	if [ $# -eq 0 ]
	then
        	
		return 1
fi
return 0
}

###########################################
##	a function to check the internet connection of the user
##	return code:
##	0: ther is connection
##	1: no connection
function check_internet_connection ()
{
	wget -q --spider  http://google.com
	if [ $? -eq 0 ]; then
    		return 0
	else
    		return 1
fi

}















