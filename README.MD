# Проект FinalVersion

Проект FinalVersion направлен на автоматизацию развертывания облачной инфраструктуры с использованием Chef, Packer и Vagrant. Включает в себя настройку CloudWatch для мониторинга, SSM (AWS Systems Manager) для управления конфигурациями и обновлениями, а также настройку базы данных PostgreSQL.

## Начало работы

Для использования этого проекта вам потребуются следующие инструменты:

- [Chef Workstation](https://downloads.chef.io/tools/workstation)
- [Vagrant](https://www.vagrantup.com/downloads)
- [Packer](https://www.packer.io/downloads)
- [AWS CLI](https://aws.amazon.com/cli/) (для работы с AWS)

### Установка и настройка

1. **Установите Chef Workstation**, чтобы иметь возможность работать с Chef-рецептами и кукбуками.
2. **Установите Vagrant** для локального развертывания виртуальных машин.
3. **Установите Packer**, который будет использоваться для создания образов машин.
4. **Настройте AWS CLI** с вашими учетными данными AWS для работы с CloudWatch и SSM.

## Структура проекта
```
finalversion/
├── cookbooks/ # Кукбуки Chef
│ ├── cloudwatch/
│ │ └── recipes/
│ │ └── default.rb
│ ├── ssm/
│ │ └── recipes/
│ │ └── default.rb
│ └── postgresql/
│ └── recipes/
│ └── default.rb
├── packer/ # Конфигурации Packer
│ └── amazonlinux.json
├── Vagrantfile # Конфигурация Vagrant VirtualBox
├── AWSVagrantfile # в случае AWS provisioner
└── README.md


```
## AWS
Для использования Vagrant с провайдером AWS и применения тех же ролей и кукбуков Chef, необходимо использовать плагин vagrant-aws, который позволяет Vagrant управлять и создавать инстансы в AWS. Вначале убедитесь, что у вас установлен этот плагин. Если нет, вы можете установить его, используя команду:
```
vagrant plugin install vagrant-aws
```
Затем, вам нужно будет настроить Vagrantfile для использования AWS как провайдера и определить конфигурации для создания инстанса EC2, а также указать настройки провижининга с помощью Chef.

config.vm.box = "dummy" используется, поскольку для Vagrant необходимо указать базовый образ, но в случае с vagrant-aws реальный образ будет указан через параметр aws.ami.
Значения YOUR_AWS_ACCESS_KEY_ID, YOUR_AWS_SECRET_ACCESS_KEY, и другие параметры должны быть заменены на ваши реальные данные AWS.
Убедитесь, что у вас есть доступ к AMI (aws.ami), который вы указываете, и что он подходит для вашего региона и типа инстанса.
aws.security_groups, aws.subnet_id, и aws.keypair_name должны быть настроены в соответствии с вашей конфигурацией безопасности в AWS.
Путь к приватному ключу (override.ssh.private_key_path) должен соответствовать ключу, который имеет доступ к созданному инстансу.
После настройки Vagrantfile, вы можете запустить инстанс в AWS, используя команду:
```
vagrant up --provider=aws
```