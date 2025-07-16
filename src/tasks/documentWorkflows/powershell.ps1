<#
    ===========================================================
    Task: Mightora Power Platform Workflows Documentation Generator
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
Write-Host "Task: Mightora Power Platform Workflows Documentation Generator"
Write-Host "Date: $(Get-Date -Format 'yyyy-MM-dd')"
Write-Host "==========================================================="

if (-not $devMode -and -not $solutionPath) {
    # Get inputs from the task when running in VSTS and no parameters provided
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

# Function to generate PlantUML diagram for Power Automate flow
function Generate-PowerAutomateFlowDiagram {
    param(
        [PSCustomObject]$flowDefinition,
        [string]$flowName
    )
    
    $plantuml = @"
@startuml
!theme plain
title Power Automate Flow: $flowName

start

"@

    # Process triggers
    if ($flowDefinition.triggers) {
        foreach ($trigger in $flowDefinition.triggers.PSObject.Properties) {
            $triggerName = $trigger.Name
            $triggerType = $trigger.Value.type
            $plantuml += ":Trigger: $triggerName ($triggerType);\n"
        }
    }

    # Process actions recursively
    if ($flowDefinition.actions) {
        $plantuml += Generate-ActionsPlantUML -actions $flowDefinition.actions -level 0
    }

    $plantuml += @"

stop
@enduml
"@
    
    return $plantuml
}

# Function to generate PlantUML for actions (recursive for nested actions)
function Generate-ActionsPlantUML {
    param(
        [PSCustomObject]$actions,
        [int]$level = 0
    )
    
    $result = ""
    $indent = "  " * $level
    
    foreach ($action in $actions.PSObject.Properties) {
        $actionName = $action.Name
        $actionData = $action.Value
        $actionType = $actionData.type
        
        # Clean action name for PlantUML
        $cleanActionName = $actionName -replace '[^\w\s]', ''
        
        $result += "${indent}:${cleanActionName} ($actionType);`n"
        
        # Handle conditional actions (if, switch, etc.)
        if ($actionData.actions -and $actionData.actions.PSObject.Properties.Count -gt 0) {
            $result += "${indent} if (condition) then (yes)`n"
            $result += Generate-ActionsPlantUML -actions $actionData.actions -level ($level + 1)
            $result += "${indent} endif`n"
        }
        
        # Handle else actions
        if ($actionData.else -and $actionData.else.actions) {
            $result += "${indent} else (no)`n"
            $result += Generate-ActionsPlantUML -actions $actionData.else.actions -level ($level + 1)
            $result += "${indent} endif`n"
        }
        
        # Handle foreach actions
        if ($actionType -eq "Foreach" -and $actionData.actions) {
            $result += "${indent} repeat`n"
            $result += Generate-ActionsPlantUML -actions $actionData.actions -level ($level + 1)
            $result += "${indent} repeat while (more items)`n"
        }
        
        # Handle scope actions
        if ($actionType -eq "Scope" -and $actionData.actions) {
            $result += "${indent} partition `"${cleanActionName}`" {`n"
            $result += Generate-ActionsPlantUML -actions $actionData.actions -level ($level + 1)
            $result += "${indent} }`n"
        }
    }
    
    return $result
}

# Function to extract connection details from Power Automate flow
function Get-PowerAutomateConnections {
    param(
        [PSCustomObject]$flowData
    )
    
    $connections = @()
    
    if ($flowData.properties.connectionReferences) {
        foreach ($connRef in $flowData.properties.connectionReferences.PSObject.Properties) {
            $connection = [PSCustomObject]@{
                Key = $connRef.Name
                ApiName = $connRef.Value.api.name
                ConnectionLogicalName = $connRef.Value.connection.connectionReferenceLogicalName
                RuntimeSource = $connRef.Value.runtimeSource
            }
            $connections += $connection
        }
    }
    
    return $connections
}

# Function to create individual markdown file for Power Automate flow
function Create-PowerAutomateFlowMarkdown {
    param(
        [PSCustomObject]$flowData,
        [string]$flowName,
        [string]$fileName,
        [string]$outputPath
    )
    
    $flowDefinition = $flowData.properties.definition
    $connections = Get-PowerAutomateConnections -flowData $flowData
    
    # Extract flow metadata
    $flowDisplayName = $flowName -replace '-[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}', ''
    $flowId = ($fileName -split '-')[-1] -replace '\.json$', ''
    
    # Generate PlantUML diagram
    $plantumlDiagram = Generate-PowerAutomateFlowDiagram -flowDefinition $flowDefinition -flowName $flowDisplayName
    
    # Count actions and triggers
    $triggerCount = if ($flowDefinition.triggers) { $flowDefinition.triggers.PSObject.Properties.Count } else { 0 }
    $actionCount = if ($flowDefinition.actions) { $flowDefinition.actions.PSObject.Properties.Count } else { 0 }
    
    # Extract parameters
    $parameters = @()
    if ($flowDefinition.parameters) {
        foreach ($param in $flowDefinition.parameters.PSObject.Properties) {
            if ($param.Name -ne '$connections' -and $param.Name -ne '$authentication') {
                $paramInfo = [PSCustomObject]@{
                    Name = $param.Name
                    Type = $param.Value.type
                    DefaultValue = $param.Value.defaultValue
                    Description = $param.Value.metadata.description
                }
                $parameters += $paramInfo
            }
        }
    }
    
    $markdownContent = @"
# Power Automate Flow: $flowDisplayName

**Generated on:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
**Flow ID:** $flowId
**Source File:** $fileName

## Overview

This document contains detailed documentation for the Power Automate flow.

### Summary
- **Flow Name:** $flowDisplayName
- **Triggers:** $triggerCount
- **Actions:** $actionCount
- **Connections:** $($connections.Count)
- **Parameters:** $($parameters.Count)

## Flow Diagram

``````plantuml
$plantumlDiagram
``````

## Connections

The following connections are used in this flow:

| Connection Key | API Name | Logical Name | Runtime Source |
|----------------|----------|--------------|----------------|

"@

    foreach ($conn in $connections) {
        $markdownContent += "| $($conn.Key) | $($conn.ApiName) | $($conn.ConnectionLogicalName) | $($conn.RuntimeSource) |`n"
    }

    if ($parameters.Count -gt 0) {
        $markdownContent += @"

## Parameters

| Parameter Name | Type | Default Value | Description |
|----------------|------|---------------|-------------|

"@
        foreach ($param in $parameters) {
            $defaultValue = if ($param.DefaultValue) { $param.DefaultValue } else { "-" }
            $description = if ($param.Description) { $param.Description } else { "-" }
            $markdownContent += "| $($param.Name) | $($param.Type) | $defaultValue | $description |`n"
        }
    }

    # Add trigger details
    if ($flowDefinition.triggers) {
        $markdownContent += @"

## Triggers

"@
        foreach ($trigger in $flowDefinition.triggers.PSObject.Properties) {
            $triggerName = $trigger.Name
            $triggerData = $trigger.Value
            $markdownContent += @"

### $triggerName
- **Type:** $($triggerData.type)
- **Recurrence:** $(if ($triggerData.recurrence) { 
    "Frequency: $($triggerData.recurrence.frequency), Interval: $($triggerData.recurrence.interval)" 
} else { "N/A" })

"@
        }
    }

    # Add action summary
    if ($flowDefinition.actions) {
        $markdownContent += @"

## Actions Summary

| Action Name | Type | Description |
|-------------|------|-------------|

"@
        foreach ($action in $flowDefinition.actions.PSObject.Properties) {
            $actionName = $action.Name
            $actionData = $action.Value
            $actionType = $actionData.type
            $description = if ($actionData.metadata.operationMetadataId) { 
                "Operation ID: $($actionData.metadata.operationMetadataId)" 
            } else { 
                "-" 
            }
            $markdownContent += "| $actionName | $actionType | $description |`n"
        }
    }

    $markdownContent += @"

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
"@

    # Save the markdown file
    $flowOutputPath = Join-Path -Path $outputPath -ChildPath "PowerAutomate_$($flowDisplayName).md"
    try {
        $markdownContent | Out-File -FilePath $flowOutputPath -Encoding UTF8
        Write-Output "Power Automate flow documentation created: $flowOutputPath"
        return $flowOutputPath
    } catch {
        Write-Warning "Error creating Power Automate flow documentation: $($_.Exception.Message)"
        return $null
    }
}

# Function to generate PlantUML diagram for Business Process Flow
function New-BusinessProcessFlowDiagram {
    param(
        [xml]$bpfXml,
        [string]$bpfName
    )
    
    $plantuml = @"
@startuml
!theme plain
title Business Process Flow: $bpfName

start

"@

    try {
        # Create namespace manager for proper XML parsing
        $nsManager = New-Object System.Xml.XmlNamespaceManager($bpfXml.NameTable)
        $nsManager.AddNamespace("mxswa", "clr-namespace:Microsoft.Xrm.Sdk.Workflow.Activities;assembly=Microsoft.Xrm.Sdk.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
        
        # Find all stages in the BPF
        $stages = $bpfXml.SelectNodes("//mxswa:ActivityReference[contains(@DisplayName, 'StageStep')]", $nsManager)
        
        if ($stages.Count -eq 0) {
            # Fallback: try without namespace
            $stages = $bpfXml.GetElementsByTagName("ActivityReference") | Where-Object { $_.DisplayName -and $_.DisplayName.Contains("StageStep") }
        }
        
        if ($stages.Count -gt 0) {
            for ($i = 0; $i -lt $stages.Count; $i++) {
                $stage = $stages[$i]
                $stageName = if ($stage.DisplayName -match "StageStep\d+:\s*(.+)") { 
                    $matches[1] 
                } else { 
                    $stage.DisplayName 
                }
                
                $cleanStageName = $stageName -replace '[^\w\s]', ''
                $plantuml += ":$cleanStageName;`n"
                
                # Find steps in this stage for more detail
                $stepNodes = $stage.SelectNodes(".//mxswa:ActivityReference[contains(@DisplayName, 'StepStep')]", $nsManager)
                if ($stepNodes.Count -eq 0) {
                    $stepNodes = $stage.GetElementsByTagName("ActivityReference") | Where-Object { $_.DisplayName -and $_.DisplayName.Contains("StepStep") }
                }
                
                foreach ($stepNode in $stepNodes) {
                    $stepName = if ($stepNode.DisplayName -match "StepStep\d+:\s*(.+)") { 
                        $matches[1] 
                    } else { 
                        $stepNode.DisplayName 
                    }
                    $cleanStepName = $stepName -replace '[^\w\s]', ''
                    $plantuml += "note right: $cleanStepName`n"
                }
                
                # Add arrow to next stage if not last
                if ($i -lt ($stages.Count - 1)) {
                    $plantuml += "`n"
                }
            }
        } else {
            $plantuml += ":Business Process Flow;`n"
        }
    }
    catch {
        Write-Warning "Error generating BPF diagram: $($_.Exception.Message)"
        $plantuml += ":Business Process Flow;`n"
    }

    $plantuml += @"

stop
@enduml
"@
    
    return $plantuml
}

# Function to extract BPF stages and steps
function Get-BusinessProcessFlowStages {
    param(
        [xml]$bpfXml
    )
    
    $stages = @()
    
    try {
        # Create namespace manager for proper XML parsing
        $nsManager = New-Object System.Xml.XmlNamespaceManager($bpfXml.NameTable)
        $nsManager.AddNamespace("mxswa", "clr-namespace:Microsoft.Xrm.Sdk.Workflow.Activities;assembly=Microsoft.Xrm.Sdk.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
        $nsManager.AddNamespace("mcwb", "clr-namespace:Microsoft.Crm.Workflow.BusinessProcessFlowActivities;assembly=Microsoft.Crm.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
        
        # Find all stage activities using namespace-aware XPath
        $stageNodes = $bpfXml.SelectNodes("//mxswa:ActivityReference[contains(@DisplayName, 'StageStep')]", $nsManager)
        
        if ($stageNodes.Count -eq 0) {
            # Fallback: try without namespace for simpler parsing
            $stageNodes = $bpfXml.GetElementsByTagName("ActivityReference") | Where-Object { $_.DisplayName -and $_.DisplayName.Contains("StageStep") }
        }
        
        foreach ($stageNode in $stageNodes) {
            $stageName = if ($stageNode.DisplayName -match "StageStep\d+:\s*(.+)") { 
                $matches[1] 
            } else { 
                $stageNode.DisplayName 
            }
            
            # Find steps within this stage
            $steps = @()
            $stepNodes = $stageNode.SelectNodes(".//mxswa:ActivityReference[contains(@DisplayName, 'StepStep')]", $nsManager)
            
            if ($stepNodes.Count -eq 0) {
                # Fallback: try without namespace
                $stepNodes = $stageNode.GetElementsByTagName("ActivityReference") | Where-Object { $_.DisplayName -and $_.DisplayName.Contains("StepStep") }
            }
            
            foreach ($stepNode in $stepNodes) {
                $stepName = if ($stepNode.DisplayName -match "StepStep\d+:\s*(.+)") { 
                    $matches[1] 
                } else { 
                    $stepNode.DisplayName 
                }
                
                # Extract step details
                $stepInfo = [PSCustomObject]@{
                    Name = $stepName
                    DisplayName = $stepName
                    IsRequired = $false
                    Controls = @()
                }
                
                # Find controls within this step
                $controlNodes = $stepNode.SelectNodes(".//mcwb:Control", $nsManager)
                if ($controlNodes.Count -eq 0) {
                    # Fallback: try without namespace
                    $controlNodes = $stepNode.GetElementsByTagName("Control")
                }
                
                foreach ($controlNode in $controlNodes) {
                    $controlInfo = [PSCustomObject]@{
                        ControlDisplayName = if ($controlNode.ControlDisplayName) { $controlNode.ControlDisplayName } else { $controlNode.GetAttribute("ControlDisplayName") }
                        ControlId = if ($controlNode.ControlId) { $controlNode.ControlId } else { $controlNode.GetAttribute("ControlId") }
                        DataFieldName = if ($controlNode.DataFieldName) { $controlNode.DataFieldName } else { $controlNode.GetAttribute("DataFieldName") }
                        IsSystemControl = if ($controlNode.IsSystemControl) { $controlNode.IsSystemControl } else { $controlNode.GetAttribute("IsSystemControl") }
                    }
                    $stepInfo.Controls += $controlInfo
                }
                
                $steps += $stepInfo
            }
            
            $stageInfo = [PSCustomObject]@{
                Name = $stageName
                DisplayName = $stageName
                Steps = $steps
            }
            
            $stages += $stageInfo
        }
    }
    catch {
        Write-Warning "Error parsing BPF stages: $($_.Exception.Message)"
    }
    
    return $stages
}

# Function to create individual markdown file for Business Process Flow
function New-BusinessProcessFlowMarkdown {
    param(
        [xml]$bpfXml,
        [string]$bpfName,
        [string]$fileName,
        [string]$outputPath
    )
    
    # Extract BPF metadata
    $bpfDisplayName = $bpfName -replace '-[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}', ''
    $bpfId = ($fileName -split '-')[-1] -replace '\.xaml$', ''
    
    # Generate PlantUML diagram
    $plantumlDiagram = New-BusinessProcessFlowDiagram -bpfXml $bpfXml -bpfName $bpfDisplayName
    
    # Extract stages and steps
    $stages = Get-BusinessProcessFlowStages -bpfXml $bpfXml
    
    # Count stages and steps
    $stageCount = $stages.Count
    $totalSteps = ($stages | ForEach-Object { $_.Steps.Count } | Measure-Object -Sum).Sum
    $totalControls = ($stages | ForEach-Object { $_.Steps | ForEach-Object { $_.Controls.Count } } | Measure-Object -Sum).Sum
    
    $markdownContent = @"
# Business Process Flow: $bpfDisplayName

**Generated on:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
**BPF ID:** $bpfId
**Source File:** $fileName

## Overview

This document contains detailed documentation for the Business Process Flow.

### Summary
- **BPF Name:** $bpfDisplayName
- **Stages:** $stageCount
- **Total Steps:** $totalSteps
- **Total Controls:** $totalControls

## Process Flow Diagram

``````plantuml
$plantumlDiagram
``````

## Stages and Steps

"@

    foreach ($stage in $stages) {
        $markdownContent += @"

### Stage: $($stage.DisplayName)

"@
        
        if ($stage.Steps.Count -gt 0) {
            $markdownContent += @"
**Steps in this stage:**

| Step Name | Controls | Required Fields |
|-----------|----------|-----------------|

"@
            foreach ($step in $stage.Steps) {
                $controlNames = ($step.Controls | ForEach-Object { $_.ControlDisplayName }) -join ", "
                $requiredField = if ($step.IsRequired) { "Yes" } else { "No" }
                $markdownContent += "| $($step.DisplayName) | $controlNames | $requiredField |`n"
            }
            
            # Add detailed control information
            foreach ($step in $stage.Steps) {
                if ($step.Controls.Count -gt 0) {
                    $markdownContent += @"

#### Step: $($step.DisplayName)

**Controls:**

| Control Name | Control ID | Data Field | System Control |
|--------------|------------|------------|----------------|

"@
                    foreach ($control in $step.Controls) {
                        $isSystem = if ($control.IsSystemControl -eq "True") { "Yes" } else { "No" }
                        $markdownContent += "| $($control.ControlDisplayName) | $($control.ControlId) | $($control.DataFieldName) | $isSystem |`n"
                    }
                }
            }
        } else {
            $markdownContent += "*No steps defined for this stage.*`n"
        }
    }

    $markdownContent += @"

## Process Statistics

| Metric | Value |
|--------|-------|
| **Total Stages** | $stageCount |
| **Total Steps** | $totalSteps |
| **Total Controls** | $totalControls |
| **Average Steps per Stage** | $(if ($stageCount -gt 0) { [math]::Round($totalSteps / $stageCount, 2) } else { 0 }) |
| **Average Controls per Step** | $(if ($totalSteps -gt 0) { [math]::Round($totalControls / $totalSteps, 2) } else { 0 }) |

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
"@

    # Save the markdown file
    $bpfOutputPath = Join-Path -Path $outputPath -ChildPath "BusinessProcessFlow_$($bpfDisplayName).md"
    try {
        $markdownContent | Out-File -FilePath $bpfOutputPath -Encoding UTF8
        Write-Output "Business Process Flow documentation created: $bpfOutputPath"
        return $bpfOutputPath
    } catch {
        Write-Warning "Error creating Business Process Flow documentation: $($_.Exception.Message)"
        return $null
    }
}

Write-Output "Working Directory: $(Get-Location)"

# Check if the output location exists; if not, create it
if (-not (Test-Path -Path $outputLocation)) {
    New-Item -ItemType Directory -Path $outputLocation -Force
    Write-Output "Created output location at: $outputLocation"
}

# Find all workflow XML files in the solution
$workflowFiles = Get-ChildItem -Path $solutionPath -Filter "*.xml" -Recurse | 
    Where-Object { 
        ($_.DirectoryName -like "*Workflows*" -or $_.Name -like "*workflow*") -and
        ($_.Name -notlike "*BPF*" -and $_.Name -notlike "*xaml.data.xml")
    }

if (-not $workflowFiles) {
    # Alternative search for workflows in solution components
    $workflowFiles = Get-ChildItem -Path $solutionPath -Filter "*.xml" -Recurse | 
        Where-Object { 
            try {
                [xml]$content = Get-Content $_.FullName -ErrorAction SilentlyContinue
                return $content.Workflow -ne $null
            } catch {
                return $false
            }
        }
}

# Find all Power Automate flow JSON files in the solution
$powerAutomateFiles = Get-ChildItem -Path $solutionPath -Filter "*.json" -Recurse | 
    Where-Object { $_.DirectoryName -like "*Workflows*" }

Write-Output "Found $($powerAutomateFiles.Count) Power Automate flow file(s)"

# Find all Business Process Flow XAML files in the solution
$businessProcessFlowFiles = Get-ChildItem -Path $solutionPath -Filter "*.xaml" -Recurse | 
    Where-Object { $_.DirectoryName -like "*Workflows*" -and $_.Name -like "*BPF*" }

Write-Output "Found $($businessProcessFlowFiles.Count) Business Process Flow file(s)"

if (-not $workflowFiles -and -not $powerAutomateFiles -and -not $businessProcessFlowFiles) {
    Write-Output "No workflow files found in the solution path: $solutionPath"
    exit 1
}

Write-Output "Found $($workflowFiles.Count) XML workflow file(s)"

# Initialize collections
$allWorkflows = @()
$processingErrors = @()

# Process each workflow file
foreach ($file in $workflowFiles) {
    try {
        Write-Output "Processing: $($file.Name)"
        [xml]$workflowXml = Get-Content -Path $file.FullName -ErrorAction Stop
        
        if ($workflowXml.Workflow) {
            $workflow = $workflowXml.Workflow
            
            # Extract workflow information
            $workflowInfo = [PSCustomObject]@{
                Name = $workflow.Name
                DisplayName = if ($workflow.displaynames.displayname) { 
                    $workflow.displaynames.displayname.description 
                } else { 
                    $workflow.Name 
                }
                Description = if ($workflow.Descriptions.Description) { 
                    $workflow.Descriptions.Description.description 
                } else { 
                    "No description available" 
                }
                Type = $workflow.Type
                Category = $workflow.Category
                SubCategory = $workflow.SubCategory
                Mode = $workflow.Mode
                Scope = $workflow.Scope
                OnDemand = $workflow.OnDemand
                TriggerOnCreate = $workflow.TriggerOnCreate
                TriggerOnDelete = $workflow.TriggerOnDelete
                TriggerOnUpdateAttributeList = $workflow.TriggerOnUpdateAttributeList
                AsyncAutoDelete = $workflow.AsyncAutoDelete
                SyncWorkflowLogOnFailure = $workflow.SyncWorkflowLogOnFailure
                StateCode = $workflow.StateCode
                StatusCode = $workflow.StatusCode
                IsTransacted = $workflow.IsTransacted
                IntroducedVersion = $workflow.IntroducedVersion
                IsCustomizable = $workflow.IsCustomizable
                BusinessLogicType = $workflow.BusinessLogicType
                IsManaged = $workflow.IsManaged
                UIFlowType = $workflow.UIFlowType
                ProcessOrder = $workflow.ProcessOrder
                ProcessRoleAssignment = $workflow.ProcessRoleAssignment
                PrimaryEntity = $workflow.PrimaryEntity
                FileName = $file.Name
                FilePath = $file.FullName
                InputParameters = @()
                OutputParameters = @()
            }
            
            # Extract input parameters
            if ($workflow.inputparameters.inputparameter) {
                foreach ($param in $workflow.inputparameters.inputparameter) {
                    $paramInfo = [PSCustomObject]@{
                        Name = $param.name
                        Type = $param.type
                        Required = $param.required
                        Description = if ($param.description) { $param.description } else { "" }
                    }
                    $workflowInfo.InputParameters += $paramInfo
                }
            }
            
            # Extract output parameters
            if ($workflow.outputparameters.outputparameter) {
                foreach ($param in $workflow.outputparameters.outputparameter) {
                    $paramInfo = [PSCustomObject]@{
                        Name = $param.name
                        Type = $param.type
                        Description = if ($param.description) { $param.description } else { "" }
                    }
                    $workflowInfo.OutputParameters += $paramInfo
                }
            }
            
            $allWorkflows += $workflowInfo
        }
    } catch {
        $errorMsg = "Error processing file $($file.Name): $($_.Exception.Message)"
        $processingErrors += $errorMsg
        Write-Warning $errorMsg
    }
}

# Process Power Automate flow files
$powerAutomateFlows = @()
$powerAutomateDocuments = @()

if ($powerAutomateFiles) {
    Write-Output "Processing Power Automate flows..."
    
    foreach ($file in $powerAutomateFiles) {
        try {
            Write-Output "Processing Power Automate flow: $($file.Name)"
            $flowContent = Get-Content -Path $file.FullName -Raw -ErrorAction Stop
            $flowData = $flowContent | ConvertFrom-Json
            
            if ($flowData.properties -and $flowData.properties.definition) {
                # Extract flow name from filename (remove GUID suffix)
                $flowName = $file.BaseName -replace '-[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}$', ''
                
                # Create individual markdown file for this flow
                $flowDocPath = Create-PowerAutomateFlowMarkdown -flowData $flowData -flowName $flowName -fileName $file.Name -outputPath $outputLocation
                if ($flowDocPath) {
                    $powerAutomateDocuments += $flowDocPath
                }
                
                # Extract flow information for summary
                $flowDefinition = $flowData.properties.definition
                $connections = Get-PowerAutomateConnections -flowData $flowData
                
                $triggerCount = if ($flowDefinition.triggers) { $flowDefinition.triggers.PSObject.Properties.Count } else { 0 }
                $actionCount = if ($flowDefinition.actions) { $flowDefinition.actions.PSObject.Properties.Count } else { 0 }
                
                $flowInfo = [PSCustomObject]@{
                    Name = $flowName
                    DisplayName = $flowName
                    FileName = $file.Name
                    FilePath = $file.FullName
                    TriggerCount = $triggerCount
                    ActionCount = $actionCount
                    ConnectionCount = $connections.Count
                    Connections = $connections
                    Type = "Power Automate"
                    Category = "5" # Modern Flow
                    StateCode = "1" # Assume Active
                    Mode = "Background"
                    PrimaryEntity = "N/A"
                    DocumentationPath = $flowDocPath
                }
                
                $powerAutomateFlows += $flowInfo
            }
        } catch {
            $errorMsg = "Error processing Power Automate flow $($file.Name): $($_.Exception.Message)"
            $processingErrors += $errorMsg
            Write-Warning $errorMsg
        }
    }
}

# Process Business Process Flow files
$businessProcessFlows = @()
$businessProcessFlowDocuments = @()

if ($businessProcessFlowFiles) {
    Write-Output "Processing Business Process Flows..."
    
    foreach ($file in $businessProcessFlowFiles) {
        try {
            Write-Output "Processing Business Process Flow: $($file.Name)"
            [xml]$bpfXml = Get-Content -Path $file.FullName -ErrorAction Stop
            
            if ($bpfXml) {
                # Extract BPF name from filename (remove GUID suffix)
                $bpfName = $file.BaseName -replace '-[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}$', ''
                
                # Create individual markdown file for this BPF
                $bpfDocPath = New-BusinessProcessFlowMarkdown -bpfXml $bpfXml -bpfName $bpfName -fileName $file.Name -outputPath $outputLocation
                if ($bpfDocPath) {
                    $businessProcessFlowDocuments += $bpfDocPath
                }
                
                # Extract BPF information for summary
                $stages = Get-BusinessProcessFlowStages -bpfXml $bpfXml
                $stageCount = $stages.Count
                $totalSteps = ($stages | ForEach-Object { $_.Steps.Count } | Measure-Object -Sum).Sum
                $totalControls = ($stages | ForEach-Object { $_.Steps | ForEach-Object { $_.Controls.Count } } | Measure-Object -Sum).Sum
                
                $bpfInfo = [PSCustomObject]@{
                    Name = $bpfName
                    DisplayName = $bpfName
                    FileName = $file.Name
                    FilePath = $file.FullName
                    StageCount = $stageCount
                    StepCount = $totalSteps
                    ControlCount = $totalControls
                    Stages = $stages
                    Type = "Business Process Flow"
                    Category = "4" # Business Process Flow
                    StateCode = "1" # Assume Active
                    Mode = "Interactive"
                    PrimaryEntity = "Unknown"
                    DocumentationPath = $bpfDocPath
                }
                
                $businessProcessFlows += $bpfInfo
            }
        } catch {
            $errorMsg = "Error processing Business Process Flow $($file.Name): $($_.Exception.Message)"
            $processingErrors += $errorMsg
            Write-Warning $errorMsg
        }
    }
}

if ($allWorkflows.Count -eq 0 -and $powerAutomateFlows.Count -eq 0 -and $businessProcessFlows.Count -eq 0) {
    Write-Output "No valid workflows found in the processed files."
    exit 1
}

# Generate solution name from path
$solutionName = Split-Path -Path $solutionPath -Leaf
if ($solutionName -eq "src") {
    $solutionName = Split-Path -Path (Split-Path -Path $solutionPath -Parent) -Leaf
}

# Initialize Markdown content
$markdownContent = @"
# Workflows Documentation

**Generated on:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
**Solution:** $solutionName

## Overview

This document contains documentation for all workflows found in the solution.

**Total XML Workflows:** $($allWorkflows.Count)
**Total Power Automate Flows:** $($powerAutomateFlows.Count)
**Total Business Process Flows:** $($businessProcessFlows.Count)
**Total Workflows:** $(($allWorkflows.Count + $powerAutomateFlows.Count + $businessProcessFlows.Count))
**Active XML Workflows:** $(($allWorkflows | Where-Object { $_.StateCode -eq "1" }).Count)
**Draft XML Workflows:** $(($allWorkflows | Where-Object { $_.StateCode -eq "0" }).Count)

"@

# Add Power Automate documentation links if any exist
if ($powerAutomateDocuments.Count -gt 0) {
    $markdownContent += @"

## Individual Power Automate Flow Documentation

The following individual documentation files have been created for Power Automate flows:

"@
    foreach ($docPath in $powerAutomateDocuments) {
        $docName = Split-Path -Path $docPath -Leaf
        $markdownContent += "- [$docName](./$docName)`n"
    }
    $markdownContent += "`n"
}

# Add Business Process Flow documentation links if any exist
Write-Output "Debug: About to check BPF documents. Count: $($businessProcessFlowDocuments.Count)"
if ($businessProcessFlowDocuments.Count -gt 0) {
    Write-Output "Debug: Adding BPF section to main documentation"
    $markdownContent += @"

## Individual Business Process Flow Documentation

The following individual documentation files have been created for Business Process Flows:

"@
    foreach ($docPath in $businessProcessFlowDocuments) {
        $docName = Split-Path -Path $docPath -Leaf
        $markdownContent += "- [$docName](./$docName)`n"
        Write-Output "Debug: Added BPF link: $docName"
    }
    $markdownContent += "`n"
} else {
    Write-Output "Debug: No BPF documents found - array is empty"
}

# Add processing errors if any
if ($processingErrors.Count -gt 0) {
    $markdownContent += @"

## Processing Warnings

The following files had processing issues:

"@
    foreach ($errorMsg in $processingErrors) {
        $markdownContent += "- $errorMsg`n"
    }
    $markdownContent += "`n"
}

# Add summary table
$markdownContent += @"

## Workflows Summary

| Name | Display Name | Type | Category | Mode | State | Primary Entity |
|------|--------------|------|----------|------|-------|----------------|

"@

# Add XML workflows to summary table
foreach ($workflow in $allWorkflows | Sort-Object Name) {
    $escapedName = $workflow.Name -replace '\|', '\\|'
    $escapedDisplayName = $workflow.DisplayName -replace '\|', '\\|'
    $categoryName = switch ($workflow.Category) {
        "0" { "Workflow (0)" }
        "1" { "Dialog (1)" }
        "2" { "Business Rule (2)" }
        "3" { "Action (3)" }
        "4" { "Business Process Flow (4)" }
        "5" { "Modern Flow (5)" }
        "6" { "Desktop Flow (6)" }
        "7" { "AI Flow (7)" }
        default { "Unknown ($($workflow.Category))" }
    }
    $state = switch ($workflow.StateCode) {
        "0" { "Draft" }
        "1" { "Active" }
        default { "Unknown" }
    }
    $markdownContent += "| $escapedName | $escapedDisplayName | $($workflow.Type) | $categoryName | $($workflow.Mode) | $state | $($workflow.PrimaryEntity) |`n"
}

# Add Power Automate flows to summary table
foreach ($flow in $powerAutomateFlows | Sort-Object Name) {
    $escapedName = $flow.Name -replace '\|', '\\|'
    $escapedDisplayName = $flow.DisplayName -replace '\|', '\\|'
    $documentationLink = if ($flow.DocumentationPath) { 
        $docName = Split-Path -Path $flow.DocumentationPath -Leaf
        "[$escapedDisplayName](./$docName)"
    } else { 
        $escapedDisplayName 
    }
    $markdownContent += "| $escapedName | $documentationLink | $($flow.Type) | Modern Flow (5) | $($flow.Mode) | Active | $($flow.PrimaryEntity) |`n"
}

# Add Business Process Flows to summary table
foreach ($bpf in $businessProcessFlows | Sort-Object Name) {
    $escapedName = $bpf.Name -replace '\|', '\\|'
    $escapedDisplayName = $bpf.DisplayName -replace '\|', '\\|'
    $documentationLink = if ($bpf.DocumentationPath) { 
        $docName = Split-Path -Path $bpf.DocumentationPath -Leaf
        "[$escapedDisplayName](./$docName)"
    } else { 
        $escapedDisplayName 
    }
    $markdownContent += "| $escapedName | $documentationLink | $($bpf.Type) | Business Process Flow (4) | $($bpf.Mode) | Active | $($bpf.PrimaryEntity) |`n"
}

# Add detailed information if requested
if ($includeDetails) {
    $markdownContent += @"

## Detailed Workflows Information

"@

    # Add XML workflow details
    foreach ($workflow in $allWorkflows | Sort-Object Name) {
        $state = switch ($workflow.StateCode) {
            "0" { "Draft" }
            "1" { "Active" }
            default { "Unknown ($($workflow.StateCode))" }
        }
        
        $status = switch ($workflow.StatusCode) {
            "1" { "Draft" }
            "2" { "Activated" }
            default { "Unknown ($($workflow.StatusCode))" }
        }
        
        # Update category rendering in Detailed Workflows Information
        $categoryName = switch ($workflow.Category) {
            "0" { "Workflow" }
            "1" { "Dialog" }
            "2" { "Business Rule" }
            "3" { "Action" }
            "4" { "Business Process Flow" }
            "5" { "Modern Flow" }
            "6" { "Desktop Flow" }
            "7" { "AI Flow" }
            default { "Unknown ($($workflow.Category))" }
        }
        
        $markdownContent += @"
### $($workflow.DisplayName)

**Technical Details:**
- **Name:** $($workflow.Name)
- **Type:** $($workflow.Type)
- **Category:** $categoryName
- **Sub Category:** $($workflow.SubCategory)
- **Mode:** $($workflow.Mode)
- **Scope:** $($workflow.Scope)
- **State:** $state
- **Status:** $status
- **Primary Entity:** $($workflow.PrimaryEntity)
- **Introduced Version:** $($workflow.IntroducedVersion)
- **Source File:** $($workflow.FileName)

**Description:** $($workflow.Description)

**Trigger Settings:**
- **On Demand:** $(if ($workflow.OnDemand -eq "true") { "Yes" } else { "No" })
- **Trigger on Create:** $(if ($workflow.TriggerOnCreate -eq "true") { "Yes" } else { "No" })
- **Trigger on Delete:** $(if ($workflow.TriggerOnDelete -eq "true") { "Yes" } else { "No" })
- **Trigger on Update:** $(if ($workflow.TriggerOnUpdateAttributeList) { "Yes (Attributes: $($workflow.TriggerOnUpdateAttributeList))" } else { "No" })

**Advanced Settings:**
- **Is Transacted:** $(if ($workflow.IsTransacted -eq "true") { "Yes" } else { "No" })
- **Async Auto Delete:** $(if ($workflow.AsyncAutoDelete -eq "true") { "Yes" } else { "No" })
- **Sync Workflow Log on Failure:** $(if ($workflow.SyncWorkflowLogOnFailure -eq "true") { "Yes" } else { "No" })
- **Is Customizable:** $(if ($workflow.IsCustomizable -eq "true") { "Yes" } else { "No" })
- **Is Managed:** $(if ($workflow.IsManaged -eq "true") { "Yes" } else { "No" })

"@

        # Add input parameters if any
        if ($workflow.InputParameters.Count -gt 0) {
            $markdownContent += @"

**Input Parameters:**

| Name | Type | Required | Description |
|------|------|----------|-------------|

"@
            foreach ($param in $workflow.InputParameters) {
                $required = if ($param.Required -eq "true") { "Yes" } else { "No" }
                $description = if ($param.Description) { $param.Description } else { "-" }
                $markdownContent += "| $($param.Name) | $($param.Type) | $required | $description |`n"
            }
        }

        # Add output parameters if any
        if ($workflow.OutputParameters.Count -gt 0) {
            $markdownContent += @"

**Output Parameters:**

| Name | Type | Description |
|------|------|-------------|

"@
            foreach ($param in $workflow.OutputParameters) {
                $description = if ($param.Description) { $param.Description } else { "-" }
                $markdownContent += "| $($param.Name) | $($param.Type) | $description |`n"
            }
        }
        
        $markdownContent += "`n"
    }
    
    # Add Power Automate flow details
    if ($powerAutomateFlows.Count -gt 0) {
        $markdownContent += @"

## Power Automate Flows Summary

"@
        foreach ($flow in $powerAutomateFlows | Sort-Object Name) {
            $documentationLink = if ($flow.DocumentationPath) { 
                $docName = Split-Path -Path $flow.DocumentationPath -Leaf
                "[$($flow.DisplayName)](./$docName)"
            } else { 
                $flow.DisplayName 
            }
            
            $markdownContent += @"
### $documentationLink

**Technical Details:**
- **Name:** $($flow.Name)
- **Type:** Power Automate Flow
- **Category:** Modern Flow
- **Source File:** $($flow.FileName)
- **Triggers:** $($flow.TriggerCount)
- **Actions:** $($flow.ActionCount)
- **Connections:** $($flow.ConnectionCount)

"@
            
            # Add connection details
            if ($flow.Connections.Count -gt 0) {
                $markdownContent += @"
**Connections Used:**

| Connection | API | Logical Name |
|------------|-----|--------------|

"@
                foreach ($connection in $flow.Connections) {
                    $markdownContent += "| $($connection.Key) | $($connection.ApiName) | $($connection.ConnectionLogicalName) |`n"
                }
                $markdownContent += "`n"
            }
            
            $markdownContent += "`n"
        }
    }
    
    # Add Business Process Flow details
    if ($businessProcessFlows.Count -gt 0) {
        $markdownContent += @"

## Business Process Flows Summary

"@
        foreach ($bpf in $businessProcessFlows | Sort-Object Name) {
            $documentationLink = if ($bpf.DocumentationPath) { 
                $docName = Split-Path -Path $bpf.DocumentationPath -Leaf
                "[$($bpf.DisplayName)](./$docName)"
            } else { 
                $bpf.DisplayName 
            }
            
            $markdownContent += @"
### $documentationLink

**Technical Details:**
- **Name:** $($bpf.Name)
- **Type:** Business Process Flow
- **Category:** Business Process Flow
- **Source File:** $($bpf.FileName)
- **Stages:** $($bpf.StageCount)
- **Steps:** $($bpf.StepCount)
- **Controls:** $($bpf.ControlCount)

"@
            
            # Add stage details
            if ($bpf.Stages.Count -gt 0) {
                $markdownContent += @"
**Stages Overview:**

| Stage Name | Steps | Controls |
|------------|-------|----------|

"@
                foreach ($stage in $bpf.Stages) {
                    $stepCount = $stage.Steps.Count
                    $controlCount = ($stage.Steps | ForEach-Object { $_.Controls.Count } | Measure-Object -Sum).Sum
                    $markdownContent += "| $($stage.DisplayName) | $stepCount | $controlCount |`n"
                }
                $markdownContent += "`n"
            }
            
            $markdownContent += "`n"
        }
    }
}

# Add usage information if requested
if ($includeUsage) {
    $markdownContent += @"

## Usage Statistics

"@

    # Combine all workflows for statistics
    $allCombinedWorkflows = @()
    $allCombinedWorkflows += $allWorkflows
    $allCombinedWorkflows += $powerAutomateFlows
    $allCombinedWorkflows += $businessProcessFlows

    # Group workflows by type
    $workflowsByType = $allCombinedWorkflows | Group-Object -Property Type
    
    $markdownContent += @"

### By Type

| Workflow Type | Count |
|---------------|-------|

"@
    
    foreach ($typeGroup in $workflowsByType | Sort-Object Name) {
        $markdownContent += "| $($typeGroup.Name) | $($typeGroup.Count) |`n"
    }

    # Group workflows by category
    $workflowsByCategory = $allCombinedWorkflows | Group-Object -Property Category
    
    $markdownContent += @"

### By Category

| Category | Count |
|----------|-------|

"@
    
    foreach ($categoryGroup in $workflowsByCategory | Sort-Object Name) {
        $markdownContent += "| $($categoryGroup.Name) | $($categoryGroup.Count) |`n"
    }

    # Group workflows by state
    $workflowsByState = $allCombinedWorkflows | Group-Object -Property StateCode
    
    $markdownContent += @"

### By State

| State | Count |
|-------|-------|

"@
    
    foreach ($stateGroup in $workflowsByState | Sort-Object Name) {
        $stateName = switch ($stateGroup.Name) {
            "0" { "Draft" }
            "1" { "Active" }
            default { "Unknown" }
        }
        $markdownContent += "| $stateName | $($stateGroup.Count) |`n"
    }

    # Workflow statistics
    $totalInputParams = ($allWorkflows | ForEach-Object { $_.InputParameters.Count } | Measure-Object -Sum).Sum
    $totalOutputParams = ($allWorkflows | ForEach-Object { $_.OutputParameters.Count } | Measure-Object -Sum).Sum
    $totalPowerAutomateActions = ($powerAutomateFlows | ForEach-Object { $_.ActionCount } | Measure-Object -Sum).Sum
    $totalPowerAutomateTriggers = ($powerAutomateFlows | ForEach-Object { $_.TriggerCount } | Measure-Object -Sum).Sum
    $totalConnections = ($powerAutomateFlows | ForEach-Object { $_.ConnectionCount } | Measure-Object -Sum).Sum
    $totalBPFStages = ($businessProcessFlows | ForEach-Object { $_.StageCount } | Measure-Object -Sum).Sum
    $totalBPFSteps = ($businessProcessFlows | ForEach-Object { $_.StepCount } | Measure-Object -Sum).Sum
    $totalBPFControls = ($businessProcessFlows | ForEach-Object { $_.ControlCount } | Measure-Object -Sum).Sum
    
    $averageInputParams = if ($allWorkflows.Count -gt 0) { 
        [math]::Round($totalInputParams / $allWorkflows.Count, 2) 
    } else { 
        0 
    }
    $averageOutputParams = if ($allWorkflows.Count -gt 0) { 
        [math]::Round($totalOutputParams / $allWorkflows.Count, 2) 
    } else { 
        0 
    }
    $averageActionsPerFlow = if ($powerAutomateFlows.Count -gt 0) { 
        [math]::Round($totalPowerAutomateActions / $powerAutomateFlows.Count, 2) 
    } else { 
        0 
    }
    $averageStagesPerBPF = if ($businessProcessFlows.Count -gt 0) { 
        [math]::Round($totalBPFStages / $businessProcessFlows.Count, 2) 
    } else { 
        0 
    }
    
    $markdownContent += @"

### Statistics

| Metric | Value |
|--------|-------|
| **Total XML Workflows** | $($allWorkflows.Count) |
| **Total Power Automate Flows** | $($powerAutomateFlows.Count) |
| **Total Business Process Flows** | $($businessProcessFlows.Count) |
| **Total Input Parameters (XML)** | $totalInputParams |
| **Total Output Parameters (XML)** | $totalOutputParams |
| **Total Power Automate Actions** | $totalPowerAutomateActions |
| **Total Power Automate Triggers** | $totalPowerAutomateTriggers |
| **Total Connections** | $totalConnections |
| **Total BPF Stages** | $totalBPFStages |
| **Total BPF Steps** | $totalBPFSteps |
| **Total BPF Controls** | $totalBPFControls |
| **Average Input Parameters per XML Workflow** | $averageInputParams |
| **Average Output Parameters per XML Workflow** | $averageOutputParams |
| **Average Actions per Power Automate Flow** | $averageActionsPerFlow |
| **Average Stages per Business Process Flow** | $averageStagesPerBPF |
| **XML Files Processed** | $($workflowFiles.Count) |
| **Power Automate Files Processed** | $($powerAutomateFiles.Count) |
| **Business Process Flow Files Processed** | $($businessProcessFlowFiles.Count) |

"@
}

$markdownContent += @"

---
*Documentation generated by Mightora Power Platform Workflows Documentation Generator*
"@

Write-Output "Processing complete."

# Define the output file path
$outputFilePath = Join-Path -Path $outputLocation -ChildPath "Workflows_$solutionName.md"

# Save the Markdown content to file
try {
    $markdownContent | Out-File -FilePath $outputFilePath -Encoding UTF8
    Write-Output "Workflows documentation successfully generated at: $outputFilePath"
} catch {
    Write-Output "Error writing documentation file: $($_.Exception.Message)"
    exit 1
}
