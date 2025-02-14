const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const tl = require('azure-pipelines-task-lib/task');

function run() {
    try {
        const locationOfMDFiles = tl.getInput('locationOfMDFiles', true);
        const outputLocation = tl.getInput('outputLocation', true);
        const diagramsDir = path.join(outputLocation, 'diagrams');

        console.log(`Location of MD Files: ${locationOfMDFiles}`);
        console.log(`Output Location: ${outputLocation}`);
        console.log(`Diagrams Directory: ${diagramsDir}`);

        // Ensure output and diagrams directories exist
        if (!fs.existsSync(outputLocation)) {
            fs.mkdirSync(outputLocation, { recursive: true });
        }
        if (!fs.existsSync(diagramsDir)) {
            fs.mkdirSync(diagramsDir, { recursive: true });
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

        // Read all Markdown files from the input directory
        const mdFiles = fs.readdirSync(locationOfMDFiles).filter(file => file.endsWith('.md'));

        mdFiles.forEach(mdFile => {
            const mdFilePath = path.join(locationOfMDFiles, mdFile);
            const docxFileName = path.basename(mdFile, '.md').replace(/\s+/g, '_') + '.docx';
            const docxFilePath = path.join(outputLocation, docxFileName);

            // Read the Markdown content
            const mdContent = fs.readFileSync(mdFilePath, 'utf8');

            // Convert Mermaid diagrams to images
            const updatedMdContent = mdContent.replace(/(```|:::)(mermaid)([\s\S]*?)(```|:::)/g, (match, p1, p2, p3, p4, offset) => {
                const mermaidFilePath = path.join(diagramsDir, `diagram-${offset}.mmd`);
                fs.writeFileSync(mermaidFilePath, p3.trim());
                const pngFilePath = mermaidFilePath.replace('.mmd', '.png');
                execSync(`mmdc -i ${mermaidFilePath} -o ${pngFilePath} --theme default`);
                console.log(`Generated Mermaid diagram: ${pngFilePath}`);
                if (fs.existsSync(pngFilePath)) {
                    console.log(`Mermaid diagram exists: ${pngFilePath}`);
                } else {
                    console.error(`Mermaid diagram does not exist: ${pngFilePath}`);
                }
                return `![Mermaid Diagram](${pngFilePath})`;
            });

            // Convert PlantUML diagrams to images
            const finalMdContent = updatedMdContent.replace(/```plantuml([\s\S]*?)```/g, (match, p1, offset) => {
                const plantUmlFilePath = path.join(diagramsDir, `diagram-${offset}.puml`);
                fs.writeFileSync(plantUmlFilePath, p1.trim());
                const pngFilePath = plantUmlFilePath.replace('.puml', '.png');
                execSync(`plantuml ${plantUmlFilePath}`);
                console.log(`Generated PlantUML diagram: ${pngFilePath}`);
                if (fs.existsSync(pngFilePath)) {
                    console.log(`PlantUML diagram exists: ${pngFilePath}`);
                } else {
                    console.error(`PlantUML diagram does not exist: ${pngFilePath}`);
                }
                return `![PlantUML Diagram](${pngFilePath})`;
            });

            // Write the updated Markdown content to a temporary file
            const tempMdFileName = `temp-${path.basename(mdFile).replace(/\s+/g, '_')}`;
            const tempMdFilePath = path.join(outputLocation, tempMdFileName);
            console.log(`Writing temporary Markdown file: ${tempMdFilePath}`);
            fs.writeFileSync(tempMdFilePath, finalMdContent);

            // Convert the Markdown file to DOCX using pandoc
            console.log(`Converting ${tempMdFilePath} to ${docxFilePath}`);
            execSync(`pandoc -f markdown ${tempMdFilePath} -o ${docxFilePath}`);

            // Comment out the cleanup of the temporary file
            fs.unlinkSync(tempMdFilePath);

            console.log(`Converted ${mdFilePath} to ${docxFilePath}`);
        });

    } catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();