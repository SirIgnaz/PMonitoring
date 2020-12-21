#############
# Variables #
#############
$configFileName = "Config.xml"

# Check Powershell Version
$psVersion = $PSVersionTable.PSVersion

# Welcome Screen

Write-Host "######################"
Write-Host "#                    #"  
Write-Host "# Welcome to         #"
Write-Host "#       PMonitoring! #"
Write-Host "#                    #"
Write-Host "######################"

# Setup the Directory
$installPath = Read-Host -Prompt "Please input the install path -- C:\PMonitoring" 
$testPath = Test-Path -Path $installPath
if($testPath -eq "False"){
    try {
        New-Item -Path $installPath/PMonitoring -ItemType Directory
        New-Item -Path $installPath/PMonitoring/Config -ItemType Directory
        New-Item -Path $installPath/PMonitoring/Scripts -ItemType Directory
        New-Item -Path $installPath/PMonitoring/"Data" -ItemType Directory
        New-Item -Path $installPath/PMonitoring/Modules -ItemType Directory
    }
    catch {
        Write-Host "Unable to write to path" -ForegroundColor Red
    }
}

# Create Config

# Download scripts

# Module Path
#Save the current value in the $p variable.
$modulePath = [Environment]::GetEnvironmentVariable("PSModulePath")

#Add the new path to the $p variable. Begin with a semi-colon separator.
$modulePath += "$installPath/PMonitoring/Modules"

#Add the paths in $p to the PSModulePath value.
[Environment]::SetEnvironmentVariable("PSModulePath",$modulePath)

