# run this first
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Check if Scoop is installed
Function Test-ScoopInstalled {
    $scoopExists = Get-Command scoop -ErrorAction SilentlyContinue
    return $scoopExists -ne $null
}

# Main script
if (-not (Test-ScoopInstalled)) {
    Write-Host "Scoop is not installed. Installing Scoop..."
    irm get.scoop.sh | iex
    Write-Host "Scoop installation complete."
} else {
    Write-Host "Scoop is already installed."
}

scoop bucket add extras
scoop update
scoop install aria2 7zip git mpv yt-dlp
rm -r -fo ~\scoop\apps\mpv\current\portable_config
New-Item -ItemType Directory -Path ~\scoop\apps\mpv\current\portable_config -Force
cd ~\scoop\apps\mpv\current\portable_config
git clone https://github.com/S25214/mpv-config.git .