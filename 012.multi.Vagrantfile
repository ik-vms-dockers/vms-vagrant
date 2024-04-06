# https://stackoverflow.com/questions/60940227/two-operating-systems-in-a-single-vagrantfile
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # box 1 - centos
  config.vm.define "centos" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = "centos"
    centos.vm.network :private_network, ip: "192.168.75.10"
    # setting name of vm to inspect in virtualbox
    centos.vm.provider :virtualbox do |vb|
      vb.name = "centos"
    end
  # box 2 - ubuntu
  end
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/trusty64"
    ubuntu.vm.hostname = "ubuntu"
    ubuntu.vm.network :private_network, ip: "192.168.75.11"
    # setting name of vm to inspect in virtualbox
    ubuntu.vm.provider :virtualbox do |vb|
      vb.name = "ubuntu"
    end
  end
end
