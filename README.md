[![Publish Docker Image](https://github.com/thomas-schuster/docker-database/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/thomas-schuster/docker-database/actions/workflows/docker-publish.yml)

# ![logo](mondialdb64.png) DockerDatabase

Welcome to the DockerDatabase! The project is dedicated to deliver free database models defined in SQL and stored in PostgreSQL database systems. It is called DockerDatabase because a Docker build file is included in order to deliver database models and data as part of docker images.

A Docker image is also used in classroom environment at Hochschule Pforzheim. The main database utilized in this context is the [Mondial](http://www.dbis.informatik.uni-goettingen.de/Mondial/) database. Students may use this project to setup their own environment.

## Database Models
This project delivers different database models. All of them are implemented as PostgreSQL schema including corresponding data. Besides that all models also provide SQL instructions to delete (drop) the schema. Currently the project includes these schemas:

- Mondial
- Warehouse (old)
- Warehouse (new)
- Bundesliga


## Get Ready
In order to use these schemas within a docker container, you'll have to build a proper image first. Currently the Mondial schema is integrated by default. For other schemas you have to modify the Dockerfile or interact with the Docker container directly.

### Environment Variables
The Dockerfile comes with several environment variables which you may modify. Since our image relies on the official docker image of [PostgreSQL](https://hub.docker.com/_/postgres/), the mandatory admin password for postgres is included in these default presets as well. 

The following environment variables are pre-defined:

Variable | Description | Default Value | Source
------------ | ------------- | ------------- | ------------- 
`POSTGRES_USER` | postgres superuser (admin) | postgres | [PostgreSQL](https://hub.docker.com/_/postgres/)
`POSTGRES_PASSWORD` | password for postgres superuser  | admin | [PostgreSQL](https://hub.docker.com/_/postgres/), preset by this image definition
`MONDIALDB` | the postgres name of the mondial database  | `mondial` | defined by image definition
`MONDIALUSER` | the username for accessing the `MONDIALDB` database | `mondial` | defined by image definition
`USERPASSWORD` | the password for the `MONDIALUSER` | `mondial!` | defined by image definition


### Build and run DockerDatabase with Mondial
In root directory of this project. Build the image by calling:
```console
foo@bar:~$ docker build -t ngmondial .
```

Run your image
```bash
foo@bar:~$ docker run --name ngmondial -e "POSTGRES_PASSWORD=admin" -p 5432:5432 -d ngmondial
```

[Publishing ports](https://docs.docker.com/config/containers/container-networking/) as defined by `-p 5432:5432` is optional and only needed in case you want to have direct access to the database from your host.

In case you plan to store postgres data in a host directory (e.g. for backup of changes), you can add a volume option to your run command. Such as: `-v </path/to/host/directory>:/var/lib/postgresql/data/`.

