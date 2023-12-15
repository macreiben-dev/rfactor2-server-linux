param([Parameter(Mandatory)] [string] $SteamCMDFolder, 
  [string[]] $WorkshopItems,
  [string] $ItemsIdFilePath,
  [bool] $Diagnose = $false,
  [bool] $Force = $false,
  [string] $SteamCmdEntryPoint = "steamcmd")

Write-Output "====== DownloadItem script ======"
Write-Output "Given parameter SteamCmdPath:         $SteamCMDFolder"
Write-Output "Given parameter WorkshopItems:        $WorkshopItems"
Write-Output "Given parameter ItemsIdFilePath:      $ItemsIdFilePath"
Write-Output "Given parameter Force:                $Force"
Write-Output "Given parameter Diagnose:             $Diagnose"

$originalLocation = Get-Location 

$is_steamCmdFolder_exist = Test-Path -Path $SteamCMDFolder

if ($is_steamCmdFolder_exist -ne $true) {
  Write-Error "SteamCMD folder is invalid."
  Exit 4
}

$items = $WorkshopItems;

if ($ItemsIdFilePath -ne $null) {

  Write-Output "Using file instead of inline parameters (row count processed):"

  $items = New-Object System.Collections.ArrayList

  foreach ($itemId in Get-Content $ItemsIdFilePath) {
    $items.Add($itemId)
  }
}

Set-Location $SteamCMDFolder

foreach ($item in $items) {

  Write-Output ">>> Downloading item [$item]" | Out-Host

  $workshop_item_in_local_cmd = "steamapps\workshop\content\365960\$item"
    
  $is_workshop_item_in_local_cmd = Test-Path $workshop_item_in_local_cmd

  Write-Output "Computed value workshop_item_in_local_cmd:         $workshop_item_in_local_cmd"
  Write-Output "Computed value is_workshop_item_in_local_cmd:      $is_workshop_item_in_local_cmd"

  if ($is_workshop_item_in_local_cmd -eq $false -or $Force) {

    if ($Diagnose -eq $false) {
      ./$SteamCmdEntryPoint +login anonymous +workshop_download_item 365960 $item +quit
    }
  }
  else {
    Write-Output "Item [$item] already downloaded. Use -Force to replace."
  }
}

Set-Location $originalLocation

Write-Output "====== DownloadItem script ====== DONE"
