# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.provider "libvirt" do |v|
    v.memory = 4096
    v.cpus = 4
  end
  
  config.vm.define "fhemig_contratos" do |fhemig_contratos|
    fhemig_contratos.vm.box = "bento/ubuntu-22.04"
    fhemig_contratos.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  end
end