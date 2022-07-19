$pwsh_cfg = "$env:USERPROFILE\.config\powershell\user_profile.ps1"
$winpwsh_pwd = "$env:USERPROFILE\Documents\PowerShell"
$pwsh_pwd = "$env:USERPROFILE\Documents\WindowsPowerShell"

Write-Output "Script Variables Check",
  $pwsh_cfg,
  $winpwsh_pwd,
  $pwsh_pwd

Start-Job -ScriptBlock {
  mkdir $pwsh_pwd,
        $winpwsh_pwd,
        $env:USERPROFILE\.config\powershell
}

Copy-Item -Recurse * $env:USERPROFILE\.config\powershell
Write-Output ". $pwsh_cfg" > $winpwsh_pwd\profile.ps1 
Copy-Item $winpwsh_pwd\profile.ps1 $pwsh_pwd\profile.ps1
