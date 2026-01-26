# ![logo](mondialdb64.png) DockerDatabase + Superset

> **Branch `superset`**: Diese Version enthält Apache Superset für Datenvisualisierung.
> Für die Basis-Version ohne Superset, siehe Branch `main`.

A containerized PostgreSQL database with pre-loaded database schemas and Apache Superset for data visualization.

[![Publish Docker Image](https://github.com/hochschule-pforzheim/docker-database/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/hochschule-pforzheim/docker-database/actions/workflows/docker-publish.yml)

## Quick Start

```bash
# Build the database image
docker build -t ngmondial .

# Start all services (DB + pgAdmin + Superset)
docker compose up -d
```

**Access points:**

| Service | URL | Login |
|---------|-----|-------|
| **Superset** | http://localhost:8088 | `admin` / `admin` |
| **pgAdmin** | http://localhost:5050 | `user@hs-pforzheim.de` / `secret` |
| **PostgreSQL** | localhost:5432 | `mondial` / `mondial!` |

## First-Time Setup

After starting the containers, configure the database connection in Superset:

1. Open http://localhost:8088 and login with `admin` / `admin`
2. Go to **Settings** → **Database Connections** → **+ Database**
3. Select **PostgreSQL** and enter:
   - Host: `db`
   - Port: `5432`
   - Database: `mondial`
   - Username: `mondial`
   - Password: `mondial!`
4. Click **Test Connection**, then **Connect**

📖 **Full documentation**: [docs/SUPERSET.md](docs/SUPERSET.md)

## Database Schemas

| Schema | Description |
|--------|-------------|
| `public` | [Mondial Database](http://www.dbis.informatik.uni-goettingen.de/Mondial/) - Geographic and demographic world data |
| `warehouse` | Data Warehouse with sales, articles, customers, stores, and time dimensions |

## Project Structure

```
├── Dockerfile              # PostgreSQL image with pre-loaded data
├── docker-compose.yml      # Full stack (DB + pgAdmin + Superset)
├── sql/                    # SQL schema and data files
├── scripts/                # Initialization scripts
├── models/                 # Database models (pgModeler)
├── generator/              # Java tool for generating test data
├── superset/               # Superset configuration exports
└── docs/                   # Documentation
```

## Branches

| Branch | Description |
|--------|-------------|
| `main` | Core database container only (Mondial + Warehouse) |
| `superset` | ← You are here - Adds Apache Superset visualization |

## Keeping superset branch updated

```bash
git checkout superset
git merge main
```
