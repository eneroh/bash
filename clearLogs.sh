#!/bin/bash

LOG_DIR="/var/log"
prune_Days=10

sleep 100

find "/ssd${variable_Location}" -mindepth 1 -mtime +"$prune_Days" -delete
