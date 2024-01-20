# Установка и настройка AWS SSM
package 'amazon-ssm-agent' do
  action :install
end

service 'amazon-ssm-agent' do
  action [:enable, :start]
end
