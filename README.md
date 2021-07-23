```
                ____  __           
               / __ \/ /___ ___  __
              / /_/ / / __ `/ / / /
             / ____/ / /_/ / /_/ / 
            /_/   /_/\__,_/\__, /  
                          /____/  
             _ _ _  _    _    _   
            | | | |<_> _| |_ | |_ 
            | | | || |  | |  | . |
            |__/_/ |_|  |_|  |_|_|
   ___                     _                     
  |   \    ___     __     | |__    ___      _ _  
  | |) |  / _ \   / _|    | / /   / -_)    | '_| 
  |___/   \___/   \__|_   |_\_\   \___|   _|_|_  
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| 
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'
           _____     _____ _____ _____ 
          |   | |___|  |  |   | |     |
          | | | | . |  |  | | | |   --|
          |_|___|___|\___/|_|___|_____|

```
instant web vnc WITH VIRTUALGL (THAT MEANS MINECRAFT!!)

ubuntu ones are for katacoda ubuntu playground, alpine ones are for play with docker.


# NOTICES
· Most ubuntu ones that don't use qemu are NOT optimized yet. (Except for minecraft)

· The minecraft and qemu scripts for ubuntu have to be run in ubuntu version 20.04 or they will not work due to hardware requirements.

· There currently is no documentation for each script. Adding a launch command, detailed step-by-step guides and general descriptions is being worked on and may get added in the future.

# How to run ubuntu_* scripts:

There are three versions of ubuntu playground:

· [Ubuntu 16.04](https://www.katacoda.com/courses/ubuntu/playground)

· [Ubuntu 18.04](https://www.katacoda.com/courses/ubuntu/playground1804)

· [Ubuntu 20.04](https://www.katacoda.com/courses/ubuntu/playground2004)


Most ubuntu scripts can be run on the 16.04 version but the Minecraft and Qemu scripts have to be run on ubuntu 20.04 due to qemu needing kvm (which only is enabled in ubuntu 20.04) and Minecraft needing a networking library that is outdated in ubuntu 16.04 and therefore causes lots of issues with multiplayer.

**The launch command:**

In order to launch any of the ubuntu scripts, you need to run the following command in ubuntu playground:

```
wget http://raw.githubusercontent.com/ayunami2000/play-with-docker-novnc/main/ubuntu_<insert name>.sh && chmod +x ubuntu_<insert name>.sh && ./ubuntu_<insert name>.sh
```

(replace <insert name> with the name of the script)

# Special thanks
Special thanks go to FreddyFeuerstein (aka iAmInActions) for improving ubuntu scripts, laying the groundwork for audio and adding a minecraft launcher.
