#!/bin/bash

temp="$(/usr/bin/nvidia-settings -q gpucoretemp -t)"

case $temp in

        [6-9][0-9])
                #echo "60-90";
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=90">/dev/null 2>/dev/null;
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=90">/dev/null 2>/dev/null;;
        5[5-9])
                #echo "55-59";
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=70">/dev/null 2>/dev/null;
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=70">/dev/null 2>/dev/null;;
        5[0-4])
                #echo "50-54";
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=55">/dev/null 2>/dev/null;
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=55">/dev/null 2>/dev/null;;
        4[5-9])
                #echo "45-49";
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=45">/dev/null 2>/dev/null;
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=45">/dev/null 2>/dev/null;;
        4[0-4])
                #echo "40-44";
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=40">/dev/null 2>/dev/null;
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=40">/dev/null 2>/dev/null;;
        [0-3][0-9])
                #echo "00-39";
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=30">/dev/null 2>/dev/null;
                /usr/bin/nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=30">/dev/null 2>/dev/null;;
esac
