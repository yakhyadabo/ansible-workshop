# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative './vagrant/key_authorization'

Vagrant.configure(2) do |config|

  config.vm.box = "centos/7"
 
  config.ssh.insert_key = false 
  # config.hostmanager.enabled = true
  # config.hostmanager.manage_host = true
  # config.hostmanager.ignore_private_ip = false
  # config.hostmanager.include_offline = true

  # Copy SSH public key
  authorize_key_for_root config, '~/.ssh/id_rsa.pub'

  # config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/root/.ssh/authorized_keys"
  # config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/authorized_keys"

  # 192.168.1.1  : The ip that refers to localhost
  # The 'ip route show' command can also be used to display the Ip to use (Ex 10.0.2.15)
  
  [ 
    {:name => 'node0', :ip  => '192.168.1.10'},
    {:name => 'node1', :ip  => '192.168.1.11'},
    {:name => 'node2', :ip  => '192.168.1.12'},
    {:name => 'ci',    :ip  => '192.168.1.13'}
  ].each do |infos|

    config.vm.define infos[:name] do |host|
      host.vm.network "private_network", ip: infos[:ip]
      host.vm.hostname = "#{infos[:name]}.app.dev"
    end
  end

end
