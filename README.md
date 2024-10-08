### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности.  В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```, 

## ОТВЕТ:

![image](https://github.com/SeNike/Study_24/blob/main/t-s-4/1.1.png)

скриншот консоли ВМ yandex cloud с их метками. 

## ОТВЕТ:

![image](https://github.com/SeNike/Study_24/blob/main/t-s-4/1.2.png) ![image](https://github.com/SeNike/Study_24/blob/main/t-s-4/1.0.png)

Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.marketing_vm

## ОТВЕТ:

![image](https://github.com/SeNike/Study_24/blob/main/t-s-4/1.3.png)

------

### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev 

## ОТВЕТ:

![image](https://github.com/SeNike/Study_24/blob/main/t-s-4/2.3.png)

4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.
5. Сгенерируйте документацию к модулю с помощью terraform-docs.

## ОТВЕТ: 

[README.md](https://github.com/SeNike/terraform-04/blob/main/modules/vpc/README.md)
 
Пример вызова

```
module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  zone = "ru-central1-a"
  cidr = "10.0.1.0/24"
}
```

### Задание 3
1. Выведите список ресурсов в стейте.
2. Полностью удалите из стейта модуль vpc.
3. Полностью удалите из стейта модуль vm.
4. Импортируйте всё обратно. Проверьте terraform plan. Значимых(!!) изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.

## ОТВЕТ: 

![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/3.2-1.png)
![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/3.2-2.png)
![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/3.2-3.png)
![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/3.2-4.png)


## Дополнительные задания (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.**   Они помогут глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 


### Задание 4*

1. Измените модуль vpc так, чтобы он мог создать подсети во всех зонах доступности, переданных в переменной типа list(object) при вызове модуля.  
  
Пример вызова
```
module "vpc_prod" {
  source       = "./vpc"
  env_name     = "production"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-c", cidr = "10.0.3.0/24" },
  ]
}

module "vpc_dev" {
  source       = "./vpc"
  env_name     = "develop"
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}
```

Предоставьте код, план выполнения, результат из консоли YC.

## ОТВЕТ: 

![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/4.png)
![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/4.1.png)


### Задание 5*

1. Напишите модуль для создания кластера managed БД Mysql в Yandex Cloud с одним или несколькими(2 по умолчанию) хостами в зависимости от переменной HA=true или HA=false. Используйте ресурс yandex_mdb_mysql_cluster: передайте имя кластера и id сети.
2. Напишите модуль для создания базы данных и пользователя в уже существующем кластере managed БД Mysql. Используйте ресурсы yandex_mdb_mysql_database и yandex_mdb_mysql_user: передайте имя базы данных, имя пользователя и id кластера при вызове модуля.
3. Используя оба модуля, создайте кластер example из одного хоста, а затем добавьте в него БД test и пользователя app. Затем измените переменную и превратите сингл хост в кластер из 2-х серверов.
4. Предоставьте план выполнения и по возможности результат. Сразу же удаляйте созданные ресурсы, так как кластер может стоить очень дорого. Используйте минимальную конфигурацию.

## ОТВЕТ: 

Код проекта в отдельном [репозитории](https://github.com/SeNike/cluster-tf-04)

![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/1.png)
![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/2.png)
![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/3.png)
![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/4.png)
![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/5.png)
![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/6.png)
![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/7.png)
![img](https://github.com/SeNike/Study_24/blob/main/s-4-4/8.png)




### Задание 6*
1. Используя готовый yandex cloud terraform module и пример его вызова(examples/simple-bucket): https://github.com/terraform-yc-modules/terraform-yc-s3 .
Создайте и не удаляйте для себя s3 бакет размером 1 ГБ(это бесплатно), он пригодится вам в ДЗ к 5 лекции.

## ОТВЕТ: 

![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/6.1.png)

### Задание 7*

1. Разверните у себя локально vault, используя docker-compose.yml в проекте.
2. Для входа в web-интерфейс и авторизации terraform в vault используйте токен "education".
3. Создайте новый секрет по пути http://127.0.0.1:8200/ui/vault/secrets/secret/create
Path: example  
secret data key: test 
secret data value: congrats!  
4. Считайте этот секрет с помощью terraform и выведите его в output по примеру:
```
provider "vault" {
 address = "http://<IP_ADDRESS>:<PORT_NUMBER>"
 skip_tls_verify = true
 token = "education"
}
data "vault_generic_secret" "vault_example"{
 path = "secret/example"
}

output "vault_example" {
 value = "${nonsensitive(data.vault_generic_secret.vault_example.data)}"
} 

Можно обратиться не к словарю, а конкретному ключу:
terraform console: >nonsensitive(data.vault_generic_secret.vault_example.data.<имя ключа в секрете>)
```
## ОТВЕТ: 

![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/7.png)

5. Попробуйте самостоятельно разобраться в документации и записать новый секрет в vault с помощью terraform. 

## ОТВЕТ: 

![img](https://github.com/SeNike/Study_24/blob/main/t-s-4/7.1.png)

### Задание 8*
Попробуйте самостоятельно разобраться в документаци и с помощью terraform remote state разделить root модуль на два отдельных root-модуля: создание VPC , создание ВМ . 

## ОТВЕТ: 

Код проекта в отдельном [репозитории](https://github.com/SeNike/tf_remote_state)






