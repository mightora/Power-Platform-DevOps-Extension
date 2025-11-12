# powershell-modular.ps1
# Modular version of the PowerShell script using separate diagram generators

<#
    ===========================================================
    Task: Mightora Power Platform Workflows Documentation Generator (Modular)
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

# Import diagram generator modules
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$diagramGeneratorsPath = Join-Path -Path $scriptPath -ChildPath "DiagramGenerators"

Import-Module (Join-Path -Path $diagramGeneratorsPath -ChildPath "BaseDiagramGenerator.psm1") -Force
Import-Module (Join-Path -Path $diagramGeneratorsPath -ChildPath "PowerAutomateDiagramGenerator.psm1") -Force
Import-Module (Join-Path -Path $diagramGeneratorsPath -ChildPath "BusinessProcessFlowDiagramGenerator.psm1") -Force
Import-Module (Join-Path -Path $diagramGeneratorsPath -ChildPath "ClassicWorkflowDiagramGenerator.psm1") -Force
Import-Module (Join-Path -Path $diagramGeneratorsPath -ChildPath "DiagramFactory.psm1") -Force

# Function to get the developer message
function Get-DeveloperMessage {
    $url = "https://developer-message.mightora.io/api/HttpTrigger?appname=documentWorkflows"
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
Write-Host "Task: Mightora Power Platform Workflows Documentation Generator (Modular)"
Write-Host "Date: $(Get-Date -Format 'yyyy-MM-dd')"
Write-Host "==========================================================="

# Parameter validation (same as original)
if (-not $devMode -and -not $solutionPath) {
    try {
        $solutionPath = Get-VstsInput -Name 'solutionPath'
        $outputLocation = Get-VstsInput -Name 'outputLocation'
        $includeDetails = [bool](Get-VstsInput -Name 'includeDetails')
        $includeUsage = [bool](Get-VstsInput -Name 'includeUsage')
        Write-Output "Successfully retrieved inputs from VSTS task"
    } catch {
        Write-Output "VSTS environment not available: $($_.Exception.Message)"
        Write-Output "Please provide parameters directly when running outside of Azure DevOps pipeline."
    }
}

if (-not $solutionPath -or -not $outputLocation) {
    Write-Output "Both solutionPath and outputLocation parameters are required."
    Write-Output "Usage: .\powershell-modular.ps1 -solutionPath '.\sampSol\CofECore\SolutionPackage\src' -outputLocation '.\testOutput'"
    exit 1
}

if (-not (Test-Path -Path $solutionPath)) {
    Write-Output "Solution path not found at: $solutionPath"
    exit 1
}

# Change to build sources directory if not in dev mode
if (-not $devMode -and $env:Build_SourcesDirectory) {
    Set-Location $env:Build_SourcesDirectory
    Write-Output "Working Directory Updated to: $(Get-Location)"
}

Write-Output "Solution path: $solutionPath"
Write-Output "Output location: $outputLocation"
Write-Output "Include Details: $includeDetails"
Write-Output "Include Usage: $includeUsage"
Write-Output "Working Directory: $(Get-Location)"

# Create output directory if it doesn't exist
if (-not (Test-Path -Path $outputLocation)) {
    New-Item -ItemType Directory -Path $outputLocation -Force | Out-Null
    Write-Output "Created output directory: $outputLocation"
}

# Function to create individual markdown file using diagram generators
function New-WorkflowMarkdown {
    param(
        [string]$FilePath,
        [string]$OutputPath,
        [string]$WorkflowName,
        [PSCustomObject]$WorkflowData
    )
    
    try {
        # Get appropriate diagram generator
        $generator = Get-DiagramGenerator -FilePath $FilePath
        if ($null -eq $generator) {
            Write-Warning "No diagram generator found for: $FilePath"
            return $null
        }
        
        # Generate the diagram
        $diagram = New-WorkflowDiagram -FilePath $FilePath -WorkflowData $WorkflowData -WorkflowName $WorkflowName
        if ($null -eq $diagram) {
            Write-Warning "Failed to generate diagram for: $FilePath"
            return $null
        }
        
        # Extract metadata based on workflow type
        $metadata = @{}
        if ($generator -is [PowerAutomateDiagramGenerator]) {
            $connections = $generator.ExtractConnections($WorkflowData)
            $parameters = $generator.ExtractParameters($WorkflowData.properties.definition)
            $metadata = @{
                Type = "Power Automate Flow"
                Connections = $connections
                Parameters = $parameters
                TriggerCount = if ($WorkflowData.properties.definition.triggers) { $WorkflowData.properties.definition.triggers.PSObject.Properties.Count } else { 0 }
                ActionCount = if ($WorkflowData.properties.definition.actions) { $WorkflowData.properties.definition.actions.PSObject.Properties.Count } else { 0 }
            }
        } elseif ($generator -is [BusinessProcessFlowDiagramGenerator]) {
            $stages = $generator.ExtractStages($WorkflowData)
            $metadata = @{
                Type = "Business Process Flow"
                Stages = $stages
                StageCount = $stages.Count
            }
        } elseif ($generator -is [ClassicWorkflowDiagramGenerator]) {
            $activities = $generator.ExtractActivities($WorkflowData)
            $metadata = @{
                Type = "Classic Workflow"
                Activities = $activities
                ActivityCount = $activities.Count
            }
        }
        
        # Generate markdown content
        $markdownContent = @"
# $($metadata.Type): $WorkflowName

**Generated on:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
**Source File:** $(Split-Path -Leaf $FilePath)

## Overview

This document contains detailed documentation for the $($metadata.Type.ToLower()).

### Summary
- **Name:** $WorkflowName
"@

        # Add type-specific summary information
        switch ($metadata.Type) {
            "Power Automate Flow" {
                $markdownContent += @"
- **Triggers:** $($metadata.TriggerCount)
- **Actions:** $($metadata.ActionCount)
- **Connections:** $($metadata.Connections.Count)
- **Parameters:** $($metadata.Parameters.Count)
"@
            }
            "Business Process Flow" {
                $markdownContent += @"
- **Stages:** $($metadata.StageCount)
"@
            }
            "Classic Workflow" {
                $markdownContent += @"
- **Activities:** $($metadata.ActivityCount)
"@
            }
        }

        $markdownContent += @"

## Workflow Diagram

``````plantuml
$diagram
``````

"@

        # Add type-specific detailed sections
        if ($includeDetails) {
            switch ($metadata.Type) {
                "Power Automate Flow" {
                    if ($metadata.Connections.Count -gt 0) {
                        $markdownContent += @"
## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|
"@
                        foreach ($conn in $metadata.Connections) {
                            $markdownContent += "| $($conn.Key) | $($conn.ApiName) | $($conn.ConnectionLogicalName) | $($conn.RuntimeSource) |`n"
                        }
                        $markdownContent += "`n"
                    }
                    
                    if ($metadata.Parameters.Count -gt 0) {
                        $markdownContent += @"
## Parameters

| Name | Type | Default Value | Description |
|------|------|---------------|-------------|
"@
                        foreach ($param in $metadata.Parameters) {
                            $markdownContent += "| $($param.Name) | $($param.Type) | $($param.DefaultValue) | $($param.Description) |`n"
                        }
                        $markdownContent += "`n"
                    }
                }
                "Business Process Flow" {
                    if ($metadata.Stages.Count -gt 0) {
                        $markdownContent += @"
## Stages

| Stage Name | Display Name | Entity | Steps Count |
|------------|--------------|--------|-------------|
"@
                        foreach ($stage in $metadata.Stages) {
                            $markdownContent += "| $($stage.Name) | $($stage.DisplayName) | $($stage.EntityName) | $($stage.Steps.Count) |`n"
                        }
                        $markdownContent += "`n"
                    }
                }
                "Classic Workflow" {
                    if ($metadata.Activities.Count -gt 0) {
                        $markdownContent += @"
## Activities

| Activity Type | Display Name | Name |
|---------------|--------------|------|
"@
                        foreach ($activity in $metadata.Activities) {
                            $markdownContent += "| $($activity.Type) | $($activity.DisplayName) | $($activity.Name) |`n"
                        }
                        $markdownContent += "`n"
                    }
                }
            }
        }

        # Write the markdown file
        $outputFileName = "$($metadata.Type -replace ' ', '')_$WorkflowName.md"
        $outputFilePath = Join-Path -Path $OutputPath -ChildPath $outputFileName
        
        $markdownContent | Out-File -FilePath $outputFilePath -Encoding UTF8
        Write-Output "$($metadata.Type) documentation created: $outputFilePath"
        
        return $outputFilePath
        
    } catch {
        Write-Error "Error creating workflow documentation for $WorkflowName`: $($_.Exception.Message)"
        return $null
    }
}

# Initialize collections
$processedDocuments = @()
$processingErrors = @()

# Find and process Power Automate files
$powerAutomateFiles = Get-ChildItem -Path $solutionPath -Filter "*.json" -Recurse | 
    Where-Object { $_.FullName -like "*flows*" }

Write-Output "Found $($powerAutomateFiles.Count) Power Automate flow file(s)"

foreach ($file in $powerAutomateFiles) {
    try {
        $jsonContent = Get-Content -Path $file.FullName -Raw | ConvertFrom-Json
        $flowName = $file.BaseName
        
        $docPath = New-WorkflowMarkdown -FilePath $file.FullName -OutputPath $outputLocation -WorkflowName $flowName -WorkflowData $jsonContent
        if ($docPath) {
            $processedDocuments += $docPath
        }
    } catch {
        $errorMsg = "Failed to process Power Automate flow $($file.Name): $($_.Exception.Message)"
        Write-Warning $errorMsg
        $processingErrors += $errorMsg
    }
}

# Find and process Business Process Flow files
$businessProcessFlowFiles = Get-ChildItem -Path $solutionPath -Filter "*.xaml" -Recurse | 
    Where-Object { 
        $content = Get-Content -Path $_.FullName -Raw -ErrorAction SilentlyContinue
        $content -like "*BusinessProcessFlow*" -or $content -like "*mcwb:*"
    }

Write-Output "Found $($businessProcessFlowFiles.Count) Business Process Flow file(s)"

foreach ($file in $businessProcessFlowFiles) {
    try {
        [xml]$xmlContent = Get-Content -Path $file.FullName -Raw
        $bpfName = $file.BaseName
        
        $docPath = New-WorkflowMarkdown -FilePath $file.FullName -OutputPath $outputLocation -WorkflowName $bpfName -WorkflowData $xmlContent
        if ($docPath) {
            $processedDocuments += $docPath
        }
    } catch {
        $errorMsg = "Failed to process Business Process Flow $($file.Name): $($_.Exception.Message)"
        Write-Warning $errorMsg
        $processingErrors += $errorMsg
    }
}

# Find and process Classic Workflow files
$classicWorkflowFiles = Get-ChildItem -Path $solutionPath -Filter "*.xaml" -Recurse | 
    Where-Object { 
        $content = Get-Content -Path $_.FullName -Raw -ErrorAction SilentlyContinue
        $content -like "*Microsoft.Xrm.Sdk.Workflow*" -and 
        $content -notlike "*BusinessProcessFlow*" -and 
        $content -notlike "*mcwb:*"
    }

Write-Output "Found $($classicWorkflowFiles.Count) Classic Workflow file(s)"

foreach ($file in $classicWorkflowFiles) {
    try {
        [xml]$xmlContent = Get-Content -Path $file.FullName -Raw
        $workflowName = $file.BaseName
        
        $docPath = New-WorkflowMarkdown -FilePath $file.FullName -OutputPath $outputLocation -WorkflowName $workflowName -WorkflowData $xmlContent
        if ($docPath) {
            $processedDocuments += $docPath
        }
    } catch {
        $errorMsg = "Failed to process Classic Workflow $($file.Name): $($_.Exception.Message)"
        Write-Warning $errorMsg
        $processingErrors += $errorMsg
    }
}

# Generate summary documentation
$solutionName = Split-Path -Leaf $solutionPath
$summaryPath = Join-Path -Path $outputLocation -ChildPath "WorkflowsSummary.md"

$summaryContent = @"
# Workflows Documentation Summary

**Generated on:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
**Solution:** $solutionName

## Overview

This document contains a summary of all workflows found and processed in the solution.

**Total Workflows Processed:** $($processedDocuments.Count)
**Processing Errors:** $($processingErrors.Count)

## Individual Documentation Files

The following individual documentation files have been created:

"@

foreach ($docPath in $processedDocuments) {
    $docName = Split-Path -Path $docPath -Leaf
    $summaryContent += "- [$docName](./$docName)`n"
}

if ($processingErrors.Count -gt 0) {
    $summaryContent += @"

## Processing Errors

The following files had processing issues:

"@
    foreach ($errorMsg in $processingErrors) {
        $summaryContent += "- $errorMsg`n"
    }
}

$summaryContent | Out-File -FilePath $summaryPath -Encoding UTF8

Write-Output "=========================================="
Write-Output "Documentation Generation Complete"
Write-Output "=========================================="
Write-Output "Total files processed: $($processedDocuments.Count)"
Write-Output "Errors encountered: $($processingErrors.Count)"
Write-Output "Summary documentation: $summaryPath"
Write-Output "Individual documents: $($processedDocuments.Count)"
Write-Output "=========================================="