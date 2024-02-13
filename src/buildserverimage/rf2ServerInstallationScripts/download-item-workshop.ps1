param([Parameter(Mandatory)] [string] $SteamCMDFolder, 
  [string] $WorkshopItems,
  [string] $ItemsIdFilePath,
  [bool] $Diagnose = $false,
  [bool] $Force = $false
)

Write-Host "====== DownloadItem script ======"
Write-Host "Given parameter SteamCmdPath:         $SteamCMDFolder"
Write-Host "Given parameter WorkshopItems:        $WorkshopItems"
Write-Host "Given parameter ItemsIdFilePath:      $ItemsIdFilePath"
Write-Host "Given parameter Force:                $Force"
Write-Host "Given parameter Diagnose:             $Diagnose"

$originalLocation = Get-Location 

$is_steamCmdFolder_exist = Test-Path -Path $SteamCMDFolder

if ($is_steamCmdFolder_exist -ne $true) {
  Write-Error "SteamCMD folder is invalid."
  Exit 4
}

$items = $WorkshopItems.Split(",");

Set-Location $SteamCMDFolder

foreach ($item in $items) {

  Write-Output ">>> Downloading item [$item]" | Out-Host

  $workshop_item_in_local_cmd = "steamapps\workshop\content\365960\$item"
    
  $is_workshop_item_in_local_cmd = Test-Path $workshop_item_in_local_cmd

  Write-Host "Computed value workshop_item_in_local_cmd:         $workshop_item_in_local_cmd"
  Write-Host "Computed value is_workshop_item_in_local_cmd:      $is_workshop_item_in_local_cmd"

  if ($is_workshop_item_in_local_cmd -eq $false -or $Force) {

    if ($Diagnose -eq $false) {
      /steamcmd/steamcmd.sh +login anonymous +workshop_download_item 365960 $item +quit
    }
  }
  else {
    Write-Host "Item [$item] already downloaded. Use -Force to replace."
  }
}

Set-Location $originalLocation

Write-Host "====== DownloadItem script ====== DONE"
