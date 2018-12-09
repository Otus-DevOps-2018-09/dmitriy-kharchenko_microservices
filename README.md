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

# Docker 3

Сборка ui началась не c первого шага, т.к. первые 2 шага уже были в кеше.

В процессе работы сделано:

- Запуск сервисов с другими сетевыми алиасами и соотвественно другими значениями переменных окружения
- Изменение конфигурации Dockerfile для облегечения размера образов, за основу был взят соотвествующий Alpine образ для каждого языка
- Создан стандартный Docker Volume для контейнера с MongoDB

# Docker 4 

Имя контейнера можно задать через параметр `container_name` compose-файла.

В процессе работы сделано:

- Созадана конфигурация docker-compose
- Созданы разные сети для взаимодействия контейнеров между собой
- Параметризирован `docker-compose.yml`, пример хранится в `.env.example`
- Конфигурация docker-compose позволяет менять код приложений без пересборки образов

# GitLab CI 1

В процессе работы сделано:

- Установлен GitLab Server
- Установлен GitLab CI Runner
- Создана конфигурация `.gitlab-ci.yml` для тестирования проекта
- В каталоге `gitlab-ci/ansible` создан Ansible playbook для деплоя GitLab CI Runner
- Настроена интеграция GitLab со [Slack чатом](https://devops-team-otus.slack.com/messages/CDA48CY1W/)
