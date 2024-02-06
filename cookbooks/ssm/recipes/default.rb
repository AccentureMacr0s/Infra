# Установка SSM Agent
if platform?('ubuntu', 'debian')
    package 'snapd'
    execute 'Install SSM Agent' do
      command 'snap install amazon-ssm-agent --classic'
      not_if 'snap list | grep amazon-ssm-agent'
    end
  elsif platform?('amazon')
    package 'amazon-ssm-agent' do
      action :install
    end
  end
  
  # Убедиться, что агент запущен
  service 'amazon-ssm-agent' do
    action [:enable, :start]
  end
  