# renamer.ps1

PowerShell script to bulk rename files based on user input.

![alt text](https://github.com/sorzkode/renamer.ps1/blob/main/reNAME.png?raw=true)

## Instructions
```
    1. Place the `renamer.ps1` script in the folder where the files are located that you want to rename.

    2. Open PowerShell and change directories to where the folder is located (e.g., `cd "C:\users\user\New folder"`).

    3. Run the script by typing `./renamer.ps1` in the PowerShell prompt.

    - **Please note:** You may need to change your execution policy to "Unrestricted" in order to run scripts. By default, the execution policy is disabled for security purposes. To change the execution policy, use the command `Set-ExecutionPolicy Unrestricted` and follow the prompts.

    4. When prompted by the script, enter the text you want to replace.

    5. When prompted by the script, enter the new text you want to add to the files.
```

**If you are uncomfortable running a script or prefer to do it manually, you can open PowerShell and use the following command:**
```
> ls | Rename-Item -NewName {$_.name -replace "curent text to be replaced","new text"}
```