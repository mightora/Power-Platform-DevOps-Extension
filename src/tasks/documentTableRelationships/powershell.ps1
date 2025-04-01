<#
    ===========================================================
    Task: Mightora Power Platform Table Relationship Documentation Generator
    
    Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)
    Date: 2024-10-08

    Contributors:
    - Ian Tweedie [https://iantweedie.biz] (Date: 2025-01-23)  (Contributions: Added filter for author)
    - Developer B (Contributions: Added support for custom commit messages)
    
    ===========================================================
#>

[CmdletBinding()]

param(
    [string]$locationOfUnpackedSolution,
    [string]$wikiLocation,
    [bool]$useSingleFile,
    [bool]$createFullERD,
    [bool]$devMode = $false,
    [string[]]$authors
)

# Function to fetch the developer message
function Fetch-DeveloperMessage {
    $url = "https://developer-message.mightora.io/api/HttpTrigger?appname=documentTableRelationships"
    try {
        $response = Invoke-RestMethod -Uri $url -Method Get -ErrorAction Stop
        return $response.message
    } catch {
        return "Developer message not available."
    }
}

# Display the developer message
$developerMessage = Fetch-DeveloperMessage
Write-Host "Developer Message: $developerMessage"

# Output the script information at runtime
Write-Host "==========================================================="
Write-Host "Task: Mightora Power Platform Table Relationship Documentation Generator"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)"
Write-Host "Contributors:"
Write-Host " - Ian Tweedie [https://iantweedie.biz] (Date: 2025-01-23)  (Contributions: Added filter for author)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="



if (-not $devMode) {
    # Get inputs from the task
    $locationOfUnpackedSolution = Get-VstsInput -Name 'locationOfUnpackedSolution'
    $wikiLocation = Get-VstsInput -Name 'wikiLocation'
    $useSingleFile = [bool](Get-VstsInput -Name 'useSingleFile')
    $createFullERD = [bool](Get-VstsInput -Name 'createFullERD')
    $authors = (Get-VstsInput -Name 'authors').Split(',')
}

# Validation: Check if rootFolder and targetFolder have been provided
if (-not $locationOfUnpackedSolution -or -not $wikiLocation) {
    Write-Output "Both rootFolder and targetFolder parameters are required."
    Write-Output "Usage: .\script.ps1 -locationOfUnpackedSolution 'C:\path\to\your\rootFolder' -wikiLocation 'C:\path\to\your\targetFolder'"
    exit
}


# Change to build sources

Write-Output "Solution folder set to: $locationOfUnpackedSolution"
Write-Output "Wiki location for Markdown files set to: $wikiLocation"
Write-Output "Output to Single File: $useSingleFile"
Write-Output "Create Full ERD: $createFullERD"
Write-Output "Working Directory: $(Get-Location)"
Write-Output "Authors: $($authors -join ', ')"


if (-not $devMode) {
    # change path
    cd $env:Build_SourcesDirectory
}


Write-Output "Working Directory Updated to: $(Get-Location)"

# Ensure the target directory exists, create it if it does not
if (-Not (Test-Path -Path $wikiLocation)) {
    New-Item -ItemType Directory -Path $wikiLocation | Out-Null
}

# Construct the path to the Other/Relationships subfolder
$relationshipsDirectory = Join-Path -Path $locationOfUnpackedSolution -ChildPath "Other\Relationships"

# Verify the Relationships directory exists
if (-Not (Test-Path -Path $relationshipsDirectory)) {
    Write-Error "The specified path to the Other/Relationships directory does not exist: $relationshipsDirectory"
    exit
}

# Get all XML files in the Relationships directory
$xmlFiles = Get-ChildItem -Path $relationshipsDirectory -Filter "*.xml"


# Filter XML files based on authors if specified
if ($authors) {
    Write-Output "Filtering XML files for authors: $($authors -join ', ')"
    $xmlFiles = $xmlFiles | Where-Object {
        $fileName = $_.BaseName
        $fileAuthor = ($fileName -split '_')[0]
        $authors -contains $fileAuthor
    }
}

