 # ![logo](mondialdb64.png) DockerDatabase

Welcome to the DockerDatabase! The project is dedicated to deliver free database models defined in SQL and stored in PostgreSQL database systems. It is called DockerDatabase because a Docker build file is included in order to deliver database models and data as part of docker images.

A Docker image is also used in classroom environment at Hochschule Pforzheim. The main database utilized in this context is the [Mondial](http://www.dbis.informatik.uni-goettingen.de/Mondial/) database. Students may use this project to setup their own environment.

## Database Models
This project delivers different database models. All of them are implemented as PostgreSQL schema including corresponding data. Besides that all models also provide SQL instructions to delete (drop) the schema. Currently the project includes these schemas:

- Mondial
- Warehouse


## Running
When using the ngmondial-docker-db image you will only have to specify a few environment variables when running
- `POSTGRES_USER`: the postgres superuser
- `POSTGRES_PASSWORD`: the password for the user above
- `NXTGENMONDIAL_DB_USERNAME`: the username for accessing the `nxtgenmondialdb` database
- `NXTGENMONDIAL_DB_PASSWORD`: the password for the user above
- `NXTGENMONDIAL_MONDIALDB_USERNAME`: the username for accessing the `mondialdb` database
- `NXTGENMONDIAL_MONDIALDB_PASSWORD`: the password for the user above

### Example
- `docker run --name ngmondial-db -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=<password> -e NXTGENMONDIAL_DB_USERNAME=ngmondial_db_user -e NXTGENMONDIAL_DB_PASSWORD=<other_password> -e NXTGENMONDIAL_MONDIALDB_USERNAME=mondial_db_user -e NXTGENMONDIAL_MONDIALDB_PASSWORD=<other_pw> -d ngmondial-db`
You can leave out the `-p 5432:5432` part if you do not want to have access to the database from the host.
To store postgres data on the host machine in a directory (e.g. for backup), add `-v </path/to/host/directory>:/var/lib/postgresql/data/`