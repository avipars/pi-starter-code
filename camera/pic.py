#!/usr/bin/python3

from picamzero import Camera

cam = Camera()
print("cam opened")
cam.resolution = (1024, 768) 
#cam.start_preview() # commented out because in headless mode there will be no way to deal with a preview
cam.take_photo("image.jpg")
#cam.stop_preview() # see above
print("cam done")
