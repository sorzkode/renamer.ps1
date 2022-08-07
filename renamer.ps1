Write-Host " __      __         .__                                    
/  \    /  \  ____  |  |    ____   ____    _____    ____   
\   \/\/   /_/ __ \ |  |  _/ ___\ /  _ \  /     \ _/ __ \  
 \        / \  ___/ |  |__\  \___(  <_> )|  Y Y  \\  ___/  
  \__/\  /   \___  >|____/ \___  >\____/ |__|_|  / \___  > 
       \/        \/            \/              \/      \/  
                                                           "
Write-Host "reNAME script by sorzkode"
Write-Host "We will need a few things to get started..."
$oldname = Read-Host -Prompt 'File name you want to replace'
$newname = Read-Host -Prompt 'New file name'
Write-Host "Make sure the renamer.ps1 script is in the same folder as the files to be renamed and that you have changed directories (cd) within PowerShell to this folder."

 ls | Rename-Item -NewName {$_.name -replace $oldname,$newname}

Write-Host "___________.__         .__         .__                 .___._. 
\_   _____/|__|  ____  |__|  ______|  |__    ____    __| _/| | 
 |    __)  |  | /    \ |  | /  ___/|  |  \ _/ __ \  / __ | | | 
 |     \   |  ||   |  \|  | \___ \ |   Y  \\  ___/ / /_/ |  \| 
 \___  /   |__||___|  /|__|/____  >|___|  / \___  >\____ |  __ 
     \/             \/          \/      \/      \/      \/  \/ 
                                                               "

Exit