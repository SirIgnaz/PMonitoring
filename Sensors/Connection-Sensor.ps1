$Destination = Read-Host -Prompt "Input Destination"
Write-Host -Object "Resolve Destination" -ForegroundColor Green
$ResolveDestination = Test-Connection $Destination -ResolveDestination | Select-Object -First 1
Write-Host -Object $ResolveDestination.Address
  
Write-Host -Object "Check MTU Size" -ForegroundColor Green
$MTUSize = Test-Connection $Destination -MTUSize
Write-Host -Object $MTUSize.MtuSize
