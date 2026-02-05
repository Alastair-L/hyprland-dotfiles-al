#!/bin/bash

# Define the source file
QUOTE_FILE="$HOME/.config/waybar/bottom-quotes/quotes.txt"

# 1. Read file, remove empty lines and comments, store in an array
mapfile -t QUOTES < <(grep -vE '^[[:space:]]*#|^[[:space:]]*$' "$QUOTE_FILE")

# 2. Get the number of valid quotes
COUNT=${#QUOTES[@]}

# 3. Check if we have any quotes to avoid division by zero
if [ "$COUNT" -eq 0 ]; then
    echo "No quotes found!"
    exit 1
fi

# 4. Pick a random index (0 to COUNT-1)
PICKED_INDEX=$(( RANDOM % COUNT ))

# 5. Output the result (This replaces your picked.txt)
echo "${QUOTES[$PICKED_INDEX]}"