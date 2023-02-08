# Packer lab

## Building Mikrotik RouterOS version 7.7 image

1. open Command prompt
2. cd path to packer directory eg Go to Packer foler on workshop content provided on USB drive.

   ~~~cli
   C:> cd C:\workshop\packer\
   C:\workshop\packer>
   ~~~

3. go into mikrotik folder

   ~~~cli
   C:\workshop\packer> cd mikrotik
   C:\workshop\packer\mikrotik>
   ~~~

4. verify packer build config using `packer validate ros.json` and see output similar to following

   ~~~cli
   C:\workshop\packer> packer validate ros.json
   The Configuration is valid.
   ~~~

5. build image usinf `packer build ros.json` and should see output similar to following

   ~~~cli
   C:\workshop\packer> packer build ros.json
    virtualbox-iso: output will be in this color.

    ==> virtualbox-iso: Retrieving ISO
    ==> virtualbox-iso: Trying ../../iso/mikrotik-7.7.iso
    ==> virtualbox-iso: Trying ../../iso/mikrotik-7.7.iso?checksum=md5%3Aefb65169264696dbdc002f99b9b88b1b
    ==> virtualbox-iso: ../../iso/mikrotik-7.7.iso?checksum=md5%3Aefb65169264696dbdc002f99b9b88b1b => /Users/chatur/Downloads/web/npNOG/Automation-Ansible/packer/iso/mikrotik-7.7.iso
    ==> virtualbox-iso: Creating virtual machine...
    ==> virtualbox-iso: Creating hard drive output/virtualbox-iso/mikrotik-7.7/mikrotik-7.7.vdi with size 128 MiB...
    ==> virtualbox-iso: Mounting ISOs...
        virtualbox-iso: Mounting boot ISO...
    ==> virtualbox-iso: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 3467)
    ==> virtualbox-iso: Executing custom VBoxManage commands...
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --memory 128
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --cpus 1
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --acpi on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --ioapic on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --hpet on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --rtcuseutc on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --pae on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --hwvirtex on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --vtxvpid on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --vtxux on
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --nic1 nat
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --nic2 intnet --intnet2 port1
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --nic3 intnet --intnet3 port2
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --nic4 intnet --intnet4 port3
        virtualbox-iso: Executing: modifyvm mikrotik-7.7 --nat-localhostreachable1 on
    ==> virtualbox-iso: Starting the virtual machine...
        virtualbox-iso: The VM will be run headless, without a GUI. If you want to
        virtualbox-iso: view the screen of the VM, connect via VRDP without a password to
        virtualbox-iso: rdp://127.0.0.1:5916
    ==> virtualbox-iso: Waiting 15s for boot...
    ==> virtualbox-iso: Typing the boot command...
    ==> virtualbox-iso: Using SSH communicator to connect: 127.0.0.1
    ==> virtualbox-iso: Waiting for SSH to become available...
    ==> virtualbox-iso: Connected to SSH!
    ==> virtualbox-iso: Provisioning with shell script: scripts/defconf.rsc
        virtualbox-iso: #line 1
        virtualbox-iso: /interface bridge add name=bridge comment=defconf disabled=no
        virtualbox-iso: #line 2
        virtualbox-iso: /interface bridge port add bridge=bridge comment=defconf interface=ether2
        virtualbox-iso: #line 3
        virtualbox-iso: /interface bridge port add bridge=bridge comment=defconf interface=ether3
        virtualbox-iso: #line 4
        virtualbox-iso: /interface bridge port add bridge=bridge comment=defconf interface=ether4
        virtualbox-iso: #line 5
        virtualbox-iso: /ip address add address=192.168.88.1/24 comment=defconf interface=bridge network=192.168.88.0
        virtualbox-iso: #line 6
        virtualbox-iso: /user add name=vagrant password=vagrant group=full
        virtualbox-iso: #line 7
        virtualbox-iso: /tool fetch url="https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub" mode=https
        virtualbox-iso:   status: connecting
        virtualbox-iso:
        virtualbox-iso:       status: finished
        virtualbox-iso:   downloaded: 0KiB
        virtualbox-iso:        total: 0KiB
        virtualbox-iso:     duration: 0s
        virtualbox-iso:
        virtualbox-iso: #line 8
        virtualbox-iso: /user ssh-keys import user=vagrant public-key-file=vagrant.pub
    ==> virtualbox-iso: Gracefully halting virtual machine...
    ==> virtualbox-iso: Preparing to export machine...
        virtualbox-iso: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 3467)
    ==> virtualbox-iso: Exporting virtual machine...
        virtualbox-iso: Executing: export mikrotik-7.7 --output output/virtualbox-iso/mikrotik-7.7/mikrotik-7.7.ovf
    ==> virtualbox-iso: Cleaning up floppy disk...
    ==> virtualbox-iso: Deregistering and deleting VM...
    ==> virtualbox-iso: Running post-processor: vagrant
    ==> virtualbox-iso (vagrant): Creating a dummy Vagrant box to ensure the host system can create one correctly
    ==> virtualbox-iso (vagrant): Creating Vagrant box for 'virtualbox' provider
        virtualbox-iso (vagrant): Copying from artifact: output/virtualbox-iso/mikrotik-7.7/mikrotik-7.7-disk001.vmdk
        virtualbox-iso (vagrant): Copying from artifact: output/virtualbox-iso/mikrotik-7.7/mikrotik-7.7.ovf
        virtualbox-iso (vagrant): Renaming the OVF to box.ovf...
        virtualbox-iso (vagrant): Using custom Vagrantfile: Vagrantfile.template
        virtualbox-iso (vagrant): Compressing: Vagrantfile
        virtualbox-iso (vagrant): Compressing: box.ovf
        virtualbox-iso (vagrant): Compressing: metadata.json
        virtualbox-iso (vagrant): Compressing: mikrotik-7.7-disk001.vmdk
    Build 'virtualbox-iso' finished after 2 minutes 54 seconds.

    ==> Wait completed after 2 minutes 54 seconds

    ==> Builds finished. The artifacts of successful builds are:
    --> virtualbox-iso: 'virtualbox' provider box: ../../box/mikrotik-routeros-7.7.box
   ~~~

