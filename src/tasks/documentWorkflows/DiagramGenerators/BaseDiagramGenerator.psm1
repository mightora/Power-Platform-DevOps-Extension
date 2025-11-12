# BaseDiagramGenerator.psm1
# Base module with common PlantUML utilities and interfaces

<#
.SYNOPSIS
Base class and common utilities for workflow diagram generation

.DESCRIPTION
Provides common PlantUML utilities and interface definitions that all
workflow diagram generators should implement.
#>

# Common PlantUML utilities
class PlantUMLHelper {
    static [string] CreateHeader([string]$title, [string]$theme = "plain") {
        return @"
@startuml
!theme $theme
title $title

start

"@
    }
    
    static [string] CreateFooter() {
        return @"

stop
@enduml
"@
    }
    
    static [string] CleanName([string]$name) {
        return $name -replace '[^\w\s]', ''
    }
    
    static [string] EscapeMarkdown([string]$text) {
        return $text -replace '\|', '\\|'
    }
}

# Interface that all diagram generators should implement
class IDiagramGenerator {
    [string] GenerateDiagram([PSCustomObject]$workflowData, [string]$workflowName) {
        throw "GenerateDiagram method must be implemented by derived classes"
    }
    
    [string] GetSupportedFileExtension() {
        throw "GetSupportedFileExtension method must be implemented by derived classes"
    }
    
    [bool] CanProcess([string]$filePath) {
        throw "CanProcess method must be implemented by derived classes"
    }
}

# Export the classes and functions
Export-ModuleMember -Variable * -Function * -Cmdlet * -Alias *