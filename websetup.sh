#!/bin/bash
set -e
# Installing dependencies
echo "#####################################"
echo "Installing packages"
echo "#####################################"


sudo yum install wget unzip httpd -y > /dev/null


# start and enable service
echo "######################################"
echo "start and enable httpd service"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd


#creating tmp directory
echo "###########################################"
echo "starting artifact deployment"

mkdir -p /tmp/webfiles
cd /tmp/webfiles

wget https://templatemo.com/tm-zip-files-2020/templatemo_511_journey.zip > /dev/null
unzip templatemo_511_journey.zip > /dev/null
sudo cp -r templatemo_511_journey/* /var/www/html/

sudo systemctl restart httpd


# clean up
echo "#################################################"
echo "removing tmp files"

rm -rf /tmp/webfiles

sudo systemctl status httpd
ls /var/www/html
