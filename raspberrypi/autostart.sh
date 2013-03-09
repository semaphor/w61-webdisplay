#!/bin/bash


## config:
W61DEBUG=1
W61DIR=~/w61-webdisplay
W61URL=$W61DIR/index.html
W61MIDORICONF=$W61DIR/raspberrypi/midori
W61WAITFORMIDORI=7
W61BLANKTIME=1800
W61DISPLAY=:0.0


## starting:
echo -e "\n---- w61-webdisplay: raspberrypi-autostart.sh ----\n"

#set/disable screensaver and display power management, we're using xscreensaver with our own script:
xset -display $W61DISPLAY s $W61BLANKTIME
xset -display $W61DISPLAY dpms 0 0 0

if [[ "$W61DEBUG" -eq 1 ]]; then
	echo -e "DEBUG: starting terminal.\n"
	lxterminal --geometry=96x30 --working-directory=$W61DIR/raspberrypi/&
fi

# derived variables:
MIDORIBIN=`which midori`
MIDORICMD=`echo "$MIDORIBIN -c $W61MIDORICONF"`


## start midori:
echo -e "Starting Midori with the following command:\n  $MIDORICMD\n"

echo "Changing to $W61DIR."
cd $W61DIR

echo "Starting midori and waiting $W61WAITFORMIDORI seconds..."
rm $W61MIDORICONF/running
$MIDORICMD --name=w61 --log-file=$W61MIDORICONF/midori.log &
sleep $W61WAITFORMIDORI

# so far i wasn't able to execute further commands when starting in "app mode":
#$MIDORICMD -e Fullscreen --log-file=$W61MIDORICONF/midori.log --app $W61URL&

echo "Loading page and closing other tabs(just to be shure)..."
$MIDORICMD $W61URL
$MIDORICMD -e TabCloseOther


## correct window settings:
egrep -q 'last-window-state=MIDORI_WINDOW_FULLSCREEN' $W61MIDORICONF/config
if [[ "$?" -ne 0 ]]; then
	echo "Switching to fulscreen mode."
	$MIDORICMD -e Fullscreen
else
	echo "Fullscreen (already enabled)."
fi

$MIDORICMD -e Navigationbar
sleep 1
egrep -q 'show-navigationbar=false' $W61MIDORICONF/config
if [[ "$?" -ne 0 ]]; then
        echo "Hiding navigation bar."
	$MIDORICMD -e Navigationbar
else   
        echo "Navigation bar hidden (already)."
fi


echo -e "\n---- Done, bye :) ----\n"
