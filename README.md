# ngmondial-docker-db
This is the repository for the ngmondial-docker-db image, which sets up a production-grade postgres-based database for use with the ngmondial-backend.
The image will create two databases, two users and populate the databases with  data.

## Building
Run `./gradlew docker` (*nix) or `gradlew.bat docker` (Windows)

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