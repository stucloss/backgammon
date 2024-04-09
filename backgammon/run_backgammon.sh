#!/bin/bash
# Create a virtual display
Xvfb :1 -screen 0 1024x768x24 &

# Set the DISPLAY environment variable to point to the virtual display
export DISPLAY=:1 myapp

# Run your Python script
python3 /home/ec2-user/backgammon/backgammon/Main.py