# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box_url = "https://atlas.hashicorp.com/chef/boxes/centos-6.6-i386/versions/1.0.0/providers/virtualbox.box"
  config.vm.box = "centos66-32"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.hostname = "local.dev"
  config.vm.provision :shell, :path => "./bootstrap.sh"
end
