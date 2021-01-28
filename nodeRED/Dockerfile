FROM nodered/node-red
MAINTAINER Christopher Grant <chrisgrant.datascience@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN npm install -g node-red-dashboard && \
    npm install -g node-red-node-smooth
COPY flows.json /data/flows.json

