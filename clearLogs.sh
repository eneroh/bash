#!/bin/bash

LOG_DIR="/var/log"
PRUNE_DAYS=10

sleep 100

find "/ssd${variable_Location}" -mindepth 1 -mtime +"$prune_Days" -delete
