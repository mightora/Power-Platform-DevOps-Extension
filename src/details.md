# Mightora Power Platform DevOps Extension
The Mightora Power Platform DevOps Extension is a comprehensive set of tools designed to maximize the capabilities of Azure DevOps and the Power Platform and empowering developers to leverage low-code solutions. This extension provides seamless integration with Dataverse and Dataverse for Teams, enabling users to automate essential development tasks and streamline the management of Power Platform solutions within DevOps pipelines.

# Roadmap

# Setup 
- Install the DevOps extension in your DevOps Orginsation using the **Get it free** button.
- Navigate to your pipeline
- Add the Tasks to your pipeline that you wish to use. 
- Some tasks require PAC to be installed. 

# Support
Please go to [mightora.io](https://mightora.io)

# Key features of the Mightora Power Platform DevOps Extension include:

## Mightora Power Platform Table Documentation Generator

### Overview
The **Mightora Power Platform Table Documentation Generator** task automates the process of documenting Dataverse entities. By parsing `Entity.xml` files from an unpacked solution, it extracts key information about each table (entity) and its attributes, generating clear and concise Markdown documentation. This task is perfect for organizations that need detailed documentation of their Dataverse schema, ensuring that entity properties and configurations are well-documented and easily accessible.

### Key Features
- **Automated Documentation**: Automatically generates Markdown documentation from Dataverse entity files, saving you time and effort.
- **Entity and Attribute Details**: Documents each entity's attributes, including their names, types, display names, and required levels.
- **Flexible Output**: Choose between generating documentation in a single file or creating individual files for each entity, based on your preference.
- **Ready for Version Control**: The generated Markdown files can be easily integrated into your version control system for ongoing management.

### How to Use
1. **Set Up the Task**: Add the **Mightora Power Platform Table Documentation Generator** task to your Azure DevOps pipeline.
2. **Configure the Inputs**:
    - `locationOfUnpackedSolution`: The path to the folder containing the unpacked Dataverse solution with `Entity.xml` files.
    - `wikiLocation`: The path where the generated Markdown files will be stored. If the directory does not exist, the task will create it.
    - `useSingleFile`: Choose `true` to output all entity documentation into a single file, or `false` to create a separate file for each entity.
3. **Run the Pipeline**: Upon execution, the task will generate Markdown documentation for all entities and their attributes, saving the output to the specified location.

### When to Use
- **Documenting Dataverse Solutions**: Use this task to generate documentation for any Dataverse solution, making it easy to understand entity structures and configurations.
- **Version Control and Auditing**: Incorporate the generated Markdown documentation into your repository for tracking schema changes over time.
- **Knowledge Sharing**: Provide your team with up-to-date, readable documentation of your Dataverse entities, enabling better collaboration and understanding of your data model.

### Example Pipeline Usage

```yaml
- task: documentSolutionTables@1
  inputs:
    locationOfUnpackedSolution: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    wikiLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    useSingleFile: true
```
This setup will generate a single Markdown file containing the documentation for all entities in the unpacked solution, saved to the specified WikiDocs directory.

## Mightora Power Platform Table Relationship Documentation Generator

### Overview
The **Mightora Power Platform Table Relationship Documentation Generator** task simplifies the process of documenting relationships between Dataverse tables. By automatically parsing relationship data from XML files, this task generates Markdown documentation that outlines the relationships between entities, such as one-to-many, many-to-one, and many-to-many relationships. Additionally, it visualizes these relationships with a diagram in the documentation.

### Key Features
- **Automated Relationship Documentation**: Automatically generates detailed Markdown documentation for relationships between tables in Dataverse.
- **Relationship Details**: Documents relationship types (one-to-many, many-to-one, etc.) and cascades, providing a clear overview of the data structure.
- **Mermaid Diagrams**: Generates diagrams using Mermaid syntax to visualize table relationships in the Markdown output.
- **Flexible Output**: Choose between generating a single file for all relationships or creating individual files for each table.
- **Ready for Version Control**: The generated documentation can be easily integrated into your version control system, ensuring your relationship structure is well-documented and up-to-date.

### How to Use
1. **Set Up the Task**: Add the **Mightora Power Platform Table Relationship Documentation Generator** task to your Azure DevOps pipeline.
2. **Configure the Inputs**:
    - `locationOfUnpackedSolution`: The path to the folder containing the unpacked Dataverse solution with relationship XML files.
    - `wikiLocation`: The path where the generated Markdown files will be stored. If the directory does not exist, the task will create it.
    - `useSingleFile`: Choose `true` to output all relationship documentation into a single file, or `false` to create a separate file for each table.
3. **Run the Pipeline**: Upon execution, the task will parse the XML files, generate Markdown documentation, and save it to the specified location.

### When to Use
- **Documenting Table Relationships**: Use this task to generate clear documentation for table relationships within a Dataverse solution, helping developers and administrators understand the data model.
- **CI/CD Pipelines**: Automate the generation of relationship documentation during continuous integration and deployment processes.
- **Knowledge Sharing**: Ensure your team has access to up-to-date documentation on how tables within Dataverse relate to one another, promoting better understanding and collaboration.

### Example Pipeline Usage

```yaml
- task: documentTableRelationships@1
  inputs:
    locationOfUnpackedSolution: "$(Build.ArtifactStagingDirectory)/UnpackedSolution"
    wikiLocation: "$(Build.ArtifactStagingDirectory)/WikiDocs"
    useSingleFile: true
```

This setup will generate a single Markdown file containing the documentation for all table relationships in the unpacked solution, saved to the specified WikiDocs directory.


## Mightora Power Platform Solution XML Node Attribute Updater

### Overview
The **Mightora Power Platform Solution XML Node Attribute Updater** task simplifies the modification of XML solution files within your DevOps pipeline. By leveraging PowerShell to update specific node attributes, it allows you to dynamically adjust configuration values or other key attributes without manual editing. This task is particularly useful in scenarios where XML configurations need to be modified before deploying or packaging solutions in the Power Platform.

### Key Features
- **Automated XML Updates**: Dynamically updates attributes within XML files during the pipeline execution, reducing the need for manual changes.
- **XPath Node Selection**: Allows precise selection of XML nodes using XPath expressions, ensuring that only the intended nodes are modified.
- **Flexible Configuration**: Input the file path, node XPath, attribute name, and new value to make specific updates as needed.
- **Improves Automation**: Ideal for automating configuration changes or version updates within Power Platform solution XML files.

### How to Use
1. **Set Up the Task**: Add the **Mightora Power Platform Solution XML Node Attribute Updater** task to your Azure DevOps pipeline.
2. **Configure the Inputs**:
    - `XmlFilePath`: The full path to the XML file that you wish to modify.
    - `NodeXPath`: The XPath expression to locate the specific XML node whose attribute will be updated.
    - `attributeName`: The name of the attribute you wish to modify.
    - `NewValue`: The new value to assign to the specified attribute.
3. **Run the Pipeline**: Once configured, the task will locate the node, update the specified attribute, and save the changes to the XML file.

### When to Use
- **Dynamically Modify Solution Files**: Use this task to automatically update attributes in Power Platform solution files, such as adjusting version numbers or configuration settings.
- **Pre-Deployment Configuration**: Make necessary changes to XML configurations before deploying solutions to different environments.
- **CI/CD Pipelines**: Ideal for continuous integration and deployment scenarios where solutions need to be modified automatically as part of the build or release process.

### Example Pipeline Usage

```yaml
- task: solutionXMLNodeAttributeUpdater@1
  inputs:
    xmlFilePath: "$(Build.SourcesDirectory)/Solutions/MySolution/Entity.xml"
    nodeXPath: "/Entity/Attributes/Attribute[@Name='DisplayName']"
    attributeName: "DisplayName"
    newValue: "NewDisplayName"
```
This setup will locate the node with the DisplayName attribute in the Entity.xml file and update its value to NewDisplayName.

## Mightora Power Platform Solution XML Node Updater

### Overview
The **Mightora Power Platform Solution XML Node Updater** task automates the process of modifying specific XML nodes within Power Platform solution files. This is ideal for scenarios where you need to dynamically adjust configuration values or other key node content during your DevOps pipeline runs. By providing the XML file path, node XPath, and the new value, you can update solution components without manual intervention.

### Key Features
- **Automated Node Updates**: Automatically updates the values of specific XML nodes during the pipeline execution, reducing manual editing.
- **Precise Node Selection**: Uses XPath expressions to locate and modify the exact node you need to update within your XML file.
- **Flexible and Dynamic**: Allows for dynamic updates to XML nodes, such as changing configuration values or other node content in solution files.
- **Streamlined Automation**: Ideal for build and release pipelines where XML modifications are needed before deployment.

### How to Use
1. **Set Up the Task**: Add the **Mightora Power Platform Solution XML Node Updater** task to your Azure DevOps pipeline.
2. **Configure the Inputs**:
    - `XmlFilePath`: The path to the XML file that contains the node you wish to update.
    - `NodeXPath`: The XPath expression to locate the specific XML node whose value will be updated.
    - `NewValue`: The new value to assign to the selected node.
3. **Run the Pipeline**: Once configured, the task will update the XML node with the specified value and save the changes to the file.

### When to Use
- **Dynamically Modify Solution Files**: Use this task to automatically update node values in Power Platform solution files, such as changing configuration settings.
- **Pre-Deployment Configuration**: Modify necessary XML node values before deploying solutions to various environments.
- **CI/CD Pipelines**: Automate updates to solution files as part of continuous integration and deployment processes.

### Example Pipeline Usage

```yaml
- task: solutionXMLNodeUpdater@1
  inputs:
    xmlFilePath: "$(Build.SourcesDirectory)/Solutions/MySolution/Entity.xml"
    nodeXPath: "/Entity/Attributes/Attribute[@Name='Description']"
    newValue: "Updated description"
```
This setup will locate the node with the Description attribute in the Entity.xml file and update its value to Updated description.

## Mightora Power Platform Dataverse 4 Teams Export

### Overview
The **Mightora Power Platform Dataverse 4 Teams Export** task simplifies the process of exporting and unpacking solutions from a Dataverse for Teams environment. It automates everything from exporting the solution to unpacking Canvas Apps and creating a solution settings template, allowing you to easily manage and version your Power Platform assets as part of your DevOps pipeline.

### Key Features
- **Solution Export**: Automates the export of a solution from a Dataverse for Teams environment with ease.
- **Canvas App Unpacking**: Unpacks all `.msapp` files in the solution to allow for version control and customization.
- **Solution Settings Template**: Generates a solution settings template file, helping you manage configurations for future deployments.
- **PAC CLI Integration**: Leverages the Power Platform CLI (PAC CLI) for seamless authentication and solution operations. Ensure PAC CLI is installed in your pipeline for the task to function correctly.

### How to Use
1. **Set Up the Task**: In your Azure DevOps pipeline, add the **Mightora Power Platform Dataverse 4 Teams Export** task to your job.
2. **Configure the Input Parameters**:
    - `solutionName`: The name of the solution you want to export.
    - `exportDirectory`: The directory where the exported solution will be saved.
    - `unpackDirectory`: The directory where the solution will be unpacked for further customization.
    - `environment`: The environment URL of the Dataverse for Teams instance.
3. **Install PAC CLI**: Ensure that the PAC CLI is installed in your pipeline environment before running the task.
4. **Run the Pipeline**: The task will authenticate with the specified Dataverse environment, export the solution, generate a settings template, and unpack the solution, including Canvas Apps.

### When to Use
- **Version Control for Power Platform Solutions**: Export and unpack solutions as part of your version control strategy, enabling you to track changes over time.
- **CI/CD Pipelines**: Automate the process of exporting and deploying Dataverse for Teams solutions in continuous integration and delivery pipelines.
- **Customization Management**: Easily manage and customize exported Canvas Apps and other solution components for re-deployment or updates.

### Example Pipeline Usage

```yaml
- task: dataverse4TeamsExport@1
  inputs:
    solutionName: "MySolution"
    exportDirectory: "$(Build.ArtifactStagingDirectory)/ExportedSolutions"
    unpackDirectory: "$(Build.ArtifactStagingDirectory)/UnpackedSolutions"
    environment: "https://your-environment-url"
```
This setup will export the solution named "MySolution," save it to the specified directory, unpack it for customization, and generate the necessary settings templates for future deployment.


## Mightora Commit To Git Repository

### Overview
The **Mightora Commit To Git Repository** task automates the process of committing changes made during a pipeline run to your Git repository. Whether you’re updating documentation, modifying code, or adding new files as part of your build process, this task ensures that everything is pushed to your repository automatically. 

### Key Features
- **Automated Git Commits**: No need to manually commit changes. This task stages and commits all modifications to the Git repository.
- **Secure Authentication**: The task leverages the pipeline's `System.AccessToken` variable for secure authentication, ensuring that your commits are authenticated.
- **Customizable Commit Message**: You can easily specify a commit message via the task's input parameters, making your version history clear and meaningful.
- **Flexible Configuration**: Set up Git configurations like user email and name, or fall back on default values if the information isn't available in your pipeline variables.

### How to Use
1. **Set Up the Task**: In your Azure DevOps pipeline, add the **Mightora Commit To Git Repository** task to your job.
2. **Specify the Commit Message**: Use the `commitMsg` input to provide a meaningful description for the changes being committed.
3. **Access Token Configuration**: Ensure your pipeline has the `System.AccessToken` variable enabled. This is required to authenticate your push to the repository.
4. **Run the Pipeline**: Upon executing the pipeline, the task will automatically stage, commit, and push the changes to the Git repository using the specified commit message.

### When to Use
- **Continuous Integration/Continuous Deployment (CI/CD)**: Automate commits for changes made during build or release jobs.
- **Documentation Updates**: Automatically commit and push documentation or config changes created during the pipeline run.
- **Tracking Build Artifacts**: Keep track of changes in generated files, such as versioned binaries or build logs, by committing them directly to your repository.

### Example Pipeline Usage

```yaml
- task: commitToRepo@1
  inputs:
    commitMsg: "Automated commit from pipeline"
```

This setup will stage all changes, commit them with the specified message, and push them to your repository using secure credentials.


