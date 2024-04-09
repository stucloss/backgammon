#!/bin/bash

# Start Xvfb
Xvfb :1 -screen 0 1024x768x24 &

# Export the DISPLAY variable to point to the virtual display
export DISPLAY=:1

# Run your Python script
python3 Main.py