# Output the filtered XML files
Write-Output "Filtered XML Files: $($xmlFiles.Name -join ', ')"

# If using a single file, define the path for the single output file and initialize content
if ($useSingleFile) {
    $singleFilePath = Join-Path -Path $wikiLocation -ChildPath "tableRelationships.md"
    $singleFileContent = "# Table Relationships`n`n"
}

# Initialize an array to collect Mermaid diagram lines for the full ERD
$mermaidLines = @()

# Define the hardcoded Mermaid diagram content
$hardcodedMermaidDiagram = @()


$hardcodedMermaidDiagram = ""


foreach ($xmlFile in $xmlFiles) {
    [xml]$xmlContent = Get-Content $xmlFile.FullName

    # Use the full name of the XML file, including its extension, for the entity name
    $entityName = $xmlFile.BaseName

    # Start building the Markdown content
    $mdContent = @("# $($entityName) Table Relationships")

    # Add table header
    $tableContent = @()
    $tableContent += "`n"
    $tableContent += "`n"
    $tableContent += "| Name | Type | Referencing Entity | Referenced Entity | Cascades |"
    $tableContent += "| ---- | ---- | ------------------ | ----------------- | -------- |"



    #foreach ($entityRelationship in $xmlContent.EntityRelationships.EntityRelationship) {
       
        # For table
    #    $tableLine = "| $($entityRelationship.Name) | $($entityRelationship.EntityRelationshipType) | $($entityRelationship.ReferencingEntityName) | $($entityRelationship.ReferencedEntityName) | Assign: $($entityRelationship.CascadeAssign), Delete: $($entityRelationship.CascadeDelete) |"
    #    $tableContent += $tableLine
    #}


    foreach ($entityRelationship in $xmlContent.EntityRelationships.EntityRelationship) {
        # Check if authors are specified
        if ($authors) {
            # Split the ReferencedEntityName to get the author
            $referencedEntityAuthor = ($entityRelationship.ReferencedEntityName -split '_')[0]
            
            # Check if the author is in the authors array
            if ($authors -contains $referencedEntityAuthor) {
                # For table
                $tableLine = "| $($entityRelationship.Name) | $($entityRelationship.EntityRelationshipType) | $($entityRelationship.ReferencingEntityName) | $($entityRelationship.ReferencedEntityName) | Assign: $($entityRelationship.CascadeAssign), Delete: $($entityRelationship.CascadeDelete) |"
                $tableContent += $tableLine #+ "`n"


            }
        } else {
            # For table (if no authors are specified)
            $tableLine = "| $($entityRelationship.Name) | $($entityRelationship.EntityRelationshipType) | $($entityRelationship.ReferencingEntityName) | $($entityRelationship.ReferencedEntityName) | Assign: $($entityRelationship.CascadeAssign), Delete: $($entityRelationship.CascadeDelete) |"
            $tableContent += $tableLine 
            #$tableContent += $tableLine + "`n"

  

        }
    }


    # Add Mermaid diagram start
    $mdContent += "`n"
    $mdContent += "`n"
    $mdContent += [uri]::UnescapeDataString("%3A%3A%3Amermaid")
    $mdContent += "`n"
    $mdContent += "flowchart LR"
    $mdContent += "`n"

    #foreach ($entityRelationship in $xmlContent.EntityRelationships.EntityRelationship) {
        # For Mermaid diagram
    #    $referencingEntityName = $entityRelationship.ReferencingEntityName
    #    $referencedEntityName = $entityRelationship.ReferencedEntityName
    #    $referencingAttributeName = $entityRelationship.ReferencingAttributeName
    #    $relationshipType = switch ($entityRelationship.EntityRelationshipType) {
    #        "OneToMany" { "-->" }
    #        "ManyToOne" { "<--" }
    #        "ManyToMany" { "---" }
    #        Default { "--" }
    #    }
    #    $mdContent += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
    #    $mdContent += "`n"


        # Collect Mermaid line for full ERD if createFullERD is true
    #    if ($createFullERD) {
    #        $mermaidLines += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
    #    }
    #}

    foreach ($entityRelationship in $xmlContent.EntityRelationships.EntityRelationship) {
        # For Mermaid diagram
        $referencingEntityName = $entityRelationship.ReferencingEntityName
        $referencedEntityName = $entityRelationship.ReferencedEntityName
        $referencingAttributeName = $entityRelationship.ReferencingAttributeName
        $relationshipType = switch ($entityRelationship.EntityRelationshipType) {
            "OneToMany" { "---" }
            "ManyToOne" { "---" }
            "ManyToMany" { "<--->" }
            Default { "---" }
        }    
    
        # Check if authors are specified
        if ($authors) {
            # Split the ReferencedEntityName to get the author
            $referencedEntityAuthor = ($referencedEntityName -split '_')[0]
            
            # Check if the author is in the authors array
            if ($authors -contains $referencedEntityAuthor) {
                $mdContent += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
                $mdContent += "`n"
    
                # Collect Mermaid line for full ERD if createFullERD is true
                if ($createFullERD) {
                    $mermaidLines += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
                    $mermaidLines += "`n"
                }
            }
        } else {
            $mdContent += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
            $mdContent += "`n"
    
            # Collect Mermaid line for full ERD if createFullERD is true
            if ($createFullERD) {
                $mermaidLines += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
                $mermaidLines += "`n"
            }
        }
    }


    # Close Mermaid diagram
    $mdContent += "`n"
    $mdContent += [uri]::UnescapeDataString("%3A%3A%3A")
    $mdContent += "`n"

    # Add table content to the Markdown content
    $mdContent += $tableContent -join "`n"

    if ($useSingleFile) {
        # Append content to the single file content
        $singleFileContent += $mdContent + "`n`n"
        
    } else {
        # Determine the output file name based on the XML file name
        $mdFileName = "$($xmlFile.BaseName)-relationships.md"
        $mdFilePath = Join-Path -Path $wikiLocation -ChildPath $mdFileName
        
        # Append the Diagram Key section
        $mdContent += "`n"

        
        # Write the content to the individual MD file
        $mdContent | Out-File -FilePath $mdFilePath -Encoding UTF8
        $mdContent = ""
    }
}

