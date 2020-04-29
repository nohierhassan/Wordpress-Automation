#/bin/bash
###############################33
##      a script to handle the installation and configuration of the WordPress!!
##      Exit codes
##      0: normal execution


###############################################
##	installing the wordpress
function install_wp()
{

	cd /var/www/html 
	sudo mkdir $1
	cd $1
	sudo wget http://wordpress.org/latest.tar.gz
	sudo tar xfz latest.tar.gz
	sudo rm -rf latest.tar.gz
	#cd $1
	sudo chown www-data:www-data  -R * 
	sudo find . -type d -exec chmod 755 {} \; 
	sudo find . -type f -exec chmod 644 {} \;
	xdg-open http://localhost/$1/wordpress
}
###################################################
##	take a backup automatically @12





