#!/bin/bash

/bin/bash ~/scripts/dualmon.sh &
/bin/bash ~/scripts/dwm-status.sh &
/bin/bash ~/scripts/wp-autochange.sh &
/bin/bash ~/scripts/setxmodmap-colemak.sh &

picom --experimental-backends --config ~/.config/picom/picom.conf >> /dev/null 2>&1 & # 开启picom
xfce4-power-manager &
fcitx5 &
wmname LG3D

/bin/bash ~/scripts/tap-to-click.sh &
/bin/bash ~/scripts/inverse-scroll.sh &

~/scripts/autostart_wait.sh &
