#!/bin/bash

# Create Extensions
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plperl;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION bool_plperl;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plpython3u;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION pgcrypto;"

# Install Mondial Database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_data.sql

# Warehouse (old) Schema in Mondial
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/warehouse-old/warehouse_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d warehouse -f /sql/warehouse-old/warehouse_data.sql

# Bundesliga Schema in Mondial
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_bundesliga/mondial_bl_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d bundesliga -f /sql/mondial_bundesliga/mondial_bl_data.sql

# Warehouse (new) Schema in Mondial
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/warehouse/mondial_warehouse_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial_wh -f /sql/warehouse/mondial_warehouse_article_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial_wh -f /sql/warehouse/mondial_warehouse_customer_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial_wh -f /sql/warehouse/mondial_warehouse_store_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial_wh -f /sql/warehouse/mondial_warehouse_time_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial_wh -f /sql/warehouse/mondial_warehouse_sales_data.sql

# Nextgen Mondial DB Schema in Mondial
#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/nxtgenmondialdb_schema.sql
#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d nxtgenmondialdb -f /sql/nxtgenmondialdb_data.sql