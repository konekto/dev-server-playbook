#!/usr/bin/env bash

currentDate=$(date +%Y%m%d-%H%M%S)

docker exec {{redmine_name}}-redmine-database mysqldump -u root -p{{redmine_database_root_password}} redmine > {{GLOBAL_BACKUP_FOLDER}}/{{redmine_name}}-redmine/${currentDate}_redmine_backup.sql

tar czvf {{GLOBAL_BACKUP_FOLDER}}/{{redmine_name}}-redmine/${currentDate}_redmine_files_backup.tar.gz /var/redmine-{{redmine_name}}/files /var/redmine-{{redmine_name}}/plugins /var/redmine-{{redmine_name}}/themes