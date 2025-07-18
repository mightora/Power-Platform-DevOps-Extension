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


## ER Diagram Generator

### Overview
This task automates the process of documenting Dataverse table relationships using Entity-Relationship diagrams. It generates comprehensive visual documentation that shows the relationships between tables in an easy-to-understand diagram format.

### Key Features
- **Visual Relationship Documentation**: Creates ER diagrams to visualize table relationships.
- **Automated Documentation**: Parses relationship data from XML files automatically.
- **Comprehensive Coverage**: Documents one-to-many, many-to-one, and many-to-many associations.
- **Professional Output**: Generates clean, professional diagrams for documentation.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `locationOfUnpackedSolution`: Path to the folder with the unpacked Dataverse solution.
    - `wikiLocation`: Path where the generated documentation will be stored.
    - `authors`: List of Power Platform authors (comma separated).
3. Run the pipeline to generate the ER diagrams.

### Example Pipeline Usage

```yaml
- task: mightora-powerplatform-documentationgenerator-erdiagram@1
  inputs:
    locationOfUnpackedSolution: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    wikiLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    authors: "Author1, Author2"
```

## Option Sets Documentation Generator

### Overview
This task generates comprehensive documentation for Power Platform Option Sets, extracting and documenting all information including metadata, values, and descriptions.

### Key Features
- **Complete Option Sets Documentation**: Documents all Option Sets in your solution.
- **Metadata Extraction**: Captures Option Set values, descriptions, and metadata.
- **Automated Processing**: Processes Option Sets from unpacked solution files.
- **Tracking Capabilities**: Perfect for tracking Option Sets across environments.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `unpackedSolutionPath`: Path to the unpacked solution folder.
    - `outputLocation`: Path to save the generated documentation.
3. Run the pipeline to generate Option Sets documentation.

### Example Pipeline Usage

```yaml
- task: mightoraDocumentOptionSets@1
  inputs:
    unpackedSolutionPath: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    outputLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
```

## Roles Documentation Generator

### Overview
This task simplifies the process of creating documentation for role permissions in Dataverse. It automatically creates easy-to-read tables in Markdown format from role XML files.

### Key Features
- **Role Permissions Documentation**: Documents all role permissions and access levels.
- **Security Management**: Makes it easier to review and manage role permissions.
- **Flexible Output**: Choose between single file or separate files for each role.
- **Organized Documentation**: Ensures documentation is accessible for security management.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `locationOfUnpackedSolution`: Path to the unpacked solution folder.
    - `wikiLocation`: Path where the generated documentation will be stored.
    - `useSingleFile`: Choose `true` for single file or `false` for separate files.
3. Run the pipeline to generate roles documentation.

### Example Pipeline Usage

```yaml
- task: documentRoles@1
  inputs:
    locationOfUnpackedSolution: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    wikiLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    useSingleFile: true
```

## Workflows Documentation Generator (Preview)

### Overview
This task generates comprehensive documentation for Power Platform Workflows and Power Automate Flows, including triggers, parameters, states, and execution settings.

### Key Features
- **Comprehensive Workflow Documentation**: Documents workflows and Power Automate flows.
- **Visual Diagrams**: Creates PlantUML diagrams for Power Automate flows.
- **Detailed Information**: Captures triggers, parameters, states, and execution settings.
- **Individual Documentation**: Creates separate markdown files for each flow.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `solutionPath`: Path to the solution source folder containing workflow files.
    - `outputLocation`: Path to save the generated documentation.
    - `includeDetails`: Set to `true` to include detailed information.
3. Run the pipeline to generate workflows documentation.

### Example Pipeline Usage

```yaml
- task: mightoraDocumentWorkflows@1
  inputs:
    solutionPath: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    outputLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    includeDetails: true
```

## Solution Manifest Documentation Generator

### Overview
This task generates documentation for Power Platform solution manifests, providing detailed information about solution components and configurations.

### Key Features
- **Solution Manifest Documentation**: Documents solution.xml files automatically.
- **Component Details**: Includes information about solution components.
- **Configuration Documentation**: Captures solution settings and metadata.
- **Version Tracking**: Helps track solution changes across environments.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `solutionXmlPath`: Path to the Solution.xml file in the src/Other/ folder.
    - `outputLocation`: Path where the generated documentation will be stored.
    - `includeComponents`: Set to `true` to include component details.
3. Run the pipeline to generate solution manifest documentation.

### Example Pipeline Usage

```yaml
- task: documentSolutionManifest@1
  inputs:
    solutionXmlPath: "$(Build.ArtifactStagingDirectory)/UnpackedSolution/src/Other/Solution.xml"
    outputLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    includeComponents: true
```

## Convert Inline Diagrams to Images

### Overview
This task converts inline diagrams in Markdown files to images, making documentation more accessible and compatible with various documentation platforms.

### Key Features
- **Diagram Conversion**: Converts inline diagrams to image format.
- **Documentation Enhancement**: Makes diagrams viewable in platforms that don't support inline diagrams.
- **Automated Processing**: Processes all Markdown files in a directory.
- **Image Generation**: Creates separate image files for diagrams.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `locationOfSourceMDFiles`: Directory containing the Markdown files.
    - `outputLocation`: Directory where images and new MD files will be saved.
3. Run the pipeline to convert diagrams to images.

### Example Pipeline Usage

```yaml
- task: convertConvertInlineDiagrams@1
  inputs:
    locationOfSourceMDFiles: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    outputLocation: "$(Build.ArtifactStagingDirectory)/ProcessedDocs"
```

## Convert Markdown to DOCX

### Overview
This task converts Markdown documentation files to DOCX format, enabling easy sharing and distribution of documentation in Microsoft Word format.

### Key Features
- **Format Conversion**: Converts Markdown files to DOCX format.
- **Template Support**: Supports custom DOCX templates for consistent formatting.
- **Bulk Processing**: Processes multiple Markdown files at once.
- **Professional Output**: Creates polished Word documents for distribution.

### How to Use
1. Add the task to your Azure DevOps pipeline.
2. Configure the inputs:
    - `locationOfMDFiles`: Directory containing the Markdown files.
    - `outputLocation`: Directory where DOCX files will be saved.
    - `templateFile`: Path to a DOCX template file (optional).
3. Run the pipeline to convert Markdown to DOCX.

### Example Pipeline Usage

```yaml
- task: convertMarkdownToDocx@1
  inputs:
    locationOfMDFiles: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    outputLocation: "$(Build.ArtifactStagingDirectory)/DocxDocs"
    templateFile: "$(Build.SourcesDirectory)/Templates/template.docx"
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

## Deprecated and Removed Tasks

### Dataverse for Teams Export and Import
**Status: REMOVED**
These tasks have been removed as the underlying PAC commands have stopped working with the deprecation of Dataverse for Teams functionality.

### Test Task
**Status: DEPRECATED**
The test task is used for internal development and testing purposes only and should not be used in production pipelines.