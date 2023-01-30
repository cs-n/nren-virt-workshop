# VirtualBox lab #

[Return to Detailed agenda](../../agenda.md)

## Overview ##

You will install VirtualBox on your laptop, create a VM, and install a guest operating system.

Note: the files you will need (VirtualBox software and ISO images) will be provided either on a USB stick or on the workshop web server. Please don't download large files directly from the Internet.

The USB stick is preferred as it will be faster than the shared wireless.

If your laptop has less than 1GB of RAM or less than 5GB of spare disk space, please check with the instructors if it will be suitable.

## Install VirtualBox ##

Separate instructions follow for Mac OSX, Windows and Linux. Once you have installed VirtualBox, move onto the section entitled "Create a Virtual Machine".

### Mac OSX ###

Double-click on the disk image file **`VirtualBox-x.x.x-xxxxx-OSX.dmg`**
![VirtualBox Disk Image](virtualbox-disk-image.png)
Double-click on **`VirtualBox.pkg`** and follow the installer.
![VirtualBoc Install Start](virtualbox-install-start.png)
![VirtualBox Install Finish](virtualbox-install-finish.png)
Open the Applications folder and double-click on VirtualBox. You can lock its icon onto the Dock to make it quicker to find in future. The Host Key by default is the Left Cmd key.

### Windows ###

Double-click on the executable **`VirtualBox-x.x.x-xxxxx-Win.exe`** and follow the install wizard with default settings. Give it permission to install the device drivers.

Start VirtualBox using the icon on the desktop or in the start menu.

!!! Tip: Note
    If you have Windows 8 and have enabled Hyper-V, you will need to [disable]("http://superuser.com/questions/500166/intel-vt-x-disappeared-after-upgrading-to-windows-8" target="_blank") [Hyper-V]("http://social.technet.microsoft.com/Forums/windows/en-US/118561b9-7155-46e3-a874-6a38b35c67fd/hyperv-disables-vtx-for-other-hypervisors?forum=w8itprogeneral" target="_blank") before VirtualBox can work.

**Checking VT-x**

VirtualBox doesn't require VT-x or AMD-V (except when running 64-bit guests), but it will work faster with it.

You can check whether hardware virtualization is enabled on your laptop by downloading and running the [Hardware-Assisted Virtualization Detection Tool]("http://www.microsoft.com/en-us/download/details.aspx?id=592" target="_blank")

If it says "this computer does not have hardware-assisted virtualization" then your laptop may be so old that it does not have this feature, or it could just be disabled in the BIOS.

