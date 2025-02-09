#!/bin/bash

### ram_processes.sh ###
# same as the cpu_processes.sh script but for ram

ps axch -o cmd:15,%mem --sort:-%mem | head
