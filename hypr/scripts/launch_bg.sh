#!/bin/sh 
hyprctl dispatch workspace 1; sleep 0.3; kitten panel --edge=background --layer=bottom $1 &
sleep 0.3; hyprctl dispatch workspace $2; sleep 0.3; kitten panel --edge=background --layer=bottom $3 & 
sleep 0.3; hyprctl dispatch workspace 1
