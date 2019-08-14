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

Now you `chroot` into the lfs system (but make sure `LFS` is set).
From there prepare the lfs system by creating the needed files and links.

    su
    chroot "$LFS" /tools/bin/env -i \
        HOME=/root                  \
        TERM="$TERM"                \
        PS1='(lfs chroot) \u:\w\$ ' \
        PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
        /tools/bin/bash --login +h
    ./11-prepare-lfs-system-2

You can (while still in the `chroot`) change the "I have no name!" to the correct prompt.

    exec /tools/bin/bash --login +h

Now you need to install the packages. Currently there is no script to install all of them for you, so you have to do it.
Remeber to run these commands while still in the `chroot`.
While installing the packages you will often switch to the package user account.

    cd /usr/pkg/linux-4.20.12 ; make with-local-sources
    make install && exit

    cd /usr/pkg/man-pages-4.16 ; make with-local-sources
    make install && exit

