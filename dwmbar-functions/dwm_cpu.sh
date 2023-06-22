#!/bin/bash

icon_color="^c#3E206F^^b#6E51760x88^"
text_color="^c#3E206F^^b#6E51760x99^"

dwm_cpu() {
    cpu_icon=" "

    cpu_text=$(top -n 1 -b | sed -n '3p' | awk '{printf "%02d%", 100 - $8}')

    icon=" $cpu_icon"
    text="$cpu_text"

    echo "$icon_color""$icon""$text_color""$text"
}
