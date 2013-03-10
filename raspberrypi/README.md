In this directory you find some files, mainly scripts, to support running the webdisplay on a [RaspberryPi](http://www.raspberrypi.org).

* `autostart.sh`: script to start Midori, using this creates the following:
 * `midori`: directory Midori stores its configuration to.
 * `midori/midori.log`: logfile Midori writes to, useful for debugging the commands you sent to Midori.

* To send a command to the already running Midori you have to append the `-c` switch plus the according path to the Midori configuration directory (if you don't do so, you'll start a new instance of the browser). The command will probably look like this

 ```
/usr/bin/midori -c /home/pi/w61-webdisplay/raspberrypi/midori
 ```

 Have a look at `~/.xsession-errors` where `autostart.sh` sends its output to to find out about it.

* `w61-webdisplay.desktop`: autostart above script `autostart.sh`, just copy or link this file to `~/.config/autostart`; eventually modify the path in the `Exec=`line, maybe you have to create the directory first.

* `screencontrol.sh`: use `on` and `off` as first parameter invoking this script to (de)activate the HDMI output of your Pi, this action supposedly puts your screen into power saving mode and also brings it hopefully back. It also detects if its used by xscreensaver in which case it then waits to turn the output on as soon as the screen saver stops.

* `xscreensaver.conf`: a template for your ~/.xscreensaver configuration file, mainly it tells xscreensaver to use above `screencontrol.sh` as the default [DPMS](https://en.wikipedia.org/wiki/VESA_Display_Power_Management_Signaling) stuff will probably not work.
