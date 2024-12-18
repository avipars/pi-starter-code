#!/usr/bin/python3

from picamera2 import Picamera2

picam2 = Picamera2()
print("cam opened")

picam2.start_and_capture_file("test.jpg") # Capture 1 image with default configurations.
print("cam done")
