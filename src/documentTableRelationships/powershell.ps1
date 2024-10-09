<#
    ===========================================================
    Task: Mightora Power Platform Table Relationship Documentation Generator
    
    Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)
    Date: 2024-10-08

    Contributors:
    - Developer A (Contributions: Improved Git configuration handling)
    - Developer B (Contributions: Added support for custom commit messages)
    
    ===========================================================
#>

[CmdletBinding()]

param()

# Output the script information at runtime
Write-Host "==========================================================="
Write-Host "Task: Mightora Power Platform Table Relationship Documentation Generator"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)"
Write-Host "Contributors:"
#Write-Host " - Developer A (Contributions: Improved Git configuration handling)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="



# Get inputs from the task
$locationOfUnpackedSolution = Get-VstsInput -Name 'locationOfUnpackedSolution'
$wikiLocation = Get-VstsInput -Name 'wikiLocation'
$useSingleFile = Get-VstsInput -Name 'useSingleFile'
$createFullERD = Get-VstsInput -Name 'createFullERD'

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

cd $env:Build_SourcesDirectory

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

# If using a single file, define the path for the single output file and initialize content
if ($useSingleFile) {
    $singleFilePath = Join-Path -Path $wikiLocation -ChildPath "tableRelationships.md"
    $singleFileContent = "# Table Relationships`n`n"
}

# Initialize an array to collect Mermaid diagram lines for the full ERD
$mermaidLines = @()

foreach ($xmlFile in $xmlFiles) {
    [xml]$xmlContent = Get-Content $xmlFile.FullName

    # Use the full name of the XML file, including its extension, for the entity name
    $entityName = $xmlFile.BaseName

    # Start building the Markdown content
    $mdContent = @("# $($entityName) Table Relationships")

    # Add table header
    $tableContent = @()
    $tableContent += "| Name | Type | Referencing Entity | Referenced Entity | Cascades |"
    $tableContent += "| ---- | ---- | ------------------ | ----------------- | -------- |"



    foreach ($entityRelationship in $xmlContent.EntityRelationships.EntityRelationship) {
       
        # For table
        $tableLine = "| $($entityRelationship.Name) | $($entityRelationship.EntityRelationshipType) | $($entityRelationship.ReferencingEntityName) | $($entityRelationship.ReferencedEntityName) | Assign: $($entityRelationship.CascadeAssign), Delete: $($entityRelationship.CascadeDelete) |"
        $tableContent += $tableLine
    }



    # Add Mermaid diagram start
    $mdContent += "`n"
    $mdContent += "`n"
    $mdContent += [uri]::UnescapeDataString("%3A%3A%3A mermaid")
    $mdContent += "`n"
    $mdContent += "graph LR"
    $mdContent += "`n"

    foreach ($entityRelationship in $xmlContent.EntityRelationships.EntityRelationship) {
        # For Mermaid diagram
        $referencingEntityName = $entityRelationship.ReferencingEntityName
        $referencedEntityName = $entityRelationship.ReferencedEntityName
        $referencingAttributeName = $entityRelationship.ReferencingAttributeName
        $relationshipType = switch ($entityRelationship.EntityRelationshipType) {
            "OneToMany" { "-->" }
            "ManyToOne" { "<--" }
            "ManyToMany" { "---" }
            Default { "--" }
        }
        $mdContent += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
        $mdContent += "`n"


        # Collect Mermaid line for full ERD if createFullERD is true
        if ($createFullERD) {
            $mermaidLines += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
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

        # Write the content to the individual MD file
        $mdContent | Out-File -FilePath $mdFilePath -Encoding UTF8
    }
}

# If using a single file, write all the content to dataDictionary.md
if ($useSingleFile) {
    $singleFileContent | Out-File -FilePath $singleFilePath -Encoding UTF8
    Write-Output "All relationships documentation saved in a single file: $singleFilePath"
}

# If using a single file, write all the content to dataDictionary.md
if ($useSingleFile) {
    $singleFileContent | Out-File -FilePath $singleFilePath -Encoding UTF8
    Write-Output "All relationships documentation saved in a single file: $singleFilePath"
}

# If createFullERD is true, process and add the full ERD to the documentation
if ($createFullERD -eq $true) {
    # Remove duplicate Mermaid lines
    $mermaidLines = $mermaidLines | Sort-Object -Unique

    # Prepare the full ERD section
    $fullERDContent = "`n`n# Full Entity Relationship Diagram (ERD)`n`n"
    $fullERDContent += [uri]::UnescapeDataString("%3A%3A%3A mermaid")
    $fullERDContent += "`n"
    $fullERDContent += "graph LR"
    $fullERDContent += "`n"
    $fullERDContent += ($mermaidLines -join "`n")
    $fullERDContent += "`n"
    $fullERDContent += [uri]::UnescapeDataString("%3A%3A%3A")
    $fullERDContent += "`n"

    # Append the full ERD to the single file or write it to a separate file
    if ($useSingleFile) {
        # Append to the single file
        $fullERDContent | Add-Content -Path $singleFilePath -Encoding UTF8
        Write-Output "Full ERD appended to the single file."
    } else {
        # Write to a separate ERD file
        $fullERDFilePath = Join-Path -Path $wikiLocation -ChildPath "fullERD.md"
        $fullERDContent | Out-File -FilePath $fullERDFilePath -Encoding UTF8
        Write-Output "Full ERD saved in: $fullERDFilePath"
    }
}

Write-Host "Processed $($xmlFiles.Count) files."
