#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_schema.sql 
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_data.sql
