param($diretorio)

$ErrorActionPreference = "Stop"

. .\ShaFile.ps1

$arquivos = Get-ChildItem $diretorio -File

foreach ($item in $arquivos | Select-Object FullName) {
    $hashItem = Get-FileSHA1 $item
    Write-Host "O Hash do arquivo $item é $hashItem !"
}