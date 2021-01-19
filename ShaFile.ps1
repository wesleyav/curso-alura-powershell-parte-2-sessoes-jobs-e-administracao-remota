function Get-FileSHA1 ($filePath) {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha1 = New-Object System.Security.Cryptography.SHA1Managed

    $hash = $sha1.ComputeHash($fileBytes)

    $prettyHashSB = New-Object System.Text.StringBuilder

    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $prettyHashSB.Append($hexaNotation) | > $null
    }

    $prettyHashSB.ToString()

}

$arquivo = "C:\ACELERA DEVS\62-PowerShell parte 2 Sessões, Jobs e Administração Remota\curso-alura-powershell-parte-2-sessoes-jobs-e-administracao-remota\ShaFile.ps1"
$hashDoArquivo = Get-FileSHA1 $arquivo

Write-Host "O hash do arquivo $arquivo é $hashDoArquivo" -BackgroundColor Red -ForegroundColor Yellow

function Get-FileSHA256() {}
function Get-FileSHA384() {}
function Get-FileSHA512() {}