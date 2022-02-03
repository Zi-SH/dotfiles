#!/bin/bash

fanSpeed=$(nvidia-settings -q GPUCurrentFanSpeed | sed -n "/Attribute 'GPUCurrentFanSpeed' (Arch-DT:1\[/p" | egrep -o ": ([0-9]{1,2})" | sed 's/: //')
controlState=$(nvidia-settings -q GPUFanControlState | sed -n "/Attribute 'GPUFanControlState' (Arch-DT:1\[/p" | egrep -o ": ([0-1]{1})" | sed 's/: //')

if [ $controlState = 1 ] ; then
   if [ $fanSpeed -ge "15" ] && [ $[fanSpeed-5] -gt "15" ] ; then
       nvidia-settings -a "[fan:0]/GPUTargetFanSpeed=$[fanSpeed-5]"
   else
       echo Fan speed at 15. Cannot raise.
   fi
else
   echo Fan control is off. Cannot raise speed.
fi
