# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.2.4"

Vagrant.configure(2) do |config|

	config.vm.box = "ubuntu/bionic64"
    config.vm.box_version = "20190411.0.0"

	config.vm.box_check_update = false

	config.vm.hostname = "canigodev"

	config.vm.provider "virtualbox" do |vb|
        vb.default_nic_type = "virtio"
		vb.gui = true
		vb.memory = "6124" # 6G
		vb.cpus = 2
		# vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]

		# https://everythingshouldbevirtual.com/virtualization/vagrant-adding-a-second-hard-drive/

		swapdisk = './swapdisk.vdi'
		unless File.exist?(swapdisk)
			# vb.customize ['createhd', '--filename', swapdisk, '--variant', 'Dynamic', '--size', 100 * 1024]
			vb.customize ['createmedium', 'disk', '--filename', swapdisk, '--size', 8 * 1024 , '--format', 'VDI']
		end
		vb.customize ['storageattach', :id,  '--storagectl', 'SCSI', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', swapdisk]

		datadisk = './datadisk.vmdk'
		unless File.exist?(datadisk)
			# vb.customize ['createhd', '--filename', datadisk, '--variant', 'Dynamic', '--size', 100 * 1024]
			vb.customize ['createmedium', 'disk', '--filename', datadisk, '--size', 100 * 1024 , '--format', 'VMDK']
		end
		vb.customize ['storageattach', :id,  '--storagectl', 'SCSI', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', datadisk]

		# See https://github.com/chef/bento/issues/682
		vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
		# vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
		vb.customize ['modifyvm', :id, '--hwvirtex', 'on']
		vb.customize ["modifyvm", :id, "--vram", "32"]

		# audio
		# vb.customize ["modifyvm", :id, "--audio", "coreaudio"]
		# vb.customize ["modifyvm", :id, "--audiocontroller", "hda"]
		vb.customize ["modifyvm", :id, "--audioout", "on"]

		vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
		vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]

		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

		vb.name = "CanigoDev-3.0.5"

	end

	# config.vm.provision "file", source: "resources", destination: "/tmp/resources"
	config.vm.provision "shell", path: "./provision.sh"

	# config.vm.synced_folder "resources", "/tmp/vagrant", owner: "root", group: "root"
end