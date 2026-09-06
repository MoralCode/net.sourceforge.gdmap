#!/bin/sh

# The directory where Flatpak allows writing data
DATA_DIR="${XDG_DATA_HOME}/tinyMediaManager"

# Create the directory if it doesn't exist
if [ ! -d "$DATA_DIR" ]; then
    mkdir -p "$DATA_DIR"
fi

# Run tinyMediaManager and tell it to use the writable directory
# -Duser.home and -Dtinymediamanager.data help redirect settings
exec /app/tinyMediaManager -Dtinymediamanager.data="$DATA_DIR"  -Dtmm.consoleloglevel=INFO "$@"