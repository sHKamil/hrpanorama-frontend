FROM node:latest

WORKDIR /usr/src/app

COPY hrpanorama-task/package*.json ./

COPY npm/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]

COPY hrpanorama-task/ ./
