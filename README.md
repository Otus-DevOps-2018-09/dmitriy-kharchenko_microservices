# dmitriy-kharchenko_microservices
dmitriy-kharchenko microservices repository

# Docker 1

В процессе выполнено:

- Запуска конейнера из образа Ubuntu
- Создание образа из контейнера
- Описание разницы вывода команд `docker inspect <u_container_id>` от `docker inspect <u_image_id>`
- Добавлена конфигурация Travis

# Docker 2

Флаг `--pid` шарит pid namespace с docker хостом

В директории `docker-monolith/infra` хранятся конфигурация инфраструктуры для запуска Docker контейнеров

```
.
├── ansible
│   ├── ansible.cfg
│   ├── playbooks
│   │   ├── base.yml # Плейбук для установки Docker, используется провиженером packer
│   │   ├── deploy.yml # Плейбук для деплоя docker контейнера c приложением
│   │   └── site.yml # base + deploy
│   ├── requirements.txt
│   └── tf_inventory.sh # динмическая инвентори для ansible
├── packer
│   ├── app.json # шаблон образа с установленным Docker
│   └── variables.json.example
└── terraform
    ├── main.tf # инфраструктура (описание переменного количества инстансов и фаеровола)
    ├── outputs.tf
    ├── terraform.tfvars.example
    └── variables.tf
```
