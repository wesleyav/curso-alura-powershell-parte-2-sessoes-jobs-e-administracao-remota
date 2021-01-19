function Get-FileSHA1 ($filePath) {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha1 = New-Object System.Security.Cryptography.SHA1Managed

    $hash = $sha1.ComputeHash($fileBytes)
    Write-Host $hash -BackgroundColor Red -ForegroundColor Yellow
}

Get-FileSHA1 C:\ACELERA DEVS\62-PowerShell parte 2 Sessões, Jobs e Administração Remota\curso-alura-powershell-parte-2-sessoes-jobs-e-administracao-remota\ShaFile.ps1

function Get-FileSHA256() {}
function Get-FileSHA384() {}
function Get-FileSHA512() {}