# https://gitlab.com/parrotsec/build/parrot-vm-build/-/blob/master/Vagrantfile?ref_type=heads
# -*- mode: ruby -*-

Vagrant.configure("2") do |config|
  config.vm.define "parrot-home" do |parrot_home|
    parrot_home.vm.box = "debian/bookworm64"
    parrot_home.vm.disk :disk, size: "64GB", primary: true
    parrot_home.vm.hostname = "parrot"
    parrot_home.vm.provider "virtualbox" do |vb|
      vb.name = "parrot-home"
      vb.gui = false
      vb.memory = "4096"
    end
    parrot_home.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt update
      apt -y full-upgrade
      echo "deb https://deb.parrot.sh/parrot lory main" > /etc/apt/sources.list
      wget https://deb.parrot.sh/parrot/pool/main/p/parrot-archive-keyring/parrot-archive-keyring_2021.7%2Bparrot2_all.deb
      dpkg -i parrot-*.deb
      rm *.deb
      apt update
      apt -y install parrot-core
      apt update
      apt -y full-upgrade
      apt -y install xserver-xorg-input-all xserver-xorg-video-all
      apt -y install linux-headers-amd64 || apt -y install linux-headers-arm64
      apt -y install locales locales-all plymouth plymouth-themes tasksel cryptsetup cryptsetup-nuke-password iw lvm2 mdadm parted gpart bash-completion rng-tools5 haveged neovim inxi neofetch htop nload iftop jfsutils hfsplus hfsutils btrfs-progs e2fsprogs dosfstools mtools reiser4progs reiserfsprogs xfsprogs xfsdump ntfs-3g libfsapfs1 libfsapfs-utils apparmor apparmor-profiles apparmor-profiles-extra apparmor-utils apparmor-easyprof apparmor-notify virtualbox-guest-x11 qemu-guest-agent spice-vdagent open-vm-tools-desktop parrot-meta-devel parrot-meta-privacy parrot-meta-crypto parrot-interface parrot-interface-home parrot-desktop-mate codium golang-go nodejs npm default-jdk python3-pip git podman podman-docker flatpak flatpak-xdg-utils chromium- mate-user-guide- pocketsphinx-en-us- libreoffice-help-en-us- mythes-en-us- libreoffice-help-common- espeak-ng-data-
      if [ -x /usr/share/parrot-menu/update-launchers ]; then
          /usr/share/parrot-menu/update-launchers
      fi
      ln -s /usr/bin/mate-terminal /usr/local/bin/gnome-terminal || true
      cat /etc/lightdm/slick-greeter-home.conf > /etc/lightdm/slick-greeter.conf
      apt update && apt -y full-upgrade -t lory-backports
      apt -y autoremove  --purge
      apt clean
      systemctl disable postgres || true
      systemctl disable gsad || true
      systemctl disable redis-server || true
      systemctl disable xrdp || true
      if [ -x "$(which updatedb 2>/dev/null)" ]; then
          updatedb
      fi
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      update-initramfs -u
      useradd -m -p "$(openssl passwd parrot)" user
      for group in dialout cdrom floppy sudo audio dip video plugdev netdev bluetooth lpadmin scanner docker; do
          adduser user $ group || true
      done
      sed -i "s/#autologin-user=/autologin-user=user" /etc/lightdm/lightdm.conf
      sed -i "s/#autologin-user-timeout=0/autologin-user-timeout=4" /etc/lightdm/lightdm.conf
      echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/20-parrot-virtual
    SHELL
  end

  config.vm.define "parrot-security" do |parrot_security|
    parrot_security.vm.box = "debian/bookworm64"
    parrot_security.vm.disk :disk, size: "64GB", primary: true
    parrot_security.vm.hostname = "parrot"
    parrot_security.vm.provider "virtualbox" do |vb|
      vb.name = "parrot-security"
      vb.gui = false
      vb.memory = "4096"
    end
    parrot_security.vm.provision "shell", inline: <<-SHELL
      export DEBIAN_FRONTEND=noninteractive
      apt update
      apt -y full-upgrade
      echo "deb https://deb.parrot.sh/parrot lory main" > /etc/apt/sources.list
      wget https://deb.parrot.sh/parrot/pool/main/p/parrot-archive-keyring/parrot-archive-keyring_2021.7%2Bparrot2_all.deb
      dpkg -i parrot-*.deb
      rm *.deb
      apt update
      apt -y install parrot-core
      apt update
      apt -y full-upgrade
      apt -y install xserver-xorg-input-all xserver-xorg-video-all
      apt -y install linux-headers-amd64 || apt -y install linux-headers-arm64
      apt -y install locales locales-all plymouth plymouth-themes tasksel cryptsetup cryptsetup-nuke-password iw lvm2 mdadm parted gpart bash-completion rng-tools5 haveged neovim inxi neofetch htop nload iftop jfsutils hfsplus hfsutils btrfs-progs e2fsprogs dosfstools mtools reiser4progs reiserfsprogs xfsprogs xfsdump ntfs-3g libfsapfs1 libfsapfs-utils apparmor apparmor-profiles apparmor-profiles-extra apparmor-utils apparmor-easyprof apparmor-notify virtualbox-guest-x11 qemu-guest-agent spice-vdagent open-vm-tools-desktop parrot-meta-devel parrot-meta-privacy parrot-meta-crypto parrot-tools-full parrot-interface parrot-desktop-mate codium golang-go nodejs npm default-jdk python3-pip git podman podman-docker flatpak flatpak-xdg-utils mate-user-guide- pocketsphinx-en-us- libreoffice-help-en-us- mythes-en-us- libreoffice-help-common- espeak-ng-data- android-sdk- dradis- exploitdb- ferret- freepats- gcc-avr- gnuradio*- guile-2.2-libs- gvim- imagemagick*- lmodern- minicom pandoc*- plasma-discover- plasma-discover-common- qttools5-dev-tools- seclists- tex-*- tex-gyre- thunderbird- vim- xpdf- xpra- termit-
      if [ -x /usr/share/parrot-menu/update-launchers ]; then
          /usr/share/parrot-menu/update-launchers
      fi
      ln -s /usr/bin/mate-terminal /usr/local/bin/gnome-terminal || true
      cat /etc/lightdm/slick-greeter-security.conf > /etc/lightdm/slick-greeter.conf
      apt update && apt -y full-upgrade -t lory-backports
      apt -y autoremove  --purge
      apt clean
      systemctl disable postgres || true
      systemctl disable gsad || true
      systemctl disable redis-server || true
      systemctl disable xrdp || true
      if [ -x "$(which updatedb 2>/dev/null)" ]; then
          updatedb
      fi
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      update-initramfs -u
      useradd -m -p "$(openssl passwd parrot)" user
      for group in dialout cdrom floppy sudo audio dip video plugdev netdev bluetooth lpadmin scanner docker; do
          adduser user $ group || true
      done
      sed -i "s/#autologin-user=/autologin-user=user" /etc/lightdm/lightdm.conf
      sed -i "s/#autologin-user-timeout=0/autologin-user-timeout=4" /etc/lightdm/lightdm.conf
      echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/20-parrot-virtual
    SHELL
  end
end
