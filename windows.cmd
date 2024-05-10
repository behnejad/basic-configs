Dism.exe /Online /Cleanup-Image /StartComponentCleanup
Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore analyzes
Dism.exe /Online /Cleanup-Image /ScanHealth
Dism.exe /Online /Cleanup-Image /RestoreHealth 
Dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
Dism.exe /Online /Set-ReservedStorageState /State:Disabled
Dism.exe /Online /Get-ReservedStorageState

bcdedit /set hypervisorlaunchtype off

powercfg /hibernate /size 10
powercfg /hibernate off

(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ PROFILE_NAME=$name;PASSWORD=$pass }} | Format-Table -AutoSize 

// unistall microsoft chrome based edge
setup.exe --uninstall --system-level --verbose-logging --force-uninstall

services -> Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\
defender -> HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender DisableAntiSpyware

Godmode -> new folder name -> GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}
