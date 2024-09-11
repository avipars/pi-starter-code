# pi-starter-code
starter and sample code for the raspberry pi

## Configuration (even with headless)

* Use Raspberry Pi Imager (via their official site) to flash the SD card with Raspberry Pi OS. Pi Zero W needs a 32 bit OS, I advise going to the 'Raspberry Pi OS (other)' section and get Pi OS Lite (32 bit), this is headless mode. If you want a desktop mode, then go for a Legacy Pi OS version instead. 

* It is worthwhile to configure extra settings (After clicking NEXT), you can set up a user, wifi network, ssh credentials, etc. 

* To utilize more channels for the built-in 2.4 ghz wifi, make sure to set the Region as IL too!

* After it writes and verifies the OS to the Micro-SD card, you can eject it and plug it into the Pi (the logo side should be facing up and visible partially when plugged in). Do not remove the micro sd card while the pi is on.

* Pi will boot up as soon as you plug it into a power source (5V, 2.5A recommended), POWER only port is on one end of the pi, the inner port can be used for data transfer, etc. It also can be (optionally) plugged into a computer and draws power from it.

* First boot will take a long time, wait till the LED stops blinking and stays solid which means it completed booting. 

* Via some network utility tool, you can see if it joined your wifi network and find the IP address of the pi.. then you can `ssh pi@<ip>` to connect to it. If you changed the username in Pi Imager, then use that username instead of `pi`.

[sudo raspi-config](https://www.raspberrypi.com/documentation/computers/configuration.html)

    * Use arrows, enter, esc to navigate 

    * Some settings require a reboot, some other settings may not work or be relevant in headless mode 


##  Shutdown 

```bash
sudo shutdown now
```

    * Wait for the LED to turn off completely, then you can unplug it from power

## GPIO

    * [https://pinout.xyz](Site with pinout info)


    ```bash
    gpio readall 
    ```

    or 
    ```bash
    pinout
    ```

    * make sure to shut off the pi completely and unplug from electricity before connecting or disconnecting any wires to the GPIO pins

## Camera 

    * Read this guide first: https://forums.raspberrypi.com/viewtopic.php?t=362707

    * Try to use camera via python library: Picamera2

    * Image previews will not work via headless mode


