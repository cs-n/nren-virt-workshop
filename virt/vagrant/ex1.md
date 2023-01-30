# Vagrant Lab - Getting Started with Vagrant

## How to use these Labs

1. Install Vagrant: [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)
2. Install Oracle Virtual Box:  [https://www.virtualbox.org/](https://www.virtualbox.org/)
3. In a new Directory/folder on your desktop named `workshop`

    ``` shell
    cd Desktop
    mkdir workshop
    ```

4. go into the workshiop folder and create new folder named `vagrantvm`

    ``` shell
    mkdir vagrantvm
    cd vagrantvm
    ```

5. Initialize the VM using vagrant init, it will create `Vagrantfile`

    ``` shell
    vagrant init bento/ubuntu-18.04

    ls
    ```

6. open `Vagrantfile`

    ```shell
    notepad Vagrantfile
    ```

    and add following lines below `config.vm.box = "bento/ubuntu-18.04"`

    ```ruby
    config.vm.hostname = "vm1"
    config.vm.network "private_network", ip: "172.16.1.10"
    ```

    final content should look like

    ```ruby
    Vagrant.configure("2") do |config|
      config.vm.box = "bento/ubuntu-18.04"
      config.vm.hostname = "vm1"
      config.vm.network "private_network", ip: "172.16.1.10"
    end

    ```

    finally save content

7. Start VM

    ``` shell
    vagrant up
    ```

    **Note**: for first time it will take lot of time to boot up VM as it has to download image file.

8. SSH into the VM

    ``` shell
    vagrant ssh
    ```

9. Stop VM

    ``` shell
    vagrant halt
    ```
