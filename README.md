# LFS install scripts

## How to build the temp system

First of all make sure you have all tools installed to build the temp-system.
The LFS website has an script to do that.

The first step then is to prepare the host-system as `root`:

    su
    ./00-download-sources
    ./01-prepare-temp-system
    
During these commands the `lfs` user is created.
You are prompted to set the password for them.

The next step is to further prepare the system as `lfs` and then to build the temp-system.

    su lfs
    ./02-prepare-temp-system-2
    source ~/.bash_profile
    source ~/.bashrc
    ./03-build-temp-system
    
Afterwards the temp-system is set up correctly.
You should then run the cleanup as `root` and prepare the system to `chroot` into it.
This also installs the helper tools for a user-based package-management.

    su
    ./04-cleanup-temp-system
    ./10-prepare-lfs-system

