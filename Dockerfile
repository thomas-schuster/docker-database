ARG  CODE_VERSION=latest
FROM postgres:${CODE_VERSION}

WORKDIR /sql
COPY sql/*.sql /sql/

RUN psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f mondial_schema.sql && \
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -f mondial_data.sql

EXPOSE 5432
