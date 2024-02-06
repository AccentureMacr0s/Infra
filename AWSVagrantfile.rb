Vagrant.configure("2") do |config|
  # Определение общих настроек AWS для всех машин
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = "YOUR_AWS_ACCESS_KEY_ID"
    aws.secret_access_key = "YOUR_AWS_SECRET_ACCESS_KEY"
    aws.session_token = "YOUR_AWS_SESSION_TOKEN" # Опционально
    aws.region = "us-east-1"
    aws.instance_type = "t2.micro"
    aws.security_groups = ["your-security-group"]
    aws.subnet_id = "subnet-123456" # Опционально
    aws.keypair_name = "your-keypair-name"
    
    override.ssh.username = "ec2-user"
    override.ssh.private_key_path = "~/.ssh/your-key.pem"
  end

  # Создание двух инстансов в AWS
  (1..2).each do |i|
    config.vm.define "node-#{i}" do |node|
      node.vm.box = "dummy" # Используется заглушка, поскольку AMI указывается через aws.ami
      node.vm.provider :aws do |aws, override|
        # Указание AMI для amazonlinux-2. Замените на ваш AMI ID
        aws.ami = "ami-0c02fb55956c7d316"
      end
      
      # Настройка провижининга с использованием Chef Solo
      node.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["./cookbooks"]
        chef.roles_path = ["./roles"]
        chef.data_bags_path = ["./data_bags"]
        chef.environment = "_default"
        chef.add_role "cloudwatch"
        chef.add_role "ssm"
        chef.add_role "postgresql"
      end
      
      # Пример использования скрипта shell для демонстрации
      node.vm.provision "shell", inline: "echo hello from node #{i}"
    end
  end
end
