#!/bin/bash

LOG_DIR="/var/log"
PRUNE_DAYS=10

sleep 100

find "/ssd${LOG_DIR}" -mindepth 1 -mtime +"$PRUNE_DAYS" -delete
