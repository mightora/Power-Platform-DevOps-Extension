<#
    ===========================================================
    Task: Mightora Power Platform Option Sets Documentation Generator
    ===========================================================
#>

[CmdletBinding()]

param(
    [string]$solutionPath,
    [string]$outputLocation,
    [bool]$includeDetails = $true,
    [bool]$includeUsage = $true,
    [bool]$devMode = $false
)

# Function to get the developer message
function Get-DeveloperMessage {
    $url = "https://developer-message.mightora.io/api/HttpTrigger?appname=documentOptionSets"
    try {
        $response = Invoke-RestMethod -Uri $url -Method Get -ErrorAction Stop
        return $response.message
    } catch {
        return "Developer message not available."
    }
}

# Display the developer message
$developerMessage = Get-DeveloperMessage
Write-Host "Developer Message: $developerMessage"

# Output the script information at runtime
Write-Host "==========================================================="
Write-Host "Task: Mightora Power Platform Option Sets Documentation Generator"
Write-Host "Date: $(Get-Date -Format 'yyyy-MM-dd')"
Write-Host "==========================================================="

if (-not $devMode -and -not $solutionPath) {
    # Get inputs from the task when running in VSTS and no parameters provided
    try {
        $solutionPath = Get-VstsInput -Name 'solutionPath'
        $outputLocation = Get-VstsInput -Name 'outputLocation'
        $includeDetails = [bool](Get-VstsInput -Name 'includeDetails')
        $includeUsage = [bool](Get-VstsInput -Name 'includeUsage')
    } catch {
        Write-Output "VSTS environment not available. Please provide parameters directly."
    }
}

# Validation: Check if required parameters have been provided
if (-not $solutionPath -or -not $outputLocation) {
    Write-Output "Both solutionPath and outputLocation parameters are required."
    Write-Output "Usage: .\powershell.ps1 -solutionPath '.\sampSol\CofECore\SolutionPackage\src' -outputLocation '.\testOutput'"
    exit 1
}

# Check if the solution path exists
if (-not (Test-Path -Path $solutionPath)) {
    Write-Output "Solution path not found at: $solutionPath"
    exit 1
}

# Change to build sources directory if not in dev mode and environment variable exists
if (-not $devMode -and $env:Build_SourcesDirectory) {
    Set-Location $env:Build_SourcesDirectory
    Write-Output "Working Directory Updated to: $(Get-Location)"
}

Write-Output "Solution path: $solutionPath"
Write-Output "Output location: $outputLocation"
Write-Output "Include Details: $includeDetails"
Write-Output "Include Usage: $includeUsage"
Write-Output "Working Directory: $(Get-Location)"

# Check if the output location exists; if not, create it
if (-not (Test-Path -Path $outputLocation)) {
    New-Item -ItemType Directory -Path $outputLocation -Force
    Write-Output "Created output location at: $outputLocation"
}

# Find all option set XML files in the solution
$optionSetFiles = Get-ChildItem -Path $solutionPath -Filter "*.xml" -Recurse | 
    Where-Object { $_.DirectoryName -like "*OptionSets*" -or $_.Name -like "*optionset*" }

if (-not $optionSetFiles) {
    # Alternative search for option sets in solution components
    $optionSetFiles = Get-ChildItem -Path $solutionPath -Filter "*.xml" -Recurse | 
        Where-Object { 
            try {
                [xml]$content = Get-Content $_.FullName -ErrorAction SilentlyContinue
                return $content.optionset -ne $null
            } catch {
                return $false
            }
        }
}

if (-not $optionSetFiles) {
    Write-Output "No option set files found in the solution path: $solutionPath"
    exit 1
}

Write-Output "Found $($optionSetFiles.Count) option set file(s)"

# Initialize collections
$allOptionSets = @()
$processingErrors = @()

# Process each option set file
foreach ($file in $optionSetFiles) {
    try {
        Write-Output "Processing: $($file.Name)"
        [xml]$optionSetXml = Get-Content -Path $file.FullName -ErrorAction Stop
        
        if ($optionSetXml.optionset) {
            $optionSet = $optionSetXml.optionset
            
            # Extract option set information
            $optionSetInfo = [PSCustomObject]@{
                Name = $optionSet.Name
                DisplayName = if ($optionSet.displaynames.displayname) { 
                    $optionSet.displaynames.displayname.description 
                } else { 
                    $optionSet.Name 
                }
                Description = if ($optionSet.Descriptions.Description) { 
                    $optionSet.Descriptions.Description.description 
                } else { 
                    "No description available" 
                }
                IsGlobal = $optionSet.IsGlobal
                OptionSetType = $optionSet.OptionSetType
                IntroducedVersion = $optionSet.IntroducedVersion
                Options = @()
                FileName = $file.Name
                FilePath = $file.FullName
            }
            
            # Extract options
            if ($optionSet.options.option) {
                foreach ($option in $optionSet.options.option) {
                    $optionInfo = [PSCustomObject]@{
                        Value = $option.value
                        Label = if ($option.labels.label) { 
                            $option.labels.label.description 
                        } else { 
                            "No label" 
                        }
                        Description = if ($option.descriptions.description) { 
                            $option.descriptions.description.description 
                        } else { 
                            "" 
                        }
                        Color = $option.color
                        IsManaged = $option.IsManaged
                        ExternalValue = $option.ExternalValue
                    }
                    $optionSetInfo.Options += $optionInfo
                }
            }
            
            $allOptionSets += $optionSetInfo
        }
    } catch {
        $error = "Error processing file $($file.Name): $($_.Exception.Message)"
        $processingErrors += $error
        Write-Warning $error
    }
}

