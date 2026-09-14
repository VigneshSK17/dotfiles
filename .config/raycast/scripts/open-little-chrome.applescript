#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Little Chrome
# @raycast.mode silent

# Optional parameters:

# Documentation:
# @raycast.author Vignesh

tell application "Google Chrome"
	activate
	set newWindow to make new window
	set bounds of newWindow to {0, 0, 680, 480}
end tell


