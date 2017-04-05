#!/bin/bash

dateStamp=`date +"%F%H%M%S"`

echo "Start Backup of all services..."

mkdir /var/backups/${dateStamp}

#redmine Backup
echo "Starting Redmine Backup"
 docker exec {{redmine_name}}-redmine-database \
  myqldump -u root -p{{redmine_database_root_password}} redmine \
  > /var/backups/${dateStamp}/redmine_latest.sql

 tar cf  /var/backups/${dateStamp}/redmine_files_themes_plugins_backup_$dateStamp.tar \
  /var/redmine-{{redmine_name}}/themes \
  /var/redmine-{{redmine_name}}/files \
  /var/redmine-{{redmine_name}}/plugins
echo "Redmine Backup finished"

# gitlab backup
echo "Starting Gitlab Backup"
gitlab-rake gitlab:backup:create SKIP=registry
tar -cf /var/backups/${dateStamp}/gitlab_config.tar /etc/gitlab

# sandstorm
echo "Starting Sandstorm Backup"
tar -cf /var/backups/${dateStamp}/sandstorm.tar /opt/sandstorm

exit 0
