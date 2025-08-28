# Mac Setup (for me at least :3)

Quoting Jeff Geerling (inspiration for me to do this)
> There are some things in life that just can't be automated... or aren't 100% worth the time :(

## Steps
- Complete macOS OOBE (Account Creation, iCloud, TouchID, etc.)
- Install [brew](https://brew.sh)
- Install `ansible` with brew
- Run playbook
```
curl -L https://github.com/chardidathing/macos-setup/archive/refs/heads/main.zip -o ~/main.zip && unzip ~/main.zip -d ~ && rm ~/main.zip && cd ~/macos-setup-main && ansible-playbook -K ./main.yaml && read -p "Delete setup folder? (y/n) " ans && [[ $ans == y ]] && cd ~ && rm -rf ~/macos-setup-main
```
> This will prompt for deletion afterwards, as I'd clone over ssh to ~/Developer later on.
- Setup the following settings in System Settings
  - Accessibility
    - Display > Pointer > Pointer fill colour > Bubblegum
    - Display > Zoom > Use scroll gesture with modifier keys to zoom
    - Pointer Control > Trackpad Options > Use trackpad for dragging > On
    - Pointer Control > Trackpad Options > Dragging Style > Three-Finger Drag
  - Appearance
    - Appearance > Dark
    - Accent colour > Pink
  - Control Centre
    - Wi-Fi > Show in Menu Bar
    - Battery > Show Percentage > On
    - Keyboard Brightness > Show in Control Centre > On
    - Spotlight - Don't Show in Menu Bar (Saves space - use cmd+space)
    - Time Machine - Show in Menu Bar
    - VPN - Show in Menu Bar
  - Desktop & Dock 
    - Make dock smaller and allign right
    - Show suggested and recent apps in Dock > Off
    - Click wallpaper to reveal desktop > Only in Stage Manager
    - Show Widgets > Disable On Desktop
  - Displays 
    - Disable Auto Brightness
  - Spotlight
    - Disable all Search Results apart from Applications, Calculator, Conversion, System Settings
    - Disable "Help Apple Improve Search" (Should be disabled already)
  - Sound
    - Play feedback when volume is changes > On
  - Lock Screen
    - Show large clock > On Screen Saver and Lock Screen
    - Show 24-hour time > On
    - Show message when locked > On (set)
  - Privacy & 
    - Analytics & Improvements > All Off
    - Apple Intelligence Report > Off
- Open and sign into 1Password
- Open and Configure Firefox
  - Sign into Firefox Account
  - Disable all autofill/password/payment saving (if not already disabled by login)
  - Install extensions (if not already installed by login)
    - 1Password
    - CanvasBlocker
    - PrivacyBadger
    - Return YouTube Dislike
    - Startpage
    - uBlock Origin
- Open and link Signal Desktop
- Sign into other apps
  - Mail
  - Vesktop (Discord)
  - Telegram
  - Tidal
  - Cursor
  - Prism Launcher
  - Steam
- Finder Configuration
  - Finder > Settings > General > Enable to show all items on desktop (Disks, External, Servers, etc.)
  - Finder > Settings > General > New Finder windows show > User Folder
  - Finder > Settings > Sidebar > Show these items in the sidebar > Favourites `AirDrop, Applications, Desktop, Documents, Downloads, User Folder`, disable all iCloud, enable all Locations, disable all Tags
  - Finder > Settings > Advanced > Show all filename extensions > On
  - Create `Developer` folder in ~/ and add to sidebar
