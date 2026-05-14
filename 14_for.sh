#!/bin/bash

MYUSERS="alpha beta gamma"

for usr in $MYUSERS
do
echo "adding user $usr"
useradd $usr 
id $usr
done

