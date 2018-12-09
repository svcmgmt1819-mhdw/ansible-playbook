# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "dockhost"
  config.vm.network "private_network", ip: "172.16.0.100", :netmask => "255.255.255.0"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end
  
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = { ansible_python_interpreter: "/usr/bin/python3" }
    ansible.tags = ["docker", "docker_compose", "ansible-docker", "swarm", "users", "ssh", "packages", "services", "pr08", "pr09"]
  end
end
