#!/bin/bash

psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plperl;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plpython3u;"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_schema.sql 
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_data.sql
