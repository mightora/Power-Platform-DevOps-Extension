# PowerAutomateDiagramGenerator.psm1
# Specialized diagram generator for Power Automate Flows

using module .\BaseDiagramGenerator.psm1

<#
.SYNOPSIS
Power Automate Flow diagram generator

.DESCRIPTION
Generates PlantUML diagrams specifically for Power Automate flows.
Handles JSON-based flow definitions with triggers, actions, conditions, loops, and scopes.
#>

class PowerAutomateDiagramGenerator : IDiagramGenerator {
    
    [string] GenerateDiagram([PSCustomObject]$flowDefinition, [string]$flowName) {
        $plantuml = [PlantUMLHelper]::CreateHeader("Power Automate Flow: $flowName")
        
        # Process triggers
        if ($flowDefinition.triggers) {
            foreach ($trigger in $flowDefinition.triggers.PSObject.Properties) {
                $triggerName = $trigger.Name
                $triggerType = $trigger.Value.type
                $plantuml += ":Trigger: $triggerName ($triggerType);`n"
            }
        }
        
        # Process actions recursively
        if ($flowDefinition.actions) {
            $plantuml += $this.GenerateActionsPlantUML($flowDefinition.actions, 0)
        }
        
        $plantuml += [PlantUMLHelper]::CreateFooter()
        return $plantuml
    }
    
    [string] GenerateActionsPlantUML([PSCustomObject]$actions, [int]$level) {
        $result = ""
        $indent = "  " * $level
        
        foreach ($action in $actions.PSObject.Properties) {
            $actionName = $action.Name
            $actionData = $action.Value
            $actionType = $actionData.type
            
            # Clean action name for PlantUML
            $cleanActionName = [PlantUMLHelper]::CleanName($actionName)
            
            $result += "${indent}:${cleanActionName} ($actionType);`n"
            
            # Handle conditional actions (if, switch, etc.)
            if ($actionData.actions -and $actionData.actions.PSObject.Properties.Count -gt 0) {
                $result += "${indent} if (condition) then (yes)`n"
                $result += $this.GenerateActionsPlantUML($actionData.actions, $level + 1)
                $result += "${indent} endif`n"
            }
            
            # Handle else actions
            if ($actionData.else -and $actionData.else.actions) {
                $result += "${indent} else (no)`n"
                $result += $this.GenerateActionsPlantUML($actionData.else.actions, $level + 1)
                $result += "${indent} endif`n"
            }
            
            # Handle foreach actions
            if ($actionType -eq "Foreach" -and $actionData.actions) {
                $result += "${indent} repeat`n"
                $result += $this.GenerateActionsPlantUML($actionData.actions, $level + 1)
                $result += "${indent} repeat while (more items)`n"
            }
            
            # Handle scope actions
            if ($actionType -eq "Scope" -and $actionData.actions) {
                $result += "${indent} partition `"${cleanActionName}`" {`n"
                $result += $this.GenerateActionsPlantUML($actionData.actions, $level + 1)
                $result += "${indent} }`n"
            }
        }
        
        return $result
    }
    
    [string] GetSupportedFileExtension() {
        return ".json"
    }
    
    [bool] CanProcess([string]$filePath) {
        return $filePath -like "*flows*" -and $filePath.EndsWith(".json")
    }
    
    [PSCustomObject] ExtractConnections([PSCustomObject]$flowData) {
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
    
    [PSCustomObject] ExtractParameters([PSCustomObject]$flowDefinition) {
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
        return $parameters
    }
}

# Create and export the generator instance
function New-PowerAutomateDiagramGenerator {
    return [PowerAutomateDiagramGenerator]::new()
}

Export-ModuleMember -Function New-PowerAutomateDiagramGenerator