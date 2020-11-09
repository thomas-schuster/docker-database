FROM postgres:latest
ADD *.sh /docker-entrypoint-initdb.d/
EXPOSE 5432
