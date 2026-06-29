@echo off
setlocal enabledelayedexpansion

:: Dossier contenant les PDF
set "PDF_DIR=C:\dossiers_PDF"
:: Dossier de sortie pour les images
set "OUT_DIR=C:\dossiers_JPEG"

:: Crée le dossier de sortie s’il n’existe pas
if not exist "%OUT_DIR%" mkdir "%OUT_DIR%"

:: Boucle sur tous les fichiers PDF du dossier
for %%F in (%PDF_DIR%\*.pdf) do (
    echo Conversion de %%~nxF...
    gswin64c -dNOPAUSE -dBATCH -sDEVICE=jpeg -r300 ^
    -sOutputFile="%OUT_DIR%\%%~nF_%%03d.jpg" "%%F"
)

echo Conversion terminée!
pause
