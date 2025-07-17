const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const tl = require('azure-pipelines-task-lib/task');
const https = require('https'); // Add this to make HTTP requests

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

function fetchDeveloperMessage() {
    const url = 'https://developer-message.mightora.io/api/HttpTrigger?appname=convertConvertInlineDiagrams';

    return new Promise((resolve, reject) => {
        https.get(url, (res) => {
            let data = '';

            res.on('data', (chunk) => {
                data += chunk;
            });

            res.on('end', () => {
                try {
                    const jsonResponse = JSON.parse(data);
                    resolve(jsonResponse.message);
                } catch (error) {
                    reject('Developer message not available.');
                }
            });
        }).on('error', () => {
            reject('Developer message not available.');
        });
    });
}

async function run() {
    try {
        // Fetch and display the developer message
        const developerMessage = await fetchDeveloperMessage().catch((err) => err);
        console.log(`Developer Message: ${developerMessage}`);

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
                try {
                    const mermaidFilePath = path.join(diagramsDir, `diagram-${offset}.mmd`);
                    fs.writeFileSync(mermaidFilePath, p3.trim());
                    const pngFilePath = mermaidFilePath.replace('.mmd', '.png');
                    console.log(`Generating Mermaid diagram: ${mermaidFilePath}`);
                    execSync(`mmdc -i ${mermaidFilePath} -o ${pngFilePath} --theme default`);
                    console.log(`Generated Mermaid diagram: ${pngFilePath}`);
                    console.log(`=== Next Diagram ===`);
                    return `![Mermaid Diagram](${path.relative(outputMdDir, pngFilePath)})`;
                } catch (error) {
                    console.error('\x1b[31m%s\x1b[0m', `ERROR: Failed to convert Mermaid diagram at offset ${offset}`);
                    console.error('\x1b[31m%s\x1b[0m', `Error Type: ${error.name || 'Unknown'}`);
                    console.error('\x1b[31m%s\x1b[0m', `Error Message: ${error.message}`);
                    if (error.stack) {
                        console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${error.stack}`);
                    }
                    if (error.stderr) {
                        console.error('\x1b[31m%s\x1b[0m', `Command Output: ${error.stderr.toString()}`);
                    }
                    console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                    console.error('\x1b[31m%s\x1b[0m', `Diagram Content: ${p3.trim()}`);
                    console.log(`=== Continuing with next diagram ===`);
                    // Return original content if conversion fails
                    return match;
                }
            });

            // Ensure all Mermaid diagrams are generated before moving on to PlantUML
            console.log(`All Mermaid diagrams generated for ${mdFilePath}`);

            // Convert PlantUML diagrams to images
            updatedMdContent = updatedMdContent.replace(/```plantuml([\s\S]*?)```/g, (match, p1, offset) => {
                console.log(`=== Convert PlantUML Diagram ===`);
                try {
                    const plantUmlFilePath = path.join(diagramsDir, `diagram-${offset}.puml`);
                    fs.writeFileSync(plantUmlFilePath, p1.trim());
                    console.log(`Generated PlantUML file: ${plantUmlFilePath}`);
                    const pngFilePath = plantUmlFilePath.replace('.puml', '.png');
                
                    const maxRetries = 3;
                    let attempt = 0;
                    let success = false;
                    let lastError = null;
                
                    while (attempt < maxRetries && !success) {
                        try {
                            execSync(`plantuml ${plantUmlFilePath}`);
                            console.log(`Generated PlantUML diagram for file: ${plantUmlFilePath}`);
                            console.log(`Generated PlantUML diagram: ${pngFilePath}`);
                            success = true;
                        } catch (error) {
                            lastError = error;
                            console.error('\x1b[31m%s\x1b[0m', `Attempt ${attempt + 1} failed: ${error.message}`);
                            attempt++;
                            if (attempt < maxRetries) {
                                console.log('Retrying...');
                            }
                        }
                    }

                    if (!success) {
                        console.error('\x1b[31m%s\x1b[0m', `ERROR: Failed to convert PlantUML diagram at offset ${offset} after ${maxRetries} attempts`);
                        console.error('\x1b[31m%s\x1b[0m', `Error Type: ${lastError?.name || 'Unknown'}`);
                        console.error('\x1b[31m%s\x1b[0m', `Error Message: ${lastError?.message || 'Unknown error'}`);
                        if (lastError?.stack) {
                            console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${lastError.stack}`);
                        }
                        if (lastError?.stderr) {
                            console.error('\x1b[31m%s\x1b[0m', `Command Output: ${lastError.stderr.toString()}`);
                        }
                        console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                        console.error('\x1b[31m%s\x1b[0m', `Diagram Content: ${p1.trim()}`);
                        console.log(`=== Continuing with next diagram ===`);
                        return match; // Return original content if conversion fails
                    }

                    // Ensure the file system has caught up
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
                        console.error('\x1b[31m%s\x1b[0m', `ERROR: PlantUML diagram was generated but image file does not exist: ${pngFilePath}`);
                        console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                        console.error('\x1b[31m%s\x1b[0m', `Diagram Content: ${p1.trim()}`);
                        console.log(`=== Continuing with next diagram ===`);
                        return match; // Return original content if file doesn't exist
                    }

                    console.log(`=== Next Diagram ===`);
                    return `![PlantUML Diagram](${path.relative(outputMdDir, pngFilePath)})`;
                } catch (error) {
                    console.error('\x1b[31m%s\x1b[0m', `ERROR: Unexpected error while converting PlantUML diagram at offset ${offset}`);
                    console.error('\x1b[31m%s\x1b[0m', `Error Type: ${error.name || 'Unknown'}`);
                    console.error('\x1b[31m%s\x1b[0m', `Error Message: ${error.message}`);
                    if (error.stack) {
                        console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${error.stack}`);
                    }
                    console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                    console.error('\x1b[31m%s\x1b[0m', `Diagram Content: ${p1.trim()}`);
                    console.log(`=== Continuing with next diagram ===`);
                    return match; // Return original content if conversion fails
                }
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
                    try {
                        const fullPath = path.resolve(path.dirname(mdFilePath), imgPath);
                        if (fs.existsSync(fullPath)) {
                            const newImagePath = path.join(diagramsDir, path.basename(imgPath));
                            fs.copyFileSync(fullPath, newImagePath);
                            console.log(`Copied image to: ${newImagePath}`);
                            return `![${altText}](${path.relative(outputMdDir, newImagePath)})`;
                        } else {
                            console.error('\x1b[31m%s\x1b[0m', `ERROR: Image file does not exist: ${fullPath}`);
                            console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                            console.error('\x1b[31m%s\x1b[0m', `Original Image Path: ${imgPath}`);
                            console.log(`Keeping original image reference...`);
                        }
                    } catch (error) {
                        console.error('\x1b[31m%s\x1b[0m', `ERROR: Failed to copy image: ${imgPath}`);
                        console.error('\x1b[31m%s\x1b[0m', `Error Type: ${error.name || 'Unknown'}`);
                        console.error('\x1b[31m%s\x1b[0m', `Error Message: ${error.message}`);
                        if (error.stack) {
                            console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${error.stack}`);
                        }
                        console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                        console.log(`Keeping original image reference...`);
                    }
                }
                return match;
            });

            // Write the updated Markdown content to a temporary file
            console.log(`Writing temporary Markdown file: ${tempMdFilePath}`);
            try {
                fs.writeFileSync(tempMdFilePath, updatedMdContent);
            } catch (error) {
                console.error('\x1b[31m%s\x1b[0m', `ERROR: Failed to write temporary Markdown file: ${tempMdFilePath}`);
                console.error('\x1b[31m%s\x1b[0m', `Error Type: ${error.name || 'Unknown'}`);
                console.error('\x1b[31m%s\x1b[0m', `Error Message: ${error.message}`);
                if (error.stack) {
                    console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${error.stack}`);
                }
                console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                console.log(`Skipping this file and continuing with next...`);
                return; // Skip this file and continue with the next
            }

            // Read the temporary Markdown file content
            let tempMdContent;
            try {
                tempMdContent = fs.readFileSync(tempMdFilePath, 'utf8');
            } catch (error) {
                console.error('\x1b[31m%s\x1b[0m', `ERROR: Failed to read temporary Markdown file: ${tempMdFilePath}`);
                console.error('\x1b[31m%s\x1b[0m', `Error Type: ${error.name || 'Unknown'}`);
                console.error('\x1b[31m%s\x1b[0m', `Error Message: ${error.message}`);
                if (error.stack) {
                    console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${error.stack}`);
                }
                console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                console.log(`Skipping this file and continuing with next...`);
                return; // Skip this file and continue with the next
            }

            // Update image paths to be relative to the location of the Markdown document
            console.log(`Updating Image Paths in Markdown file...`);
            tempMdContent = tempMdContent.replace(/!\[([^\]]*)\]\(([^)]+)\)/g, (match, altText, imgPath) => {
                console.log(`Found image path: ${imgPath}`);
                if (!imgPath.startsWith('http')) {
                    try {
                        const fullPath = path.resolve(locationOfMDFiles, imgPath);
                        if (fs.existsSync(fullPath)) {
                            console.log(`Updated image path to: ${fullPath}`);
                            return `![](${path.relative(outputMdDir, fullPath)})`;
                        } else {
                            console.error('\x1b[31m%s\x1b[0m', `ERROR: Image file does not exist during path update: ${fullPath}`);
                            console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                            console.error('\x1b[31m%s\x1b[0m', `Original Image Path: ${imgPath}`);
                            console.log(`Keeping original image reference...`);
                        }
                    } catch (error) {
                        console.error('\x1b[31m%s\x1b[0m', `ERROR: Failed to update image path: ${imgPath}`);
                        console.error('\x1b[31m%s\x1b[0m', `Error Type: ${error.name || 'Unknown'}`);
                        console.error('\x1b[31m%s\x1b[0m', `Error Message: ${error.message}`);
                        if (error.stack) {
                            console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${error.stack}`);
                        }
                        console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                        console.log(`Keeping original image reference...`);
                    }
                }
                return match;
            });

            // Write the updated content back to the temporary file
            try {
                fs.writeFileSync(tempMdFilePath, tempMdContent);
                console.log(`Converted ${mdFilePath} to ${outputMdFilePath}`);
            } catch (error) {
                console.error('\x1b[31m%s\x1b[0m', `ERROR: Failed to write final Markdown file: ${tempMdFilePath}`);
                console.error('\x1b[31m%s\x1b[0m', `Error Type: ${error.name || 'Unknown'}`);
                console.error('\x1b[31m%s\x1b[0m', `Error Message: ${error.message}`);
                if (error.stack) {
                    console.error('\x1b[31m%s\x1b[0m', `Stack Trace: ${error.stack}`);
                }
                console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                console.log(`Skipping final write for this file and continuing with next...`);
            }
            
            console.log(`====================================================================================================`);
            console.log(`====================================================================================================`);
        });

    } catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();