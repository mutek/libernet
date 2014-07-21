#!/usr/bin/env sh
# non overlapping a 2,4GHz g/n OFDM HT20
# ch 1  - 2412 MHz
# ch 6  - 2437 MHz
# ch 11 - 2462 MHz
#
# HT40
# ch 3  - 2422 MHz

[ -z $1 ] && echo "utilizzo: "$0" start|stop|restart" && exit 1

opzione=$1
echo "Hai scritto: "$opzione

if [ $opzione = "start" ]
then

	echo "Eseguo: "$opzione

	rfkill unblock wifi
	wait

	iw wlan1 set type ibss
	wait

	ip link set wlan1 up
	wait

#	iw dev wlan0 set channel 3 HT40+

	iw dev wlan1 ibss join libernet 2422 HT40+
#	iw wlan1 ibss join libernet
	wait

#iw wlan1 ibss leave libernet

#segue batman-adv e quindi autoip

    #  ifconfig wlan0 down

    # iwconfig wlan0 mode ad-hoc essid hacdc-batman channel 8

    # ifconfig wlan0 up


	modprobe batman-adv
	wait

	batctl if add wlan1
	wait
	# b.a.t.m.a.n. adv cambia il frame
	ifconfig wlan1 mtu 1527
	wait

	cat /sys/class/net/wlan1/batman_adv/iface_status

	ifconfig wlan1 0.0.0.0
	wait

	ifconfig bat0 up
	wait

	avahi-autoipd -D -s bat0
	wait

	batctl o

	exit

elif [ $opzione = "stop" ]
then

	echo "Eseguo: "$opzione

	ifconfig bat0 down
	wait
	ifconfig wlan1 down
	wait	
	batctl if del wlan1
	wait
	iw wlan1 ibss leave
	wait
	ip link set wlan1 down

elif [ $opzione = "restart" ]
then

	echo "Eseguo: "$opzione
	echo "TO BE IMPLEMENTED"
	exit

else [ $opzione ]

	echo "utilizzo: "$0" start|stop|restart"
	exit

fi
