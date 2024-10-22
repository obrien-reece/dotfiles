#!/bin/sh
# Use dmenu to open and edit a file from a given folder or create a new file.

# Set the folder to '~/Downloads/tmp'
LOCAL="${LOCAL:-$HOME/Downloads/tmp}"
[ -d "$LOCAL" ] || exit 1

# Use dmenu to select or type the file name
file="$(ls "$LOCAL" | dmenu -p "Select or create a file:" "$@")"

# If a file name is provided
if [ "$file" ]; then
    # Check if the file exists, if not, create it
    [ -f "$LOCAL/$file" ] || touch "$LOCAL/$file"
    
    # Open the file in kitty with nvim
    kitty -e nvim "$LOCAL/$file" &
fi

