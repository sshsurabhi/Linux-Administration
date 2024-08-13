#!/bin/bash

# Configuration directories
sudo cp  /etc/letsencrypt/live/nginxwordpress.course-datascientest.cloudns.ch/fullchain.pem backup_files_nginx_loadbalancer/
sudo cp  /etc/letsencrypt/live/nginxwordpress.course-datascientest.cloudns.ch/privkey.pem backup_files_nginx_loadbalancer/
sudo cp  /etc/letsencrypt/options-ssl-nginx.conf backup_files_nginx_loadbalancer/
sudo cp  /etc/letsencrypt/ssl-dhparams.pem backup_files_nginx_loadbalancer/

sudo cp  /var/log/nginx/access.log backup_files_nginx_loadbalancer/
sudo cp  /var/log/nginx/error.log backup_files_nginx_loadbalancer/

# Backup storage location
BACKUP_DIR="backup_files_nginx_loadbalancer/"
DATE=$(date +%F-%T)

# Create backup
tar --warning=no-file-changed -czf ${BACKUP_DIR}Apache-php-config-${DATE}.tar.gz "${BACKUP_DIR}"

# Optional: delete old backups (e.g., older than 30 days)
find ${BACKUP_DIR} -type f -name "*.tar.gz" -mtime +30 -exec rm {} \;

echo "Backup completed on ${DATE}" >> "${BACKUP_DIR}/backup.log"
