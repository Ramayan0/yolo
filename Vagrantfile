# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration version
Vagrant.configure("2") do |config|

  # Box to use, Ubuntu 20.04 is a good choice for your project
  config.vm.box = "ubuntu/focal64"

  # Network configuration
  # Forward port 3000 from the VM to the host for the web application (frontend)
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Private network configuration (optional, for internal VM communication)
  # config.vm.network "private_network", type: "dhcp"

  # Provider-specific configuration (VirtualBox in this case)
  config.vm.provider "virtualbox" do |vb|
    # Customize VM resources
    vb.memory = "1024"  # Assign 1 GB of memory
    vb.cpus = 2         # Assign 2 CPUs
  end

  # Provisioning with Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"  # Path to your Ansible playbook
    ansible.verbose = "v"              # Optional: provides detailed output during playbook run
  end

  # Optional: Share a folder between host and VM (for persistent data or code)
  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  # Uncomment this section to enable SSH access to the VM without password prompts
  # config.ssh.username = "vagrant"
  # config.ssh.password = "vagrant"
  # config.ssh.insert_key = false
end
