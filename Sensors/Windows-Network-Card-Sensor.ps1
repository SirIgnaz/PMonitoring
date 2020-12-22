$netAdapter = Get-NetAdapter | Select-Object Name, InterfaceDescription, Status | Out-ConsoleGridView
$netAdapterName = $netAdapter.Name

Get-NetAdapter -Name $netAdapterName | Out-ConsoleGridView
Get-NetAdapterStatistics -Name $netAdapterName | Out-ConsoleGridView