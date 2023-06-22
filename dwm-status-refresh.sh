LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")
export IDENTIFIER="unicode"

function get_bytes {
	# Find active network interface
	interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
	line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
	eval $line
	now=$(date +%s%N)
}

function get_velocity {
	value=$1
	old_value=$2
	now=$3

	timediff=$(($now - $old_time))
	velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
	if test "$velKB" -gt 1024
	then
		echo $(echo "scale=2; $velKB/1024" | bc)MB/s
	else
		echo ${velKB}KB/s
	fi
}

get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

. "$DIR/dwmbar-functions/dwm_alsa.sh"
. "$DIR/dwmbar-functions/dwm_cpu.sh"
. "$DIR/dwmbar-functions/dwm_mem.sh"
. "$DIR/dwmbar-functions/dwm_date.sh"
. "$DIR/dwmbar-functions/dwm_battery.sh"
. "$DIR/dwmbar-functions/dwm_net.sh"

get_bytes

vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)

dwm_net(){
    icon_color="^c#000080^^b#3870560x88^"
    text_color="^c#000080^^b#3870560x99^"
    d_icon=" "
    u_icon=" "

    echo "$icon_color" "$d_icon""$text_color""$vel_recv" "$icon_color" "$u_icon""$text_color""$vel_trans"
}


xsetroot -name "$(dwm_cpu) $(dwm_mem) $(dwm_net) $(dwm_alsa) $(dwm_bat) $(dwm_date) "

old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

exit 0
