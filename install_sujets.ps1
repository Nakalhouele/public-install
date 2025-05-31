# Définir l’URL du fichier ZIP brut sur GitHub
$url = "https://github.com/Nakalhouele/public-install/raw/main/25_NSI_SUJETS.zip"

# Définir le dossier de destination (modifiez selon vos besoins)
$destinationFolder = "C:\NSI_25"

# Créer le dossier de destination s’il n’existe pas
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Définir le chemin local temporaire pour le ZIP
$zipPath = Join-Path $destinationFolder "25_NSI_SUJETS.zip"

# Télécharger le fichier
Invoke-WebRequest -Uri $url -OutFile $zipPath

# Extraire le ZIP
Expand-Archive -Path $zipPath -DestinationPath $destinationFolder -Force

# Optionnel : supprimer le ZIP après extraction
Remove-Item $zipPath
