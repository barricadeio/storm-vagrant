# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

KAFKA_VERSION = "kafka_2.9.2-0.8.1.1"
KAFKA_ARCHIVE = "kafka/#{KAFKA_VERSION}.tgz"

STORM_VERSION = "apache-storm-0.10.0"
STORM_ARCHIVE = "storm/#{STORM_VERSION}.zip"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.hostmanager.manage_host = true
  config.hostmanager.enabled = true
  
  if(!File.exist?(STORM_ARCHIVE))
    `wget -N http://www.whoishostingthis.com/mirrors/apache/storm/apache-storm-0.10.0/apache-storm-0.10.0.zip`
  end

  if (!File.exist?(KAFKA_ARCHIVE))
    `wget -N http://www.whoishostingthis.com/mirrors/apache/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz`
  end
  
  config.vm.define "zookeeper" do |zookeeper|
    zookeeper.vm.box = "ubuntu/trusty64"
    zookeeper.vm.network "private_network", ip: "192.168.50.3"
    zookeeper.vm.hostname = "zookeeper"
    zookeeper.vm.provision "shell", path: "zookeeper/install.sh"
  end

  config.vm.define "kafka" do |kafka|
    kafka.vm.box = "ubuntu/trusty64"
    kafka.vm.network "private_network", ip: "192.168.50.7"
    kafka.vm.hostname = "kafka"
    kafka.vm.provision "shell", path: "kafka/install.sh", args: [KAFKA_VERSION, "192.168.50.3"]
    kafka.vm.provision "shell", path: "kafka/config-supervisord.sh", args: "kafka"
    kafka.vm.provision "shell", path: "general/start-supervisord.sh"
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end

  config.vm.define "nimbus" do |nimbus|
    nimbus.vm.box = "ubuntu/trusty64"
    nimbus.vm.network "private_network", ip: "192.168.50.4"
    nimbus.vm.hostname = "nimbus"
    nimbus.vm.provision "shell", path: "storm/install.sh", args: STORM_VERSION
    nimbus.vm.provision "shell", path: "storm/config-supervisord.sh", args: "nimbus"
    nimbus.vm.provision "shell", path: "storm/config-supervisord.sh", args: "ui"
    nimbus.vm.provision "shell", path: "storm/config-supervisord.sh", args: "drpc"
    nimbus.vm.provision "shell", path: "general/start-supervisord.sh"
  end

  config.vm.define "supervisor1" do |supervisor|
    supervisor.vm.box = "ubuntu/trusty64"
    supervisor.vm.network "private_network", ip: "192.168.50.5"
    supervisor.vm.hostname = "supervisor1"
    
    supervisor.vm.provision "shell", path: "storm/install.sh", args: STORM_VERSION
    supervisor.vm.provision "shell", path: "storm/config-supervisord.sh", args: "supervisor"
    supervisor.vm.provision "shell", path: "storm/config-supervisord.sh", args: "logviewer"
    supervisor.vm.provision "shell", path: "general/start-supervisord.sh"
    
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  
  config.vm.define "supervisor2" do |supervisor|
    supervisor.vm.box = "ubuntu/trusty64"
    supervisor.vm.network "private_network", ip: "192.168.50.6"
    supervisor.vm.hostname = "supervisor2"
    
    supervisor.vm.provision "shell", path: "storm/install.sh", args: STORM_VERSION
    supervisor.vm.provision "shell", path: "storm/config-supervisord.sh", args: "supervisor"
    supervisor.vm.provision "shell", path: "storm/config-supervisord.sh", args: "logviewer"
    supervisor.vm.provision "shell", path: "general/start-supervisord.sh"
    
    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
  
  config.vm.provider :virtualbox do |vb|
      vb.gui = false
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  end 
end
