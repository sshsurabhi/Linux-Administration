#!/bin/bash

# WordPress directory
sudo cp /var/www/html/wp-config.php  loadbalancer_wordpress_backup2/

# Backup storage location
BACKUP_DIR="loadbalancer_wordpress_backup2/"
DATE=$(date +%F-%T)

# Create backup
tar --warning=no-file-changed -czf ${BACKUP_DIR}/wordpress-files-${DATE}.tar.gz "${BACKUP_DIR}"

# Optional: delete old backups (e.g., older than 30 days)
find ${BACKUP_DIR} -type f -name "*.tar.gz" -mtime +30 -exec rm {} \;
echo "Backup completed on ${DATE}" >> "${BACKUP_DIR}/backup.log"
