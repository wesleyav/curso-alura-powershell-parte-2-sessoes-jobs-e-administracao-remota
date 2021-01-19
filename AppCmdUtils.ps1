function Add-ApplicationPool {
    param (
        [String[]] $ComputersName,
        [String] $ApplicationPoolName
    )

    $ComputersName | ForEach-Object {
        Enter-PSSession -ComputerName $_
        "Estamos executando os comandos no computador: $env:COMPUTERNAME"
        $appCmdArgs = "add apppool /name: $ApplicationPoolName /managedRuntimeVersion:v4.0 /managedPipelineMode:Integrated"
        C:Windows\System32\inetsrv\appcmd.exe $appCmdArgs

        Exit-PSSession
    }
    
}