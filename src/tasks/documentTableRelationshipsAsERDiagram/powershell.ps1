<#
    ===========================================================
    Task: Mightora Power Platform Table Relationship Documentation Generator
    
    Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2025-01-23)
    Date: 2025-01-23

    Contributors:
    - Developer B (Contributions: Added support for custom commit messages)
    
    ===========================================================
#>

[CmdletBinding()]

param(
    [string]$locationOfUnpackedSolution,
    [string]$wikiLocation,
    [bool]$devMode = $false,
    [string[]]$authors
)

# Output the script information at runtime
Write-Host "==========================================================="
Write-Host "Task: Mightora Power Platform Table Relationship Documentation ER Diagram Generator"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2025-01-23)"
Write-Host "Contributors:"
#Write-Host " - Ian Tweedie [https://iantweedie.biz] (Date: 2025-01-23)  (Contributions: Added filter for author)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="



if (-not $devMode) {
    # Get inputs from the task
    $locationOfUnpackedSolution = Get-VstsInput -Name 'locationOfUnpackedSolution'
    $wikiLocation = Get-VstsInput -Name 'wikiLocation'
    $authors = Get-VstsInput -Name 'authors'
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



foreach ($xmlFile in $xmlFiles) {
    [xml]$xmlContent = Get-Content $xmlFile.FullName


    $mdContent += "`n"
    $mdContent += "erDiagram"
    $mdContent += "`n"

    foreach ($entityRelationship in $xmlContent.EntityRelationships.EntityRelationship) {
        # For Mermaid diagram
        $referencingEntityName = $entityRelationship.ReferencingEntityName
        $referencedEntityName = $entityRelationship.ReferencedEntityName
        $referencingAttributeName = $entityRelationship.ReferencingAttributeName
        $relationshipType = switch ($entityRelationship.EntityRelationshipType) {
            "OneToMany" { "||--|{" }
            "ManyToOne" { "}|--||" }
            "ManyToMany" { "}|--|{" }
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

                    $mermaidLines += "$referencingEntityName $relationshipType $referencedEntityName : $referencingAttributeName"
                    $mermaidLines += "`n"

            }
        } else {
            $mdContent += "$referencingEntityName $relationshipType |$referencingAttributeName| $referencedEntityName"
            $mdContent += "`n"
    
                $mermaidLines += "$referencingEntityName $relationshipType $referencedEntityName : $referencingAttributeName"
                $mermaidLines += "`n"
            
        }



    }

    # Create file
        $mdFileName = "$($xmlFile.BaseName)-relationships.mmd"
        $mdFilePath = Join-Path -Path $wikiLocation -ChildPath $mdFileName
        
        # Append the Diagram Key section
        $mdContent += "`n"

        
        # Write the content to the individual MMD file
        $mdContent | Out-File -FilePath $mdFilePath -Encoding UTF8
$mdContent = ""

}

# If createFullERD is true, process and add the full ERD to the documentation

    # Remove duplicate Mermaid lines
    $mermaidLines = $mermaidLines | Sort-Object -Unique

    # Prepare the full ERD section

    $fullERDContent += "`n"
    $fullERDContent += "erDiagram"
    $fullERDContent += "`n"
    $fullERDContent += ($mermaidLines -join "`n")
    $fullERDContent += "`n"
    $fullERDContent += "`n"


    # Write to a separate ERD file
    $fullERDFilePath = Join-Path -Path $wikiLocation -ChildPath "fullERDiagram.mmd"
    $fullERDContent | Out-File -FilePath $fullERDFilePath -Encoding UTF8
    Write-Output "Full ERD saved in: $fullERDFilePath"



Write-Host "Processed $($xmlFiles.Count) files."

