#!/bin/zsh

nvidia-settings -q gpucoretemp | sed -n "/Attribute 'GPUCoreTemp' (Arch-DT:0\[/p" | egrep -o "([0-9]{2})" | sed '/^.*/ s/$/c/'
