#!/usr/bin/env bash

#{{ ansible_managed }}

NEXTCLOUD_DATABASE_CONTAINER="nextcloud-mysql"
ONLYOFFICE_DATABASE_CONTAINER="onlyoffice-postgresql"

CONTAINER_NAME="onlyoffice-community-server"
NEXTCLOUD_HOME="{{services_folder}}/nextcloud"

NEXTCLOUD_DATA="$NEXTCLOUD_HOME/data"

currentDate=$(date +%Y%m%d-%H%M%S)

docker exec ${NEXTCLOUD_DATABASE_CONTAINER} mysqldump -h localhost -u root -p{{nextcloud_mysql_root_password}} {{nextcloud_mysql_database}} | gzip > {{GLOBAL_BACKUP_FOLDER}}/nextcloud/${currentDate}_nextcloud_backup.sql.gz
docker exec ${ONLYOFFICE_DATABASE_CONTAINER} pg_dump nextcloud-onlyoffice -h localhost -U nextcloud-user | gzip > {{GLOBAL_BACKUP_FOLDER}}/nextcloud/${currentDate}_nextcloud_onlyoffice_ds_backup.sql.gz

tar czf {{GLOBAL_BACKUP_FOLDER}}/nextcloud/${currentDate}_nextccloud_data_backup.tar.gz ${NEXTCLOUD_DATA}
