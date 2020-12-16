 # ![logo](mondialdb64.png) DockerDatabase

Welcome to the DockerDatabase! The project is dedicated to deliver free database models defined in SQL and stored in PostgreSQL database systems. It is called DockerDatabase because a Docker build file is included in order to deliver database models and data as part of docker images.

A Docker image is also used in classroom environment at Hochschule Pforzheim. The main database utilized in this context is the [Mondial](http://www.dbis.informatik.uni-goettingen.de/Mondial/) database. Students may use this project to setup their own environment.

## Database Models
This project delivers different database models. All of them are implemented as PostgreSQL schema including corresponding data. Besides that all models also provide SQL instructions to delete (drop) the schema. Currently the project includes these schemas:

- Mondial
- Warehouse


## Get Ready
In order to use these schemas within a docker container, you'll have to build a proper image first. Currently the Mondial schema is integrated by default. For other schemas you have to modify the Dockerfile.

### Environment Variables
The Dockerfile comes with several environment variables which you may modify. Since our image relies on the official docker image of [PostgreSQL](https://hub.docker.com/_/postgres/), the mandatory admin password for postgres is included in these default presets as well. 

The following environment variables are defined as preset:

- `POSTGRES_USER`: postgres superuser (admin)
- `POSTGRES_PASSWORD`: the password for the user above
- `NXTGENMONDIAL_DB_USERNAME`: the username for accessing the `nxtgenmondialdb` database
- `NXTGENMONDIAL_DB_PASSWORD`: the password for the user above
- `NXTGENMONDIAL_MONDIALDB_USERNAME`: the username for accessing the `mondialdb` database
- `NXTGENMONDIAL_MONDIALDB_PASSWORD`: the password for the user above

### Build and run DockerDatabase with Mondial
In root directory of this project. Build the image by calling:
```console
foo@bar:~$ docker build -t ngmondial .
```

Run your image
```bash
foo@bar:~$ docker run --name ngmondial -p 5432:5432 -d ngmondial
```

You can leave out the `-p 5432:5432` part if you do not want to have access to the database from the host.

To store postgres data on the host machine in a directory (e.g. for backup), add `-v </path/to/host/directory>:/var/lib/postgresql/data/`

