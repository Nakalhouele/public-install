# Ce script installe une version spécifique de python et de thonny sur une machine windows.
# Il faut être vigiliant aux interactions avec l'ordinateur car des opérations manuelles pourraient être requises.

# Répertoire d'installation
$installDirectory = "C:\NSI_25"

# Définir la version de Python et les chemins d'installation
$pythonVersion = "3.12.3"
$pythonInstallerUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion-amd64.exe"
$pythonInstallPath = "$installDirectory\Python_$pythonVersion"

$thonnyVersion = "4.1.7"
$thonnyInstallerUrl = "https://github.com/thonny/thonny/releases/download/v$thonnyVersion/thonny-$thonnyVersion.exe"
$thonnyInstallPath = "$installDirectory\Thonny_$thonnyVersion"

# Télécharger et installer Python
$pythonInstaller = "$env:TEMP\python-installer.exe"
Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $pythonInstaller
Start-Process -FilePath $pythonInstaller -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1 TargetDir=$pythonInstallPath" -Wait
Remove-Item $pythonInstaller

# Télécharger et installer Thonny
$thonnyInstaller = "$env:TEMP\thonny-installer.exe"
Invoke-WebRequest -Uri $thonnyInstallerUrl -OutFile $thonnyInstaller
Start-Process -FilePath $thonnyInstaller -ArgumentList "/VERYSILENT /DIR=$thonnyInstallPath" -Wait
Remove-Item $thonnyInstaller

Write-Output "Installation terminée : Python $pythonVersion et Thonny ont été installés avec succès."



# Après les installations (Manuellement)
# 1. Mettre la langue en Francais au démarrage de thonny
# 2. Changer la version de l'interpreteur Python dans thonny: 
#     - Ouvrir thonny, cliquer sur Outils, sélectionner Options, sélectionner l'onglet Interpreteur, puis changer 
#       l'executable pour faire pointer sur la version de python.
