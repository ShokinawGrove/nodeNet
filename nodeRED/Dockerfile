FROM nodered/node-red
MAINTAINER Christopher Grant <chrisgrant.datascience@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

COPY flows.json /data/flows.json

#
#ENV PYTHONHASHSEED 0
#ENV PYTHONIOENCODING UTF-8
#ENV PIP_DISABLE_PIP_VERSION_CHECK 1
#
#RUN apt-get update && \
#    apt-get install -y locales && \
#    dpkg-reconfigure -f noninteractive locales && \
#    locale-gen en_US.UTF-8 && \
#    /usr/sbin/update-locale LANG=en_US.UTF-8 && \
#    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
#    locale-gen && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*
#
## Users with other locales should set this in their derivative image
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8
#
### Install Python 3
#RUN apt-get update && \
#    apt-get install -y --no-install-recommends curl unzip python3 python3-setuptools python3-pip cython cython3 \
#        apt-utils wget ca-certificates apt-transport-https dirmngr gnupg software-properties-common lsb-release unzip && \
#    ln -s /usr/bin/python3 /usr/bin/python && \
#	apt-get clean && \
#    rm -rf /var/lib/apt/lists/*
#
### nodeRED
#RUN apt-get update && \
#    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
#    apt-get install -y nodejs && \
#    npm install && \
#    npm install -g --unsafe-perm node-red && \
#    npm install node-red-dashboard && \
#    npm build && \
#    python3 -m pip install py4j websocket websockets && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*