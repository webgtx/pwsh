# Welcome message
echo "Hello again, David :)"

# Aliases
Set-Alias vim nvim

# Prompt
Import-Module posh-git
Import-Module Terminal-Icons

oh-my-posh prompt -c $env:USERPROFILE\.config\powershell\theme.json init pwsh 
  | Invoke-Expression

Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView
