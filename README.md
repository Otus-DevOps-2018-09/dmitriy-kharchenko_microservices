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

 export GOOGLE_PROJECT=docker-223604
$ docker-machine create --driver google \
 --google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
 --google-machine-type n1-standard-1 \
 --google-zone europe-west1-b \
 docker-host 

 eval $(docker-machine env docker-host) 

 docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
docker run -d --network=reddit --network-alias=post dkharchenko/post:1.0
docker run -d --network=reddit --network-alias=comment  dkharchenko/comment:1.0
docker run -d --network=reddit -p 9292:9292 dkharchenko/ui:1.0

docker run -d --network=front_net -p 9292:9292 --name ui  dkharchenko/ui:1.0
docker run -d --network=back_net --name comment  dkharchenko/comment:1.0
docker run -d --network=back_net --name post  dkharchenko/post:1.0
docker run -d --network=back_net --name mongo_db --network-alias=post_db --network-alias=comment_db mongo:latest