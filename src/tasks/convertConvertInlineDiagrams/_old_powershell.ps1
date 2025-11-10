<#
    ===========================================================
    Task: Mightora Power Platform Roles Documentation Generator
    
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
Write-Host "Task: Mightora Power Platform Roles Documentation Generator"
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

# Validation: Check if locationOfUnpackedSolution and wikiLocation have been provided
if (-not $locationOfUnpackedSolution -or -not $wikiLocation) {
    Write-Output "Both locationOfUnpackedSolution and wikiLocation parameters are required."
    Write-Output "Usage: .\script.ps1 -locationOfUnpackedSolution 'C:\path\to\your\rootFolder' -wikiLocation 'C:\path\to\your\targetFolder'"
    exit 1
}

# Change to the source directory
Write-Host "Current Working Directory: $(Get-Location)"
cd $env:Build_SourcesDirectory
Write-Host "Working Directory Updated to: $(Get-Location)"

# Ensure the wiki directory exists, create it if it does not
if (-Not (Test-Path -Path $wikiLocation)) {
    Write-Host "Wiki location not found. Creating directory at: $wikiLocation"
    New-Item -ItemType Directory -Path $wikiLocation | Out-Null
} else {
    Write-Host "Wiki directory exists: $wikiLocation"
}

# Define the path to the roles folder
$rolesFolder = Join-Path -Path $locationOfUnpackedSolution -ChildPath "Roles"
Write-Host "Roles Folder Path: $rolesFolder"

# Ensure the roles folder exists
if (-Not (Test-Path -Path $rolesFolder)) {
    Write-Error "The specified path to the Roles directory does not exist: $rolesFolder"
    exit 1
}

# Get all XML files in the Roles directory
$xmlFiles = Get-ChildItem -Path $rolesFolder -Filter "*.xml"
Write-Host "Found $($xmlFiles.Count) XML files in the Roles folder."

# Define the privileges list
$privilegesList = @('Append', 'Assign', 'Create', 'Delet', 'Read', 'Share', 'Write')

# Function to convert privilege name and extract the privilege and table
function Convert-PrivilegeName {
    param (
        [string]$privilegeName
    )
    foreach ($privilege in $privilegesList) {
        if ($privilegeName.StartsWith("prv$privilege")) {
            Write-Host "Privilege found: $privilege for table $($privilegeName.Substring(3 + $privilege.Length))"
            return @($privilege, $privilegeName.Substring(3 + $privilege.Length))
        }
    }
    Write-Host "Privilege does not match known list. Handling as 'prv'."
    return @('prv', $privilegeName.Substring(3))
}

# If using a single file, define the path and initialize content
if ($useSingleFile) {
    $singleFilePath = Join-Path -Path $wikiLocation -ChildPath "AllRolesPrivileges.md"
    $singleFileContent = "# All Roles Privileges`n`n"
    Write-Host "Single file mode enabled. Output will be written to: $singleFilePath"
}

# Iterate through each XML file and generate the Markdown content
foreach ($xmlFile in $xmlFiles) {
    Write-Host "Processing file: $($xmlFile.FullName)"
    [xml]$xmlData = Get-Content -Path $xmlFile.FullName
    $roleName = $xmlData.Role.name
    Write-Host "Processing role: $roleName"

    # Create an empty hashtable to store table data
    $tables = @{}

    # Iterate through each RolePrivilege and organize them by table and privilege
    foreach ($privilege in $xmlData.Role.RolePrivileges.RolePrivilege) {
        $parsed = Convert-PrivilegeName -privilegeName $privilege.name
        $privilegeType = $parsed[0]
        $tableName = $parsed[1]
        $level = $privilege.level

        # Initialize the table row if not present
        if (-not $tables.ContainsKey($tableName)) {
            Write-Host "Creating new entry for table: $tableName"
            $tables[$tableName] = @{}
            foreach ($privilege in ($privilegesList + 'prv')) {
                $tables[$tableName][$privilege] = " - "
            }
        }

        # Set the privilege level for the corresponding privilege type
        Write-Host "Setting privilege $privilegeType for table $tableName to level $level"
        $tables[$tableName][$privilegeType] = $level
    }

    # Generate the Markdown content for the current role
    $markdownContent = "# Role: $roleName`n`n"
    $markdownContent += "Table | " + ($privilegesList + 'prv' -join ' | ') + "`n"
    $markdownContent += "---- " + ($privilegesList + 'prv' | ForEach-Object { "| ---" }) -join ' | ' + "`n"
    $markdownContent += "`n"

    foreach ($tableName in $tables.Keys) {
        $row = "$tableName | "
        $row += ($privilegesList + 'prv' | ForEach-Object { $tables[$tableName][$_] }) -join ' | '
        $markdownContent += $row + "`n"
    }

    # Append content to a single file or write to individual files
    if ($useSingleFile) {
        $singleFileContent += $markdownContent + "`n`n"
    } else {
        # Determine the output file name based on the role name
        $mdFileName = "$roleName-privileges.md"
        $mdFilePath = Join-Path -Path $wikiLocation -ChildPath $mdFileName

        # Write the content to the individual MD file
        $markdownContent | Out-File -FilePath $mdFilePath -Encoding UTF8
        Write-Host "Privileges for $roleName saved in: $mdFilePath"
    }
}

# If using a single file, write all the content to one Markdown file
if ($useSingleFile) {
    $singleFileContent | Out-File -FilePath $singleFilePath -Encoding UTF8
    Write-Host "All roles privileges saved in a single file: $singleFilePath"
}

Write-Host "Processed $($xmlFiles.Count) role files."
