ARG  CODE_VERSION=latest
FROM postgres:${CODE_VERSION}

ENV MONDIALDB mondial
ENV MONDIALUSER mondial
ENV USERPASSWORD mondial!
ENV POSTGRES_PASSWORD admin

WORKDIR /sql
COPY sql/*.sql /sql/
COPY scripts/readenvironment.sh /sql
COPY scripts/init.sh /docker-entrypoint-initdb.d/

RUN ["/bin/bash", "-c", "/sql/readenvironment.sh"]

EXPOSE 5432
