#!/bin/bash

# Database credentials
USER="wordpress_user"
PASSWORD="Datascientest2022"
HOST="192.168.10.13"
DB_NAME="wordpress_database"

# Backup storage location
BACKUP_DIR="database_loadbalancer_backup"
DATE=$(date +%F-%T)

# Create backup
mysqldump --user=${USER} --password=${PASSWORD} --host=${HOST} ${DB_NAME} > ${BACKUP_DIR}/${DB_NAME}-${DATE}.sql

# Optional: delete old backups (e.g., older than 30 days)
find ${BACKUP_DIR} -type f -name "*.sql" -mtime +30 -exec rm {} \;
