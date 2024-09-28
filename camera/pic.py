from picamzero import Camera

cam = Camera()
print("cam opened")
cam.resolution = (1024, 768) 
#cam.start_preview()
cam.take_photo("image.jpg")
#cam.stop_preview()
print("cam done")