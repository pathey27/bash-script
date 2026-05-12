#!/bin/bash
set -e

#variable declaration

package="httpd wget unzip"
svc="httpd"
url="https://templatemo.com/tm-zip-files-2020/templatemo_511_journey.zip"
art_name="templatemo_511_journey"
tempdir="/tmp/webfiles"



# Installing dependencies
echo "#####################################"
echo "Installing packages"
echo "#####################################"


sudo yum install $package -y > /dev/null


# start and enable service
echo "######################################"
echo "start and enable httpd service"
echo "########################################"
sudo systemctl start $svc
sudo systemctl enable $svc


#creating tmp directory
echo "###########################################"
echo "starting artifact deployment"

mkdir -p $tempdir
cd $tempdir

wget $url > /dev/null
unzip $art_name.zip > /dev/null
sudo cp -r $art_name/* /var/www/html/

sudo systemctl restart $svc


# clean up
echo "#################################################"
echo "removing tmp files"

rm -rf $tempdir

sudo systemctl status $svc
ls /var/www/html
