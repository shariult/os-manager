# Windows Setup Manual

A Guide on setting up Windows after installation.

## Windows Installation

1. Fix Time, Power and Sleep, Mute Microphone
2. Personalize > Desktop icons
3. File Explorer: View > Options > Open Explorer to, Privacy
4. C:\\ Drive > Properties > Allow files on this drive... (Uncheck)
5. Indexing options
6. Turn on System restore
7. [Debloat Windows](https://github.com/Sycnex/Windows10Debloater)
8. Install Drivers
9. Unpin applications + Defragment settings + [O&O shutup 10](https://www.oo-software.com/en/shutup10) + Restart
10. Winodows Update + Restart
11. Activate .Net 3.5 + Windows Update Recheck
12. Device encryption > Turn off + Settings (Minimal)
13. Fix taskbar + Task manager settings
14. Create New User Account + Change to New Account
15. User folder locations (Optional) + Transfer User files + AppData (Install fonts, Run 'fix_context_menu.reg' etc.)
16. Fix taskbar + Task manager settings + Settings
17. Powertoys
18. Store update
19. [O&O shutup 10](https://www.oo-software.com/en/shutup10) as User + Restart
20. Block in firewall + Install Adobe + Clean 'temp' files + Photoshop fixes
21. Office 365 + Remove Bloatwares (Onedrive, Microsoft Teams)
22. Task manager (both as User and Adminstrator) > Startup + Restart
23. Ninite apps + Other Apps
24. App Settings (KeepassXC > Browsers > Rest) + Restart

## Windows Settings

- System: Display (Night Light), Sound (Master Volume), Notifications & actions (Edit your quick actions), Power & sleep, Multitasking, Clipboard
- Devices: Bluetooth (status), Typing (Advanced keyboard settings), Autoplay (Use AutoPlay...)
- Network & Internet: Mobile hotspot
- Apps: Default Apps
- Accounts: Sign in Options (Restart apps)
- Turn off bitlocker
- Search > Permission & history (SafeSearch, History)
- Privacy > \*
- UWP App Settings

## Softwares

**Ninite:** 7-zip, Adopt openjdk x64 17, Chrome, Firefox, Imgburn, K-lite codec pack, qBittorrent.

**Softwares:** Internet download manager, Joplin, Nomacs, Okular, SetupAvro, Vmware.

**Development and Design Tools:** Anaconda, Devdocs, Dia, Git, MongoDB, MongoDB compass, Node.JS, XAMPP, Composer, Sublime text, VSCode.

## Software Settings

**7-zip:** File association, change extract directory

**Chrome:** Sign in and Sync

**Firefox:** Sync, settings, sign in

**Avro:** Interface, Local/Language Settings(bangladesh)

**IDM:** Icons, temp folder

**Imgburn:** Tools > Settings > turn off sound

**Joplin:** General, Sync, Appearance, Application, Shortcuts

**K-lite codec:** run .reg file

**qBittorrent:** Behavior(Check for updates), Downloads(Folders)

**MongoDB, MySQL, PHP:** Add to path

**Sublime text & VSCode:** import settings and plugins

**Xampp:** xampp-conrol.ini permission, Config(default editor, startup servers), Apache > Config > httpd.conf

## Debloat Windows

```powershell
Get-AppxPackage -AllUsers *3dbuilder* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsalarms* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowscalculator* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowscamera* | Remove-AppxPackage
Get-AppxPackage -AllUsers *officehub* | Remove-AppxPackage
Get-AppxPackage -AllUsers *skypeapp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *getstarted* | Remove-AppxPackage
Get-AppxPackage -AllUsers *zunemusic* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsmaps* | Remove-AppxPackage
Get-AppxPackage -AllUsers *solitairecollection* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingfinance* | Remove-AppxPackage
Get-AppxPackage -AllUsers *zunevideo* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingnews* | Remove-AppxPackage
Get-AppxPackage -AllUsers *onenote* | Remove-AppxPackage
Get-AppxPackage -AllUsers *people* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage
Get-AppxPackage -AllUsers *photos* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsstore* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingsports* | Remove-AppxPackage
Get-AppxPackage -AllUsers *soundrecorder* | Remove-AppxPackage
Get-AppxPackage -AllUsers *bingweather* | Remove-AppxPackage
Get-AppxPackage -AllUsers *xboxapp* | Remove-AppxPackage
```

## Useful Commands

```powershell
# Restore Uninstall Apps
Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

# Allow Local and Remote Signed Scripts
Set-ExecutionPolicy RemoteSigned -Forced

# Change a directory in the Windows file system so that it is case-sensitive (FOO !== foo)
fsutil.exe file setCaseSensitiveInfo <path> enable
```

```cmd
# Make Junctions
mklink /J "<link-path>" "<target-path>"

## Bypass OOBE - shift+F10 to bring Command prompt
oobe/BypassNRO
```

## Block in Firewall

```powershell
New-NetFirewallRule -DisplayName "NetBlocker-BootstrapStudio" -Direction Outbound -Program "C:\Users\User\AppData\Local\Programs\bstudio\Bootstrap Studio.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Illustrator_CRWCS" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Illustrator 2020\Support Files\Contents\Windows\CRWindowsClientService.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Illustrator" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Illustrator 2020\Support Files\Contents\Windows\Illustrator.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-InDesign_CRWCS" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe InDesign 2020\CRWindowsClientService.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-InDesign_CEPHE" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe InDesign 2020\Resources\CEP\CEPHtmlEngine\CEPHtmlEngine.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-InDesign" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe InDesign 2020\InDesign.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Photoshop_CRWCS" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Photoshop 2020\CRWindowsClientService.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Photoshop" -Direction Outbound -Program "C:\Program Files\Adobe\Adobe Photoshop 2020\Photoshop.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-AdobeCC_node64" -Direction Outbound -Program "C:\Program Files\Common Files\Adobe\Creative Cloud Libraries\libs\node.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-AdobeCC_node" -Direction Outbound -Program "C:\Program Files (x86)\Adobe\Adobe Creative Cloud Experience\libs\node.exe" -Action Block
New-NetFirewallRule -DisplayName "NetBlocker-Lunacy" -Direction Outbound -Program "C:\Program Files\Lunacy\Lunacy.exe" -Action Block
```

## WSL Commands

```powershell
wsl -l -v
wsl -d Debian
wsl --install -d Debian
wsl --export Debian <Path>.tar
wsl --import Debian <installation_path> <tar_file_path>
wsl --unregister Debian
```

## Miscellaneous

**IDM File Extensions:** AI APK APPIMAGE BUNDLE DEB DOCX FIG MSIXBUNDLE PPTX PSD RUN SKETCH VSIX XD XLSX

**Windows God Mode:** Create a folder named `God Mode.{ED7BA470-8E54-465E-825C-99712043E01C}`

## Common

**Browser Extensions:** Decentraleyes, fireshot, focus to-do, font fingerprint defender, jsonview, kontrast, news feed eradicator, privacy badger, react developer tools, redux, responsive viewer, return youtube dislike, singlefile, site palette, ublock origin, visbug, web developer, whatfont

**Sublime Extensions:** AdvancedNewfile, A file icon, Babel, BracketHighlighter, ColorPicker, Color Highlight, Ejs2, Emmet, EsLint, Material Theme, Monokai pro, Sass, SidebarEnhancements, SublimeCodeIntel

**VSCode Extensions:** Bracket Pair Colorizer, Color Highlight, Community Material Theme, Debugger for Firefox, DotEnv, ESLint, ES7/React Snippets, Image Preview, Material Icon Theme, PHP Extension Pack, Prettier, Pug Beautify, MySQL-cweijan(Optional), Python (Optional), Thunder client(Optional)

**NPM/Composer Global Packages:**

```bash
npm install -g asar create-react-app create-next-app express-generator eslint live-server http-server nodemon prettier sass sass-migrator typescript uglify-js yarn
composer global require laravel/installer friendsofphp/php-cs-fixer
```

## Dual Booting Bootloader fixes

If Windows is installed after Ubuntu then use this method to fix bootloader by changing from Windows bootloader to Grub. Run cmd as adminstrator in Windows,

```cmd
bcedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
```

In Linux,

```bash
sudo update-grub
```