if ($allOptionSets.Count -eq 0) {
    Write-Output "No valid option sets found in the processed files."
    exit 1
}

# Generate solution name from path
$solutionName = Split-Path -Path $solutionPath -Leaf
if ($solutionName -eq "src") {
    $solutionName = Split-Path -Path (Split-Path -Path $solutionPath -Parent) -Leaf
}

# Initialize Markdown content
$markdownContent = @"
# Option Sets Documentation

**Generated on:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
**Solution:** $solutionName

## Overview

This document contains documentation for all option sets found in the solution.

**Total Option Sets:** $($allOptionSets.Count)
**Global Option Sets:** $(($allOptionSets | Where-Object { $_.IsGlobal -eq "true" }).Count)
**Local Option Sets:** $(($allOptionSets | Where-Object { $_.IsGlobal -ne "true" }).Count)

"@

# Add processing errors if any
if ($processingErrors.Count -gt 0) {
    $markdownContent += @"

## Processing Warnings

The following files had processing issues:

"@
    foreach ($error in $processingErrors) {
        $markdownContent += "- $error`n"
    }
    $markdownContent += "`n"
}

# Add summary table
$markdownContent += @"

## Option Sets Summary

| Name | Display Name | Type | Options Count | Global |
|------|--------------|------|---------------|--------|

"@

foreach ($optionSet in $allOptionSets | Sort-Object Name) {
    $isGlobal = if ($optionSet.IsGlobal -eq "true") { "Yes" } else { "No" }
    $optionCount = $optionSet.Options.Count
    $markdownContent += "| $($optionSet.Name) | $($optionSet.DisplayName) | $($optionSet.OptionSetType) | $optionCount | $isGlobal |`n"
}

# Add detailed information if requested
if ($includeDetails) {
    $markdownContent += @"

## Detailed Option Sets Information

"@

    foreach ($optionSet in $allOptionSets | Sort-Object Name) {
        $markdownContent += @"

### $($optionSet.DisplayName)

**Technical Details:**
- **Name:** ``$($optionSet.Name)``
- **Type:** $($optionSet.OptionSetType)
- **Global:** $(if ($optionSet.IsGlobal -eq "true") { "Yes" } else { "No" })
- **Introduced Version:** $($optionSet.IntroducedVersion)
- **Source File:** $($optionSet.FileName)

**Description:** $($optionSet.Description)

"@

        if ($optionSet.Options.Count -gt 0) {
            $markdownContent += @"

**Options:**

| Value | Label | Description | Color | External Value |
|-------|-------|-------------|-------|----------------|

"@
            foreach ($option in $optionSet.Options | Sort-Object { [int]$_.Value }) {
                $color = if ($option.Color) { 
                    # Add HTML color swatch for visualization
                    "<span style='background-color:$($option.Color);color:white;padding:2px 6px;border-radius:3px;'>$($option.Color)</span>"
                } else { 
                    "-" 
                }
                $externalValue = if ($option.ExternalValue) { $option.ExternalValue } else { "-" }
                $description = if ($option.Description) { $option.Description } else { "-" }
                $markdownContent += "| $($option.Value) | $($option.Label) | $description | $color | $externalValue |`n"
            }
        } else {
            $markdownContent += "`n**No options defined for this option set.**`n"
        }
        
        $markdownContent += "`n"
    }
}

# Add usage information if requested
if ($includeUsage) {
    $markdownContent += @"

## Usage Statistics

"@

    # Group option sets by type
    $optionSetsByType = $allOptionSets | Group-Object -Property OptionSetType
    
    $markdownContent += @"

### By Type

| Option Set Type | Count |
|-----------------|-------|

"@
    
    foreach ($typeGroup in $optionSetsByType | Sort-Object Name) {
        $markdownContent += "| $($typeGroup.Name) | $($typeGroup.Count) |`n"
    }

    # Option value statistics
    $totalOptions = ($allOptionSets | ForEach-Object { $_.Options.Count } | Measure-Object -Sum).Sum
    $averageOptions = if ($allOptionSets.Count -gt 0) { 
        [math]::Round($totalOptions / $allOptionSets.Count, 2) 
    } else { 
        0 
    }
    
    $markdownContent += @"

### Statistics

| Metric | Value |
|--------|-------|
| **Total Option Values** | $totalOptions |
| **Average Options per Set** | $averageOptions |
| **Largest Option Set** | $($allOptionSets | Sort-Object { $_.Options.Count } -Descending | Select-Object -First 1 | ForEach-Object { "$($_.DisplayName) ($($_.Options.Count) options)" }) |
| **Files Processed** | $($optionSetFiles.Count) |

"@
}

$markdownContent += @"

---
*Documentation generated by Mightora Power Platform Option Sets Documentation Generator*
"@

# Define the output file path
$outputFilePath = Join-Path -Path $outputLocation -ChildPath "OptionSets_$solutionName.md"

# Save the Markdown content to file
try {
    $markdownContent | Out-File -FilePath $outputFilePath -Encoding UTF8
    Write-Output "Option sets documentation successfully generated at: $outputFilePath"
} catch {
    Write-Output "Error writing documentation file: $($_.Exception.Message)"
    exit 1
}

Write-Output "Processing complete."
