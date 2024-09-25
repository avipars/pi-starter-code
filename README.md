# pi-starter-code
Starter and sample code for the raspberry pi

## Configuration (even with headless)

* Use Raspberry Pi Imager (via their official site) to flash the SD card with Raspberry Pi OS. Pi Zero W needs a 32 bit OS, I advise going to the 'Raspberry Pi OS (other)' section and get Pi OS Lite (32 bit), this is headless mode. If you want a desktop mode, then go for a Legacy Pi OS version instead. 

    - Pi Zero 2 can use a 64-bit os

* It is worthwhile to configure extra settings (After clicking NEXT), you can set up a user, wifi network, ssh credentials, etc. 

* To utilize more channels for the built-in 2.4 ghz wifi, make sure to set the Region as IL too!

* After it writes and verifies the OS to the Micro-SD card, you can eject it and plug it into the Pi (the logo side should be facing up and visible partially when plugged in). Do not remove the micro sd card while the pi is on.

* Pi will boot up as soon as you plug it into a power source (5V, 2.5A recommended), POWER only port is on one end of the pi, the inner port can be used for data transfer, etc. It also can be (optionally) plugged into a computer and draws power from it.

* First boot will take a long time, wait till the LED stops blinking and stays solid which means it completed booting. 

* Via some network utility tool, you can see if it joined your wifi network and find the IP address of the pi.. then you can `ssh pi@<ip>` to connect to it. If you changed the username in Pi Imager, then use that username instead of `pi`.

[sudo raspi-config](https://www.raspberrypi.com/documentation/computers/configuration.html)

    * Use arrows, enter, esc keys to navigate 

    * Some settings require a reboot, some other settings may not work or be relevant in headless mode 


##  Power 

```bash
sudo shutdown now # Wait for the LED to turn off completely, then you can unplug it from power
``` 


```bash
sudo shutdown -r now # Reboots the pi
```


## GPIO

[https://pinout.xyz](Site with pinout info)


```bash
gpio readall 
```
or 
```bash
pinout
```

Make sure to shut off the pi completely and unplug from electricity before connecting or disconnecting any wires to the GPIO pins 

## Camera 

Read this guide if you are having any issues with the camera: https://forums.raspberrypi.com/viewtopic.php?t=362707

Image previews will probably not work via headless mode, I use SCP usually to copy the saved image file from the Pi to my Desktop PC 

### Via Python:

Picamera2 is recommended for newer Debian Builds (IE bookworm and newer). 

```bash
sudo apt install -y python3-picamera2 # if it wasn't preinstalled with your system
```

### Via CLI:

[Documentation](https://www.raspberrypi.com/documentation/computers/camera_software.html#install-libcamera-and-rpicam-apps)

try to use rpicam rather than libcamera for newer builds (explanation in documentation)

```bash
rpicam-hello --list-cameras -n -v # shows all compatible cameras found
```


```bash
rpicam-still -o ./image.jpg # take a photo and save as jpg

```
