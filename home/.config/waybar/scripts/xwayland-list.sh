#!/bin/bash

# Get list of all Xwayland window classes
# 1. Get all clients in JSON
# 2. Filter for xwayland == true
# 3. Grab the 'class' field
# 4. Join them with a comma and space
XWAYLAND_APPS=$(hyprctl clients -j | jq -r '[.[] | select(.xwayland == true) | .class] | join(", ")')

if [ -n "$XWAYLAND_APPS" ]; then
    echo "(⚠️ X11: $XWAYLAND_APPS)"
else
    # Output nothing if no Xwayland apps are open
    echo ""
fi