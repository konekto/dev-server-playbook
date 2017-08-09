#!/usr/bin/env bash

currentDate=$(date +%Y%m%d-%H%M%S)

gitlab-rake gitlab:backup:create SKIP=registry,builds
tar -czf {{GLOBAL_BACKUP_FOLDER}}/gitlab/${currentDate}_gitlab_config.tar /etc/gitlab