<#
    ===========================================================
    Task: Mightora Power Platform Table Documentation Generator
    
    Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)
    Date: 2024-10-08

    Contributors:
    - Developer A (Contributions: Improved Git configuration handling)
    - Developer B (Contributions: Added support for custom commit messages)
    
    ===========================================================
#>

[CmdletBinding()]

param(
    [string]$locationOfUnpackedSolution,
    [string]$wikiLocation,
    [bool]$useSingleFile,
    [bool]$devMode = $false
)

# Output the script information at runtime
Write-Host "==========================================================="
Write-Host "Task: Mightora Power Platform Table Documentation Generator"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)"
Write-Host "Contributors:"
#Write-Host " - Developer A (Contributions: Improved Git configuration handling)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="


if (-not $devMode) {
    # Get inputs from the task
    $locationOfUnpackedSolution = Get-VstsInput -Name 'locationOfUnpackedSolution'
    $wikiLocation = Get-VstsInput -Name 'wikiLocation'
    $useSingleFile = [bool](Get-VstsInput -Name 'useSingleFile')
}

# Validation: Check if rootFolder and targetFolder have been provided
if (-not $locationOfUnpackedSolution -or -not $wikiLocation) {
    Write-Output "Both rootFolder and targetFolder parameters are required."
    Write-Output "Usage: .\script.ps1 -locationOfUnpackedSolution 'C:\path\to\your\rootFolder' -wikiLocation 'C:\path\to\your\targetFolder'"
    exit
}

# Construct the path to the entities folder
$entitiesFolder = Join-Path -Path $locationOfUnpackedSolution -ChildPath "entities"

# Change to build sources



Write-Output "Solution folder set to: $locationOfUnpackedSolution"
Write-Output "Entities folder set to: $entitiesFolder"
Write-Output "Wiki location for Markdown files set to: $wikiLocation"
Write-Output "Output to Single File: $useSingleFile"
Write-Output "Working Directory: $(Get-Location)"

cd $env:Build_SourcesDirectory

Write-Output "Working Directory Updated to: $(Get-Location)"

# Check if the wiki location exists; if not, create it
if (-not (Test-Path -Path $wikiLocation)) {
    New-Item -ItemType Directory -Path $wikiLocation
    Write-Output "Created wiki location at: $wikiLocation"
}

# If useSingleFile is true, define the path for the single output file
if ($useSingleFile) {
    $singleFilePath = Join-Path -Path $wikiLocation -ChildPath "tableColumns.md"
    $singleFileContent = "# Table Columns`n`n"  # Initialize content for the single file
}

# Get all subdirectories in the entities folder
$entityFolders = Get-ChildItem -Path $entitiesFolder -Directory

foreach ($folder in $entityFolders) {
    Write-Output "Processing folder: $($folder.FullName)"
    $entityFile = Join-Path -Path $folder.FullName -ChildPath "Entity.xml"
    
    # Check if Entity.xml exists in the folder
    if (Test-Path $entityFile) {
        Write-Output "Found Entity.xml in $($folder.FullName)"
        [xml]$xmlContent = Get-Content -Path $entityFile

        # Extracting the entity name to use as the Markdown section/file name
        $entityName = $xmlContent.Entity.Name.'#text'
        if (-not $entityName) {
            $entityName = $xmlContent.Entity.Name.OriginalName
        }

        # Extracting the entity description
        $entityDescription = $xmlContent.Entity.EntityInfo.entity.Descriptions.Description.description


        # Initialize Markdown content with entity details
        $markdownContent = "# Entity: $entityName`n"
        $markdownContent += "## Localized Name: $($xmlContent.Entity.Name.LocalizedName)`n`n"
        $markdownContent += "**Description:** $entityDescription`n`n"


        # Start Attributes table
        $markdownContent += "## Attributes`n"
        $markdownContent += "| Name | Type | Display Name | Description | Required Level | Is Custom Field | Is Searchable | Format | Max Length | Auto Number Format | IME Mode |`n"
        $markdownContent += "|------|------|--------------|-------------|----------------|-----------------|---------------|--------|------------|--------------------|---------|`n"


        # Fill the table with attribute details
        foreach ($attribute in $xmlContent.Entity.EntityInfo.entity.attributes.attribute) {
            $displayName = $attribute.displaynames.displayname.description
            $description = $attribute.Descriptions.Description.description
            $format = $attribute.Format
            $maxLength = $attribute.MaxLength
            $autoNumberFormat = $attribute.AutoNumberFormat
            $imeMode = $attribute.ImeMode
            $markdownContent += "| $($attribute.Name) | $($attribute.Type) | $displayName | $description | $($attribute.RequiredLevel) | $($attribute.IsCustomField) | $($attribute.IsSearchable) | $format | $maxLength | $autoNumberFormat | $imeMode |`n"
        }

        if ($useSingleFile) {
            # Append content to the single file
            $singleFileContent += $markdownContent + "`n`n"
        } else {
            # Define the output Markdown file name using the entity name and save it to the wiki location
            $mdFileName = Join-Path -Path $wikiLocation -ChildPath "$entityName.md"
            # Save the Markdown content to a file
            $markdownContent | Out-File -FilePath $mdFileName -Encoding UTF8  
            Write-Output "Markdown documentation generated for entity '$entityName' at: $mdFileName"
        }
    } else {
        Write-Output "No Entity.xml found in $($folder.FullName)"
    }
}

# If using a single file, save all content to dataDictionary.md
if ($useSingleFile) {
    $singleFileContent | Out-File -FilePath $singleFilePath -Encoding UTF8
    Write-Output "All entities documentation saved in a single file: $singleFilePath"
}

Write-Output "Processing complete."
