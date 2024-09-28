# Connecting via SSH and WIFI to a Pi 

### Wifi 

* Add the right wifi credentials to Pi Imager Configuration before flashing the SD card.

* Make sure to set the Region as IL to utilize more channels for the built-in 2.4 ghz wifi.

* Connect your computer to the same network as the Pi. 

* Put the Micro-SD card into the Pi and plug it into a power source (5V, 1.2A recommended). Let the Pi boot up and wait for the LED to stop blinking and stay solid green. 

* Options:

    - Version 1: 

        Router settings page: login to the admin page and you can find a list of connected devices and their IP addresses. Find the one that says raspberry pi and note the IP address.

    - Windows

        - Version 2:

            * If you recall the hostname you set in Pi Imager, ie `pi.local` then you can type `ping pi.local` in command prompt, click enter, and you should see the IP address of the Pi. If this doesn't work, you can try to ping `raspberrypi.local` or `raspberrypi` instead of `pi.local`. 

        - Version 3:

            * Type `ipconfig` in command prompt, click enter and find the relevant interface (usually Wireless LAN adapter Wi-Fi) and copy the IpV4 address. In this case, we are interested in `0.0.0.0` (replace 0.0.0.0 with your IP address).


            * Now type `arp -a -N 0.0.0.0 | FINDSTR dynamic` (replace 0.0.0.0 with your IP address), click enter and you will see the IP, MAC address of all devices found on the network. You will also see if it is static (pre-configured) or dynamic. The Pi will likely be dynamic. It should appear in a similar format to what you see below, but with more entries... Now you will need to figure out which entry is the Pi.


### SSH 

* Now that you have the IP address of the Pi and are sure it is online (via the ping command), you can SSH into it. There are several SSH clients available and even some that are built for Android and iOS... the process is similar for all of them, but I will show you how to do it on Windows. 

` (replace  with the IP address of the Pi). and pi with your username if you changed it in Pi Imager. The default username is pi and the password is raspberry.`

- Windows

    * Open command prompt and type `ssh pi@0.0.0.0 (replace 0.0.0.0 with your IP address, pi with the username you set). You will be prompted to enter your password and then click enter... You will then be logged in. 

