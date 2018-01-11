#!/usr/bin/env bash

#{{ ansible_managed }}

CONTAINER_NAME="onlyoffice-community-server"
ONLYOFFICE_HOME="/var/onlyoffice"

ONLYOFFICE_DATA="$ONLYOFFICE_HOME/data"

currentDate=$(date +%Y%m%d-%H%M%S)

docker exec ${CONTAINER_NAME} mysqldump -h localhost onlyoffice | gzip > {{GLOBAL_BACKUP_FOLDER}}/onlyoffice/${currentDate}_onlyoffice_backup.sql.gz

tar czf {{GLOBAL_BACKUP_FOLDER}}/onlyoffice/${currentDate}_onlyoffice_files_backup.tar.gz ${ONLYOFFICE_DATA}
