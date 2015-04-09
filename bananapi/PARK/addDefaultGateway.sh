#!/usr/bin/env sh


[ -z $1 ] && echo "usage: "$0" IP_DEFAULT_GATEWAY" && exit 1


IP_DEFAULT_GATEAWAY="$1"

ip route add default via $IP_DEFAULT_GATEWAY
wait

sleep 1

route -n

echo ""


