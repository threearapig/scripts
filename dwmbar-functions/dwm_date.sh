#!/bin/bash

dwm_date(){

    icon_color="^c#4B005B^^b#7E51680x88^"
    text_color="^c#4B005B^^b#7E51680x99^"

    time_text="$(date '+%m/%d %H:%M')"
    case "$(date '+%I')" in
        "01") time_icon="󱑋" ;;
        "02") time_icon="󱑌" ;;
        "03") time_icon="󱑍" ;;
        "04") time_icon="󱑎" ;;
        "05") time_icon="󱑏" ;;
        "06") time_icon="󱑐" ;;
        "07") time_icon="󱑑" ;;
        "08") time_icon="󱑒" ;;
        "09") time_icon="󱑓" ;;
        "10") time_icon="󱑔" ;;
        "11") time_icon="󱑕" ;;
        "12") time_icon="󱑖" ;;
    esac

    icon="$time_icon"
    text="$time_text"

    echo "$icon_color $icon $text_color$text"

}
