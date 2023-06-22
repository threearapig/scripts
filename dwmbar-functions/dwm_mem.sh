#!/bin/bash


dwm_mem() {
    icon_color="^c#3B001B^^b#6873790x88^"
    text_color="^c#3B001B^^b#6873790x99^"

	mem_icon=""
    mem_total=$(cat /proc/meminfo | grep "MemTotal:"| awk '{print $2}')
    mem_free=$(cat /proc/meminfo | grep "MemFree:"| awk '{print $2}')
    mem_buffers=$(cat /proc/meminfo | grep "Buffers:"| awk '{print $2}')
    mem_cached=$(cat /proc/meminfo | grep -w "Cached:"| awk '{print $2}')
    men_usage_rate=$(((mem_total - mem_free - mem_buffers - mem_cached) * 100 / mem_total))
    mem_text=$(echo $men_usage_rate | awk '{printf "%02d%", $1}')

    icon="$mem_icon"
    text="$mem_text"

    echo "$icon_color" "$icon" "$text_color""$text"
}


dwm_mem1(){
    icon_color="^c#3B001B^^b#6873790x88^"
    text_color="^c#3B001B^^b#6873790x99^"
    icon=""

	text=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
	echo -e "$icon_color" "$icon" "$text_color""$text"
}
