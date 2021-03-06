#!/bin/sh
# This scrip is intended send email with information related to upgrade process
#

#ENV
HOME_DIR="/home/eip"
#HOME_DIR="/home/eip/prg/docker/eip-docker-testing"
SCRIPTS_DIR="$HOME_DIR/scripts"
LOG_DIR="$HOME_DIR/shared/logs/upgrade"


EMAIL_CONTENT_FILE="$HOME_DIR/update_email_content"
UPDATES_LOG_FILE="$LOG_DIR/upgrade.log"

. $SCRIPTS_DIR/release_info.sh

LOCAL_RELEASE_NAME=$RELEASE_NAME
LOCAL_RELEASE_DATE=$RELEASE_DATE

#recipient="jorge.boane@fgh.org.mz" 
#sender="jorge.boane@fgh.org.mz" 
#subject="EIP_REMOTO_ESTADO_DE_ACTUALIZACAO_$db_sync_senderId" 
#content="Caros" 
#content="$content\r\r\nJunto enviamos o report da ultima tentativa de actualizacao da aplicacao openmrs-eip."  
#content="$content\r\r\n" 
#content="$content\r\r\nINFORMACAO DAS RELEASES" 
#content="$content\r\r\n---------------------" 
#content="$content\r\r\n CURRENT RELEASE INFO {NAME: $LOCAL_RELEASE_NAME, DATE: $LOCAL_RELEASE_DATE}"
#content="$content\r\r\n--------------------" 
#content="$content\r\r\n" 
#content="$content\r\r\nEnviado automaticamente a partir do servidor $db_sync_senderId." 

#echo $content | mutt -s $subject -a $UPDATES_LOG_FILE -b jorge.boane@fgh.org.mz

#echo "EMAIL SENT!"

EMAIL_CONTENT_FILE="/home/eip/update_email_content"

echo "To: jorge.boane@fgh.org.mz" >> $EMAIL_CONTENT_FILE
echo "From: jorge.boane@fgh.org.mz" >> $EMAIL_CONTENT_FILE
echo "Subject: EIP REMOTO - ESTADO DE ACTUALIZACAO[$db_sync_senderId]" >> $EMAIL_CONTENT_FILE
echo "Caros" >> $EMAIL_CONTENT_FILE
echo "Junto enviamos o report da ultima tentativa de actualizacao da aplicacao openmrs-eip." >> $EMAIL_CONTENT_FILE
echo "" >> $EMAIL_CONTENT_FILE
echo "INFORMACAO DAS RELEASES" >> $EMAIL_CONTENT_FILE
echo "---------------------" >> $EMAIL_CONTENT_FILE
echo "CURRENT RELEASE INFO {NAME: $LOCAL_RELEASE_NAME, DATE: $LOCAL_RELEASE_DATE}" >> $EMAIL_CONTENT_FILE
echo "--------------------" >> $EMAIL_CONTENT_FILE
echo "" >> $EMAIL_CONTENT_FILE
echo "Enviado automaticamente a partir do servidor $db_sync_senderId." >> $EMAIL_CONTENT_FILE
echo "" >> $EMAIL_CONTENT_FILE
echo "" >> $EMAIL_CONTENT_FILE
echo "-----------------------------------------------------" >> $EMAIL_CONTENT_FILE
echo "LOG" >> $EMAIL_CONTENT_FILE
echo "-----------------------------------------------------" >> $EMAIL_CONTENT_FILE
cat $UPDATES_LOG_FILE >> $EMAIL_CONTENT_FILE
echo "-----------------------------------------------------" >> $EMAIL_CONTENT_FILE

sendmail -t -f  < $EMAIL_CONTENT_FILE

rm $EMAIL_CONTENT_FILE

echo "EMAIL SENT!"
