ARG MYSQL_VERSION
ARG IMAGE=mysql:${MYSQL_VERSION}
FROM ${IMAGE}

COPY low-memory.cnf /etc/mysql/conf.d/