#Requires -RunAsAdministrator
#Requires -Version 7

$Target = Read-Host "Please input Name or IP Address"

if ((Test-NetConnection $Target ).PingSucceeded){

$MTUSize = Test-Connection -TargetName $Target -MtuSize
$DNSName = Resolve-DnsName -Name $Target
$DiagnosticRouting = Test-NetConnection -ComputerName $Target -DiagnoseRouting -InformationLevel Detailed

Write-Host "MTU Size" -ForegroundColor Green
Write-Host $MTUSize.MtuSize
Write-Host "DNS" -ForegroundColor Green
Write-Host $DNSName.Name
Write-Host "Outgoing Interface" -ForegroundColor Green
Write-Host $DiagnosticRouting.OutgoingInterfaceAlias
}
else{
    Write-Error "Target not reachable"
}
