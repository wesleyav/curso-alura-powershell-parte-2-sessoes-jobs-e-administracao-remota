function Add-ApplicationPool {
    param (
        [String[]] $ComputersName,
        [String] $ApplicationPoolName
    )

    $ComputersName | ForEach-Object {
        $session = New-PSSession -ComputerName $_

        Invoke-Command -Session $session -ScriptBlock {
            "Estamos executando os comandos no computador: $env:COMPUTERNAME"
            $appCmdArgs = "add apppool /name:$(args[0]) /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrated"
            C:Windows\System32\inetsrv\appcmd.exe $appCmdArgs.Split(' ')

        } -ArgumentList $ApplicationPoolName
    }
}