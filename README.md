# renamer.ps1
Generic PowerShell script to bulk rename files based on user input. 

![alt text](https://github.com/sorzkode/renamer.ps1/blob/main/reNAME.png?raw=true)

1. Place the renamer.ps1 script in the folder where the files are located that you want to rename.
2. Open PowerShell and change directories to where the folder is located (IE cd "C:\users\user\New folder"). 
3. Type **./renamer.ps1** to run the script.
    
    -**Please note:** *You may need to change your execution policy to "unrestricted" in order to run scripts. This is disabled by default for security purposes. To do this you would type* **Set-ExecutionPolicy Unrestricted** *and follow the prompts.* 
4. Enter the text you want to replace when prompted by the script. 
5. Enter the new text you wanted added to the files when prompted by the script. 

**If you are uncomfortable running a script or just want to do it manually; You can open PowerShell and type the following command:** 
> ls | Rename-Item -NewName {$_.name -replace "curent text to be replaced","new text"}