Restart your laptop, go into BIOS Setup, then look for a setting which may be under "Advanced BIOS Features" or "Security".
~~~~text
Virtualization Technology (VT-x)
~~~~
Ensure it is set to Enabled. (If you see VT-d, you can turn that on as well, but it's only important if you want to give your guest VM direct access to some of the host hardware)

After changing this setting and saving, some systems require you to fully power off and power on again.

In extreme cases you may need to [disable and re-enable VT-x]("https://forums.virtualbox.org/viewtopic.php?p=108857" target="_blank")

### For Linux (Ubuntu 14.04, 16.04, 16.10, 18.02) ###

Copy the appropriate file for your operating system:

* 14.04
  - virtualbox-x.x_x.x.x-xxxxx~Ubuntu~trusty_i386.deb for a 32-bit system
  - virtualbox-x.x_x.x.x-xxxxx~Ubuntu~trusty_amd64.deb for a 64-bit system

* 16.04
  - virtualbox-x.x_x.x.x-xxxxx~Ubuntu~xenial_i386.deb for a 32-bit system
  - virtualbox-x.x_x.x.x-xxxxx~Ubuntu~xenial_amd64.deb for a 64-bit system

* 16.10
  - virtualbox-x.x_x.x.x-xxxxx~Ubuntu~yakkety_i386.deb for a 32-bit system
  - virtualbox-x.x_x.x.x-xxxxx~Ubuntu~yakkety_amd64.deb for a 64-bit system

* 18.04 / 18.10 / 19.04
  - virtualbox-x.x_x.x.xx-xxxxxx~Ubuntu~bionic_amd64.deb for a 64-bit system

Install it by double-clicking,
![](virtualbox-install-linux.png)
![](virtualbox-install-linux1.png)

or from the command line using this command:
~~~~bash
$ sudo dpkg -i virtualbox-x.x_x.x.x-xxxxx~Ubuntu~xxxxxxx_xxx.deb
~~~~
Start the GUI by typing "VirtualBox"

To check whether your laptop has VT-x, at a command line type
~~~~bash
$ egrep '(vmx|svm)' /proc/cpuinfo
~~~~
If you see at least one line containing vmx or svm, the CPU has this capability, although it is not necessarily enabled in the BIOS.

## Create a virtual machine ##
You are now going to create a virtual machine and install Ubuntu inside it.

You will install Ubuntu Server Edition, as it is faster to install than the Desktop Edition, and will give you an opportunity to practice administering a system using the command line.

The 32-bit (i386) version is fine because we do not expect to give this VM more than 4GB of RAM. For a real server you would more likely install the 64-bit (amd64) version instead.

Find the appropriate Ubuntu ISO image (e.g. **`ubuntu-14.04.5-server-i386.iso`**). Make a folder on your laptop for ISO images, and copy the Ubuntu ISO image there.

### New Virtual Machine ###
In the VirtualBox Manager window, click on the "New" button (a blue spiky circle)

![](buttons.png)

The first screen asks for Name and operating system

Enter:
* Name: ubuntu-1 (or any other name you like)
* Type: Linux
* Version: Ubuntu (or Ubuntu 64-bit if you're installing 64-bit version)
* click Next
The next screen is the memory size. Set the memory down to 512 MB, unless your machine has enough RAM for the default (1024 MB).

The next screen asks for Hard drive. Select "Create a virtual hard drive now" and click "Create"

Select the default VDI (VirtualBox Disk Image) and click Next.

Choose "Dynamically allocated" and click Next. (This option allocates disk space only when the guest OS writes to the virtual disk)

Accept the default size of 8.00 GB. Note that this won't actually use 8GB straight away on your laptop, but will allow it to grow up to 8GB. Click Create.

Now you will see the VM created but in state "Powered Off"

### Insert virtual CD ###
When you start a VM for the first time, VirtualBox will automatically prompt you for a CD-ROM image. However you are going to do it the manual way so that you learn your way around the settings.

Before starting the VM, click on the "Settings" button (an orange sprocket)

Click on Storage.

You should see:

* Controller: IDE
* ... Empty (with a CD icon)
* Controller: SATA
* ... ubuntu-1.vdi

Click on the CD icon by "Empty". To the right you will see:

* Attributes:
  - CD/DVD Drive: IDE Secondary Master, and another CD icon
Click on this other CD icon. From the menu which appears, select "Choose a virtual CD/DVD disk file..."

![](choose-cd-image.png)

Browse to the directory where you copied the ubuntu server ISO image, and select it.

You should now see:

* Controller: IDE
* ... ubuntu-16.04-1-server-i386
* Controller: SATA
* ... ubuntu-1.vdi
Click OK.

### Start the VM ###

Select the VM and click the green Start arrow - or simply double-click the VM - and your VM will start.

You may get some warnings - read them. One will read something like this:

*`"You have Auto capture keyboard option turned on ... You can press the host key at any time to uncapture the keyboard and mouse and return them to normal operation ... The host key is currently defined as Right Ctrl"`*

Have a look at the bottom right-hand corner of the window. It should show a reminder of what the host key is set to, next to a small downward arrow.

The Ubuntu installer should start. Click inside the window. Note that you have to press the host key to get your mouse out again.

If this is the first time you've installed Ubuntu, ask a neighbor or an instructor for help if you get stuck.

Select your language, and press F3 if you want to select a non-US keyboard layout.

Next, press F4 and select "Install a minimal virtual machine".

![](modes.png)

This selects the minimum number of packages to get a very basic system.

Then select "Install Ubuntu Server" from the front menu, and follow the prompts. Use Tab to move around the screen, Enter to select something.

Follow the prompts for timezone, keyboard and so on. It's quickest to say "No" when asked if you want to auto-detect the keyboard layout; you can then manually select the US English layout or whichever is appropriate.

Use whatever hostname, username and password you like. This is your own VM to take away and keep! Ask your neighbor or an instructor if you need help.

We do strongly suggest the following settings:

* Encrypt your home directory? No
* Partitioning method: Guided - use entire disk

![](partitioning.png)

It will say that it will use the entire disk sda, which is about 8.6GB and is an "ATA VBOX HARDDISK"

Allow it to write changes to the disk. Remember, this is safe - you're not overwriting your real hard drive, it's only writing into the virtual disk file you created before.

* For HTTP proxy please enter http://apt.lab.workalaya.net:3142/ unless the instructors tell you otherwise. This will speed up the installation by using a local cache of packages.
![](proxy.png)

* No automatic updates
* When you get to "Choose software to install", move to OpenSSH Server and hit Space to select it, but leave everything else unselected.
* Install GRUB boot loader to the master boot record? Yes.

## Restart ##

Once the installation is complete, you will be prompted to restart.

If the machine starts up with the virtual CD-ROM still attached, you may need to remove it. Go to *`Settings > Storage`* as before, click on the CD icon under Controller IDE, click on the second CD icon, select "Remove disk from virtual drive". Then restart the VM again.

After a few seconds you should get an Ubuntu login prompt. Login with the username and password you created.

## Try the console ##
You a sitting in front of a server text console. Just like on a real PC, you can switch between virtual consoles using Ctrl-Alt-F1 to Ctrl-Alt-F6.

Here are a few basic commands you can try: the "$" is the prompt you will see, so don't type it.

~~~~bash
$ uptime        # how long machine is running, how busy it is
$ uname -a      # information about the kernel
$ df -h         # free disk space in (h)uman readable form
$ ls /          # list the root directory
~~~~

## Mouse cursor (Optional) ##
If you want a mouse cursor in Ubuntu Server, you need to install the package "gpm". These commands need to be run with "root" or superuser privileges, so you prefix them with "sudo".

~~~~bash
$ sudo apt-get update          # update the index of downloadable packages
$ sudo apt-get install gpm     # install the package
~~~~

Once you've done this, you should be able to copy-paste within your VM by using the left and right buttons to select, and middle button to paste.

If this doesn't work, you may need to disable "Mouse Integration" under the "Input" Menu.

If you want to be able to copy-paste between the VM and your laptop, see the optional exercises at the end.

## ACPI shutdown ##
Try selecting *`Machine > ACPI shutdown`* from VirtualBox, and you should see that this triggers the virtual machine to shut itself down. It takes only a couple of seconds. Then you can restart your virtual machine.

If nothing happens, it could be because your server doesn't have an acpi daemon installed to respond to the request. If so, you can install it like this:

~~~~bash
$ sudo apt-get install acpid
~~~~

# Additional exercises #
If you complete the basic Ubuntu install early, here are some additional things you can do, as well as exploring the Ubuntu install you've just done.

## Install VirtualBox Guest Additions ##
The "guest additions" are some extra code which can be installed inside the guest OS to improve keyboard and mouse integration, and enable things like copy-paste and easy file transfer between host and guest.

* In VirtualBox, select *`Devices > Insert Guest Additions CD image...`*
* Inside the VM (as the root user) mount the CD image and run the installer script.

~~~~bash
$ sudo -s                                   # enter a root shell
# apt-get install build-essential dkms      # we need these packages
# mount /dev/cdrom /mnt                     # mount the CD-ROM
# /mnt/VBoxLinuxAdditions.run               # run the installer
~~~~
!!! Tip: Note
    It is normal to see an error about the window system, because we have installed the server version of Ubuntu with no graphical interface

~~~~bash
Installing the Window System drivers ...fail!
(Could not find the X.Org or XFree86 Window System.)
~~~~
When it has finished, you can unmount the CD image:

~~~~bash
# umount /mnt
# exit                                      # leave the root shell
$
~~~~
You may need to repeat this every time you install an updated kernel from Ubuntu.

Once this is done, you should find that, if that was not already the case, mousing over the window works without having to capture and release the mouse any more.

Also, it's now possible to share folders between your Host (laptop) and the virtual machine. We won't look at this now.

!!! Tip: Note
    copy-paste between guest and host only works with a desktop GUI.

### Add a desktop to your server ###

Your installed Ubuntu Server VM can have a desktop added. There are many to choose from, but LXDE is a compact and lightweight one. All you need to do is:
~~~~bash
$ sudo apt-get install xorg lxde lxdm
~~~~
When prompted for which graphical login manager, choose 'lxdm'

~~~~bash
$ sudo service lxdm start
~~~~
This should switch to a graphical interface where you can login again. You can still get to the text console with Ctrl-Alt-F1, and return to the graphical interface with Ctrl-Alt-F7.

Inside your VM you probably want to disable the screensaver (*`Start > Preferences > Screensaver`*) because the default screensavers are very CPU intensive and will drain your laptop battery!

The virtual console screen may be larger than the window on your desktop, so you may need to scroll down to see the bottom line of the console where the LXDE start button is. *`Start > Accessories > LXTerminal`* will give you a terminal window.

### Reinstall guest additions ###
When the graphical interface is present, you can reinstall the guest additions (just open the file manager and double-click on *`autorun.sh`*)

Once it,s done, reboot your VM.

Now, whenever you resize the window the desktop should auto-resize to fit, avoiding the need to scroll.

Furthermore, the "seamless windows" feature should now be available (*`View > Switch to seamless mode`*). This scales the VM to fit your available screen and removes the background, so VM windows sit side-by-side with your regular windows.

### Copy-paste ###
If you want to copy-paste between the VM and your host machine, you need to enable it in VirtualBox by selecting

*`Devices > Shared Clipboard > Bidirectional`*

Finally, you may also need to open a terminal and run VBoxClient-all in the guest OS before copy-paste works.

### Getting rid of the proxy ###
If you continue to use this VM outside the classroom, you will find that the HTTP proxy (apt.ws.nsrc.org) is not available. To disable it you need to edit the file /etc/apt/apt.conf and remove or comment out this line:

~~~~bash
Acquire::http::Proxy "http://apt.lab.workalaya.net:3142/";
~~~~

and then run *`apt-get update`*. But don't do this until after the end of the system administration section of the workshop.

----

[Return to Detailed agenda](../../agenda.md)
