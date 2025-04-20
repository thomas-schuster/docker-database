# Create Extensions
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plperl;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION bool_plperl;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION plpython3u;"
psql -U "$POSTGRES_USER" -d template1 -c "CREATE EXTENSION pgcrypto;"

# Install Mondial Database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f /sql/mondial_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_data.sql

# Add Warehouse Schema to Mondial
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_warehouse_schema.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_warehouse_article_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_warehouse_customer_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_warehouse_store_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_warehouse_time_data.sql
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d mondial -f /sql/mondial_warehouse_sales_data.sql

# Grant necessary privileges to the application user
echo "Granting privileges to ${MONDIALUSER} on database ${MONDIALDB}..."
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$MONDIALDB" <<-EOSQL
    GRANT USAGE ON SCHEMA public TO ${MONDIALUSER};
    GRANT SELECT ON ALL TABLES IN SCHEMA public TO ${MONDIALUSER};
    GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO ${MONDIALUSER};
    GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO ${MONDIALUSER};
EOSQL
echo "Privileges granted."