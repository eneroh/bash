#!/bin/sh
#conditional response, you have to meet the previous coniditions for the reply "It's alive" to appear

ping -c 1 raspberrypi.snopoint.com | grep "time" && echo "It's alive"
