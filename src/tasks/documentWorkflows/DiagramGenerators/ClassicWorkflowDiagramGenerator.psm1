# ClassicWorkflowDiagramGenerator.psm1
# Specialized diagram generator for Classic Workflows

using module .\BaseDiagramGenerator.psm1

<#
.SYNOPSIS
Classic Workflow diagram generator

.DESCRIPTION
Generates PlantUML diagrams specifically for Classic Workflows.
Handles XAML-based workflow definitions with activities, conditions, and sequences.
#>

class ClassicWorkflowDiagramGenerator : IDiagramGenerator {
    
    [string] GenerateDiagram([xml]$workflowXml, [string]$workflowName) {
        $plantuml = [PlantUMLHelper]::CreateHeader("Classic Workflow: $workflowName")
        
        try {
            # Create namespace manager for XAML parsing
            $nsManager = New-Object System.Xml.XmlNamespaceManager($workflowXml.NameTable)
            $nsManager.AddNamespace("mxswa", "clr-namespace:Microsoft.Xrm.Sdk.Workflow.Activities;assembly=Microsoft.Xrm.Sdk.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
            $nsManager.AddNamespace("x", "http://schemas.microsoft.com/winfx/2006/xaml")
            
            # Process workflow activities
            $activities = $workflowXml.SelectNodes("//mxswa:*", $nsManager)
            
            if ($activities.Count -gt 0) {
                foreach ($activity in $activities) {
                    $activityType = $activity.LocalName
                    $displayName = $activity.GetAttribute("DisplayName")
                    
                    if ($displayName) {
                        $cleanName = [PlantUMLHelper]::CleanName($displayName)
                        $plantuml += ":${cleanName} ($activityType);`n"
                    } else {
                        $plantuml += ":$activityType Activity;`n"
                    }
                }
            } else {
                $plantuml += ":Workflow Activities;`n"
            }
            
        } catch {
            Write-Warning "Error parsing Classic Workflow XAML: $($_.Exception.Message)"
            $plantuml += ":Classic Workflow (Parse Error);`n"
        }
        
        $plantuml += [PlantUMLHelper]::CreateFooter()
        return $plantuml
    }
    
    [string] GetSupportedFileExtension() {
        return ".xaml"
    }
    
    [bool] CanProcess([string]$filePath) {
        if (-not $filePath.EndsWith(".xaml")) {
            return $false
        }
        
        # Check if it's a classic workflow (not a BPF)
        try {
            $content = Get-Content -Path $filePath -Raw
            return $content -like "*Microsoft.Xrm.Sdk.Workflow*" -and 
                   $content -notlike "*BusinessProcessFlow*" -and 
                   $content -notlike "*mcwb:*"
        } catch {
            return $false
        }
    }
    
    [PSCustomObject[]] ExtractActivities([xml]$workflowXml) {
        $activities = @()
        
        try {
            # Create namespace manager
            $nsManager = New-Object System.Xml.XmlNamespaceManager($workflowXml.NameTable)
            $nsManager.AddNamespace("mxswa", "clr-namespace:Microsoft.Xrm.Sdk.Workflow.Activities;assembly=Microsoft.Xrm.Sdk.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
            
            # Find all workflow activities
            $activityNodes = $workflowXml.SelectNodes("//mxswa:*", $nsManager)
            
            foreach ($activityNode in $activityNodes) {
                $activity = [PSCustomObject]@{
                    Type = $activityNode.LocalName
                    DisplayName = $activityNode.GetAttribute("DisplayName")
                    Name = $activityNode.GetAttribute("Name")
                    Attributes = @{}
                }
                
                # Extract common attributes
                foreach ($attr in $activityNode.Attributes) {
                    $activity.Attributes[$attr.Name] = $attr.Value
                }
                
                $activities += $activity
            }
        } catch {
            Write-Warning "Error extracting workflow activities: $($_.Exception.Message)"
        }
        
        return $activities
    }
}

# Create and export the generator instance
function New-ClassicWorkflowDiagramGenerator {
    return [ClassicWorkflowDiagramGenerator]::new()
}

Export-ModuleMember -Function New-ClassicWorkflowDiagramGenerator