function Install-WindowsFeaturesInServers {
    param (
        [String[]] $computers,
        [String] $featureName
    )

    $jobScriptBlock = {
        param(
            [String] $computerName,
            [String] $featureName
        )
        Install-WindowsFeature -ComputerName $computerName -Name $featureName
    }

    $computers | ForEach-Object {
        Start-Job -ScriptBlock $jobScriptBlock -ArgumentList ($_, $featureName)
    }
    
}