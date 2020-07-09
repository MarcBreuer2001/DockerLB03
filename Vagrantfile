
Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "Virtualbox" do |vb|
    vb.memory = "2048"
    vb.disksize.size = "50GB"
    vb.cpus = "2"
    vb.name = "DOCK-MAN-001(Docker_Cluster_Manager)"
     
  end

  config.vm.hostname = "DOCK-MAN-001"
  config.vm.network "private_network", ip:"192.168.36.100"
  config.vm.provision "shell", path: "manager.sh"

 
end
