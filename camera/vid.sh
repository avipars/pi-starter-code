#!/bin/bash

export DISPLAY=:0
libcamera-vid -t 0 -f --width 1920 --height 1080 --framerate 24 --exposure normal --awb auto --brightness -0. --vflip --hflip #take a video in 1080p with 24 frames, auto white balance, flip vertically and horizontally 
