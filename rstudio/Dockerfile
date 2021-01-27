FROM rocker/verse:3.6.3-ubuntu18.04
MAINTAINER Christopher Grant <chrisgrant.datascience@gmail.com>

ARG pgversion=12
ARG javaversion=8
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ARG DEBIAN_FRONTEND=noninteractive

#  ENV JAVA_HOME /usr/lib/jvm/java-${java_version}-openjdk-amd64
ENV JAVA_HOME /usr/lib/jvm/adoptopenjdk-8-hotspot-amd64


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

## OpenJDK, Postgres client, and Arrow
COPY postgresKey.asc openjdkKey.asc /tmp/
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip python3 python3-setuptools python3-pip apt-utils wget ca-certificates apt-transport-https dirmngr gnupg software-properties-common  autoconf automake libtool curl make g++ lsb-release unzip tzdata && \
    apt-key add /tmp/postgresKey.asc && \
    apt-key add /tmp/openjdkKey.asc && \
    add-apt-repository --yes 'deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main' && \
	add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
# Update machine and install postgresql and jdk
    apt-get update && \
    apt-get install --no-install-recommends -y postgresql-client-${pgversion} libicu-dev adoptopenjdk-${javaversion}-hotspot && \
    update-java-alternatives -s adoptopenjdk-${javaversion}-hotspot-amd64 && \
    R CMD javareconf && \
    cd /opt && \
# Get Arrow, protobuf libraries, and postgresql-jdbc driver
    wget https://apache.bintray.com/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb && \
    apt-get install -y -V ./apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb && \
    apt-get update && \
    apt-get install -y -V libprotobuf-dev libprotobuf-c-dev protobuf-compiler protobuf-c-compiler libprotoc-dev \
                          libarrow-dev libarrow-glib-dev libarrow-dataset-dev libarrow-flight-dev libplasma-dev libplasma-glib-dev \
                          libgandiva-dev libgandiva-glib-dev libparquet-dev libparquet-glib-dev && \
    rm ./apache-arrow-archive-keyring-latest-$(lsb_release --codename --short).deb && \
    wget --quiet https://jdbc.postgresql.org/download/postgresql-42.2.14.jar && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# ENV LD_LIBRARY_PATH $JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server

RUN echo "JAVA_HOME=/usr/lib/jvm/adoptopenjdk-${javaversion}-hotspot-amd64" >> /etc/profile && \
    export JAVA_HOME=/usr/lib/jvm/adoptopenjdk-${javaversion}-hotspot-amd64 && \
    ln -s /usr/local/bin/Rscript /usr/bin/Rscript && \
    . /home/rstudio/.bashrc
# Install R packages
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"))' >> /etc/R/Rprofile.site && \
    Rscript -e "install.packages(c(\"microbenchmark\", \"arrow\", \"rjson\", \"RJSONIO\", \"jsonlite\", \"XML\", \"functional\", \"R.methodsS3\", \"caTools\", \"trelliscopejs\", \"RPostgreSQL\", \"RJDBC\", \"housingData\", \"Lahman\", \"nycflights13\", \"flexdashboard\", \"sparklyr\", \"glmnet\", \"reticulate\", \"tensorflow\"), repos = 'http://cran.rstudio.com')"

RUN chown -R rstudio:rstudio /home/rstudio
# USER root

EXPOSE 8787
# EXPOSE 4040
# EXPOSE 4041

CMD ["/init"]