# If using a single file, write all the content to dataDictionary.md
if ($useSingleFile) {
    $singleFileContent += "`n"
    $singleFileContent | Out-File -FilePath $singleFilePath -Encoding UTF8
    Write-Output "All relationships documentation saved in a single file: $singleFilePath"
}

# If using a single file, write all the content to dataDictionary.md
#if ($useSingleFile) {
#    $singleFileContent | Out-File -FilePath $singleFilePath -Encoding UTF8
#    Write-Output "All relationships documentation saved in a single file: $singleFilePath"
#}

# If createFullERD is true, process and add the full ERD to the documentation
if ($createFullERD -eq $true) {
    # Remove duplicate Mermaid lines
    $mermaidLines = $mermaidLines | Sort-Object -Unique

    # Prepare the full ERD section
    $fullERDContent = "`n`n# Full Entity Relationship Diagram (ERD)`n`n"
    $fullERDContent += [uri]::UnescapeDataString("%3A%3A%3Amermaid")
    $fullERDContent += "`n"
    $fullERDContent += "flowchart LR"
    $fullERDContent += "`n"
    $fullERDContent += ($mermaidLines -join "`n")
    $fullERDContent += "`n"
    $fullERDContent += [uri]::UnescapeDataString("%3A%3A%3A")
    $fullERDContent += "`n"

    # Append the full ERD to the single file or write it to a separate file
    if ($useSingleFile) {
        # Append to the single file
        $fullERDContent | Add-Content -Path $singleFilePath -Encoding UTF8
        Write-Output "Full ERD appended to the single file. $singleFilePath"
    } else {
        # Write to a separate ERD file
        $fullERDFilePath = Join-Path -Path $wikiLocation -ChildPath "fullERD.md"
        $fullERDContent += $hardcodedMermaidDiagram
        $fullERDContent | Out-File -FilePath $fullERDFilePath -Encoding UTF8
        Write-Output "Full ERD saved in: $fullERDFilePath"
    }
}

Write-Host "Processed $($xmlFiles.Count) files."

