const tl = require('azure-pipelines-task-lib/task');
const fs = require('fs');
const path = require('path');
const xml2js = require('xml2js');

console.log(`
                                                                                                 
                                                                                                    
                                                                                                    
                                                             -==++##%%@@%%%%%%%#                    
                                      -+*#*###%%#####*  #@@@@@@@@@@@@@@@@@@@@@@@+                   
                          +*%#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+*+#**=             
                        *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+==#@=::.*@@@:...@@@@@@@@@@@@@#-         
       +#%%%%%%%@@@@@@@@@@@@@@@@@@@%##**%#+=-:::..-@@@%-.     +@-   *@@@.  .@@@@@@@@@@@@@@@#        
    +#@@@@@@@@@@@@@@@@@@@@@%.           #=        -@@=    ....+@-   *@@@.  .@@@@%-. ..+@@@@@#       
  :=@@@@@@@@@@@@@@@@@@@@@@@*            #=  .:=+*#@@-.  .*@@@@@@-   *@@@.  .@@@+.     ..%@@@@#      
 ::%@@@#:......     .#@@@@@@####*.  :%@@@=  .*@@@@@*.  .%@@@@@@@-   ....   .@@%:  .##-. -@@@@#      
::-%@@@=        .....#@@@@@@@@@@%.  :%@@@=  .....%@=   -@@@@@@@@-          .@@@-  .*-.  +@@@@*      
::-%@@@@@@@@@@@@@@@@@@@@@@@@@@@@%.  :%@@@=      .%@+.  .%@@@@@@@-   +@@@.  .%@@@-.    .+@@@@%-      
:::=@@@@@@@@@@@@@@@@@@@@@@@@@@@@%.  :%@@@=  .+%%%@@@-   .+@@@@@@-   +@@@.  .%@@@@@%%%%@@@@@@@@@@%*  
:::--*@@@%#***+++=-:-%@@@@@@@@@@%.  :%@@@=  .*@@@@@@@-.   ....+@-   +@@@:  .%@@@@@@@@@@@@@@@@@@@@@@#
:::--+@@#.          .#@@@@@@@@@@%.  :%@@#.        -@@@%=..    +@- ..*@@@--==@@@@@@@@@@@@%%%####@@@@#
:::--+@@#. ...:--=+*#@@@@@@@@@@@%.  :%@@#.        -@@@@@@@@@@@@@@@@@@@@@@@@@@@#.. -@#.        .#@@@#
:::-+%@@@@@@@@@@@@@@@@@@@@@@@@@@%*###@@@@#%%%%@@@@@@@*==--::..*@-..    ..=@@@@#.  -@#.        .#@@@%
::-%@@@@@@@@@@@@@@@@@@@@@@@@@#**%@@@%-:::%*.      .#%:        *@-         .=@@#.  -@#.  +@@@@@@@@@@#
::-@@@@#*+=--::...-@.   =@@@-   -@@@=   -@*.     ..#%:  .--==+%@-   #@%=.   -@#.  -@#.  =%*+%@@@@@%- 
::-@@@#.          -@=.  .%@#.   .#@@.   +@*.  +@@@@@%:  .%@@@@@@:   #@@@#.  .##.  -@#.     .#@@@@=:: 
::-@@@%..:::  .=*#%@%.  .+@-     :@=   :@@*.  +%%#%@%:  ....-@@@:   #@@@@:  .##.  -@#.  :-=+%@@@@@%- 
::-%@@@@@@@=  .+@@@@@-   .#.  ..  -:  .*@@*.      *@%:      -@@@:   *@@@%.  .%#.  -@#.  +@@@@@@@@@@# 
:::+@@@@@@@=  .+@@@@@#.   .  .*.      :%@@*.  ....#@%:  .%@@@@@@:   #@@%.  .=@#.  -@#.  =+=--::#@@@# 
:::--=+%@@@=  .+@@@@@@-      =@-      =@@@*.  +@@@@@%:  .%@@@@@@-   ::..  .+@@#.  -@#.        .#@@@# 
:::----#@@@=  .+@@@@@@#.    .%@%.    .%@@%+.  -++=-#%:  ..    +@-       .=%@@@#.  -@#..::--=+**%@@@# 
:::----#@@@=  .+@@@@@@%:    =@@@=.  .=@@@+        .*%:     ...+@-::-==*@@@@@@@@@@@@@@@@@@@@@@@@@@@#+ 
  :::::#@@@=  .+@@@@@@@+   .@@@@%.  .%@@@+. ...:--=%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#-:  
  :::::*@@@#. .*@@@@@@@@--=#@@@@@%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++@@@@@%#**++==----::::   
  :::::=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%##***++==---::::::::::::::::::::::::    
  :::::-=%@@@@@@@@**@@@@@@@@@%=%@@@@@%*=*%%#*+==---::::::::::::::::::::::::::::::::::::::::::        
   :::::---+#@@*=----=====--::::::::::::::::::::::::::::::::::::::::::..                             
    ::::::::::::::::::::::::::::::::::::::::::::::::::                                               
      .:::::::.   :::::::::::
`);

