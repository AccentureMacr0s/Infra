# Установка PostgreSQL
package 'postgresql15' do
    action :install
  end
  
  # Настройка службы PostgreSQL
  service 'postgresql-15' do
    supports status: true, restart: true, reload: true
    action [:enable, :start]
  end
  
  # Дополнительные настройки конфигурации и базы данных можно добавить здесь
  