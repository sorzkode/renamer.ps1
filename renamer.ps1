'''
+-+-+-+-+-+-+
|r|e|N|A|M|E|
+-+-+-+-+-+-+
                                                   
PowerShell File Renamer Script.
-
Author:
Mister Riley
sorzkode@proton.me
https://github.com/sorzkode

MIT License
Copyright (c) 2024 Mister Riley
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'''

Write-Host " __      __         .__                                    
/  \    /  \  ____  |  |    ____   ____    _____    ____   
\   \/\/   /_/ __ \ |  |  _/ ___\ /  _ \  /     \ _/ __ \  
 \        / \  ___/ |  |__\  \___(  <_> )|  Y Y  \\  ___/  
  \__/\  /   \___  >|____/ \___  >\____/ |__|_|  / \___  > 
       \/        \/            \/              \/      \/  
                                                           "

Write-Host "reNAME script by Mister Riley"
Write-Host "We will need a few things to get started..."

do {
    # Prompt for the file name to replace
    $oldname = Read-Host -Prompt 'File name you want to replace'

    # Prompt for the new file name
    $newname = Read-Host -Prompt 'New file name'

    # Prompt for the location to search or specify to search the whole PC
    $searchLocation = Read-Host -Prompt 'Enter a specific location to search (leave empty to search the whole PC)'

    # Store the results of the search
    if ([string]::IsNullOrWhiteSpace($searchLocation)) {
        $files = Get-ChildItem -Recurse -File
    } else {
        $files = Get-ChildItem -Recurse -File -Path $searchLocation
    }

    # Check if the new file name already exists
    $existingFiles = $files | Where-Object { $_.Name -eq $newname }

    if ($existingFiles.Count -gt 0) {
        Write-Host "The new file name '$newname' already exists in the specified location(s)."
        $proceed = Read-Host -Prompt "Do you want to proceed? (Y/N)"

        if ($proceed -ne "Y" -and $proceed -ne "y") {
            Write-Host "Operation canceled by the user."
            Exit
        }
    }

    # Preview the file name changes
    Write-Host "Preview of file name changes:"
    $files | ForEach-Object {
        $newNameWithPath = Join-Path -Path $_.DirectoryName -ChildPath ($_.Name -replace $oldname, $newname)
        Write-Host "Old Name: $($_.Name)"
        Write-Host "New Name: $newNameWithPath"
        Write-Host "------------------------"
    }

    $confirm = Read-Host -Prompt "Do you want to proceed with the renaming? (Y/N)"

    if ($confirm -ne "Y" -and $confirm -ne "y") {
        Write-Host "Operation canceled by the user."
        Exit
    }

    # Rename the files and handle any errors
    try {
        $files | ForEach-Object {
            $newNameWithPath = Join-Path -Path $_.DirectoryName -ChildPath ($_.Name -replace $oldname, $newname)
            Rename-Item -Path $_.FullName -NewName $newNameWithPath -ErrorAction Stop
        }

        Write-Host "Finished"
    }
    catch {
        Write-Host "An error occurred while renaming the files: $_"
        Exit 1
    }

    $continue = Read-Host -Prompt "Do you want to rename another file? (Y/N)"
} while ($continue -eq "Y" -or $continue -eq "y")

Exit 0
