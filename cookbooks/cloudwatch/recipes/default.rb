# Установка CloudWatch Agent
package 'amazon-cloudwatch-agent' do
    action :install
  end
  
  # Конфигурация CloudWatch Agent
  template '/opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json' do
    source 'cloudwatch-agent-config.json.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :restart, 'service[amazon-cloudwatch-agent]', :immediately
  end
  
  # Убедиться, что агент запущен
  service 'amazon-cloudwatch-agent' do
    action [:enable, :start]
  end
  