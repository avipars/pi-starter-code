# Brief install guide for Pi Zero W

Install PiOS Imager - https://www.raspberrypi.com/software/


Choose device -> Pi Zero

![Choose device -> Pi Zero](/images/install/image.png) 


Choose OS -> Pi OS (other)

![Choose OS -> Pi OS (other)](/images/install/image-1.png)

Pi OS Lite (32 bit)

![Pi OS Lite (32 bit)](/images/install/image-2.png)

Storage -> Pick your micro-sd card 

If it alreayd is partitioned, you may need to delete the volumes via compmgmt.msc (Run as admin). Please exercise caution and google it for further assistance if needed. 

![Storage -> Pick your micro-sd card ](/images/install/image-3.png)


Click Next -> Edit Settings

![Click Next -> Edit Settings](/images/install/image-5.png)

Here make sure to write down and save the hostname, username, password, and Wi-Fi credentials (case sensitive). 

Also, change the timezone, and region accordingly to where you are

Services -> Enable SSH -> Use password authentication

* This is not the most "secure" way to set up your Pi, but for a beginner it is a good starting point. 

![Enable SSH](/images/install/image-6.png)

Once you are done, click the X and then Yes. 

![yes](/images/install/image-7.png)

Now, you are back to the original screen. Finally click Next to proceed and flash the image!