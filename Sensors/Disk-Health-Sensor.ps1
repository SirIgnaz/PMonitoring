#Requires -Version 7
#Requires -RunAsAdministrator

Import-Module .\Modules\Search-Module\Search-Module.psm1
Get-Command -Module Search-Module
Search-Module -moduleName Microsoft.PowerShell.ConsoleGuiTools

$getDisk = Get-PhysicalDisk | Select-Object Number, FriendlyName | Out-ConsoleGridView -Title "Select Disk"
$diskName = $getDisk.FriendlyName

Get-PhysicalDisk -FriendlyName $diskName | 
Select-Object -Property @{Label = 'Name'; Expression = { $_.FriendlyName } },
@{Label = 'SerialNumber'; Expression = { $_.SerialNumber } },
@{Label = 'MediaType'; Expression = { $_.MediaType } },
@{Label = 'HealthStatus'; Expression = { $_.HealthStatus } },
@{Label = 'OperationalStatus'; Expression = { $_.OperationalStatus } },
@{Label = 'TotalDiskSize_GB'; Expression = { [math]::round($_.Size / 1Gb, 3) } } | 
Out-ConsoleGridView -Title "Disk Infos"

Get-PhysicalDisk -FriendlyName $diskName | Get-StorageReliabilityCounter |
Select-Object -Property @{Label = 'Temperature'; Expression = { $_.Temperature } },
@{Label = 'WriteErrosCorrected'; Expression = { $_.WriteErrorsCorrected } },
@{Label = 'WriteErrorsTotal'; Expression = { $_.WriteErrorsTotal } },
@{Label = 'WriteErrorsUncorrected'; Expression = { $_.WriteErrorsUncorrected } },
@{Label = 'WriteErrorsLatencyMax'; Expression = { $_.WriteErrorsLatencyMax } },
@{Label = 'ReadErrorsCorrected'; Expression = { $_.ReadErrorsCorrected } },
@{Label = 'ReadErrorsTotal'; Expression = { $_.ReadErrorsTotal } },
@{Label = 'ReadErrorsUncorrected'; Expression = { $_.ReadErrorsUncorrected } },
@{Label = 'ReadLatencyMax'; Expression = { $_.ReadLatencyMax } } | 
Out-ConsoleGridView -Title "Disk Stats"