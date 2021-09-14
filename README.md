# Readme

Para instalação desse projeto será necessário instalar:

- Docker
- Java 11
- Dart

código docker-compose:

```dart
version: "3.8"
services:
    mongodb:
        image: mongo
        container_name: mongodb
        ports:
            - 27017:27017
        volumes:
            - data:/data
        environment:
            - MONGO_INITDB_ROOT_USERNAME=rootuser
            - MONGO_INITDB_ROOT_PASSWORD=rootpass
    mongo-express:
        image: mongo-express
        container_name: mongo-express
        restart: always
        ports:
            - 8081:8081
        environment:
            - ME_CONFIG_MONGODB_ADMINUSERNAME=rootuser
            - ME_CONFIG_MONGODB_ADMINPASSWORD=rootpass
            - ME_CONFIG_MONGODB_SERVER=mongodb
volumes:
    data: {}

networks:
    default:
        name: mongodb_network
```

[https://github.com/TiagoAlmeidaS/api-navigation](https://github.com/TiagoAlmeidaS/api-navigation)

Esse repositório para levantar a API e conversar com o Banco Mongo

Para realização da emulação da aplicação será necessário trocar o host do Endpoints presente na pasta de datasource dentro de data.