#!/usr/bin/env bash
# This sets the backlight brightness - must be run as root.
# This is specific to my system, and my system only - may have unintended consequences on a different system.

if [ $1 -gt 937 ]
    then echo "This is outside of the acceptable parameters. Please choose a value equal to or less than 937."
else echo $1 > /sys/class/backlight/intel_backlight/brightness
fi