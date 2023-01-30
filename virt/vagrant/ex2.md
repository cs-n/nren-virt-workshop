# Vagrant Lab - Advanced Vagrantfile Configuration

## Assign CPU and RAM

1. go into the workshiop folder named `vagrantvm`

    ``` shell
    cd vagrantvm
    ```

2. now we will assign cpu and memory limit to vagrant box or VM

    ```text
    CPU: 2
    RAM: 1024MB or 1GB
    ```

3. open `Vagrantfile`

    ```shell
    notepad Vagrantfile
    ```

    and add following lines

    ```ruby
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end
    ```

    final content should look like

    ```ruby
    Vagrant.configure("2") do |config|
      config.vm.box = "bento/ubuntu-18.04"
      config.vm.hostname = "vm1"
      config.vm.network "private_network", ip: "172.16.1.10"
      
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--memory", 1024]
      end
    
    end

    ```

    finally save file

4. validate `Vagrantfile` config

    ``` shell
    vagrant validate
    ```

5. Start VM

    ``` shell
    vagrant up
    ```

6. Goto VirtualBox, and verify CPU and RAM changed accordingly for vagrant managed VM

7. Stop VM

    ``` shell
    vagrant halt
    ```

## Share File and sync folder

1. go to `workshop` folder and create new folder named `data`
2. create new file named `syncedfile.txt` inside `data` folder and create some content in this file
3. go into `vagrantvm` folder and create new file named `copiedfile.txt` and create some content in this file
4. modify `Vagrantfile` to add following lines

    ```ruby
    config.vm.synced_folder "../data", "/home/vagrant/data"
    config.vm.provision "file", source: "./copiedfile.txt", destination: "/home/vagrant/copiedfile.txt"
    ```

    final content should look like

    ```ruby
    Vagrant.configure("2") do |config|
      config.vm.box = "bento/ubuntu-18.04"
      config.vm.hostname = "vm1"
      config.vm.network "private_network", ip: "172.16.1.10"
      config.vm.synced_folder "../data", "/home/vagrant/data"
      config.vm.provision "file", source: "./copiedfile.txt", destination: "/home/vagrant/copiedfile.txt"
      
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--memory", 1024]
      end
    
    end

    ```

    finally save file

5. validate `Vagrantfile` config

    ``` shell
    vagrant validate
    ```

6. Start VM

    ``` shell
    vagrant up
    ```

7. SSH into VM and verify if `copiedfile.txt` and `data` folder exist and `syncedfile.txt` inside `data` exist and contents of both file same as in host.
8. Try updating both file on host and on VM and see if changes get synced
9. Stop VM

    ``` shell
    vagrant halt
    ```
