#!/bin/sh

ping -c 1 raspberrypi.snopoint.com | grep "time" && echo "It's alive"
