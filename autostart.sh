#!/bin/bash

/bin/bash ~/scripts/dwm-status.sh &
/bin/bash ~/scripts/wp-autochange.sh &
picom -b
fcitx5 &
~/scripts/autostart_wait.sh &
