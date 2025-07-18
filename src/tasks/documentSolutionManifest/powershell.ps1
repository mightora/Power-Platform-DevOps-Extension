<#
    ===========================================================
    Task: Mightora Power Platform Solution Manifest Documentation Generator
    
    Originally Created By: GitHub Copilot Assistant (Date: 2025-07-07)
    Date: 2025-07-07

    Contributors:
    - GitHub Copilot Assistant (Contributions: Initial implementation)
    
    ===========================================================
#>

[CmdletBinding()]

param(
    [string]$solutionXmlPath,
    [string]$outputLocation,
    [bool]$includeComponents = $true,
    [bool]$includeDependencies = $true,
    [bool]$devMode = $false
)

# Function to get the developer message
function Get-DeveloperMessage {
    $url = "https://developer-message.mightora.io/api/HttpTrigger?appname=documentSolutionManifest"
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
Write-Host "Task: Mightora Power Platform Solution Manifest Documentation Generator"
Write-Host "Originally Created By: GitHub Copilot Assistant (Date: 2025-07-07)"
Write-Host "Contributors:"
Write-Host " - GitHub Copilot Assistant (Contributions: Initial implementation)"
Write-Host "==========================================================="

if (-not $devMode) {
    # Get inputs from the task
    $solutionXmlPath = Get-VstsInput -Name 'solutionXmlPath'
    $outputLocation = Get-VstsInput -Name 'outputLocation'
    $includeComponents = [bool](Get-VstsInput -Name 'includeComponents')
    $includeDependencies = [bool](Get-VstsInput -Name 'includeDependencies')
}

# Validation: Check if required parameters have been provided
if (-not $solutionXmlPath -or -not $outputLocation) {
    Write-Output "Both solutionXmlPath and outputLocation parameters are required."
    Write-Output "Usage: .\powershell.ps1 -solutionXmlPath 'C:\path\to\Solution.xml' -outputLocation 'C:\path\to\output'"
    exit 1
}

# Check if the Solution.xml file exists
if (-not (Test-Path -Path $solutionXmlPath)) {
    Write-Output "Solution.xml file not found at: $solutionXmlPath"
    exit 1
}

# Change to build sources directory if not in dev mode
if (-not $devMode) {
    Set-Location $env:Build_SourcesDirectory
    Write-Output "Working Directory Updated to: $(Get-Location)"
}

Write-Output "Solution.xml file: $solutionXmlPath"
Write-Output "Output location: $outputLocation"
Write-Output "Include Components: $includeComponents"
Write-Output "Include Dependencies: $includeDependencies"
Write-Output "Working Directory: $(Get-Location)"

# Check if the output location exists; if not, create it
if (-not (Test-Path -Path $outputLocation)) {
    New-Item -ItemType Directory -Path $outputLocation -Force
    Write-Output "Created output location at: $outputLocation"
}

# Load the Solution.xml file
try {
    [xml]$solutionXml = Get-Content -Path $solutionXmlPath -ErrorAction Stop
    Write-Output "Successfully loaded Solution.xml file"
} catch {
    Write-Output "Error loading Solution.xml file: $($_.Exception.Message)"
    exit 1
}

# Extract solution manifest information
$manifest = $solutionXml.ImportExportXml.SolutionManifest
$solutionName = $manifest.UniqueName
$solutionVersion = $manifest.Version
$solutionDisplayName = $manifest.LocalizedNames.LocalizedName.description
$isManaged = switch ($manifest.Managed) {
    "0" { "Unmanaged" }
    "1" { "Managed" }
    "2" { "Both" }
    default { "Unknown" }
}

# Extract publisher information
$publisher = $manifest.Publisher
$publisherName = $publisher.UniqueName
$publisherDisplayName = $publisher.LocalizedNames.LocalizedName.description
$publisherPrefix = $publisher.CustomizationPrefix
$publisherOptionValuePrefix = $publisher.CustomizationOptionValuePrefix

# Initialize Markdown content
$markdownContent = @"
# Solution Manifest Documentation

**Generated on:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

## Solution Overview

| Property | Value |
|----------|-------|
| **Solution Name** | $solutionName |
| **Display Name** | $solutionDisplayName |
| **Version** | $solutionVersion |
| **Type** | $isManaged |
| **Language Code** | $($solutionXml.ImportExportXml.languagecode) |
| **Organization Version** | $($solutionXml.ImportExportXml.OrganizationVersion) |
| **Schema Type** | $($solutionXml.ImportExportXml.OrganizationSchemaType) |

## Publisher Information

| Property | Value |
|----------|-------|
| **Publisher Name** | $publisherName |
| **Display Name** | $publisherDisplayName |
| **Customization Prefix** | $publisherPrefix |
| **Option Value Prefix** | $publisherOptionValuePrefix |

"@

# Add publisher address information if available
if ($publisher.Addresses.Address) {
    $markdownContent += @"

### Publisher Addresses

"@
    $addressCount = 1
    foreach ($address in $publisher.Addresses.Address) {
        $addressLabel = "Address $addressCount"
        $markdownContent += "`n`n**$addressLabel**:`n"
        $markdownContent += "- Address Number: $($address.AddressNumber)`n"
        $markdownContent += "- Address Type Code: $($address.AddressTypeCode)`n"
        $markdownContent += "- Shipping Method Code: $($address.ShippingMethodCode)`n`n"
        $addressCount++
    }
}

# Add root components section if requested
if ($includeComponents -and $manifest.RootComponents.RootComponent) {
    $markdownContent += @"

## Detailed Component Breakdown

This solution contains **$($manifest.RootComponents.RootComponent.Count)** total components across **$($componentsByType.Count)** different types.

"@

    # Focus on the most important component types first
    $priorityTypes = @("1", "60", "300", "27", "24", "26", "9", "20", "371", "372")
    $processedTypes = @()

    # Process priority types first
    foreach ($priorityType in $priorityTypes) {
        $typeGroup = $componentsByType | Where-Object { $_.Name -eq $priorityType }
        if ($typeGroup) {
            $typeName = if ($componentTypeMap.ContainsKey($typeGroup.Name)) { 
                $componentTypeMap[$typeGroup.Name]
            } else { 
                "Type $($typeGroup.Name)" 
            }
            
            $markdownContent += @"

### $typeName
**Count:** $($typeGroup.Count)

"@

            # If there are schema names, list them in a more compact format
            $componentsWithSchema = $typeGroup.Group | Where-Object { $_.schemaName }
            if ($componentsWithSchema -and $componentsWithSchema.Count -le 20) {
                $markdownContent += "**Components:** "
                $schemaNames = ($componentsWithSchema | Sort-Object schemaName | ForEach-Object { $_.schemaName }) -join ", "
                $markdownContent += "$schemaNames`n`n"
            } elseif ($componentsWithSchema -and $componentsWithSchema.Count -gt 20) {
                $markdownContent += "**Sample Components (showing first 10):** "
                $sampleNames = ($componentsWithSchema | Sort-Object schemaName | Select-Object -First 10 | ForEach-Object { $_.schemaName }) -join ", "
                $markdownContent += "$sampleNames ... and $($componentsWithSchema.Count - 10) more`n`n"
            }

            $processedTypes += $typeGroup.Name
        }
    }

    # Process remaining types
    $remainingTypes = $componentsByType | Where-Object { $_.Name -notin $processedTypes } | Sort-Object Name
    if ($remainingTypes) {
        $markdownContent += @"

### Other Component Types

"@
        foreach ($typeGroup in $remainingTypes) {
            $typeName = if ($componentTypeMap.ContainsKey($typeGroup.Name)) { 
                $componentTypeMap[$typeGroup.Name]
            } else { 
                "Type $($typeGroup.Name)" 
            }
            
            $markdownContent += "- **$typeName**: $($typeGroup.Count) components`n"
        }
    }
}

# Add component type summary section
if ($includeComponents -and $manifest.RootComponents.RootComponent) {
    # Component type mapping (common types)
    $componentTypeMap = @{
        "1" = "Entity"
        "2" = "Attribute"
        "3" = "Relationship"
        "9" = "Option Set"
        "20" = "Role"
        "24" = "Form"
        "26" = "Saved Query"
        "27" = "Workflow"
        "29" = "Report Entity"
        "60" = "Web Resource"
        "61" = "Site Map"
        "62" = "Connection Role"
        "66" = "Plugin Type"
        "67" = "Plugin Assembly"
        "68" = "SDK Message Processing Step"
        "300" = "Canvas App"
        "371" = "Connector"
        "372" = "Environment Variable Definition"
        "373" = "Environment Variable Value"
        "380" = "AI Template"
        "381" = "AI Model"
        "400" = "Desktop Flow Module"
        "418" = "Dataflow"
    }

    # Group components by type
    $componentsByType = $manifest.RootComponents.RootComponent | Group-Object -Property type

    $markdownContent += @"

## Component Type Summary

"@

    # Create a summary table of component types with counts
    $markdownContent += "| Component Type | Count | Description |`n"
    $markdownContent += "|----------------|-------|-------------|`n"
    
    foreach ($typeGroup in $componentsByType | Sort-Object Name) {
        $typeName = if ($componentTypeMap.ContainsKey($typeGroup.Name)) { 
            $componentTypeMap[$typeGroup.Name]
        } else { 
            "Unknown Type" 
        }
        
        $markdownContent += "| **$typeName** (Type $($typeGroup.Name)) | $($typeGroup.Count) | "
        
        # Add descriptions for common component types
        $description = switch ($typeGroup.Name) {
            "1" { "Custom tables/entities that store business data" }
            "9" { "Choice/option sets used in fields" }
            "20" { "Security roles defining user permissions" }
            "24" { "Custom forms for data entry and viewing" }
            "26" { "Saved queries/views for displaying data" }
            "27" { "Automated business processes and workflows" }
            "29" { "Report entities for reporting functionality" }
            "60" { "Web resources like HTML, CSS, JavaScript files" }
            "61" { "Navigation structure and menu configuration" }
            "62" { "Connection roles for relationship management" }
            "66" { "Custom plugin types for extending functionality" }
            "67" { "Plugin assemblies containing custom code" }
            "68" { "Plugin steps defining when plugins execute" }
            "300" { "Canvas apps for custom user interfaces" }
            "371" { "Custom connectors for external integrations" }
            "372" { "Environment variable definitions for configuration" }
            "373" { "Environment variable values" }
            default { "Solution component" }
        }
        
        $markdownContent += "$description |`n"
    }

    # Add detailed breakdown section
    $markdownContent += @"

## Detailed Component Breakdown

This solution contains **$($manifest.RootComponents.RootComponent.Count)** total components across **$($componentsByType.Count)** different types.

"@

    # Focus on the most important component types first
    $priorityTypes = @("1", "60", "300", "27", "24", "26", "9", "20", "371", "372")
    $processedTypes = @()

    # Process priority types first
    foreach ($priorityType in $priorityTypes) {
        $typeGroup = $componentsByType | Where-Object { $_.Name -eq $priorityType }
        if ($typeGroup) {
            $typeName = if ($componentTypeMap.ContainsKey($typeGroup.Name)) { 
                $componentTypeMap[$typeGroup.Name]
            } else { 
                "Type $($typeGroup.Name)" 
            }
            
            $markdownContent += @"

### $typeName
**Count:** $($typeGroup.Count)

"@

            # If there are schema names, list them in a more compact format
            $componentsWithSchema = $typeGroup.Group | Where-Object { $_.schemaName }
            if ($componentsWithSchema -and $componentsWithSchema.Count -le 20) {
                $markdownContent += "**Components:** "
                $schemaNames = ($componentsWithSchema | Sort-Object schemaName | ForEach-Object { $_.schemaName }) -join ", "
                $markdownContent += "$schemaNames`n`n"
            } elseif ($componentsWithSchema -and $componentsWithSchema.Count -gt 20) {
                $markdownContent += "**Sample Components (showing first 10):** "
                $sampleNames = ($componentsWithSchema | Sort-Object schemaName | Select-Object -First 10 | ForEach-Object { $_.schemaName }) -join ", "
                $markdownContent += "$sampleNames ... and $($componentsWithSchema.Count - 10) more`n`n"
            }

            $processedTypes += $typeGroup.Name
        }
    }

    # Process remaining types
    $remainingTypes = $componentsByType | Where-Object { $_.Name -notin $processedTypes } | Sort-Object Name
    if ($remainingTypes) {
        $markdownContent += @"

### Other Component Types

"@
        foreach ($typeGroup in $remainingTypes) {
            $typeName = if ($componentTypeMap.ContainsKey($typeGroup.Name)) { 
                $componentTypeMap[$typeGroup.Name]
            } else { 
                "Type $($typeGroup.Name)" 
            }
            
            $markdownContent += "- **$typeName**: $($typeGroup.Count) components`n"
        }
    }
}

# Add missing dependencies section if requested
if ($includeDependencies -and $manifest.MissingDependencies.MissingDependency) {
    $markdownContent += @"

## Missing Dependencies

This solution has **$($manifest.MissingDependencies.MissingDependency.Count)** missing dependencies.

"@

    $dependencyCount = 1
    foreach ($dependency in $manifest.MissingDependencies.MissingDependency) {
        $markdownContent += @"

### Dependency $dependencyCount

**Required:**
- Type: $($dependency.Required.type)
- Display Name: $($dependency.Required.displayName)

"@
        
        if ($dependency.Required.solution) {
            $markdownContent += "- Solution: $($dependency.Required.solution)`n"
        }
        
        if ($dependency.Required.package) {
            $markdownContent += "- Package: $($dependency.Required.package.appName) (Version: $($dependency.Required.package.version))`n"
        }

        $markdownContent += @"

**Dependent:**
- Type: $($dependency.Dependent.type)
- Display Name: $($dependency.Dependent.displayName)

"@

        if ($dependency.Dependent.parentDisplayName) {
            $markdownContent += "- Parent Display Name: $($dependency.Dependent.parentDisplayName)`n"
        }

        $markdownContent += "`n"
        $dependencyCount++
    }
}

# Add summary statistics
if ($includeComponents -and $manifest.RootComponents.RootComponent) {
    $markdownContent += @"

## Summary Statistics

| Metric | Count |
|--------|-------|
| **Total Components** | $($manifest.RootComponents.RootComponent.Count) |
| **Component Types** | $($componentsByType.Count) |
| **Custom Entities** | $(($componentsByType | Where-Object {$_.Name -eq "1"}).Count) |
| **Web Resources** | $(($componentsByType | Where-Object {$_.Name -eq "60"}).Count) |
| **Workflows** | $(($componentsByType | Where-Object {$_.Name -eq "27"}).Count) |
| **Forms** | $(($componentsByType | Where-Object {$_.Name -eq "24"}).Count) |
| **Views** | $(($componentsByType | Where-Object {$_.Name -eq "26"}).Count) |

"@
} else {
    $markdownContent += @"

## Summary Statistics

| Metric | Count |
|--------|-------|
| **Total Components** | $($manifest.RootComponents.RootComponent.Count) |

"@
}

$markdownContent += @"
---
*Documentation generated by Mightora Power Platform Solution Manifest Documentation Generator*
"@

# Define the output file path
$outputFilePath = Join-Path -Path $outputLocation -ChildPath "SolutionManifest_$solutionName.md"

# Save the Markdown content to file
try {
    $markdownContent | Out-File -FilePath $outputFilePath -Encoding UTF8
    Write-Output "Solution manifest documentation successfully generated at: $outputFilePath"
} catch {
    Write-Output "Error writing documentation file: $($_.Exception.Message)"
    exit 1
}

Write-Output "Processing complete."
