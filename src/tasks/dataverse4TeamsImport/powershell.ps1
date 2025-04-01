<#
    ===========================================================
    Task: Mightora Power Platform Dataverse 4 Teams Import
    
    Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)
    Date: 2024-10-08

    Contributors:
    - Developer A (Contributions: Improved Git configuration handling)
    - Developer B (Contributions: Added support for custom commit messages)
    
    ===========================================================
#>

[CmdletBinding()]

param()

# Fetch and display the developer message
function Fetch-DeveloperMessage {
    $url = "https://developer-message.mightora.io/api/HttpTrigger?appname=dataverse4TeamsImport"
    try {
        $response = Invoke-RestMethod -Uri $url -Method Get -ErrorAction Stop
        return $response.message
    } catch {
        return "Developer message not available."
    }
}

# Display the developer message
$developerMessage = Fetch-DeveloperMessage
Write-Host "Developer Message: $developerMessage"

# Output the script information at runtime
Write-Host "==========================================================="
Write-Host "Task: Mightora Power Platform Dataverse 4 Teams Import"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)"
Write-Host "Contributors:"
#Write-Host " - Developer A (Contributions: Improved Git configuration handling)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="

# Get inputs from the task
$solutionZipPath = Get-VstsInput -Name 'solutionZipPath'
$environment = Get-VstsInput -Name 'environment'
$forceOverwrite = Get-VstsInput -Name 'forceOverwrite'
$convertToManaged = Get-VstsInput -Name 'convertToManaged'
$activatePlugins = Get-VstsInput -Name 'activatePlugins'
$publishChanges = Get-VstsInput -Name 'publishChanges'
$importAsHolding = Get-VstsInput -Name 'importAsHolding'
$skipDependencyCheck = Get-VstsInput -Name 'skipDependencyCheck'
$skipLowerVersion = Get-VstsInput -Name 'skipLowerVersion'
$stageAndUpgrade = Get-VstsInput -Name 'stageAndUpgrade'
$async = Get-VstsInput -Name 'async'
$maxAsyncWaitTime = Get-VstsInput -Name 'maxAsyncWaitTime'
$solutionSettingsPath = Get-VstsInput -Name 'solutionSettingsPath'

# Change to build sources directory
Write-Output "Working Directory: $(Get-Location)"
cd $env:Build_SourcesDirectory
Write-Output "Working Directory Updated to: $(Get-Location)"

# Authenticate to the environment
pac auth create --deviceCode --environment $environment

# Get the current environment
Write-Host "You are currently connected to:"
pac auth list

# Construct the import command with dynamic options
$importCommand = "pac solution import --path `"$solutionZipPath`" --environment `"$environment`""

if ($forceOverwrite -eq $true) {
    $importCommand += " --force-overwrite"
}

if ($convertToManaged -eq $true) {
    $importCommand += " --convert-to-managed"
}

if ($activatePlugins -eq $true) {
    $importCommand += " --activate-plugins"
}

if ($publishChanges -eq $true) {
    $importCommand += " --publish-changes"
}

if ($importAsHolding -eq $true) {
    $importCommand += " --import-as-holding"
}

if ($skipDependencyCheck -eq $true) {
    $importCommand += " --skip-dependency-check"
}

if ($skipLowerVersion -eq $true) {
    $importCommand += " --skip-lower-version"
}

if ($stageAndUpgrade -eq $true) {
    $importCommand += " --stage-and-upgrade"
}

if ($async -eq $true) {
    $importCommand += " --async"
    if ($maxAsyncWaitTime -ne "") {
        $importCommand += " --max-async-wait-time $maxAsyncWaitTime"
    }
}

# Check if solution settings file is provided and add it to the import command
if ($solutionSettingsPath -ne "") {
    $importCommand += " --settings-file `"$solutionSettingsPath`""
}

# Execute the import command
Write-Host "Executing command: $importCommand"
Invoke-Expression $importCommand
