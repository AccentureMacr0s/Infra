Vagrant.configure("2") do |config|
    config.vm.box = "bento/amazonlinux-2"
    
    # Настройка сети, если необходимо
    # config.vm.network "private_network", ip: "192.168.33.10"
    
    # Настройка провайдера виртуальной машины
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
    end
  
    # Провижининг с использованием Chef Solo
    config.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = ["./cookbooks"]
      chef.roles_path = ["./roles"]
      chef.data_bags_path = ["./data_bags"]
      
      # Добавление ролей к run_list
      chef.add_role "cloudwatch"
      chef.add_role "ssm"
      chef.add_role "postgresql"
  
      # Атрибуты можно добавлять здесь, если они не определены в файлах ролей
      # chef.json = {
      # }
    end
  end
  