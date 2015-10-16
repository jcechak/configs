#!/bin/sh

~/.xprofile

# spusť xmonad
#xmonad
# spusť i3 a log dávej do ~/.i3/logfile
echo "Starting at $(date)" > ~/.i3/logfile
#exec /usr/bin/i3 -V -d all >> ~/.i3/logfile
# míň výpisů
exec /usr/bin/i3 > ~/.i3/logfile
