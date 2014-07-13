#!/usr/bin/env sh
# non overlapping a 2,4GHz g/n OFDM HT20
# ch 1  - 2412 MHz
# ch 6  - 2437 MHz
# ch 11 - 2462 MHz
#
# HT40
# ch 3  - 2422 MHz


rfkill unblock wifi
wait

iw wlan2 set type ibss
wait

ip link set wlan2 up
wait

iw wlan2 ibss join libernet 2422
wait

#iw wlan2 ibss leave libernet

#segue batman-adv e quindi autoip

    #  ifconfig wlan0 down

    # iwconfig wlan0 mode ad-hoc essid hacdc-batman channel 8

    # ifconfig wlan0 up


modprobe batman-adv

batctl if add wlan2

ifconfig wlan2 mtu 1527

cat /sys/class/net/wlan2/batman_adv/iface_status

ifconfig wlan2 0.0.0.0

ifconfig bat0 up

avahi-autoipd -D -s bat0

