<#
    ===========================================================
    Task: Mightora Power Platform Solution XML Node Updater
    
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
Write-Host "Task: Mightora Power Platform Solution XML Node Updater"
Write-Host "Originally Created By: Ian Tweedie [https://iantweedie.biz] (Date: 2024-10-08)"
Write-Host "Contributors:"
#Write-Host " - Developer A (Contributions: Improved Git configuration handling)"
#Write-Host " - Developer B (Contributions: Added support for custom commit messages)"
Write-Host "==========================================================="


# Get inputs from the task
$xmlFilePath = Get-VstsInput -Name 'xmlFilePath'
$nodeXPath = Get-VstsInput -Name 'nodeXPath'
$newValue = Get-VstsInput -Name 'newValue'


Write-Output "Working Directory: $(Get-Location)"

cd $env:Build_SourcesDirectory

Write-Output "Working Directory Updated to: $(Get-Location)"

function Update-XmlNode {
    param (
        [string]$XmlFilePath,
        [string]$NodeXPath,
        [string]$NewValue
    )

    # Load the XML file
    Write-Host "Loading XML file: $XmlFilePath"
    $xml = New-Object System.Xml.XmlDocument
    $xml.Load($XmlFilePath)

    # Select the node
    Write-Host "Selecting node with XPath: $NodeXPath"
    $node = $xml.SelectSingleNode($NodeXPath)

    if ($node -ne $null) {
        # Update the node value
        Write-Host "Updating node value to: $NewValue"
        $node.InnerText = $NewValue

        # Save the XML file
        Write-Host "Saving changes to XML file"
        $xml.Save($XmlFilePath)
        
        Write-Host "Update completed successfully."
    }
    else {
        Write-Host "Node not found."
    }
}

# Call the function with the parameters
Update-XmlNode -XmlFilePath $xmlFilePath -NodeXPath $nodeXPath -NewValue $newValue