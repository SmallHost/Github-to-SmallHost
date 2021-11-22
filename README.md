# Github to SmallHost
⚠️ **You need WinSCP installed for this to work!** You can [install WinSCP here](https://winscp.net/download/WinSCP-5.19.4-Setup.exe) (11.3 MB). To ensure Github to SmallHost works, at WinSCP installation install it to all users (not just you). Without WinSCP, Github to SmallHost cannot connect to SmallHost's FTP server to upload the repo.
![A flowchart](https://raw.githubusercontent.com/SmallHost/Github-to-SmallHost/main/flowchart-ghtosh.png)
## How It Works
### Download
1. [Click here for the raw porttosmallhost.bat file.](https://raw.githubusercontent.com/SmallHost/Github-to-SmallHost/main/porttosmallhost.bat)
2. Run keyboard command `CTRL + S`.
3. Under the `Save as Type` dropdown, select `All Files`. At the end of the file name, type `.bat`.
4. Save it.
5. Run it.
6. If you have Windows Defender, click `More Info > Run Anyways`.
### Using Github to SmallHost, Step-By-Step
1. You'll enter the `Username/RepoName`. The repo has to be public. (If you own the repo and it's sat to private, [set it to public](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/setting-repository-visibility) and after the download change it back to private)
2. You'll then enter your SmallHost username and password.
3. You'll then enter `/htaccess` if you want to port it to the subdomain you got at signup, or enter `/url.name.here/htaccess` if you want to port it to a domain/subdomain you got on the [cPanel](https://cpanel.smallhost.us.to).
4. Your computer will temporarilly download and save the repo. It will be deleted from your device after it's uploaded to SmallHost.
5. After the download, the repo will be uploadeded to SmallHost's FTP server.
6. The temporary local copy of the repo will then be deleted from your PC.
### A Simple Flowchart
This is the Github to SmallHost broken down into small, easy-to-read chunks.
