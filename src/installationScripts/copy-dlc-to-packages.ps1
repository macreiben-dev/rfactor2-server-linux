param([Parameter(Mandatory)][string] $SteamCMDFolder,
  [Parameter(Mandatory)] $ServerInstallationDirectory)

Write-Output "====== CopyDlcToPackages script ======"

Write-Output "Given parameter SteamCMDFolder:                 $SteamCMDFolder"
Write-Output "Given parameter ServerInstallationDirectory:    $ServerInstallationDirectory"

$source = "$SteamCMDFolder\steamapps\workshop\content\365960\*"
$destination = "$ServerInstallationDirectory\Packages"

Get-ChildItem -Path $source -Include *.rfcmp -Recurse | Copy-Item -Destination $destination

Write-Output "====== CopyDlcToPackages script ====== DONE" 