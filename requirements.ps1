if ($PSVersionTable.OS.Split()[0] -eq "Windows_NT") {
    scoop install gsudo git oh-my-posh  
} else {
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
    chmod +x /usr/local/bin/oh-my-posh
}

Install-Module PSReadLine -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

