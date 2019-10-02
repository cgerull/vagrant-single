# -*- mode: ruby -*-
# vi: set ft=ruby :

###
# Install virtual linux VM on your hypervisor.
# The primary goal is to perform development
# and testing for DevOps tooling.
#
# This Vagrant file is suitable for VirtualBox and
# Hyper-V. The preconfigured Linux VM is Centos 7
# or Ubuntu 18.04. Please enable the approbiate
# sections.
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
# PROVIDER = 'VirtualBox'.freeze
PROVIDER = 'hyperv'.freeze

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

    # Set network for VirtualBox machines
    # node.vm.network 'private_network', ip: VM_IP_ADDRESS.to_s
    # node.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

    # Set network for Hyper-V machines
    config.vm.network "public_network"
    config.vm.synced_folder ".", "/vagrant", type: "smb"

    node.vm.provider 'virtualbox' do |vb|
      vb.memory = '2048'
      vb.cpus = '2'
      vb.name = "#{VM_PREFIX}-#{VM_NAME}"
      vb.gui = false
    end

    config.vm.provider "hyperv" do |hv|
      hv.memory = '4096'
      hv.cpus = '4'
      hv.enable_virtualization_extensions = true
      hv.linked_clone = true
    end

    # Hyper-V needs SMB2
    # On modern boxes the cifs-utils package is usally installed
    # If you encounter mount errors like
    #      mount error(112): Host is down
    # please uncomment the following code to install the package.
    # If you have this problem with Ubuntu please change the
    # package manager to apt.
    #
    # node.vm.provision 'shell', 
    #   inline: 'yum install -y cifs-utils'

    node.vm.provision 'ansible_local' do |ansible|
      ansible.playbook = '/vagrant//provisioning/setup_devops.yml'
    end
  end
end
