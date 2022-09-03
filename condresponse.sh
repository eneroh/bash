#!/bin/sh

ping raspberrypi.snopoint.com | grep -c 1 "time" && echo "It's alive"
