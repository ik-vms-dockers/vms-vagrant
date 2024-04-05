# -*- mode: ruby -*-
# vi: set ft=ruby :
# https://superuser.com/questions/895123/setting-up-our-existing-vagrant-virtualbox-instance-to-use-vpn-when-not-in-the
# Developer specific settings
developer = ENV['VAGRANT_DEV']
example_path = ENV['VAGRANT_REPO']


# Perform a quick sanity check, to ensure everything actually is set up.
if developer.empty? or example_path.empty? then
    puts "Developer or example path not set"
    exit
end


# Vagrant settings
Vagrant.configure("2") do |config|

    {
        # Define which VMs to run
        'dev' => {
            :roles => ["devbox"]
        },
        # 'web' => {
        #   :roles => ["webworker", "queue", "cron"],
        #   :use_remote_git => true
        # }
    }.each do |name, cfg|

        # Enable the hostmanager plugin (Only works with VirtualBox on OS X/Linux)
        if Vagrant.has_plugin?("vagrant-hostmanager") then
            config.vm.provision :hostmanager do
                config.hostmanager.enabled = false
                config.hostmanager.manage_host = true
                config.hostmanager.include_offline = false
            end
        end

        config.vm.define name do |vm_config|

            # Give the box enough memory, more CPUs, etc.
            vm_config.vm.provider "virtualbox" do |vb|
                vb.customize ["modifyvm", :id, "--memory", "2048"]
                vb.customize ["modifyvm", :id, "--cpus", "2"]
                vb.customize ["modifyvm", :id, "--ioapic", "on"]
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

                # Set up the host computer's hosts file
                if Vagrant.has_plugin?("vagrant-hostmanager") then
                    config.vm.provision :hostmanager do
                        if cfg.has_key?(:roles) and cfg[:roles].include?("devbox") then
                            vm_config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
                                if vm.id
                                    `VBoxManage guestproperty get #{vm.id} "/VirtualBox/GuestInfo/Net/1/V4/IP"`.split()[1]
                                end
                            end
                            vm_config.hostmanager.aliases = Dir.glob(example_path + '/www/clients/*/sites/*').each { |d| d.replace(d.gsub(/.*\/sites\//,"") + "." + developer + ".bc") }
                        end
                    end
                end
            end

            # General VM setup
            #vm_config.vm.network :public_network
            vm_config.vm.network :private_network, ip: "172.21.1.180"
            vm_config.vm.box = name
            vm_config.vm.hostname = "#{name}-#{developer}"
            vm_config.vm.box_url = "http://vagrant.office.example.com/package.box"

            # Share the host machine's example folder with the VM
            vm_config.vm.synced_folder example_path, "/example",
                :mount_options => ["dmode=777","fmode=666"]

            # Tell the OS to use eth1 as the default route, which results in Chef getting the correct IP.
            config.vm.provision :shell, run: "always", inline: <<-SCRIPT
            sudo route del default || true                  # Make sure we delete the current default route.
            sudo route add default gw 172.20.0.1 || true
            if [[ ! -d "/etc/chef" ]] ; then sudo mkdir /etc/chef; fi
            if [[ ! -f "/etc/chef/webworker.key" ]] ; then sudo wget -O/etc/chef/webworker.key http://vagrant.office.example.com/webworker.key 2>/dev/null; fi
            SCRIPT


            # Provision with Chef
            vm_config.vm.provision :chef_client do |chef|

                # Set up chef config
                chef.chef_server_url = "https://chef.internal.office.example.com/"
                chef.validation_key_path = "validation.pem"
                chef.environment = "internal"
                chef.node_name = "#{name}-#{developer}"

                # Chef attributes
                chef.json = {
                    "example" => {
                        "example_deployed_path" => "/example/",
                        "devbox" => {
                            "developer" => developer
                        }
                    },
                    "chef_client" =>{
                        "config" => {
                            "node_name" => "#{name}-#{developer}"
                        }
                    }
                }

                if cfg.has_key?(:use_remote_git) and cfg[:use_remote_git] then
                    chef.json['example'].delete('example_deployed_path')
                end

                # Add roles
                chef.add_role "example-base"
                if cfg.has_key?(:roles) then
                    cfg[:roles].each do |role|
                        chef.add_role role
                    end
                end
            end
        end
    end
end
