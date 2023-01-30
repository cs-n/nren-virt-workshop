# Vagrant Labs - Multiple Hosts

1. go into the workshiop folder named `vagrantvm`

    ``` shell
    mkdir vagrantvm
    cd vagrantvm
    ```

2. now we will manage Multiple hosts or VMs through single `Vagrantfile`

3. open `Vagrantfile`

    ```shell
    notepad Vagrantfile
    ```

    and update the file to look like

    ```ruby
    Vagrant.configure("2") do |config|
        servers=[
            {
            :hostname => "Server1",
            :box => "bento/ubuntu-18.04",
            :ip => "172.16.1.50",
            :ssh_port => '2200'
            },
            {
            :hostname => "Server2",
            :box => "bento/ubuntu-18.04",
            :ip => "172.16.1.51",
            :ssh_port => '2201'
            },
            {
            :hostname => "Server3",
            :box => "bento/ubuntu-18.04",
            :ip => "172.16.1.52",
            :ssh_port => '2202'
            }
        ]

        servers.each do |machine|
            config.vm.define machine[:hostname] do |node|
                node.vm.box = machine[:box]
                node.vm.hostname = machine[:hostname]
                node.vm.network :private_network, ip: machine[:ip]
                node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"
                node.vm.synced_folder "../data", "/home/vagrant/data"
                node.vm.provision "file", source: "./copiedfile.txt", destination: "/home/vagrant/copiedfile.txt"

                node.vm.provider :virtualbox do |vb|
                    vb.customize ["modifyvm", :id, "--cpus", 1]
                    vb.customize ["modifyvm", :id, "--memory", 512]
                end
            end
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

6. Goto VirtualBox, and verify all vagrant managed VMs are created

7. Try SSHing into all VMs

    ``` shell
    vagrant ssh

    vagrant ssh Server1
    vagrant ssh Server2
    vagrant ssh Server3
    ```

8. Stop VM

    ``` shell
    vagrant halt
    ```
