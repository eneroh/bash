#!/bin/bash

### Pending upgrades ###
# - Load relevant dependencies
# - Create a temporary backup directory backup/tmp_$(date +%F)
# - Pause or flush services
# - Create data archive using tar/rync
# - Verify backup integrity with sha256sum 
# - Upload to remote storage i.e. cloud services/offsite location and confirm success w/ logs present
# - Rotate old backups
# - Delete local and remote backups older than retention period
# - Restart
# - Clean up logs older than 10 days
###

LOG_DIR="/var/log"
PRUNE_DAYS=10

sleep 100

find "/ssd${LOG_DIR}" -mindepth 1 -mtime +"$PRUNE_DAYS" -delete
