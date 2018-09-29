# How to setup cat-bots (for dummies)

## Please, follow the instructions and you shouldn't have any problems installing/using cat-bots (at least if you use Ubuntu 16.04)

1. You **must** have cathook installed (and you should be able to compile/inject it at least once)
2. Locate your steamapps folder (usually in `/home/yourname/.local/share/Steam/steamapps`, to see hidden folders/files press Ctrl+H) and copy this path somewhere
3. Locate your cathook folder (probably in `/home/yourname/cathook`), this is the folder with injection scripts, etc. Save the path
4. Open terminal (Ctrl+Alt+T)
5. Run this command: `git clone https://github.com/nullworks/catbot-setup && cd catbot-setup` (next commands will just be in `monospace blocks`, you have to run them). **Remember that you can auto-complete the command in bash by pressing** `Tab`
6. `./00-generate-random-username.sh`
7. `./01-usergroup.sh`
8. You have to log out (or restart the PC)
9. `./02-steamapps.sh "/path/to/steamapps"` (you got path in step 2)
10. `./03-create-users.sh 4` (replace `4` with amount of accounts you want to create, 12 by default)
11. `./04-init-steams.sh 4` (replace `4` with the amount of accounts you want to init steam on, uset he same as above for this.)
12. `./05-locate-cathook.sh "/path/to/cathook"` (step 3)
13. Run scripts `./06-build-cathook.sh`, `./07-install-config.sh`, `./08-get-account-generator.sh`, `./09-get-ipc-server.sh` and `./10-get-webpanel.sh`
14. Choose the amount of bots you will run, it's better to start with something like 1 (to test) or 3. My i5 3570k @ 3.8GHz and 16GB RAM could run 9 cat-bots.
14. `sudo mkdir cathook-ipc-web-panel/logs;sudo touchfile cathook-ipc-web-panel/logs/main.log;chmod 777 -R cathook-ipc-web-panel/logs`
15. Incase you have a account database file, copy it into `account-generator` now.
16. `./11-start.sh`
17. You have to launch Team Fortress 2, open Casual matchmaking menu and **select only those maps for which you have walkbot paths installed (these path files must be named `default`). Bot abandons the game if there is no default path for map.**
18. Click "Save" button above map selection menu. You can close TF2 now.
(Alternatively run ./95 to just set it up for harvest incl. map selection)
19. open `localhost:8081` and `localhost:8080` in your browser
20. Enter the passwords given in step 15 into the respective windows (8080 is the account generator, 8081 the webpanel), then refresh
21. If you supplied an Account generator databse, you should see a number of avaiable accounts in the account generator. (if you didn't you need to manually adjust the web panel and manually enter accounts using ./04 since Account generation is patched as of now), it will automatically get used by the Web panel
22. Enter a bot quota (not higher than the number you created) and apply it
23. Restart all bots using their restart button
24. The bots should now be running, check cathook-ipc-web-panel/\*.log for details on crashes.
25. When an update is released, run `./13-update.sh`

# TIPS

1. You can run console commands on bots' games. If you are in the web panel, then you can use either `exec <bot ID> <command>` or `exec_all <command>` (will run a command on one bot or all bots, for example `exec_all say hello` or `exec 1 kill`

2. You can increase the amount of catbots you can host by installing a custom UKSM (Ultra Kernel Samepage Merging) kernel. For further details, look up how to install kernel patches and properly install a kernel. https://github.com/dolohow/uksm 

# FAQ

### My bots crashed or are frozen.
Use `./99-kill-everything.sh` to kill all bots/steam instances, stop IPC server and start over from step 14.

### I get error message libGL error: unable to load driver: radeonsi_dri.so/swrast_dri.so
Use `sudo ./97-fix-radeonsi_dri.sh` to remove libstdc++.so.6 and fix the problem.

### Some of my Steam processes note high CPU usage, which hinders my bots from fragging effectively!
In each Steam instance that encounters this problem, go to **Settings** > **Downloads** > **Clear Download Cache**. Restart and relogin, that should fix it.

### Some of my TF2 instances do not start up properly (eg. stuck on ~90 MB of RAM usage).
Restart Steam on each account that fails to start up the game properly.

### TF2 processes crash upon injecting cathook.
There are two causes & solutions I have encountered. The more common one involves simply having TF2 processes left running before injecting cathook for too long - simply try again, but inject cathook quicker!
The much less common one occured to me when I moved my linux installation with catbots already configured to a completely separate machine, causing cathook to spit out SIGILL errors. Recompiling cathook with `./07-build-textmode.sh` fixed the issue.
If neither of these apply to you, consult your cathook logs.
