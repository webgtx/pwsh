$os_type = $PSVersionTable.OS | Select-String -Pattern "Windows"

if ($os_type) {
  if ($(winget list | Select-String "posh")) {
    Write-Output "Oh My Posh is already installed"
  } else {
    winget install jandedobbeleer.ohmyposh
  }
} else {
  wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
  chmod +x /usr/local/bin/oh-my-posh
}

Write-Output "Installing PWSH modules..."
Install-Module PSReadLine -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force