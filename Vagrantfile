# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_url = "https://dl.dropbox.com/s/3fgr7lbvcpn51py/centos_6-5_i386.box"
  config.vm.box = "centos_6-5_i386"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.hostname = "local.dev"
  config.vm.provision :shell, :path => "./bootstrap.sh"
end
