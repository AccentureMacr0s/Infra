# Установка PostgreSQL
package 'postgresql' do
    action :install
  end
  
  # Настройка службы PostgreSQL
  service 'postgresql' do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
  end
  
  # Дополнительные настройки конфигурации и базы данных можно добавить здесь
  