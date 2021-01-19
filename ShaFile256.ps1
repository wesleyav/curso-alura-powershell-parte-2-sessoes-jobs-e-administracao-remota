# Função  para  obtermos o hash 256 do arquivo localizado em $filePath.
function Get-FileSHA256($filePath) {
    # Vamos, antes de tudo, obter o conteúdo deste  arquivo
    # e obter a cadeia de bytes que representa seu conteúdo
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    # Não  vamos  reinventar  a  roda!  O  .NET  já  possui
    # implementado uma classe que executa  o  algoritmo  de
    # hash para nós!
    $sha1 = New-Object System.Security.Cryptography.SHA256Managed

    # Com uma instância do objeto SHA256Managed e os  bytes
    # de  nosso  arquivo,  basta  operar  usando  o  método
    # ComputeHash!
    $hash = $sha1.ComputeHash($fileBytes)

    # Para facilitar o trabalho de concatenação  de strings
    # de  uma  forma  mais  performática,  devemos  usar  o
    # StringBuilder.
    $prettyHashSB = New-Object System.Text.StringBuilder

    # Com nosso  Hash   calculado  e   uma   instância   do
    # StringBuilder, basta obtermos a  notação  hexadecimal
    # com o argumento X2 ao método Byte::ToString(string).
    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $prettyHashSB.Append($hexaNotation) > $null
    }

    # Usando uma expressão de  valor  livre,  enviamos  seu
    # resultado ao pipeline
    $prettyHashSB.ToString()
}