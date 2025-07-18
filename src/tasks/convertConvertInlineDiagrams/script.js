const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const tl = require('azure-pipelines-task-lib/task');
const https = require('https'); // Add this to make HTTP requests
const crypto = require('crypto');

// Cache for generated diagrams to avoid regenerating identical content
const diagramCache = new Map();

function generateDiagramHash(content) {
    return crypto.createHash('md5').update(content.trim()).digest('hex');
}

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

function hasInlineDiagrams(filePath) {
    try {
        const content = fs.readFileSync(filePath, 'utf8');
        return /(```|:::)(mermaid)/.test(content) || /```plantuml/.test(content);
    } catch {
        return false;
    }
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

        // Install necessary tools (skip if already installed to save time)
        console.log('Checking and installing required tools...');
        
        // Check if mermaid-cli is already installed
        try {
            execSync('mmdc --version', { stdio: 'pipe' });
            console.log('✓ mermaid-cli already installed, skipping...');
        } catch {
            console.log('Installing mermaid-cli...');
            execSync('npm install -g @mermaid-js/mermaid-cli', { stdio: 'inherit' });
        }

        // Check if plantuml is already installed
        try {
            execSync('plantuml -version', { stdio: 'pipe' });
            console.log('✓ plantuml already installed, skipping...');
        } catch {
            console.log('Installing plantuml...');
            execSync('choco install plantuml -y', { stdio: 'inherit' });
        }

        // Check if imagemagick is already installed
        try {
            execSync('magick -version', { stdio: 'pipe' });
            console.log('✓ imagemagick already installed, skipping...');
        } catch {
            console.log('Installing imagemagick...');
            execSync('choco install imagemagick -y', { stdio: 'inherit' });
        }

        // Get all Markdown files from the input directory and subdirectories
        const allMdFiles = getAllMarkdownFiles(locationOfMDFiles);
        console.log(`📄 Found ${allMdFiles.length} markdown files, scanning for diagrams...`);
        
        // Pre-scan to only process files with diagrams
        const mdFiles = allMdFiles.filter(filePath => {
            const hasDiagrams = hasInlineDiagrams(filePath);
            if (!hasDiagrams) {
                console.log(`⏭️  Skipping ${path.basename(filePath)} (no diagrams found)`);
            }
            return hasDiagrams;
        });
        
        console.log(`🎯 Processing ${mdFiles.length} files with diagrams (skipped ${allMdFiles.length - mdFiles.length} files)`);

        let processedCount = 0;
        const startTime = Date.now();

        mdFiles.forEach((mdFilePath, index) => {
            const progress = `[${index + 1}/${mdFiles.length}]`;
            console.log(`${progress} Processing: ${path.basename(mdFilePath)}`);
            
            processedCount++;
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
                    
                    // Check cache first
                    const diagramHash = generateDiagramHash(p3);
                    if (diagramCache.has(diagramHash)) {
                        console.log(`Diagram already generated, using cached version: ${diagramCache.get(diagramHash)}`);
                        return `![Mermaid Diagram](${path.relative(outputMdDir, diagramCache.get(diagramHash))})`;
                    }

                    console.log(`Generating Mermaid diagram: ${mermaidFilePath}`);
                    execSync(`mmdc -i ${mermaidFilePath} -o ${pngFilePath} --theme default`);
                    console.log(`Generated Mermaid diagram: ${pngFilePath}`);
                    
                    // Add to cache
                    diagramCache.set(diagramHash, pngFilePath);
                    
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

            // Convert PlantUML diagrams to images (with caching for performance)
            updatedMdContent = updatedMdContent.replace(/```plantuml([\s\S]*?)```/g, (match, p1, offset) => {
                console.log(`=== Convert PlantUML Diagram ===`);
                try {
                    const diagramContent = p1.trim();
                    const diagramHash = generateDiagramHash(diagramContent);
                    const cachedPath = diagramCache.get(`plantuml_${diagramHash}`);
                    
                    // Check if we already generated this exact diagram
                    if (cachedPath && fs.existsSync(cachedPath)) {
                        console.log(`Using cached PlantUML diagram: ${cachedPath}`);
                        const relativeCachedPath = path.relative(outputMdDir, cachedPath);
                        console.log(`=== Next Diagram (cached) ===`);
                        return `![PlantUML Diagram](${relativeCachedPath})`;
                    }
                    
                    const plantUmlFilePath = path.join(diagramsDir, `diagram-${offset}-${diagramHash.substring(0, 8)}.puml`);
                    fs.writeFileSync(plantUmlFilePath, diagramContent);
                    console.log(`Generated PlantUML file: ${plantUmlFilePath}`);
                    const pngFilePath = plantUmlFilePath.replace('.puml', '.png');
                
                    const maxRetries = 2; // Reduced from 3 to 2 for faster execution
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

                    // Optimize file system sync check - reduce wait time and iterations
                    let fileExists = false;
                    for (let i = 0; i < 3; i++) { // Reduced from 5 to 3 iterations
                        if (fs.existsSync(pngFilePath)) {
                            fileExists = true;
                            break;
                        }
                        console.log(`Waiting for file system to catch up...`);
                        // Use a more efficient wait on Windows - reduced from 1 second to 200ms
                        const startTime = Date.now();
                        while (Date.now() - startTime < 200) {
                            // Busy wait for 200ms instead of calling external sleep command
                        }
                    }
                    
                    if (!fileExists) {
                        console.error('\x1b[31m%s\x1b[0m', `ERROR: PlantUML diagram was generated but image file does not exist: ${pngFilePath}`);
                        console.error('\x1b[31m%s\x1b[0m', `Source File: ${mdFilePath}`);
                        console.error('\x1b[31m%s\x1b[0m', `Diagram Content: ${p1.trim()}`);
                        console.log(`=== Continuing with next diagram ===`);
                        return match; // Return original content if file doesn't exist
                    }

                    // Cache the generated diagram
                    diagramCache.set(`plantuml_${diagramHash}`, pngFilePath);

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

        // Summary statistics
        const endTime = Date.now();
        const totalTime = (endTime - startTime) / 1000;
        console.log(`\n🎉 Processing Complete!`);
        console.log(`📊 Summary:`);
        console.log(`   • Files processed: ${processedCount}`);
        console.log(`   • Total time: ${totalTime.toFixed(2)} seconds`);
        console.log(`   • Average time per file: ${(totalTime / processedCount).toFixed(2)} seconds`);
        console.log(`   • Cached diagrams used: ${[...diagramCache.keys()].length}`);

    } catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();