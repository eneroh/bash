#!/bin/bash

sensors | grep k10 -A 3 | sed -e 's/k10temp-pci-00c3/CPU Temp/g' | sed -e 's/Tccd1/Core Complex Die (Tccd1)/g' | sed -e 's/Tctl/Temp. Ctrl. Value (Tctl)/g' | sed -e 's/Adapter: PCI adapter//g' | tr -s " " | tr -s '\n'
