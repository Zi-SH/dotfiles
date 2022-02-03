#!/bin/bash

controlState=$(nvidia-settings -q GPUFanControlState | sed -n "/Attribute 'GPUFanControlState' (Arch-DT:0\[/p" | egrep -o ": ([0-1]{1})" | sed 's/: //')

if [ $controlState = 1 ] ; then
   nvidia-settings -a "[gpu:0]/GPUFanControlState=0"
else
   nvidia-settings -a "[gpu:0]/GPUFanControlState=1"
   nvidia-settings --a "[fan:0]/GPUTargetFanSpeed=25"
fi
