const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const tl = require('azure-pipelines-task-lib/task');

function run() {
    try {
        const locationOfMDFiles = tl.getInput('locationOfMDFiles', true);
        const outputLocation = tl.getInput('outputLocation', true);

        console.log(`Location of MD Files: ${locationOfMDFiles}`);
        console.log(`Output Location: ${outputLocation}`);

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

        // Read all Markdown files from the input directory
        const mdFiles = fs.readdirSync(locationOfMDFiles).filter(file => file.endsWith('.md'));

        mdFiles.forEach(mdFile => {
            const mdFilePath = path.join(locationOfMDFiles, mdFile);
            const docxFileName = path.basename(mdFile, '.md').replace(/\s+/g, '_') + '.docx';
            const docxFilePath = path.join(outputLocation, docxFileName);

            // Convert Mermaid diagrams to images
            const mdContent = fs.readFileSync(mdFilePath, 'utf8');
            const updatedMdContent = mdContent.replace(/```mermaid([\s\S]*?)```/g, (match, p1, offset) => {
                const mermaidFilePath = path.join(outputLocation, `diagram-${offset}.svg`);
                fs.writeFileSync(mermaidFilePath.replace('.svg', '.mmd'), p1);
                execSync(`mmdc -i ${mermaidFilePath.replace('.svg', '.mmd')} -o ${mermaidFilePath}`);
                return `![Mermaid Diagram](./${path.basename(mermaidFilePath)})`;
            });

            // Convert PlantUML diagrams to images
            const finalMdContent = updatedMdContent.replace(/```plantuml([\s\S]*?)```/g, (match, p1, offset) => {
                const plantUmlFilePath = path.join(outputLocation, `diagram-${offset}.png`);
                fs.writeFileSync(plantUmlFilePath.replace('.png', '.puml'), p1);
                execSync(`plantuml ${plantUmlFilePath.replace('.png', '.puml')}`);
                return `![PlantUML Diagram](./${path.basename(plantUmlFilePath)})`;
            });

            // Write the updated Markdown content to a temporary file
            const tempMdFileName = `temp-${path.basename(mdFile).replace(/\s+/g, '_')}`;
            const tempMdFilePath = path.join(outputLocation, tempMdFileName);
            console.log(`Writing temporary Markdown file: ${tempMdFilePath}`);
            fs.writeFileSync(tempMdFilePath, finalMdContent);

            // Log the content of the temporary Markdown file
            const tempMdContent = fs.readFileSync(tempMdFilePath, 'utf8');
            console.log(`Content of ${tempMdFilePath}:\n${tempMdContent}`);

            // Convert the Markdown file to DOCX using pandoc
            console.log(`Converting ${tempMdFilePath} to ${docxFilePath}`);
            execSync(`pandoc -f markdown ${tempMdFilePath} -o ${docxFilePath}`);

            // Clean up the temporary file
            fs.unlinkSync(tempMdFilePath);

            console.log(`Converted ${mdFilePath} to ${docxFilePath}`);
        });

    } catch (err) {
        tl.setResult(tl.TaskResult.Failed, err.message);
    }
}

run();