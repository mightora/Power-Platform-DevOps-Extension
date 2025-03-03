[![Visual Studio Marketplace](https://img.shields.io/badge/Marketplace-View%20Extension-blue?logo=visual-studio)](https://marketplace.visualstudio.com/items?itemName=mightoraio.mightora-power-platform-devOps-extension) [![DeepScan grade](https://deepscan.io/api/teams/25106/projects/28110/branches/903222/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=25106&pid=28110&bid=903222) [![vsmarketplace](https://vsmarketplacebadges.dev/version/mightoraio.mightora-power-platform-devOps-extension.svg)](https://marketplace.visualstudio.com/items?itemName=mightoraio.mightora-power-platform-devOps-extension)  
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/mightora/Power-Platform-DevOps-Extension.svg)](http://isitmaintained.com/project/mightora/Power-Platform-DevOps-Extension)  
[![Percentage of issues still open](http://isitmaintained.com/badge/open/mightora/Power-Platform-DevOps-Extension.svg)](http://isitmaintained.com/project/mightora/Power-Platform-DevOps-Extension) 
![Mightora.io](https://img.shields.io/badge/Mightora-Visit-blue?logo=https://raw.githubusercontent.com/mightora/mightora.io/main/static/favicon-32x32.png&link=https://mightora.io)

# Mightora Power Platform Extension
The Mightora Power Platform DevOps Extension is a comprehensive set of tools designed to generate Power Platform Solution Documentation from within an Azure DevOps Pipeline. We have also included some other useful tools within the solution such as the **XML Node Updater** and **XML Node Attribute Updater** allowing advanced users to edit a solution within a release pipeline. Alongside this we have included tools which allow you to connect to **Dataverse for Teams** from Azure DevOps allowing ALM and a handy extension allowing for easy commit to repo from a Pipeline. 

**Created by:**

[![Mightora Logo](https://raw.githubusercontent.com/TechTweedie/techtweedie.github.io/main/static/logo-01_150x150.png)](https://techtweedie.github.io)


# Setup 
- Install the DevOps extension in your DevOps Organization using the **Get it free** button.
- Navigate to your pipeline.
- Add the tasks you want to use to your pipeline.
- Some tasks require PAC to be installed.

# Support
Please visit [mightora.io](https://mightora.io)

# Key features 

## Table Documentation Generator

### Overview
This task automates the documentation of Dataverse entities. It reads files from an unpacked solution and generates Markdown documentation for each table and its attributes.

### Key Features
- **Automated Documentation**: Generates Markdown documentation from Dataverse entity files.
- **Entity and Attribute Details**: Documents each entity's attributes, including names, types, display names, and required levels.
- **Flexible Output**: Choose to generate documentation in a single file or separate files for each entity.
- **Version Control Ready**: The generated Markdown files can be integrated into your version control system.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `locationOfUnpackedSolution`: Path to the folder with the unpacked Dataverse solution.
    - `wikiLocation`: Path where the generated Markdown files will be stored.
    - `useSingleFile`: Choose `true` for a single file or `false` for separate files.
3. Run the pipeline to generate the documentation.

### Example Pipeline Usage

```yaml
- task: documentSolutionTables@1
  inputs:
    locationOfUnpackedSolution: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    wikiLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    useSingleFile: true
```

## Table Relationship Documentation Generator

### Overview
This task documents relationships between Dataverse tables by parsing relationship data from XML files and generating Markdown documentation.

### Key Features
- **Automated Relationship Documentation**: Generates Markdown documentation for table relationships.
- **Relationship Details**: Documents relationship types and cascades.
- **Mermaid Diagrams**: Generates diagrams using Mermaid syntax to visualize relationships.
- **Flexible Output**: Choose to generate a single file or separate files for each table.
- **Version Control Ready**: The documentation can be integrated into your version control system.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `locationOfUnpackedSolution`: Path to the folder with the unpacked Dataverse solution.
    - `wikiLocation`: Path where the generated Markdown files will be stored.
    - `useSingleFile`: Choose `true` for a single file or `false` for separate files.
3. Run the pipeline to generate the documentation.

### Example Pipeline Usage

```yaml
- task: documentTableRelationships@1
  inputs:
    locationOfUnpackedSolution: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    wikiLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    useSingleFile: true
```

## Solution XML Node Attribute Updater

### Overview
This task updates specific attributes in XML solution files using PowerShell, allowing dynamic adjustments without manual editing.

### Key Features
- **Automated XML Updates**: Updates attributes within XML files during pipeline execution.
- **XPath Node Selection**: Uses XPath expressions to select specific XML nodes.
- **Flexible Configuration**: Input the file path, node XPath, attribute name, and new value.
- **Improves Automation**: Ideal for automating configuration changes or version updates.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `XmlFilePath`: Path to the XML file to modify.
    - `NodeXPath`: XPath expression to locate the XML node.
    - `attributeName`: Name of the attribute to modify.
    - `NewValue`: New value for the attribute.
3. Run the pipeline to update the XML file.

### Example Pipeline Usage

```yaml
- task: solutionXMLNodeAttributeUpdater@1
  inputs:
    xmlFilePath: "$(Build.SourcesDirectory)/Solutions/MySolution/Entity.xml"
    nodeXPath: "/Entity/Attributes/Attribute[@Name='DisplayName']"
    attributeName: "DisplayName"
    newValue: "NewDisplayName"
```

## Solution XML Node Updater

### Overview
This task updates specific XML nodes within Power Platform solution files, allowing dynamic adjustments during pipeline runs.

### Key Features
- **Automated Node Updates**: Updates values of specific XML nodes during pipeline execution.
- **Precise Node Selection**: Uses XPath expressions to locate and modify nodes.
- **Flexible and Dynamic**: Allows dynamic updates to XML nodes.
- **Streamlined Automation**: Ideal for build and release pipelines.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `XmlFilePath`: Path to the XML file with the node to update.
    - `NodeXPath`: XPath expression to locate the XML node.
    - `NewValue`: New value for the node.
3. Run the pipeline to update the XML node.

### Example Pipeline Usage

```yaml
- task: solutionXMLNodeUpdater@1
  inputs:
    xmlFilePath: "$(Build.SourcesDirectory)/Solutions/MySolution/Entity.xml"
    nodeXPath: "/Entity/Attributes/Attribute[@Name='Description']"
    newValue: "Updated description"
```


## Dataverse 4 Teams Export

### Overview
This task exports and unpacks solutions from a Dataverse for Teams environment, automating the process and allowing easy management and versioning of Power Platform assets.

### Key Features
- **Solution Export**: Automates the export of a solution from Dataverse for Teams.
- **Canvas App Unpacking**: Unpacks `.msapp` files for version control and customization.
- **Solution Settings Template**: Generates a settings template file.
- **PAC CLI Integration**: Uses the Power Platform CLI for authentication and solution operations.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `solutionName`: Name of the solution to export.
    - `exportDirectory`: Directory to save the exported solution.
    - `unpackDirectory`: Directory to unpack the solution.
    - `environment`: URL of the Dataverse for Teams environment.
3. Ensure PAC CLI is installed in your pipeline environment.
4. Run the pipeline to export and unpack the solution.

### Example Pipeline Usage

```yaml
- task: dataverse4TeamsExport@1
  inputs:
    solutionName: "MySolution"
    exportDirectory: "$(Build.ArtifactStagingDirectory)/ExportedSolutions"
    unpackDirectory: "$(Build.ArtifactStagingDirectory)/UnpackedSolutions"
    environment: "https://your-environment-url"
```

## Commit To Git Repository

### Overview
This task automates committing changes made during a pipeline run to your Git repository, ensuring everything is pushed automatically.

### Key Features
- **Automated Git Commits**: Stages and commits all modifications to the Git repository.
- **Secure Authentication**: Uses the pipeline's `System.AccessToken` for authentication.
- **Customizable Commit Message**: Specify a commit message via the task's input parameters.
- **Flexible Configuration**: Set up Git configurations like user email and name.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Specify the commit message using the `commitMsg` input.
3. Ensure your pipeline has the `System.AccessToken` variable enabled.
4. Run the pipeline to commit and push changes to the repository.

### Example Pipeline Usage

```yaml
- task: commitToRepo@1
  inputs:
    commitMsg: "Automated commit from pipeline"
```