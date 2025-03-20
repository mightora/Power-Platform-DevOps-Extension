const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const tl = require('azure-pipelines-task-lib/task');

function run() {
    try {
        const locationOfMDFiles = tl.getInput('locationOfMDFiles', true);
        const outputLocation = tl.getInput('outputLocation', true);
        const templateFile = tl.getInput('templateFile', false);
        const includeTOC = tl.getBoolInput('includeTOC', false);
        const tocDepth = tl.getInput('tocDepth', false);

        console.log(`Location of MD Files: ${locationOfMDFiles}`);
        console.log(`Output Location: ${outputLocation}`);
        if (templateFile) {
            console.log(`Template File: ${templateFile}`);
        }
        console.log(`Include TOC: ${includeTOC}`);
        if (includeTOC) {
            console.log(`TOC Depth: ${tocDepth}`);
        }

        // Ensure output directory exists
        if (!fs.existsSync(outputLocation)) {
            fs.mkdirSync(outputLocation, { recursive: true });
        }

        // Install necessary tools
        console.log('Installing pandoc...');
        execSync('choco install pandoc -y', { stdio: 'inherit' });

        console.log('Installing mermaid-cli...');
        execSync('npm install -g @mermaid-js/mermaid-cli', { stdio: 'inherit' });

        console.log('Installing plantuml...');
        execSync('choco install plantuml -y', { stdio: 'inherit' });

        console.log('Installing imagemagick...');
        execSync('choco install imagemagick -y', { stdio: 'inherit' });

        // Function to recursively process directories
        function processDirectory(currentDir, outputDir) {
            const items = fs.readdirSync(currentDir);

            items.forEach(item => {
                const itemPath = path.join(currentDir, item);
                const itemOutputPath = path.join(outputDir, item);

                if (fs.statSync(itemPath).isDirectory()) {
                    // Ensure the output directory exists
                    if (!fs.existsSync(itemOutputPath)) {
                        fs.mkdirSync(itemOutputPath, { recursive: true });
                    }
                    // Recursively process the subdirectory
                    processDirectory(itemPath, itemOutputPath);
                } else if (item.endsWith('.md')) {
                    // Process the Markdown file
                    processMarkdownFile(itemPath, itemOutputPath.replace(/\.md$/, '.docx'));
                }
            });
        }

        // Function to process a single Markdown file
        function processMarkdownFile(mdFilePath, docxFilePath) {
            const diagramsDir = path.join(path.dirname(docxFilePath), 'diagrams');

            // Ensure diagrams directory exists
            if (!fs.existsSync(diagramsDir)) {
                fs.mkdirSync(diagramsDir, { recursive: true });
            }

            // Read the Markdown content
            const mdContent = fs.readFileSync(mdFilePath, 'utf8');

            console.log(`====================================================================================================`);
            console.log(`Converting ${mdFilePath} to ${docxFilePath}`);
            console.log(`====================================================================================================`);

            // Convert Mermaid diagrams to images
            let updatedMdContent = mdContent.replace(/(```|:::)(mermaid)([\s\S]*?)(```|:::)/g, (match, p1, p2, p3, p4, offset) => {
                console.log(`=== Convert Mermaid Diagram ===`);
                const mermaidFilePath = path.join(diagramsDir, `diagram-${offset}.mmd`);
                fs.writeFileSync(mermaidFilePath, p3.trim());
                const pngFilePath = mermaidFilePath.replace('.mmd', '.png');
                console.log(`Generating Mermaid diagram: ${mermaidFilePath}`);
                execSync(`mmdc -i ${mermaidFilePath} -o ${pngFilePath} --theme default`);
                console.log(`Generated Mermaid diagram: ${pngFilePath}`);
                console.log(`=== Next Diagram ===`);
                return `![Mermaid Diagram](${pngFilePath})`;
            });

            // Ensure all Mermaid diagrams are generated before moving on to PlantUML
            console.log(`All Mermaid diagrams generated for ${mdFilePath}`);

            // Convert PlantUML diagrams to images
            updatedMdContent = updatedMdContent.replace(/```plantuml([\s\S]*?)```/g, (match, p1, offset) => {
                console.log(`=== Convert PlantUML Diagram ===`);
                const plantUmlFilePath = path.join(diagramsDir, `diagram-${offset}.puml`);
                fs.writeFileSync(plantUmlFilePath, p1.trim());
                console.log(`Generated PlantUML file: ${plantUmlFilePath}`);
                const pngFilePath = plantUmlFilePath.replace('.puml', '.png');
            
                const maxRetries = 3;
                let attempt = 0;
                let success = false;
            
                while (attempt < maxRetries && !success) {
                    try {
                        execSync(`plantuml ${plantUmlFilePath}`);
                        console.log(`Generated PlantUML diagram for file: ${plantUmlFilePath}`);
                        console.log(`Generated PlantUML diagram: ${pngFilePath}`);
                        success = true;
                    } catch (error) {
                        console.error(`Attempt ${attempt + 1} failed: ${error.message}`);
                        attempt++;
                        if (attempt < maxRetries) {
                            console.log('Retrying...');
                        } else {
                            console.error('Max retries reached. Failed to generate PlantUML diagram.');
                        }
                    }
                }

                // Ensure the file system has caught up
                if (success) {
                    let fileExists = false;
                    for (let i = 0; i < 5; i++) {
                        if (fs.existsSync(pngFilePath)) {
                            fileExists = true;
                            break;
                        }
                        console.log(`Waiting for file system to catch up...`);
                        execSync('sleep 1');
                    }
                    if (!fileExists) {
                        console.error(`Image file does not exist after retries: ${pngFilePath}`);
                        success = false;
                    }
                }

                console.log(`=== Next Diagram ===`);
                return success ? `![PlantUML Diagram](${pngFilePath})` : match;
            });

            // Ensure all PlantUML diagrams are generated before moving on to writing the Markdown to a temporary file
            console.log(`All PlantUML diagrams generated for ${mdFilePath}`);

            // Write the updated Markdown content to a temporary file
            const tempMdFileName = `z-temp-${path.basename(mdFilePath).replace(/\s+/g, '_')}`;
            const tempMdFilePath = path.join(path.dirname(docxFilePath), tempMdFileName);
            console.log(`Writing temporary Markdown file: ${tempMdFilePath}`);
            fs.writeFileSync(tempMdFilePath, updatedMdContent);

            // Read the temporary Markdown file content
            let tempMdContent = fs.readFileSync(tempMdFilePath, 'utf8');

            // Update image paths to be fully qualified
            console.log(`Updating Image Paths in Markdown file...`);
            tempMdContent = tempMdContent.replace(/!\[([^\]]*)\]\(([^)]+)\)/g, (match, altText, imgPath) => {
                console.log(`Found image path: ${imgPath}`);
                if (!imgPath.startsWith('http')) {
                    const fullPath = path.resolve(path.dirname(mdFilePath), imgPath);
                    if (fs.existsSync(fullPath)) {
                        console.log(`Updated image path to: ${fullPath}`);
                        return `![${altText}](${fullPath})`;
                    } else {
                        console.error(`Image file does not exist: ${fullPath}`);
                    }
                }
                return match;
            });

            // Write the updated content back to the temporary file
            fs.writeFileSync(tempMdFilePath, tempMdContent);

            // Convert the Markdown file to DOCX using pandoc
            console.log(`Converting ${tempMdFilePath} to ${docxFilePath}`);
            let pandocCommand = `pandoc -f markdown ${tempMdFilePath} -o ${docxFilePath}`;
            if (templateFile) {
                pandocCommand += ` --reference-doc=${templateFile}`;
                console.log(`Using template file: ${templateFile}`);
            }
            if (includeTOC) {
                pandocCommand += ` --toc --toc-depth=${tocDepth}`;
                console.log(`Including TOC with depth: ${tocDepth}`);
            }
            execSync(pandocCommand, { cwd: path.dirname(mdFilePath) });

            // Comment out the cleanup of the temporary file
            fs.unlinkSync(tempMdFilePath);

            console.log(`Converted ${mdFilePath} to ${docxFilePath}`);
            
            console.log(`====================================================================================================`);
        }

        // Start processing from the root directory
        processDirectory(locationOfMDFiles, outputLocation);

    } catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();