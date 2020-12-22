function Search-Module {
    param (
        [string]$moduleName
    )
    if(Get-Module -ListAvailable -Name $moduleName){

    }
    else {
        Write-Host -Object "$moduleName not found" -ForegroundColor "Red"
        Write-Host "Do yout want to download and install this module?" -ForegroundColor "yellow"
        Write-Host "Enter your choice" -ForegroundColor "yellow"
        Write-Host "1 : yes"
        Write-Host "2 : no"

        $selection = Read-Host "Please make a selection: "

        switch($selection){
            1 { Write-Host -Object "Yes"
            Install-Module Microsoft.PowerShell.ConsoleGuiTools -Force}
            2 { Write-Host -Object "No"
                Exit }
        }
    }
}