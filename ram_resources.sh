#!/bin/bash
### ram_resources.sh ###

free -h | awk '/^Mem:/{print $3"/"$2}'
