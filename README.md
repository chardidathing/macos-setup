# macos-setup
Automatically configure macOS 

## How to configure
Homebrew Packages - `app_config.yaml` > `homebrew_installed_packages`\
Homebrew Casks  - `app_config.yaml` > `homebrew_cask_apps`\
Mac App Store Apps - `app_config.yaml` > `mas_installed_apps`\
> You can get the ID of an App Store app by copying the link and looking for the id at the end of the link (e.g: id1136220934) - just make sure you only input the numbers.
Toggle Modules - `config.yaml` > "Toggle Configuration"\
Remove Dock Items - `config.yaml` > "Items to remove from dock"\
Add Dock Items - `config.yaml` > "Items to place in dock"\
Set macOS defaults - `config.yaml` > `defaults`\
Configure Hardening - `config.yaml` > "Hardening"

## Setup
- Install `brew` and `ansible`
- Clone repo
- Install requiremets `ansible-galaxy install -r requirements.yml`
- Grant your terminal `Full Disk Access` (Settings > Privacy & Security > Full Disk Access), you might need to manually add your terminal if it's not there.
- [Configure](#how-to-configure)
- Run `ansible-playbook -K main.yaml`
> `-K` asks for your `become` password, which is your user/sudo password, this will be used when tasks require sudo.

## Tools for configuration
> Detect changes to defaults - `tools/defaultschanges.sh`