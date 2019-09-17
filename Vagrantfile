# -*- mode: ruby -*-
# vi: set ft=ruby :

###
# Install virtual linux VM on your hypervisor.
#
# Naming suggestions:
# <name>-app          -> this is the application server
# <name>-db           -> a separate database server
# <name>-controller -> control server, is provisioned
#               with Ansible and Git. Should be used for
#               automation of this environment
#
#
# When using Hyper-V you need to an elevated command prompt. Run CMD
# as Administrator.
# Start the machines with vagrant up --provider=hyperv
###

# Vagrantfile API/syntax version. Don't touch unless you know
# what you're doing!
VAGRANTFILE_API_VERSION = '2'.freeze

# If you have more machines use a descriptive name.
VM_NAME = 'DevOps'.freeze

VM_IP_ADDRESS = '192.168.56.100'.freeze

# CentOs
BOX = 'centos/7'.freeze
VM_PREFIX = 'centos'.freeze

# Ubuntu
# BOX = 'ubuntu/bionic64'.freeze
# VM_PREFIX = 'ubuntu'.freeze

# On Windows 10  Pro with Hyper-V use hyperv. This example uses VirtualBox.
PROVIDER = 'VirtualBox'.freeze

#############################################################################
# Start of vagrant setup_support_host
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Hostmanager settings
  # Enable Hostmanager when running on Hyper-V
  config.hostmanager.enabled = false
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = true
  config.hostmanager.include_offline = true

  # Configure node
  config.vm.define "#{VM_PREFIX}-#{VM_NAME}" do |node|
    node.vm.box = BOX.to_s
    node.vm.hostname = "#{VM_PREFIX}-#{VM_NAME}"
    # Set IP address for VirtualBox machines
    node.vm.network 'private_network', ip: VM_IP_ADDRESS.to_s
    node.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

    node.vm.provider 'virtualbox' do |vb|
      vb.memory = '2048'
      vb.cpus = '2'
      vb.name = "#{VM_PREFIX}-#{VM_NAME}"
      vb.gui = false
    end

    node.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = '/vagrant//provisioning/setup_devops.yml'
    end
  end
end
