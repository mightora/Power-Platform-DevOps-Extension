# DiagramFactory.psm1
# Factory for creating appropriate diagram generators

using module .\PowerAutomateDiagramGenerator.psm1
using module .\BusinessProcessFlowDiagramGenerator.psm1
using module .\ClassicWorkflowDiagramGenerator.psm1

<#
.SYNOPSIS
Factory for creating workflow diagram generators

.DESCRIPTION
Provides a factory pattern to create the appropriate diagram generator
based on the workflow type and file extension.
#>

class DiagramFactory {
    static [IDiagramGenerator[]] $RegisteredGenerators = @(
        [PowerAutomateDiagramGenerator]::new(),
        [BusinessProcessFlowDiagramGenerator]::new(),
        [ClassicWorkflowDiagramGenerator]::new()
    )
    
    static [IDiagramGenerator] GetGenerator([string]$filePath) {
        foreach ($generator in [DiagramFactory]::RegisteredGenerators) {
            if ($generator.CanProcess($filePath)) {
                return $generator
            }
        }
        return $null
    }
    
    static [IDiagramGenerator[]] GetAllGenerators() {
        return [DiagramFactory]::RegisteredGenerators
    }
    
    static [void] RegisterGenerator([IDiagramGenerator]$generator) {
        [DiagramFactory]::RegisteredGenerators += $generator
    }
}

# Helper functions for the main script
function Get-DiagramGenerator {
    param([string]$FilePath)
    return [DiagramFactory]::GetGenerator($FilePath)
}

function Get-AllDiagramGenerators {
    return [DiagramFactory]::GetAllGenerators()
}

function Register-DiagramGenerator {
    param([IDiagramGenerator]$Generator)
    [DiagramFactory]::RegisterGenerator($Generator)
}

function New-WorkflowDiagram {
    param(
        [string]$FilePath,
        [PSCustomObject]$WorkflowData,
        [string]$WorkflowName
    )
    
    $generator = Get-DiagramGenerator -FilePath $FilePath
    if ($null -eq $generator) {
        Write-Warning "No suitable diagram generator found for file: $FilePath"
        return $null
    }
    
    try {
        return $generator.GenerateDiagram($WorkflowData, $WorkflowName)
    } catch {
        Write-Error "Error generating diagram for $FilePath`: $($_.Exception.Message)"
        return $null
    }
}

Export-ModuleMember -Function Get-DiagramGenerator, Get-AllDiagramGenerators, Register-DiagramGenerator, New-WorkflowDiagram