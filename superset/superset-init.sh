#!/bin/bash
# Superset initialization script
# This script sets up Superset with an admin user and imports the database connection

set -e

echo "=== Initializing Apache Superset ==="

# Wait for Superset to be ready
sleep 5

# Initialize the database
echo "Setting up Superset database..."
superset db upgrade

# Create admin user (only if not exists)
echo "Creating admin user..."
superset fab create-admin \
    --username admin \
    --firstname Admin \
    --lastname User \
    --email admin@hs-pforzheim.de \
    --password admin || echo "Admin user already exists"

# Initialize roles and permissions
echo "Initializing roles..."
superset init

# Import database connection (if export files exist)
if [ -d "/app/superset_home/exports" ]; then
    echo "Importing database connections..."
    superset import-datasources -p /app/superset_home/exports/databases/ || true
fi

echo "=== Superset initialization complete ==="
echo "Access Superset at http://localhost:8088"
echo "Login: admin / admin"
