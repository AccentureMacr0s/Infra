# Установка Postgres 15
package 'postgresql15' do
  action :install
end

service 'postgresql-15' do
  action [:enable, :start]
end
