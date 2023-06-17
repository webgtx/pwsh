$os_type = $PSVersionTable.OS | Select-String -Pattern "Windows"
$pwsh_profile = "$env:USERPROFILE\.config\powershell\profile.ps1"
$winpwsh_pwd = "$env:USERPROFILE\Documents\WindowsPowerShell"
$pwsh_pwd = $os_type ? "$env:USERPROFILE\Documents\PowerShell" : "$HOME/.config/powershell"

Write-Output "Script Variables Check",
  $pwsh_profile,
  $winpwsh_pwd,
  $pwsh_pwd

Copy-Item -Recurse -Force * $pwsh_pwd
if ($os_type) {
  Start-Job -ScriptBlock {
    mkdir $winpwsh_pwd,
      $env:USERPROFILE\.config\powershell
  }
  Write-Output ". $pwsh_profile" > $winpwsh_pwd\profile.ps1
  Copy-Item $winpwsh_pwd\profile.ps1 $pwsh_pwd\profile.ps1
}

Start-Job -ScriptBlock {
  mkdir $pwsh_pwd
}