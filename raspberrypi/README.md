In this directory you find some files, mainly scripts, to support running the webdisplay on a [RaspberryPi](http://www.raspberrypi.org).

* `autostart.sh`: script to start Midori.
* `w61-webdisplay.desktop`: autostart above script `autostart.sh`, just copy or link this file to `~/.config/autostart`; eventually modify the path in the `Exec=`line, maybe you have to create the directory first.
* `midori-config`: directory Midori stores its configuration to, set if started by `autostart.sh`.
