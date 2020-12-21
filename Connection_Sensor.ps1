[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [string]
    $Target
)
/**
 * @author [BraunS]
 * @email [example@mail.com]
 * @create date 2020-12-16 10:53:44
 * @modify date 2020-12-16 10:53:44
 * @desc [Script to get some infos of the current connection]
 */

function TestConnection{
    param (
        $Hostname
    )
    Write-Host -Object "Resolve Destination" -ForegroundColor Green
    $ResolveDestination = Test-Connection $Hostname -ResolveDestination | Select-Object -First 1
    Write-Host -Object $ResolveDestination.Address
    
    Write-Host -Object "Check MTU Size" -ForegroundColor Green
    $MTUSize = Test-Connection $Hostname -MTUSize
    Write-Host -Object $MTUSize.MtuSize
}


TestConnection -Hostname $Target

