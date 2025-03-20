const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const tl = require('azure-pipelines-task-lib/task');

function getAllMarkdownFiles(dir, fileList = []) {
    const files = fs.readdirSync(dir);
    files.forEach(file => {
        const filePath = path.join(dir, file);
        if (fs.statSync(filePath).isDirectory()) {
            getAllMarkdownFiles(filePath, fileList);
        } else if (file.endsWith('.md')) {
            fileList.push(filePath);
        }
    });
    return fileList;
}

function run() {
    try {
        const locationOfMDFiles = tl.getInput('locationOfSourceMDFiles', true);
        const outputLocation = tl.getInput('outputLocation', true);

        console.log(`Location of MD Files: ${locationOfMDFiles}`);
        console.log(`Output Location: ${outputLocation}`);

        // Ensure output directory exists
        if (!fs.existsSync(outputLocation)) {
            fs.mkdirSync(outputLocation, { recursive: true });
        }

        // Install necessary tools
        console.log('Installing mermaid-cli...');
        execSync('npm install -g @mermaid-js/mermaid-cli', { stdio: 'inherit' });

        console.log('Installing plantuml...');
        execSync('choco install plantuml -y', { stdio: 'inherit' });

        console.log('Installing imagemagick...');
        execSync('choco install imagemagick -y', { stdio: 'inherit' });

        // Get all Markdown files from the input directory and subdirectories
        const mdFiles = getAllMarkdownFiles(locationOfMDFiles);

        mdFiles.forEach(mdFilePath => {
            const relativePath = path.relative(locationOfMDFiles, mdFilePath);
            const outputMdFilePath = path.join(outputLocation, relativePath);
            const outputMdDir = path.dirname(outputMdFilePath);
            const diagramsDir = path.join(outputMdDir, 'diagrams');

            // Ensure the output and diagrams directories for the current file exist
            if (!fs.existsSync(outputMdDir)) {
                fs.mkdirSync(outputMdDir, { recursive: true });
            }
            if (!fs.existsSync(diagramsDir)) {
                fs.mkdirSync(diagramsDir, { recursive: true });
            }

            // Read the Markdown content
            const mdContent = fs.readFileSync(mdFilePath, 'utf8');

            console.log(`====================================================================================================`);
            console.log(`====================================================================================================`);
            console.log(`Converting ${mdFilePath} to ${outputMdFilePath}`);
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
                return `![Mermaid Diagram](${path.relative(outputMdDir, pngFilePath)})`;
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
                return success ? `![PlantUML Diagram](${path.relative(outputMdDir, pngFilePath)})` : match;
            });

            // Ensure all PlantUML diagrams are generated before moving on to writing the Markdown to a temporary file
            console.log(`All PlantUML diagrams generated for ${mdFilePath}`);

            // Define the temporary Markdown file path
            const tempMdFileName = relativePath.replace(/\.md$/, '.md').replace(/\s+/g, '_');
            const tempMdFilePath = path.join(outputLocation, tempMdFileName);
            const tempMdDir = path.dirname(tempMdFilePath);
            if (!fs.existsSync(tempMdDir)) {
                fs.mkdirSync(tempMdDir, { recursive: true });
            }

            // Copy images found in the Markdown content to the diagrams directory
            updatedMdContent = updatedMdContent.replace(/!\[([^\]]*)\]\(([^)]+)\)/g, (match, altText, imgPath) => {
                console.log(`Found image path: ${imgPath}`);
                if (!imgPath.startsWith('http')) {
                    const fullPath = path.resolve(path.dirname(mdFilePath), imgPath);
                    if (fs.existsSync(fullPath)) {
                        const newImagePath = path.join(diagramsDir, path.basename(imgPath));
                        fs.copyFileSync(fullPath, newImagePath);
                        console.log(`Copied image to: ${newImagePath}`);
                        return `![${altText}](${path.relative(outputMdDir, newImagePath)})`;
                    } else {
                        console.error(`Image file does not exist: ${fullPath}`);
                    }
                }
                return match;
            });

            // Write the updated Markdown content to a temporary file
            console.log(`Writing temporary Markdown file: ${tempMdFilePath}`);
            fs.writeFileSync(tempMdFilePath, updatedMdContent);

            // Read the temporary Markdown file content
            let tempMdContent = fs.readFileSync(tempMdFilePath, 'utf8');

            // Update image paths to be relative to the location of the Markdown document
            console.log(`Updating Image Paths in Markdown file...`);
            tempMdContent = tempMdContent.replace(/!\[([^\]]*)\]\(([^)]+)\)/g, (match, altText, imgPath) => {
                console.log(`Found image path: ${imgPath}`);
                if (!imgPath.startsWith('http')) {
                    const fullPath = path.resolve(locationOfMDFiles, imgPath);
                    if (fs.existsSync(fullPath)) {
                        console.log(`Updated image path to: ${fullPath}`);
                        return `![](${path.relative(outputMdDir, fullPath)})`;
                    } else {
                        console.error(`Image file does not exist: ${fullPath}`);
                    }
                }
                return match;
            });

            // Write the updated content back to the temporary file
            fs.writeFileSync(tempMdFilePath, tempMdContent);

            console.log(`Converted ${mdFilePath} to ${outputMdFilePath}`);
            
            console.log(`====================================================================================================`);
            console.log(`====================================================================================================`);
        });

    } catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();