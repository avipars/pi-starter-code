#!/bin/bash

export DISPLAY=:0

libcamera-hello --list-cameras -n -v

libcamera-jpeg -o test.jpg