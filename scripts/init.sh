#!/bin/bash

psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plperl;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION bool_plperl;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plpython3u;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION pgcrypto;"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_schema.sql 
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_data.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/warehouse_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d warehouse -f /sql/warehouse_data.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/bl_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d bundesliga -f /sql/bl_data.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f create_mondial_warehouse_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial_wh -f /sql/create_mondial_warehouse_data.sql



#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/nxtgenmondialdb_schema.sql
#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d nxtgenmondialdb -f /sql/nxtgenmondialdb_data.sql