FROM nodered/node-red
MAINTAINER Christopher Grant <chrisgrant.datascience@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN npm install node-red-dashboard && \
    npm install node-red-node-smooth
COPY flows.json /data/flows.json

