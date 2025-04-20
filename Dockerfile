ARG CODE_VERSION=latest
ARG DEBIAN_FRONTEND=noninteractive
FROM postgres:${CODE_VERSION}
RUN apt-get update && apt-get install -y --no-install-recommends \
    dos2unix \
    postgresql-plperl-17 \
    postgresql-plpython3-17 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG MONDIALDB_ARG=mondial 
ARG MONDIALUSER_ARG=mondial
ARG USERPASSWORD_ARG=mondial!
ARG POSTGRES_USER_ARG=postgres 
ARG POSTGRES_PASSWORD_ARG=admin

ENV MONDIALDB=${MONDIALDB_ARG}
ENV MONDIALUSER=${MONDIALUSER_ARG}
ENV USERPASSWORD=${USERPASSWORD_ARG}
ENV POSTGRES_USER=${POSTGRES_USER_ARG} 
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD_ARG}

WORKDIR /sql
COPY sql/*.sql /sql/
COPY scripts/readenvironment.sh /sql
COPY scripts/init.sh /docker-entrypoint-initdb.d/

ADD sql/*.sql /sql/
ADD scripts/readenvironment.sh /sql
ADD scripts/init.sh /docker-entrypoint-initdb.d/

# probably not necessary
RUN ["dos2unix", "/docker-entrypoint-initdb.d/init.sh"]
RUN ["dos2unix", "/sql/readenvironment.sh"]
RUN ["/bin/bash", "-c", "chmod +x /sql/readenvironment.sh"]
RUN ["/bin/bash", "-c", "/sql/readenvironment.sh"]
EXPOSE 5432
EXPOSE 5050