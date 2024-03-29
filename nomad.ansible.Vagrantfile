# -*- mode: ruby -*-
# vi: set ft=ruby :

# 2023
# https://github.com/ansible-community/ansible-nomad/blob/master/examples/Vagrantfile

# Vagrantfile for bootstrapping a development nomad cluster with
# VirtualBox provider and Ansible provisioner

ANSIBLE_PLAYBOOK = ENV['ANSIBLE_PLAYBOOK'] || "site.yml"
VAGRANTFILE_API_VERSION = "2"
BOX_MEM = ENV['BOX_MEM'] || "1536"
BOX_NAME =  ENV['BOX_NAME'] || "debian/jessie64"
CLUSTER_HOSTS = ENV['CLUSTER_HOSTS'] || "vagrant_hosts"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Configure 3 nomad nodes
  config.vm.define :nomad1 do |nomad1_config|
    nomad1_config.vm.box = BOX_NAME
    nomad1_config.vm.network :private_network, ip: "10.1.42.70"
    nomad1_config.vm.hostname = "nomad1.local"
    nomad1_config.ssh.forward_agent = true
    nomad1_config.vm.provider "virtualbox" do |v|
      v.name = "nomad-node1"
      v.customize ["modifyvm", :id, "--memory", BOX_MEM]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    if ENV['NOMAD_DOCKER_ENABLE'] == "true"
      nomad1_config.vm.provision "docker"
    end
    nomad1_config.vm.provision :hosts do |provisioner|
        provisioner.add_host '10.1.42.70', ['nomad1.local']
        provisioner.add_host '10.1.42.71', ['nomad2.local']
        provisioner.add_host '10.1.42.72', ['nomad3.local']
    end
  end
  config.vm.define :nomad2 do |nomad2_config|
    nomad2_config.vm.box = BOX_NAME
    nomad2_config.vm.network :private_network, ip: "10.1.42.71"
    nomad2_config.vm.hostname = "nomad2.local"
    nomad2_config.ssh.forward_agent = true
    nomad2_config.vm.provider "virtualbox" do |v|
      v.name = "nomad-node2"
      v.customize ["modifyvm", :id, "--memory", BOX_MEM]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    if ENV['NOMAD_DOCKER_ENABLE'] == "true"
      nomad2_config.vm.provision "docker"
    end
    nomad2_config.vm.provision :hosts do |provisioner|
        provisioner.add_host '10.1.42.70', ['nomad1.local']
        provisioner.add_host '10.1.42.71', ['nomad2.local']
        provisioner.add_host '10.1.42.72', ['nomad3.local']
    end
  end
  config.vm.define :nomad3 do |nomad3_config|
    nomad3_config.vm.box = BOX_NAME
    nomad3_config.vm.network :private_network, ip: "10.1.42.72"
    nomad3_config.vm.hostname = "nomad3.local"
    nomad3_config.ssh.forward_agent = true
    nomad3_config.vm.provider "virtualbox" do |v|
      v.name = "nomad-node3"
      v.customize ["modifyvm", :id, "--memory", BOX_MEM]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    if ENV['NOMAD_DOCKER_ENABLE'] == "true"
      nomad3_config.vm.provision "docker"
    end
    nomad3_config.vm.provision :hosts do |provisioner|
        provisioner.add_host '10.1.42.70', ['nomad1.local']
        provisioner.add_host '10.1.42.71', ['nomad2.local']
        provisioner.add_host '10.1.42.72', ['nomad3.local']
    end
    nomad3_config.vm.provision :ansible do |ansible|
      ansible.inventory_path = CLUSTER_HOSTS
      # Extra Ansible variables can be defined here
      ansible.extra_vars = {
        nomad_magic: 9001,
      }
      ansible.playbook = ANSIBLE_PLAYBOOK
      ansible.limit = "all"
    end
  end
end
