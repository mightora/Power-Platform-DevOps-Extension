<#
    ===========================================================
    Task: Test
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
Write-Host "Task: Test"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)"
Write-Host "Contributors:"
#Write-Host " - Developer A (Contributions: Improved Git configuration handling)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="


# Get inputs from the task
$projectFolder = Get-VstsInput -Name 'projectFolder'
$outputFolder = Get-VstsInput -Name 'outputFolder'

# Log inputs
Write-Output "### Initial parameters ###"
Write-Output "Project Folder: $projectFolder"
Write-Output "Output Folder: $outputFolder"

# Task completed successfully
Write-Output "Task completed successfully."
