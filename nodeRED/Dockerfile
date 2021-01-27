FROM ubuntu:focal
MAINTAINER Christopher Grant <chrisgrant.datascience@gmail.com>

ARG javaversion=8
ARG pgversion=12
ARG DEBIAN_FRONTEND=noninteractive

ENV PYTHONHASHSEED 0
ENV PYTHONIOENCODING UTF-8
ENV PIP_DISABLE_PIP_VERSION_CHECK 1

ENV R_BASE_VERSION 4.0.3

RUN apt-get update && \
    apt-get install -y locales && \
    dpkg-reconfigure -f noninteractive locales && \
    locale-gen en_US.UTF-8 && \
    /usr/sbin/update-locale LANG=en_US.UTF-8 && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Users with other locales should set this in their derivative image
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

## Install Python 3
## COPY postgresKey.asc openjdkKey.asc /tmp/
COPY openjdkKey.asc /tmp/
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip python3 python3-setuptools python3-pip cython cython3 \
        apt-utils wget ca-certificates apt-transport-https dirmngr gnupg software-properties-common lsb-release unzip && \
    ln -s /usr/bin/python3 /usr/bin/python && \
# JAVA
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
#    apt-key add /tmp/postgresKey.asc && \
    apt-key add /tmp/openjdkKey.asc && \
    add-apt-repository --yes 'deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main' && \
	add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
# Update machine and install
    apt-get update && \
    apt-get install --no-install-recommends -y postgresql-client-${pgversion} libicu-dev adoptopenjdk-${javaversion}-hotspot && \
    update-java-alternatives -s adoptopenjdk-${javaversion}-hotspot-amd64 && \
    echo "JAVA_HOME=/usr/lib/jvm/adoptopenjdk-${javaversion}-hotspot-amd64" >> /etc/profile && \
    export JAVA_HOME=/usr/lib/jvm/adoptopenjdk-${javaversion}-hotspot-amd64 && \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/*

## nodeRED
RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g --unsafe-perm node-red && \
    npm install node-red-dashboard && \
    python -m pip install py4j websocket websockets && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["node-red"]