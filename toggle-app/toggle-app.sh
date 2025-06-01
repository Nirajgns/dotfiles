#!/bin/bash

# Map app keys to wmctrl class and launch commands
declare -A apps=(
  [chrome]="google-chrome.Google-chrome"
  [postman]="Postman.Postman"
  [vscode]="code.Code"
  [neovide]="neovide.neovide" # Adjust based on wmctrl -lx output
)

declare -A launch_cmds=(
  [chrome]="google-chrome"
  [postman]="postman"
  [vscode]="code"
  [neovide]="neovide" # No --server for simplicity
)

app=$1

if [[ -z "$app" ]]; then
  echo "Usage: $0 {chrome|postman|vscode|neovide}"
  exit 1
fi

wm_class=${apps[$app]}
cmd=${launch_cmds[$app]}

if [[ -z "$wm_class" || -z "$cmd" ]]; then
  echo "Unknown app: $app"
  exit 1
fi

# Debug: Show Neovide windows
if [[ "$app" == "neovide" ]]; then
  echo "Debug: Checking for Neovide windows with wm_class '$wm_class'"
  wmctrl -lx | grep -i neovide || echo "Debug: No Neovide windows found"
fi

# Try to focus the app window using wmctrl
echo "Debug: Attempting to focus '$wm_class' with wmctrl"
if wmctrl -xa "$wm_class"; then
  echo "Debug: Successfully focused $app with wmctrl"
  exit 0
fi

# Fallback: Try xdotool if wmctrl fails
if command -v xdotool >/dev/null; then
  echo "Debug: wmctrl failed, attempting to focus '$wm_class' with xdotool"
  if xdotool search --class "$wm_class" windowactivate; then
    echo "Debug: Successfully focused $app with xdotool"
    exit 0
  else
    echo "Debug: xdotool failed to find or focus '$wm_class'"
  fi
else
  echo "Debug: xdotool not installed, skipping fallback"
fi

# If focusing fails, launch the app
echo "Debug: No window found for $app, launching new instance"
$cmd &
