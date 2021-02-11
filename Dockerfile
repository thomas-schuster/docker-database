ARG CODE_VERSION=latest
ARG DEBIAN_FRONTEND=noninteractive
FROM postgres:${CODE_VERSION}

RUN apt-get update && apt-get install -y postgresql-plperl-13 dos2unix
RUN apt-get install -y postgresql-plpython3-13

ENV MONDIALDB mondial
ENV MONDIALUSER mondial
ENV USERPASSWORD mondial!
ENV POSTGRES_PASSWORD admin

WORKDIR /sql

COPY sql/*.sql /sql/
COPY scripts/readenvironment.sh /sql
COPY scripts/init.sh /docker-entrypoint-initdb.d/
RUN ["dos2unix", "/sql/readenvironment.sh"]
RUN ["/bin/bash", "-c", "/sql/readenvironment.sh"]

EXPOSE 5432