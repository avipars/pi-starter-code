#!/bin/bash

# Code to control and play with the built in LED (checked and works on a PI Zero)

# turn on LED
echo 1 | sudo tee /sys/class/leds/ACT/brightness

# turn off LED
echo 0 | sudo tee /sys/class/leds/ACT/brightness

# heatbeat blink
echo heartbeat | sudo tee /sys/class/leds/ACT/trigger

# back to normal
echo mmc0 | sudo tee /sys/class/leds/ACT/trigger
