#!/bin/bash
export TARGET_PATH="/var/www/html"
export chrome_browser=true
export chromium_browser=true
export opera_browser=true
export safari_browser=false
export ie_browser=false
export edge_browser=false
export headless_browser=false

# Change directory to the project path
cd "$(dirname "$0")"

# Copy necessary files
cp -R * $TARGET_PATH

# Install npm packages
npm install

# Build the application
npm run build

# Clean the existing log files
find . -name "*.log" -type f -delete

# Run the application
node ./bin/www &

# Open the default browser
if [ "$chrome_browser" = true ]; then
    google-chrome http://localhost:3000
fi

if [ "$chromium_browser" = true ]; then
    chromium-browser http://localhost:3000
fi

if [ "$opera_browser" = true ]; then
    opera http://localhost:3000
fi

if [ "$safari_browser" = true ]; then
    open -a safari http://localhost:3000
fi

if [ "$ie_browser" = true ]; then
    start iexplore http://localhost:3000
fi

if [ "$edge_browser" = true ]; then
    microsoft-edge http://localhost:3000
fi

# Trap ctrl-c and do cleanup
trap 'echo "Terminating background processes..." && pkill node && pkill -9 chromium-browser && pkill -9 google-chrome && pkill -9 opera && pkill -9 safari && pkill -9 microsoft-edge && echo "Done"' SIGINT

# Keep the script running to prevent it from closing immediately
while true; do
    sleep 1
done