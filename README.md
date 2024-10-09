# Power-Platform-DevOps-Extension
[![Visual Studio Marketplace](https://img.shields.io/badge/Marketplace-View%20Extension-blue?logo=visual-studio)](https://marketplace.visualstudio.com/items?itemName=mightoraio.mightora-power-platform-devOps-extension) [![DeepScan grade](https://deepscan.io/api/teams/25106/projects/28110/branches/903222/badge/grade.svg)](https://deepscan.io/dashboard#view=project&tid=25106&pid=28110&bid=903222) [![vsmarketplace](https://vsmarketplacebadges.dev/version/mightoraio.mightora-power-platform-devOps-extension.svg)](https://marketplace.visualstudio.com/items?itemName=mightoraio.mightora-power-platform-devOps-extension)  [![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/mightora/Power-Platform-DevOps-Extension.svg)](http://isitmaintained.com/project/mightora/Power-Platform-DevOps-Extension)  [![Percentage of issues still open](http://isitmaintained.com/badge/open/mightora/Power-Platform-DevOps-Extension.svg)](http://isitmaintained.com/project/mightora/Power-Platform-DevOps-Extension)

This repository contains the Mightora Power Platform DevOps Extension, a set of tasks that streamline development, deployment, and management of Power Platform solutions. Automating solution export, documentation, and XML updates, it integrates seamlessly with Azure DevOps to optimize Power Platform development workflows.

# Mightora Power Platform DevOps Extension

## Overview

The **Mightora Power Platform DevOps Extension** is a collection of pipeline tasks designed to automate and streamline the development, deployment, and management of Power Platform solutions. These tasks enable seamless integration with Azure DevOps, simplifying key processes such as solution export, table documentation, XML node updates, and more.

With this extension, Power Platform developers can automate their workflows, reduce manual intervention, and enhance efficiency across their CI/CD pipelines.

## Features

- **Commit to Git Repository**: Automatically commit pipeline changes to your Git repository for version control.
- **Dataverse for Teams Solution Export**: Export solutions from Dataverse for Teams, unpack Canvas Apps, and generate solution settings templates.
- **Table Documentation Generator**: Generate Markdown documentation for Dataverse entities, including detailed information on attributes and properties.
- **Table Relationship Documentation Generator**: Document relationships between Dataverse tables and generate relationship diagrams using Mermaid.
- **Solution XML Node Attribute Updater**: Dynamically update specific XML node attributes for solution components.
- **Solution XML Node Updater**: Modify XML node values using XPath expressions during the pipeline execution.

## Getting Started

To get started, add the tasks provided by the **Mightora Power Platform DevOps Extension** to your Azure DevOps pipeline. 
[![Visual Studio Marketplace](https://img.shields.io/badge/Marketplace-View%20Extension-blue?logo=visual-studio)](https://marketplace.visualstudio.com/items?itemName=mightoraio.mightora-power-platform-devOps-extension)

## Usage

Add the tasks to your Azure DevOps pipeline YAML file like so:

```yaml
- task: solutionXMLNodeUpdater@1
  inputs:
    xmlFilePath: "$(Build.SourcesDirectory)/Solutions/MySolution/Entity.xml"
    nodeXPath: "/Entity/Attributes/Attribute[@Name='DisplayName']"
    newValue: "UpdatedDisplayName"
This example demonstrates how to update the DisplayName attribute in an XML file as part of your build or release pipeline.
```

## Contributions
We welcome contributions to improve the Mightora Power Platform DevOps Extension. If you find a bug, have suggestions for new features, or would like to contribute in any way, feel free to open an issue or submit a pull request. All contributions are greatly appreciated and will help make this project even better.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact
For more information or support, please visit [https://mightora.io](https://mightora.io) or open an issue in this repository.
