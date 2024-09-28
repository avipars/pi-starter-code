# Camera 

Read this guide if you are having any issues with the camera: https://forums.raspberrypi.com/viewtopic.php?t=362707

Image previews will probably not work via headless mode, I use SCP usually to copy the saved image file from the Pi to my Desktop PC 

### Via Python:

Picamera2 is recommended for newer Debian Builds (IE bookworm and newer). 

```bash
sudo apt install -y python3-picamera2 # if it wasn't preinstalled with your system
```

Try out some of the examples [here](https://github.com/raspberrypi/picamera2/tree/main/examples)

### Via CLI:

[Documentation](https://www.raspberrypi.com/documentation/computers/camera_software.html#install-libcamera-and-rpicam-apps)

try to use rpicam rather than libcamera for newer builds (explanation in documentation)

```bash
rpicam-hello --list-cameras -n -v # shows all compatible cameras found
```


```bash
rpicam-still -o ./image.jpg # take a photo and save as jpg
```

If you try to use the video feed, and you don't have a Pi 5... you should pass in the codec libav

```bash
rpicam-vid -t 10000 --codec libav --libav-format mp4 -o ./video.mp4, 10000 is the number of milliseconds to record
```
[Source](https://projects.raspberrypi.org/en/projects/getting-started-with-picamera/3)

Tested on Pi Camera Module V2.1

## cam.sh 

Firstly run `chmod +x cam.sh` to allow execution of the program.

Now you can run it in the current directory that the script is in via `./cam.sh` or `bash cam.sh`

Similar steps can be taken to try out with a video and `vid.sh`
## pic.py

You can run it by typing `python pic.py` 
