# LinuxMint Setup Manual

A Guide on setting up Linux mint after installation. Most of the instructions below can be applied to other Linux OS also.

## Update Manager

1. After installing Mint configure update manager first. Select best server for fetching update and switch on/off update settings.
2. After Fixing Preference, install update.
3. Drivers
4. Install available drivers.
5. Restart
6. Transfer User Files

## Mint Settings

- Backgrounds: Select a Background
- Themes: Window Borders
- Account Details: Set account image
- Applets: Network Data Usage Monitor
- Date and Time: Use 24h clock (off), Display date (on), Display seconds (on)
- Desktop: Computer + Home + Trash + Mounted Drives (off)
- Input Method: Ibus (select), iBus Preference: Input Method > Add > Bangla (Bangladesh) > OpenBangla Keyboard, Restart
- Languages: Region (Select English)
- Preferred Application: Removable Media (off)
- Privacy: Remember recently accessed file (off)
- Screensaver: Customize > Allow floating clock and album art widget (off) + Show media player controls (off) + Show album art (off)
- Startup Applications: mintwelcome + Print Queue Applet + Support for NVIDIA Prime + Warpinator (off)
- Windows: Behavior > Special key to move and resize window (Super)
- Disks: Turn on 'Enable Write Cache' in linux root partition
- Sound: Output > Volume (100%), Settings > Maximum volume (150%)
- Firewall: Turn on
- Change Terminal: size 'w: 199 h: 49', Font 'MesloLGS Nerd Font Mono', Text editor theme, Preferences > Scrolling > Show scrollbar, General > Show menubar

## Shortcuts

1. Keyboard > Shortcuts > General: Show the workspace selection screen 'Super+Tab'.
2. Keyboard > Shortcuts > Windows: Close window 'Super+q', Inter-workspace > Move window to left workspace 'Super+Alt+left', Inter-workspace > Move window to right workspace 'Super+Alt+right'
3. Keyboard > Shortcuts > Workspaces: Switch to left workspace 'Super+Ctrl+left', Switch to right workspace 'Super+Ctrl+right'.
4. Keyboard > Shortcuts > System: Lock screen 'Super+l'.
5. Keyboard > Shortcuts > Launchers: Launch terminal 'Super+Enter'.
6. Keyboard > Shortcuts > Add Custom Shortcuts: Name='XKill' Command='xkill' KeyBindings='Super + ESC'.

## Text Editor

- View: Toolbar, Statusbar
- Edit > Preferences

## LibreOffice Tweaks

- Disable java for fast startup in settings
- View > User Interface > Tabbed
- Settings > View > Icon Style > sifr dark
- Tools > Options > Libreoffice writer > Basic fonts

## Firefox Settings

- Configure Settings
- Play DRM Content

## Clean System

- Open 'Bleachbit' > cache + temporary files + trash > clean
- Open 'Bleachbit Root' > apt > clean

## VPN Start

```bash
sudo openvpn ~/.vpn-configs/
```

## Categories for '.desktop'

Main Categories: AudioVideo, Audio, Video, Development, Education, Game, Graphics, Network, Office, Settings, Utility

SubCategories: Building, Debugger, IDE, GUIDesigner, Profiling, RevisionControl, Translation, Calendar, ContactManagement, Database, Dictionary, Chart, Email, Finance, FlowChart, PDA, ProjectManagement, Presentation, Spreadsheet, WordProcessor, 2DGraphics, VectorGraphics, RasterGraphics, 3DGraphics, Scanning, OCR, Photography, Publishing, Viewer, TextTools, DesktopSettings, HardwareSettings, Printing, PackageManager, Dialup, InstantMessaging, Chat, IRCClient, FileTransfer, HamRadio, News, P2P, RemoteAccess, Telephony, TelephonyTools, VideoConference, WebBrowser, WebDevelopment, Midi, Mixer, Sequencer, Tuner, TV, AudioVideoEditing, Player, Recorder, DiscBurning, ActionGame, AdventureGame, ArcadeGame, BoardGame, BlocksGame, CardGame, KidsGame, LogicGame, RolePlaying, Simulation, SportsGame, StrategyGame, Art, Construction, Music, Languages, Science, ArtificialIntelligence, Astronomy, Biology, Chemistry, ComputerScience, DataVisualization, Economy, Electricity, Geography, Geology, Geoscience, History, ImageProcessing, Literature, Math, NumericalAnalysis, MedicalSoftware, Physics, Robotics, Sports, ParallelComputing, Amusement, Archiving, Compression, Electronics, Emulator, Engineering, FileTools, FileManager, TerminalEmulator, Filesystem, Monitor, Security, Accessibility, Calculator, Clock, TextEditor, Documentation, Core, KDE, GNOME, GTK, Qt, Motif, Java, ConsoleOnly

## Fix Front Panel Sound Issue

In the BIOS settings change "HD audio" to "AC97".

```bash
sudo xed /usr/share/pulseaudio/alsa-mixer/paths/analog-output-headphones.conf
```

In the file above, find the section `[Element Front]`. In the line "switch" change from "mute" to "off":

```
[Element Front]
switch = off
volume = zero
```

## Secure Boot - Sign NVidia, VMware and VirtualBox

### Sign NVidia

```bash
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=NvidiaCustom/"

# Signing NVidia
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n nvidia-current)
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n nvidia-current-drm)
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n nvidia-current-modeset)
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n nvidia-current-peermem)
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n nvidia-current-uvm)

# Importing MOK key
mokutil --import MOK.der
```

### Sign VMware

```bash
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VMware/"

# Signing VMware
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmmon)
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmnet)

# Importing MOK key
mokutil --import MOK.der
```

### Sign VirtualBox

```bash
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VirtualBox/"

# Signing VirtualBox
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vboxdrv)

# Importing MOK key
mokutil --import MOK.der
```

### After Kernal Update

```bash
sudo vmware-modconfig --console --install-all

sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmmon)
sudo /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmnet)

sudo modprobe -v vmnet
sudo modprobe -v vmmon
sudo vmware-networks --start
```

## Game Launch Options

Steam Proton GE location: `~/.steam/root/compatibilitytools.d/`. Use following tweaks only if game crashes or error occurs,

- Seraph: If having issue use this command, `PROTON_USE_WINED3D=1 %command%`
- Skyrim: Use Proton GE and this command, `WINEDDLOVERRIDES="xaudio2_7=n,b" PULSE_LATENCY_MSEC=90 %command%`
- Fallout 4: Use Proton GE and this command, `WINEDLLOVERRIDES=”xaudio2_7=n,b” PROTON_NO_ESYNC=1 %command%`

```bash
# Use FSR
WINE_FULLSCREEN_FSR=1 WINE_FULLSCREEN_FSR_STRENGTH=4 %command%
# Use Nvidia Image Sharpening
PROTON_HIDE_NVIDIA_GPU=0 PROTON_ENABLE_NVAPI=1 %command%`
```

## Useful Commands

```bash
# Show GPU Options
sudo nano /usr/share/X11/xorg.conf.d/10-nvidia.conf
# Add text before end section: Option "CoolBits" "12"

# 7zip
7zip-linux a ./JLib.7z ./JLib/* -p"Password" -v20g -mhe
# -mhe -> Encrypts filename
# -v20g -> Split volume into 20GB per pieces

# Run with Nvidia GPU
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia
```
