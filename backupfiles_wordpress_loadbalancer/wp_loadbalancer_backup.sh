#!/bin/bash

# WordPress directory
sudo cp /var/www/html/wp-config.php  backupfiles_wordpress_loadbalancer/

# Backup storage location
BACKUP_DIR="backupfiles_wordpress_loadbalancer/"
DATE=$(date +%F-%T)

# Create backup
tar -czf ${BACKUP_DIR}/wordpress-files-${DATE}.tar.gz "${BACKUP_DIR}"

# Optional: delete old backups (e.g., older than 30 days)
find ${BACKUP_DIR} -type f -name "*.tar.gz" -mtime +30 -exec rm {} \;
echo "Backup completed on ${DATE}" >> "${BACKUP_DIR}/backup.log"
