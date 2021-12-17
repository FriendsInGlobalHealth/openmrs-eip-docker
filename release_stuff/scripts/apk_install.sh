#!/bin/sh
#This bash install all the necessary applications needed by the container

HOME_DIR=/home/eip
LOG_DIR=$HOME_DIR/shared/logs/apk

if [ -d "$LOG_DIR" ]; then
       echo "THE LOG DIR EXISTS" | tee -a $LOG_DIR/apk_install.log
else
       mkdir -p $LOG_DIR
       echo "THE LOG DIR WAS CREATED" | tee -a $LOG_DIR/apk_install.log
fi

apk update

echo "TRYING TO INSTALL GIT" | tee -a $LOG_DIR/apk_install.log
apk add git
echo "GIT INSTALLED" | tee -a $LOG_DIR/apk_install.log

echo "INSTALLING SSMPT" | tee -a $LOG_DIR/apk_install.log
apk add ssmtp
echo "SSMPT INSTALLED" | tee -a $LOG_DIR/apk_install.log

echo "INSTALLING OPENSSH" | tee -a $LOG_DIR/apk_install.log
apk add openssh
echo "OPENSSH INSTALLED" | tee -a $LOG_DIR/apk_install.log

echo "INSTALLING EXPECT" | tee -a $LOG_DIR/apk_install.log
apk add expect
echo "EXPECT INSTALLED" | tee -a $LOG_DIR/apk_install.log
