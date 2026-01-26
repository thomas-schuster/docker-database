# ![<img src="mondialdb64.png" width="25"/>](mondialdb64.png) DockerDatabase

A containerized PostgreSQL database with pre-loaded database schemas for educational purposes. This project provides ready-to-use Docker images containing the [Mondial](http://www.dbis.informatik.uni-goettingen.de/Mondial/) database and additional schemas.

[![Publish Docker Image](https://github.com/hochschule-pforzheim/docker-database/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/hochschule-pforzheim/docker-database/actions/workflows/docker-publish.yml)

## Quick Start

```bash
# Build the image
docker build -t ngmondial .

# Run the container
docker run --name ngmondial -e "POSTGRES_PASSWORD=admin" -p 5432:5432 -d ngmondial
```

Or use Docker Compose (includes pgAdmin):

```bash
docker compose up -d
```

Access points:
- **PostgreSQL**: `localhost:5432` (User: `mondial`, Password: `mondial!`)
- **pgAdmin**: `http://localhost:5050` (Email: `user@hs-pforzheim.de`, Password: `secret`)

## Database Schemas

| Schema | Description |
|--------|-------------|
| `public` | [Mondial Database](http://www.dbis.informatik.uni-goettingen.de/Mondial/) - Geographic and demographic world data |
| `warehouse` | Data Warehouse schema with sales, articles, customers, stores, and time dimensions |

## Project Structure

```
├── Dockerfile              # PostgreSQL image with pre-loaded data
├── docker-compose.yml      # Multi-container setup (DB + pgAdmin)
├── sql/                    # SQL schema and data files
│   ├── mondial_*.sql       # Mondial database schema and data
│   └── mondial_warehouse_*.sql  # Warehouse schema and data
├── scripts/                # Initialization scripts
└── models/                 # Database models (pgModeler format)
```

## Environment Variables

| Variable            | Description                               | Default     |
| ------------------- | ----------------------------------------- | ----------- |
| `POSTGRES_USER`     | PostgreSQL superuser                      | `postgres`  |
| `POSTGRES_PASSWORD` | Superuser password                        | `admin`     |
| `MONDIALDB`         | Database name                             | `mondial`   |
| `MONDIALUSER`       | Application user                          | `mondial`   |
| `USERPASSWORD`      | Application user password                 | `mondial!`  |

## Advanced Usage

### Persistent Storage

Mount a volume to persist data across container restarts:

```bash
docker run --name ngmondial \
  -e "POSTGRES_PASSWORD=admin" \
  -p 5432:5432 \
  -v /path/to/data:/var/lib/postgresql/data \
  -d ngmondial
```

### Connect with psql

```bash
docker exec -it ngmondial psql -U mondial -d mondial
```

## Branches

| Branch | Description |
|--------|-------------|
| `main` | Core database container (Mondial + Warehouse) |
| `superset` | Adds Apache Superset for data visualization |

## License

This project is used in classroom environments at Hochschule Pforzheim.
