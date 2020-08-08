#!/bin/bash

#==============================================================================
#title           : ghost-backup.sh
#description     : Quick & Dirty script to backup Ghost Selfhosted blog
#author	      	 : Julien Mousqueton (@JMousqueton)
#date            : 20200801
#version         : 1.0
#usage		     : bash ghost-backup.sh
#notes           : Becarefull no check is done in this script 
#==============================================================================
# Variables
#==============================================================================
ghostUser=""
ghostPassword=""
# MySQL/MariaDB information 
ghostDatabase=''
ghostDatabaseUser=""
ghostDatabasePassword=``
# Where you will store your backup 
backupDir=/root/ghost-backup/
# Your blog domain (ie: https://www.example.com)
ghostDomain=""
# Folder of your blog 
ghostFolder=/var/www/ghost/
# Backup archive name
backupName="ghost-backup"
# Retention in days 
backupRetention=15

backupDate=${date +"%y-%m-%d"}
# Create backup Directory 
mkdir $backupDir/$backupDate

function BackupDatabase() {
mysqldump -u $ghostDatabaseUser -p$ghostDatabasePassword --quick --add-locks --lock-tables --extended-insert $ghostDatabase --skip-lock-tables | gzip > $backupDir/$backupDate/$ghostDatabase.sql.gz
}

function BackupJSON() {
  curl -c $backupDir/ghost-cookie.txt -d username=$ghostUser -d password=$ghostPassword -H "Origin: $ghostDomain" $domain/ghost/api/v3/admin/session
  if $(curl -f -b $backupDir/ghost-cookie.txt -H "Origin: $domain" $ghostDomain/ghost/api/v3/admin/db/ -o $backupDir/$backupDate/database.json); then
    echo Got JSON
    return 0
  else
    echo Failed to get json
    return 1
fi
}

function BackupContent() {
    tar cvfz ${backupDir}/$backupDate/ghost-site.tar.gz ${ghostFolder}/content/
}

function BackupConfig() {
    cp ${ghostFolder}/config.production.json ${backupDir}/$backupDate/
}

function purgeOldBackup() {
find ${backupDir} -name "${backupName}-*.tgz" -mtime +${backupRetention} -print -exec rm {} \;
}

function CreateBackupArchive() {
    tar cvfz ${backupDir}/${backupName}-${backupDate}.tgz ${backupDir}/$backupDate/
}

function DeleteWorkingDir() {
    rm -Rf ${backupDir}/$backupDate 
}

BackupDatabase
BackupContent
BackupConfig
