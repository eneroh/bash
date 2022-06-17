#!/bin/sh

ping raspberrypi.snopoint.com | grep "time" && echo "It's alive"
