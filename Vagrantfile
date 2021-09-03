# -*- mode: ruby -*-
# vi: set ft=ruby :
# vi: set tabstop=2 :
# vi: set shiftwidth=2 :

Vagrant.configure("2") do |config|

  vms = [
    { :name => "vbox-debian-stretch",  :box => "debian/stretch64" },
    { :name => "vbox-debian-buster",   :box => "debian/buster64" },
    { :name => "vbox-debian-bullseye", :box => "debian/bullseye64" },
  ]

  conts = [
    { :name => "docker-debian-stretch",  :docker => "hanxhx/vagrant-ansible:debian9" },
    { :name => "docker-debian-buster",   :docker => "hanxhx/vagrant-ansible:debian10" },
    { :name => "docker-debian-bullseye", :docker => "hanxhx/vagrant-ansible:debian11" }
  ]

  config.vm.network "private_network", type: "dhcp"

  conts.each do |opts|
    config.vm.define opts[:name] do |m|
      m.vm.provider "docker" do |d|
        d.image = opts[:docker]
        d.remains_running = true
        d.has_ssh = true
      end

      if opts[:name].include? "bullseye"
        m.vm.provision "shell", inline: "[ -f '/root/first_provision' ] || (apt-get update -qq && apt-get -y dist-upgrade && touch /root/first_provision)"
      end

      m.vm.provision "ansible" do |ansible|
        ansible.playbook = "tests/test.yml"
        ansible.verbose = 'vv'
        ansible.become = true
      end
    end
  end

  vms.each do |opts|
    config.vm.define opts[:name] do |m|
      m.vm.box = opts[:box]
      m.vm.provider "virtualbox" do |v|
        v.cpus = 1
        v.memory = 256
      end

      if opts[:name].include? "bullseye"
        m.vm.provision "shell", inline: "[ -f '/root/first_provision' ] || (apt-get update -qq && apt-get -y dist-upgrade && touch /root/first_provision)"
      end

      m.vm.provision "ansible" do |ansible|
        ansible.playbook = "tests/test.yml"
        ansible.verbose = 'vv'
        ansible.become = true
      end
    end
  end
end
