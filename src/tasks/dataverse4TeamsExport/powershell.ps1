<#
    ===========================================================
    Task: Mightora Power Platform Dataverse 4 Teams Export
    
    Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)
    Date: 2024-10-08

    Contributors:
    - Developer A (Contributions: Improved Git configuration handling)
    - Developer B (Contributions: Added support for custom commit messages)
    
    ===========================================================
#>

[CmdletBinding()]

param()

# Output the script information at runtime
Write-Host "==========================================================="
Write-Host "Task: Mightora Power Platform Dataverse 4 Teams Export"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)"
Write-Host "Contributors:"
#Write-Host " - Developer A (Contributions: Improved Git configuration handling)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="



# Get inputs from the task
$solutionName = Get-VstsInput -Name 'solutionName'
$exportDirectory = Get-VstsInput -Name 'exportDirectory'
$managed = Get-VstsInput -Name 'managed'
$environment = Get-VstsInput -Name 'environment'

# Change to build sources

Write-Output "Working Directory: $(Get-Location)"

cd $env:Build_SourcesDirectory

Write-Output "Working Directory Updated to: $(Get-Location)"

pac auth create --deviceCode --environment $environment

# Get the current environment
Write-Host "You are currently connected to:"
pac auth list

# Export the solution based on managed flag
if ($managed -eq $true) {
    Write-Output "Exporting solution as managed."
    pac solution export --name $solutionName --path $exportDirectory --managed --overwrite
} else {
    Write-Output "Exporting solution as unmanaged."
    pac solution export --name $solutionName --path $exportDirectory --overwrite
}

