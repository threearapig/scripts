#!/bin/bash

/usr/bin/amixer -qM set Master 5%+ umute
bash ~/scripts/dwm-status-refresh.sh
