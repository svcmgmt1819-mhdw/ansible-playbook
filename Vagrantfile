# -*- mode: ruby -*-
# vi: set ft=ruby :

NUMBER_OF_NODES = 3

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  
  (0..NUMBER_OF_NODES-1).each do |i|
    config.vm.define "dockhost#{i}" do |dockhost|
      dockhost.vm.hostname = "dockhost#{i}"
      dockhost.vm.network "private_network", ip: "172.16.0.10#{i}", :netmask => "255.255.255.0"
      dockhost.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "playbook.yml"
        ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python3", dockhost_no: "#{i}" }
        ansible.tags = ["docker", "docker_compose", "ansible-docker", "swarm", "swarmapp", "users", "ssh", "packages", "services"]
      end
    end
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end
end
