# <img src="mondialdb64.png" width="48" style="vertical-align: middle;"> DockerDatabase

A containerized PostgreSQL database with pre-loaded database schemas for educational purposes. This project provides ready-to-use Docker images containing the [Mondial](http://www.dbis.informatik.uni-goettingen.de/Mondial/) database and additional schemas.

[![Publish Docker Image](https://github.com/hochschule-pforzheim/docker-database/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/hochschule-pforzheim/docker-database/actions/workflows/docker-publish.yml)

## Quick Start

### 1. Configuration
This project uses environment variables for configuration. You can use the default settings or create a custom configuration:

```bash
cp .env.example .env
# Edit .env to change passwords if desired
```

### 2. Build and Run
Use Docker Compose to build the local image and start PostgreSQL and pgAdmin:

```bash
docker compose up -d --build
```

### 3. Access
- **PostgreSQL Database**: Port `5432`
  - **Admin User**: `postgres` (Password: Check `.env`, Default: `admin`)
  - **Mondial User**: `mondial` (Password: Check `.env`, Default: `mondial!`)
  - **Database name**: `mondial`
- **pgAdmin Interface**: [http://localhost:5050](http://localhost:5050)
  - **Login**: `user@hs-pforzheim.de` (Password: Check `.env` -> `PGADMIN_PASSWORD`, Default: `secret`)
  - **Server Connection**: "Mondial DB (Docker)" is pre-configured. If prompted for a password when connecting to the server within pgAdmin, use the Postgres admin password (`admin`).

### Using Pre-built Images (GitHub Registry)
Instead of building locally, you can pull the image from the GitHub Container Registry:

```bash
docker pull ghcr.io/thomas-schuster/docker-database:latest
# Tag it to match docker-compose expectation
docker tag ghcr.io/thomas-schuster/docker-database:latest ngmondial
docker compose up -d
```

## Management
- **Stop containers**: `docker compose down`
- **Stop and remove data**: `docker compose down -v`

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