try {
    const locationOfUnpackedSolution = tl.getInput('locationOfUnpackedSolution', true);
    const wikiLocation = tl.getInput('wikiLocation', true);
    const useSingleFile = tl.getBoolInput('useSingleFile', true);

    console.log('Location of Unpacked Solution:', locationOfUnpackedSolution);
    console.log('Wiki Location:', wikiLocation);
    console.log('Use Single File:', useSingleFile);

    const rolesDirectory = path.join(locationOfUnpackedSolution, 'Roles');
    const files = fs.readdirSync(rolesDirectory).filter(file => file.endsWith('.xml'));

    // Ensure the wikiLocation directory exists
    if (!fs.existsSync(wikiLocation)) {
        fs.mkdirSync(wikiLocation, { recursive: true });
        console.log(`Directory created: ${wikiLocation}`);
    }

    const levelMapping = {
        'None': 'None',
        'Basic': 'User',
        'Local': 'Business Unit',
        'Deep': 'Parent Business Unit',
        'Global': 'Organization'
    };

    const actionTable = `
| Action (Platform) | XML Meaning |
|-------------------|-------------|
| Read              | View records |
| Write             | Modify records |
| Append            | Associate with other records |
| AppendTo          | Be associated with other records |
| Create            | Add new records |
| Delete            | Remove records |
| Assign            | Reassign records to other users |
| Share             | Grant access to records |
`;

    files.forEach(file => {
        const filePath = path.join(rolesDirectory, file);
        const xmlContent = fs.readFileSync(filePath, 'utf8');

        xml2js.parseString(xmlContent, (err, result) => {
            if (err) {
                console.error('Error parsing XML:', err);
                return;
            }

            if (!result.Role || !result.Role.RolePrivileges || !result.Role.RolePrivileges[0]) {
                console.error('RolePrivileges is undefined in the XML file:', filePath);
                return;
            }

            const rolePrivileges = result.Role.RolePrivileges[0].RolePrivilege || [];
            const transformedPrivileges = rolePrivileges.map(privilege => {
                let name = privilege.$.name.replace(/^prv/, '');
                let permission = '';
                const level = levelMapping[privilege.$.level] || privilege.$.level; // Map the level

                const permissions = ['Append', 'Assign', 'Create', 'Delete', 'Read', 'Share', 'Write'];
                for (const perm of permissions) {
                    if (name.startsWith(perm)) {
                        permission = perm;
                        name = name.replace(perm, '');
                        break;
                    }
                }

                return { name, permission, level };
            });

            const matrix = {};
            transformedPrivileges.forEach(privilege => {
                if (!matrix[privilege.name]) {
                    matrix[privilege.name] = {};
                }
                matrix[privilege.name][privilege.permission] = privilege.level;
            });

            const permissions = ['Append', 'Assign', 'Create', 'Delete', 'Read', 'Share', 'Write'];
            const header = ['Name', ...permissions];
            const rows = Object.keys(matrix).map(name => {
                const row = [name];
                permissions.forEach(permission => {
                    row.push(matrix[name][permission] || '');
                });
                return row;
            });

            const markdownContent = [
                actionTable,
                header.join(' | '),
                header.map(() => '---').join(' | '),
                ...rows.map(row => row.join(' | '))
            ].join('\n');

            const outputFilePath = path.join(wikiLocation, `${path.basename(file, '.xml')}.md`);
            fs.writeFileSync(outputFilePath, markdownContent, 'utf8');
            console.log(`Markdown file created: ${outputFilePath}`);
        });
    });
} catch (err) {
    console.error('Error:', err);
}