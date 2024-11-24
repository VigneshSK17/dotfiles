#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Firefox - Open New Window
# @raycast.mode silent

# Optional parameters:

# Documentation:
# @raycast.author Vignesh

set windowSize to {1610, 1125}
set windowPosition to {190, 44}
#
#tell application ""
#	make new document
#	set URL of front document to "topsites://"
#end tell
#
#tell application "System Events"
#	tell process "Safari"
#		tell window 1
#			set position to windowPosition
#			set size to windowSize
#		end tell
#		set frontmost to true
#	end tell
#end tell

tell application "System Events"
    tell process "Firefox Developer Edition"
        click menu item "New Window" of menu "File" of menu bar 1
				set frontmost to true
    end tell
end tell
