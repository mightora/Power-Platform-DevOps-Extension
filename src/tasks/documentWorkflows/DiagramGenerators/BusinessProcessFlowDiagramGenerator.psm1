# BusinessProcessFlowDiagramGenerator.psm1
# Specialized diagram generator for Business Process Flows

using module .\BaseDiagramGenerator.psm1

<#
.SYNOPSIS
Business Process Flow diagram generator

.DESCRIPTION
Generates PlantUML diagrams specifically for Business Process Flows.
Handles XAML-based BPF definitions with stages, steps, and transitions.
#>

class BusinessProcessFlowDiagramGenerator : IDiagramGenerator {
    
    [string] GenerateDiagram([xml]$bpfXml, [string]$bpfName) {
        $plantuml = [PlantUMLHelper]::CreateHeader("Business Process Flow: $bpfName")
        
        try {
            # Create namespace manager for XAML parsing
            $nsManager = New-Object System.Xml.XmlNamespaceManager($bpfXml.NameTable)
            $nsManager.AddNamespace("mxswa", "clr-namespace:Microsoft.Xrm.Sdk.Workflow.Activities;assembly=Microsoft.Xrm.Sdk.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
            $nsManager.AddNamespace("mcwb", "clr-namespace:Microsoft.Crm.Workflow.BusinessProcessFlowActivities;assembly=Microsoft.Crm.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
            
            # Find Business Process Flow activities
            $bpfActivities = $bpfXml.SelectNodes("//mcwb:BusinessProcessFlowContainer", $nsManager)
            
            if ($bpfActivities.Count -gt 0) {
                foreach ($activity in $bpfActivities) {
                    $stages = $activity.SelectNodes(".//mcwb:BusinessProcessFlowStage", $nsManager)
                    
                    if ($stages.Count -gt 0) {
                        foreach ($stage in $stages) {
                            $stageName = $stage.GetAttribute("DisplayName")
                            if (-not $stageName) {
                                $stageName = $stage.GetAttribute("Name")
                            }
                            $cleanStageName = [PlantUMLHelper]::CleanName($stageName)
                            $plantuml += ":Stage: ${cleanStageName};`n"
                        }
                    } else {
                        $plantuml += ":Business Process Flow;`n"
                    }
                }
            } else {
                $plantuml += ":Business Process Flow;`n"
            }
        } catch {
            Write-Warning "Error parsing Business Process Flow XAML: $($_.Exception.Message)"
            $plantuml += ":Business Process Flow (Parse Error);`n"
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
        
        # Check if the XAML contains BPF-specific content
        try {
            $content = Get-Content -Path $filePath -Raw
            return $content -like "*BusinessProcessFlow*" -or $content -like "*mcwb:*"
        } catch {
            return $false
        }
    }
    
    [PSCustomObject[]] ExtractStages([xml]$bpfXml) {
        $stages = @()
        
        try {
            # Create namespace manager
            $nsManager = New-Object System.Xml.XmlNamespaceManager($bpfXml.NameTable)
            $nsManager.AddNamespace("mcwb", "clr-namespace:Microsoft.Crm.Workflow.BusinessProcessFlowActivities;assembly=Microsoft.Crm.Workflow, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35")
            
            # Find all stages
            $stageNodes = $bpfXml.SelectNodes("//mcwb:BusinessProcessFlowStage", $nsManager)
            
            foreach ($stageNode in $stageNodes) {
                $stage = [PSCustomObject]@{
                    Name = $stageNode.GetAttribute("Name")
                    DisplayName = $stageNode.GetAttribute("DisplayName")
                    EntityName = $stageNode.GetAttribute("EntityName")
                    Steps = @()
                }
                
                # Extract steps within this stage
                $stepNodes = $stageNode.SelectNodes(".//mcwb:BusinessProcessFlowStep", $nsManager)
                foreach ($stepNode in $stepNodes) {
                    $step = [PSCustomObject]@{
                        Name = $stepNode.GetAttribute("Name")
                        DisplayName = $stepNode.GetAttribute("DisplayName")
                        Required = $stepNode.GetAttribute("Required")
                        AttributeName = $stepNode.GetAttribute("AttributeName")
                    }
                    $stage.Steps += $step
                }
                
                $stages += $stage
            }
        } catch {
            Write-Warning "Error extracting BPF stages: $($_.Exception.Message)"
        }
        
        return $stages
    }
}

# Create and export the generator instance
function New-BusinessProcessFlowDiagramGenerator {
    return [BusinessProcessFlowDiagramGenerator]::new()
}

Export-ModuleMember -Function New-BusinessProcessFlowDiagramGenerator