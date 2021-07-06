#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Basic Setup                                                                 #
###############################################################################

# Install command line tools
xcode-select --install

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
#sudo scutil --set ComputerName "0x6D746873"
#sudo scutil --set HostName "0x6D746873"
#sudo scutil --set LocalHostName "0x6D746873"
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"

# Completely Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001


###############################################################################
# General.                                                                    #
###############################################################################

# System Preferences > General > Show scroll bars: Always
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# System Preferences > General > Highlight color: Green
# Graphite : `0.780400 0.815700 0.858800`
# Silver   : `0.776500 0.776500 0.776500`
# Blue     : `0.709800 0.835300 1.000000`
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

# System Preferences > General > Sidebar icon size: Small
# Small  : 1
# Medium : 2
# Large  : 3
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

###############################################################################
# Desktop & Screen Saver                                                      #
###############################################################################


# System Preferences > Desktop & Screen Saver > Start after: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0


###############################################################################
# Dock                                                                        #
###############################################################################

# System Preferences > Dock > Size:
defaults write com.apple.dock tilesize -int 36

# System Preferences > Dock > Magnification:
defaults write com.apple.dock magnification -bool true

# System Preferences > Dock > Size (magnified):
defaults write com.apple.dock largesize -int 54

# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# System Preferences > Dock > Automatically hide and show the Dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.5

# System Preferences > Dock > Automatically hide and show the Dock (delay)
defaults write com.apple.dock autohide-delay -float 0

# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# System Preferences > Dock > Position on screen: Left
defaults write com.apple.dock 'orientation' -string 'left'

# Remove all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Change the size of Launchpad grid to 7x8
defaults write com.apple.dock springboard-columns -int 8
defaults write com.apple.dock springboard-rows -int 7
defaults write com.apple.dock ResetLaunchPad -bool true

###############################################################################
# Mission Control                                                             #
###############################################################################

# System Preferences > Mission Control > Hot Corners > Top right screen corner: Notification Center
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0

# System Preferences > Mission Control > Hot Corners > Bottom left screen corner: Launchpad
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
defaults write com.apple.dock wvous-bl-corner -int 11
defaults write com.apple.dock wvous-bl-modifier -int 0

# System Preferences > Mission Control > Hot Corners > Bottom right screen corner: Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

###############################################################################
# Language & Region                                                           #
###############################################################################

# System Preferences > Language & Region > Preferred Languages: English, Simplified Chinese
defaults write NSGlobalDomain AppleLanguages -array "en-US" "zh-Hans-US"

# System Preferences > Language & Region > 24-Hour Time
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# System Preferences > Language & Region > Temperature: Celsius
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

# System Preferences > Language & Region > Advanced > Currency: US Dollar ($)
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"

# System Preferences > Language & Region > Advanced > Mesurement units: Metric
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

###############################################################################
# Security & Privacy                                                          #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Allow applications downloaded from anywhere
sudo spctl --master-disable

# Turn on Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# Allow signed apps
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool true

# Firewall logging
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool false

# Stealth mode
sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -bool true

# Disable Infared Remote
sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -bool false

###############################################################################
# Spotlight                                                                   #
###############################################################################

# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Change indexing order and disable some search results
# Yosemite-specific search results (remove them if you are using macOS 10.9 or older):
#  MENU_DEFINITION
#  MENU_CONVERSION
#  MENU_EXPRESSION
#  MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
#  MENU_WEBSEARCH             (send search queries to Apple)
#  MENU_OTHER
defaults write com.apple.spotlight orderedItems -array \
'{"enabled" = 1;"name" = "APPLICATIONS";}' \
'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
'{"enabled" = 1;"name" = "DIRECTORIES";}' \
'{"enabled" = 1;"name" = "PDF";}' \
'{"enabled" = 1;"name" = "FONTS";}' \
'{"enabled" = 0;"name" = "DOCUMENTS";}' \
'{"enabled" = 0;"name" = "MESSAGES";}' \
'{"enabled" = 0;"name" = "CONTACT";}' \
'{"enabled" = 0;"name" = "EVENT_TODO";}' \
'{"enabled" = 0;"name" = "IMAGES";}' \
'{"enabled" = 0;"name" = "BOOKMARKS";}' \
'{"enabled" = 0;"name" = "MUSIC";}' \
'{"enabled" = 0;"name" = "MOVIES";}' \
'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
'{"enabled" = 0;"name" = "SOURCE";}' \
'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
'{"enabled" = 0;"name" = "MENU_OTHER";}' \
'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch
sudo mdutil -E / > /dev/null

###############################################################################
# Displays                                                                    #
###############################################################################

# System Preferences > Displays > Display > Scaled > More Space
osascript <<EOD
tell application "System Preferences"
    reveal anchor "displaysDisplayTab" of pane "com.apple.preference.displays"
end tell
tell application "System Events" to tell process "System Preferences" to tell window "Built-in Retina Display"
    click radio button "Scaled" of radio group 1 of tab group 1
    click radio button 3 of radio group 1 of group 1 of tab group 1
end tell
quit application "System Preferences"
EOD

###############################################################################
# Keyboard                                                                    #
###############################################################################

# System Preferences > Keyboard > Full keyboard access > All controls (enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# System Preferences > Keyboard > Key Repeat: Fast
defaults write NSGlobalDomain KeyRepeat -int 1

# System Preferences > Keyboard > Delay Until Repeat: Short
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# System Preferences > Keyboard > Text > Use smart quotes and dashes: Unchecked
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


###############################################################################
# Trackpad                                                                    #
###############################################################################

# System Preferences > Trackpad > Point & Click > Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# System Preferences > Trackpad > Point & Click > Tap to click (for login screen)
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# System Preferences > Trackpad > Point & Click > Lookup & Data detectors: Tab with three fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2

###############################################################################
# Users & Groups                                                              #
###############################################################################

# Disallow guests to login to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

###############################################################################
# Siri                                                                        #
###############################################################################

# Show Siri in menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false

###############################################################################
# Accessibility                                                               #
###############################################################################


# System Preferences > Accessibility > Mouse & Trackpad > Trackpad Potions
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0

###############################################################################
# Date & Time                                                                 #
###############################################################################

# System Preferences > Date & Time > Clock > Date options > Show date
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm"

###############################################################################
# Finder                                                                      #
###############################################################################


# Finder > Preferences > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder > Preferences > Show wraning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder > Preferences > Show wraning before removing from iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Finder > Preferences > Advanced > Keep folders on top > In windows when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Finder > Preferences > Advanced > When performing a search: Search the Current Folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set Desktop as the default location for new Finder windows
# New window target
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string "PfDo"
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > View > Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder > View > Show Tab Bar
defaults write com.apple.finder ShowTabBar -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true


###############################################################################
# Terminal                                                                    #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
defaults write com.apple.terminal FocusFollowsMouse -bool true
defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

###############################################################################
# TextEdit                                                                    #
###############################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Apple Mail                                                                  #
###############################################################################

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Display emails in threaded mode, sorted by date (oldest at the top)
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

###############################################################################
# QuickLook                                                                   #
###############################################################################

# Enable text selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

###############################################################################
# Miscs                                                                       #
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"


###############################################################################
# Done                                                                        #
###############################################################################


# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
