#!/bin/sh
set -e
#xset s off dpms 0 10 0
xset dpms force off
i3lock -e -f -n -i ~/.config/i3/i3lock.png -c 000000
# i3lock --color=000000 --ignore-empty-password --show-failed-attempts --nofork
#xset s off -dpms
#xset dpms force off
