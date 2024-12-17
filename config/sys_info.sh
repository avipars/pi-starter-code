#!/bin/bash

# Script to get hardware diagnostics and info about the PI 
# Timestamp-based directory creation
timestamp=$(date +%s)
last_digits=${timestamp: -6}
RESULTS_DIR="results/dir_$last_digits"

# Check if an argument is provided
if [[ $# -gt 0 ]]; then
  # Validate the argument: Check if it's valid ASCII (printable characters)
  if [[ "$1" =~ ^[[:print:]]+$ ]]; then
    RESULTS_DIR="results/dir_$1_$last_digits"
    echo "Using custom directory name: $RESULTS_DIR"
  else
    echo "Error: Invalid argument. Argument must contain only printable ASCII characters."
    echo "Using default directory name: $RESULTS_DIR"
  fi
fi

# Create the results directory
mkdir -p "$RESULTS_DIR"

LOGFILE="$RESULTS_DIR/pi_diagnostic.log"
ERRORFILE="$RESULTS_DIR/pi_diagnostic_errors.log"

# Clear log files
> $LOGFILE
> $ERRORFILE

echo "Starting Raspberry Pi Diagnostic..." | tee -a $LOGFILE 2>> $ERRORFILE

# --- Wi-Fi Test ---
echo "Checking Wi-Fi..." | tee -a $LOGFILE 2>> $ERRORFILE
WIFI=$(iwgetid -r 2>> $ERRORFILE)
if [ -z "$WIFI" ]; then
    echo "Wi-Fi not connected, scanning networks..." | tee -a $LOGFILE 2>> $ERRORFILE
    sudo iwlist wlan0 scan 2>> $ERRORFILE | grep 'ESSID' | tee -a $LOGFILE 2>> $ERRORFILE
else
    echo "Connected to Wi-Fi: $WIFI" | tee -a $LOGFILE 2>> $ERRORFILE
fi

# --- Bluetooth Test ---
echo "Checking Bluetooth..." | tee -a $LOGFILE 2>> $ERRORFILE
BT_DEVICES=$(hcitool scan 2>> $ERRORFILE)
if [ -z "$BT_DEVICES" ]; then
    echo "No Bluetooth devices found." | tee -a $LOGFILE 2>> $ERRORFILE
else
    echo "Bluetooth devices found: $BT_DEVICES" | tee -a $LOGFILE 2>> $ERRORFILE
fi

# RAM info
echo "Gathering RAM stats..." | tee -a $LOGFILE 2>> $ERRORFILE
free -m > "$RESULTS_DIR/free.txt"

# CPU information
echo "Gathering CPU info..." | tee -a $LOGFILE 2>> $ERRORFILE
cat /proc/cpuinfo > "$RESULTS_DIR/cpuinfo.txt"
lscpu > "$RESULTS_DIR/lscpu.txt"

# Temperature check
echo "Measuring temperature..." | tee -a $LOGFILE 2>> $ERRORFILE
vcgencmd measure_temp > "$RESULTS_DIR/temp.txt"

# Process info
echo "Gathering process info..." | tee -a $LOGFILE 2>> $ERRORFILE
ps -ef > "$RESULTS_DIR/ps.txt"

# SD card clock speed
echo "Checking SD card clock speed..." | tee -a $LOGFILE 2>> $ERRORFILE
sd_clock=$(($(sudo awk 'NR==2 { printf $3 }' /sys/kernel/debug/mmc0/ios) / 1000000))
echo $sd_clock > "$RESULTS_DIR/sd_clock.txt"

# Voltage check
echo "Measuring core voltage..." | tee -a $LOGFILE 2>> $ERRORFILE
vcgencmd measure_volts core > "$RESULTS_DIR/core.txt"
vcgencmd measure_volts uncached >> "$RESULTS_DIR/core.txt"

# OS details
echo "Gathering OS details..." | tee -a $LOGFILE 2>> $ERRORFILE
uname -a > "$RESULTS_DIR/uname.txt"

# USB details
echo "Checking USB devices..." | tee -a $LOGFILE 2>> $ERRORFILE
lsusb -t -v > "$RESULTS_DIR/lsusb.txt"

# Network interface info
echo "Getting network interface details..." | tee -a $LOGFILE 2>> $ERRORFILE
ifconfig > "$RESULTS_DIR/ifconfig.txt"

# Wireless interface info
echo "Getting wireless interface details..." | tee -a $LOGFILE 2>> $ERRORFILE
iwconfig > "$RESULTS_DIR/iwconfig.txt"

# Ping tests
echo "Running ping tests..." | tee -a $LOGFILE 2>> $ERRORFILE
ping -c 6 google.com > "$RESULTS_DIR/ping.txt"
ping -c 6 1.1.1.1 > "$RESULTS_DIR/ping2.txt"

# Compress results into a zip file
echo "Zipping results..." | tee -a $LOGFILE 2>> $ERRORFILE
zip -r "$RESULTS_DIR.zip" "$RESULTS_DIR/" 2>> $ERRORFILE

# Notify the user
echo "All results saved in '$RESULTS_DIR' and zipped as '$RESULTS_DIR.zip'." | tee -a $LOGFILE 2>> $ERRORFILE
echo "You can use SCP to download: scp pi@raspberrypi.local:scripts/$RESULTS_DIR.zip ." | tee -a $LOGFILE 2>> $ERRORFILE