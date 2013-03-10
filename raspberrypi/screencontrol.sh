#!/bin/bash

## Small script to control the display (powersave, waking up),

#  It simply (de)activates the HDMI output on a Raspberry Pi, this is needed due to the use of a HDMI-VGA adapter.
#  Its also designed for beeing used as a module for xscreensaver: if the script is started by xscreensaver it waits until the screensaver wakes up, xscreensaver then kills (SIGTERM) the process it started (for actually drawing on the screen); this script catches SIGTERM and forks itself to turn the display on again.


## config:
MODE="DMT 18"

echo "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: starting."

## switch cases:
case "$1" in

"off")

	echo "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: off, PID $$ (PPID $PPID)"

	echo -ne "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: "
	/opt/vc/bin/tvservice -o

	PARENTCOMMAND=`ps hcf -o cmd -p $PPID`
	PARENTCOMMAND=`basename $PARENTCOMMAND`
	if  [[ "$PARENTCOMMAND" == "xscreensaver" ]]; then
		#keep the process alive and idling for a long time:
		sleep 10000d&
		ALIBI=$!
		echo "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: invoked by xscreensaver."
		echo "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: sleep's PID: $ALIBI"

		trap "echo 'w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: off, caught $sig (PID $$, PPID $PPID)'; kill $ALIBI; /home/pi/w61-webdisplay/raspberrypi/screencontrol.sh on \&; exit 0;" SIGTERM
		wait $ALIBI
		echo "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: waited! this should not happen, there probably went something wrong with xscreensaver."
		exit 2
	fi

	;;

"on")
	echo "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: on:  PID $$ (PPID $PPID)"

	echo -ne "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: "
	/opt/vc/bin/tvservice -e"$MODE"
	# small hack to "reactivate" the graphix... somehow.
	sudo chvt 6
	sudo chvt 7

	;;

*)
	echo -e "   Have a look at the script for how to use it ;)\n\n   Exiting."
	exit 1

	;;

esac


echo "w61-webdisplay/screencontrol.sh `date +%H:%M:%S`: Done, bye :)."

exit 0
