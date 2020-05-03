#!/usr/bin/env bash
#
# Setup the macbook by settings the preferred settings.

ORANGE='\033[0;33m'
NC='\033[0m'


echo "Please fill in your password. This is used to set the correct settings for your mac."
# Ask for the administrator password upfront
sudo -v

###############################################################################
# General settings                                                            #
###############################################################################

# Set cursor speed.
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 8
echo "[Setting] A really fast keyrepeat is set."

defaults write com.apple.dock wvous-br-corner -int 5
defaults write com.apple.dock wvous-br-modifier -int 0
echo "[Setting] Run the screensaver if we're in the bottom-right hot corner."

# The notification 'Your disk is almost full' should only warn us when we're
# below a certain threshold of GiB.
defaults write com.apple.diskspaced minFreeSpace 5

# Disable inline attachments in Mail.app (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
defaults write com.apple.mail-shared DisableURLLoading -bool true

# Show battery percent
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Disable AirDrop
# defaults write com.apple.NetworkBrowser DisableAirDrop -bool true

# Set spotlight.
defaults write com.apple.spotlight orderedItems -array \
  '{"enabled" = 1;"name" = "APPLICATIONS";}' \
  '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
  '{"enabled" = 0;"name" = "SYSTEM_PREFS";}' \
  '{"enabled" = 0;"name" = "DIRECTORIES";}' \
  '{"enabled" = 0;"name" = "PDF";}' \
  '{"enabled" = 0;"name" = "FONTS";}' \
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
  '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

echo "What should the name of your hostname mac be?"
read macbook_name

sudo scutil --set ComputerName $macbook_name
sudo scutil --set LocalHostName $macbook_name
sudo scutil --set HostName $macbook_name
sudo sysctl kern.hostname=$macbook_name

echo "kern.hostname=$macbook_name" | sudo tee -a /etc/sysctl.conf
echo "[Setting] Hostname set to ${macbook_name}"

###############################################################################
# Safari                                                                      #
###############################################################################

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo "[Setting] Safari is set up for developmenet."

###############################################################################
# Text edit                                                                   #
###############################################################################

defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# show debug menu of appstore
defaults write com.apple.appstore ShowDebugMenu -bool true

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

mkdir "${HOME}/Pictures/screenshots"

# Save screenshots to desktop and disable the drop-shadow.
defaults write com.apple.screencapture location -string "${HOME}/Pictures/screenshots"
defaults write com.apple.screencapture type -string "png"
#defaults write com.apple.screencapture disable-shadow -bool true

# Enable sub-pixel rendering on non-Apple LCDs.
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Disable and kill Dashboard
# Can be reverted with:
# defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock
defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock

###############################################################################
# Finder                                                                      #
###############################################################################

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Always open everything in Finder's column view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Don't write `.DS_Store` files to portable devices.
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show hidden files and file extensions by default.
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show all filename extensions (so that "Evil.jpg.app" cannot masquerade easily).
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing file extensions.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show ShowStatusBar
defaults write com.apple.finder ShowStatusBar -bool true

# Allow text-selection in Quick Look.
defaults write com.apple.finder QLEnableTextSelection -bool true

# Expand print panel by default.
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable Resume system-wide.
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable the crash reporter.
defaults write com.apple.CrashReporter DialogType -string "none"
echo "[Setting] Finder is set up correctly."

###############################################################################
# SSD                                                                         #
###############################################################################

# Disable the sudden motion sensor as it’s not useful for SSDs.
sudo pmset -a sms 0
echo "[Setting] The sudden motion sensor is disabled."

###############################################################################
# Dock                                                                        #
###############################################################################

# Automatically hide and show the Dock.
defaults write com.apple.dock autohide -bool true
echo "[Setting] The Dock will show/hide automatically."

###############################################################################
# Security and Privacy                                                        #
###############################################################################

# turn off Bluetooth on boot.
sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 0

# Turn off hibernation [laptops only].
sudo pmset -a hibernatemode 0
# sudo rm -f /var/vm/sleepimage

# remove FileVault keys on hibernation.
sudo pmset -a destroyfvkeyonstandby 1
sudo pmset -a hibernatemode 25

# Disable powernap.
sudo pmset -a powernap 0

# Disable automatically going standby.
sudo pmset -a standby 0
sudo pmset -a standbydelay 0
sudo pmset -a autopoweroff 0

# Enable FireFault.
sudo fdesetup enable
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Enable stealth mode.
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

# See if the user wants to reboot.
function set_push_notifications() {
  read -p "Would you like to disable the push notifications? (y/N)" pushnotifications_status
  case "$pushnotifications_status" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | N | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

# Call on the set_push_notifications function.
if [[ "Yes" == $(set_push_notifications) ]]
then
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.apsd.plist
fi

# Disable captive portal.
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# Don't default to saving documents to iCloud:
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Bonjour multicast advertisements.
sudo defaults write /Library/Preferences/com.apple.mDNSResponder.plist NoMulticastAdvertisements -bool NO
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool false

# Disable siri.
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.Siri.agent.plist
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.photolibraryd.plist
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.SocialPushAgent.plist
sudo launchctl unload -w /System/Library/LaunchAgents/com.apple.ManagedClientAgent.enrollagent.plist

echo
echo "You need to restart your computer for the changes to take effect."
echo "After the reboot, please run install_2.sh for development packages."

# See if the user wants to reboot.
function reboot() {
  read -p "Do you want to reboot your computer now? (y/N)" choice
  case "$choice" in
    y | Yes | yes ) echo "Yes"; exit;; # If y | yes, reboot
    n | N | No | no) echo "No"; exit;; # If n | no, exit
    * ) echo "Invalid answer. Enter \"y/yes\" or \"N/no\"" && return;;
  esac
}

# Call on the function.
if [[ $(reboot) == "Yes" ]]
then
  echo "Rebooting."
  sudo reboot
  exit 0
else
  exit 1
fi