6. Now go to workshop content folder, there you see new folder named `box`
7. Inside `box` foler you will find `Mikrotik ROS` image you just created
8. now we will import this into `vagrant` and test it.

   ~~~cli
   C:\workshop> vagrant box add box/mikrotik-routeros-7.7.box --name mikrotik-routeros-7.7
   ==> box: Box file was not detected as metadata. Adding it directly...
   ==> box: Adding box 'mikrotik-routeros-7.7' (v0) for provider: 
       box: Unpacking necessary files from: file://C:\workshop\box\mikrotik-routeros-7.7.box
   ==> box: Successfully added box 'mikrotik-routeros-7.7' (v0) for 'virtualbox'!
   ~~~

9. now initialize vagrant box and test it

   ~~~cli
   C:\workshop> cd vagrant 
   C:\workshop\vagrant> mkdir mikrotik
   C:\workshop\vagrant> cd mikrotik

   C:\workshop\vagrant\mikrotik>vagrant init mikrotik-routeros-7.7

   A `Vagrantfile` has been placed in this directory. You are now
   ready to `vagrant up` your first virtual environment! Please read
   the comments in the Vagrantfile as well as documentation on
   `vagrantup.com` for more information on using Vagrant.
   ~~~

10. start vagrant box

    ~~~cli
    C:\workshop\vagrant\mikrotik> vagrant up

    Bringing machine 'default' up with 'virtualbox' provider...
    ==> default: Importing base box 'mikrotik-routeros-7.7'...
    ==> default: Matching MAC address for NAT networking...
    ==> default: Setting the name of the VM: vagrant_default_1675848542546_17610
    ==> default: Clearing any previously set network interfaces...
    ==> default: Preparing network interfaces based on configuration...
        default: Adapter 1: nat
        default: Adapter 2: hostonly
        default: Adapter 3: intnet
        default: Adapter 4: intnet
    ==> default: Forwarding ports...
        default: 22 (guest) => 2222 (host) (adapter 1)
    ==> default: Running 'pre-boot' VM customizations...
    ==> default: Booting VM...
    ==> default: Waiting for machine to boot. This may take a few minutes...
        default: SSH address: 127.0.0.1:2222
        default: SSH username: vagrant
        default: SSH auth method: private key
    The configured shell (config.ssh.shell) is invalid and unable
    to properly execute commands. The most common cause for this is
    using a shell that is unavailable on the system. Please verify
    you're using the full path to the shell and that the shell is
    executable by the SSH user.
    ~~~

11. ssh into mikrotik vagrant box

    ~~~cli
    C:\workshop\vagrant\mikrotik> vagrant ssh

    MMM      MMM       KKK                          TTTTTTTTTTT      KKK
    MMMM    MMMM       KKK                          TTTTTTTTTTT      KKK
    MMM MMMM MMM  III  KKK  KKK  RRRRRR     OOOOOO      TTT     III  KKK  KKK
    MMM  MM  MMM  III  KKKKK     RRR  RRR  OOO  OOO     TTT     III  KKKKK
    MMM      MMM  III  KKK KKK   RRRRRR    OOO  OOO     TTT     III  KKK KKK
    MMM      MMM  III  KKK  KKK  RRR  RRR   OOOOOO      TTT     III  KKK  KKK

    MikroTik RouterOS 7.7 (c) 1999-2023       https://www.mikrotik.com/


    ROUTER HAS NO SOFTWARE KEY
    ----------------------------
    You have 23h33m to configure the router to be remotely accessible,
    and to enter the key by pasting it in a Telnet window or in Winbox.
    Turn off the device to stop the timer.
    See www.mikrotik.com/key for more details.

    Current installation "software ID": WLIM-CM73
    Please press "Enter" to continue!


    [vagrant@MikroTik] > 
    [vagrant@MikroTik] > quit
    Connection to 127.0.0.1 closed.

    ~~~

12. destroy mikrotik box

    ~~~cli
    C:\workshop\vagrant\mikrotik> vagrant destroy
        default: Are you sure you want to destroy the 'default' VM? [y/N] y
    ==> default: Forcing shutdown of VM...
    ==> default: Destroying VM and associated drives...
    ~~~
