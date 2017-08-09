#!/usr/bin/env bash

currentDate=$(date +%Y%m%d-%H%M%S)

docker exec hackmdservice_hackmdPostgres_1 bash -c 'PGPASSWORD={{HMD_POSTGRES_PASSWORD}} pg_dump -U {{HMD_POSTGRES_USER}} -w hackmd' > {{GLOBAL_BACKUP_FOLDER}}/hackmd/${currentDate}_hackmd_dump.sql