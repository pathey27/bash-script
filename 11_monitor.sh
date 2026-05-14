#!/bin/bash

 echo "#########################################"


ls /var/run/httpd/httpd.pid &> /dev/null

if [ $? -eq 0 ]
then
echo "httpd process is running"

else
echo "httpd process is not running"
echo "starting the process"

systemctl start httpd

if [ $? -eq 0 ]
then 
echo "process started successfully"
else
echo "process failed,contact the admin"
fi


fi

