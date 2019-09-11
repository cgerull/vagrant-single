# Vagrant Single

Install and run a virtual machine on your host

The installation can be used for local development or testing.
Please change the parameter in Vagrantfile to suit your needs.
This script will install 1 virtual machine with Ansible and Docker
provisioned.

## Vagrant

These plugins a needed:

```dos
vagrant plugin list
vagrant-hostmanager (1.8.9, global)
  - Version Constraint: > 0
vagrant-hosts (2.9.0, global)
  - Version Constraint: > 0
vagrant-vbguest (0.19.0, global)
  - Version Constraint: > 0
```

## Virtualisation environments

### VirtualBox

Is the default and need nom alterations in the Vagrant file.
To install the VBox extentions you need the vagrant-vbguest
plugin. The /etc/hosts sync can be done with vagrant-hosts.

### Hyper-V

When using Hyper-V you need to an elevated command prompt. Run CMD as Administrator
 Start the machines with `vagrant up --provider=hyperv`
The /etc/hosts sync can be done with vagrant-hostmanager.

## Operation system

You can change the OS to any supported box you need. In that case please change the setup scripts the example playbook according to you flavour of Linux.

Default OS is CentOs 7.
