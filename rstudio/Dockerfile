FROM rocker/verse:4.0.3
MAINTAINER Christopher Grant <chrisgrant.datascience@gmail.com>

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ARG DEBIAN_FRONTEND=noninteractive

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

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip python3-dev python3-setuptools python3-pip apt-utils wget \
        ca-certificates apt-transport-https dirmngr gnupg software-properties-common  autoconf automake libtool \
        curl make g++ lsb-release unzip tzdata cython3 cython && \
    python3 -m pip install py4j pyarrow websocket websockets && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# ENV LD_LIBRARY_PATH $JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server
RUN ln -s /usr/local/bin/Rscript /usr/bin/Rscript
# Install R packages
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"))' >> /etc/R/Rprofile.site && \
    Rscript -e "install.packages(c(\"microbenchmark\",\"websocket\", \"rjson\", \"RJSONIO\", \"jsonlite\", \"XML\", \"functional\", \"R.methodsS3\", \"caTools\", \"trelliscopejs\", \"flexdashboard\"), repos = 'http://cran.rstudio.com')"

RUN chown -R rstudio:rstudio /home/rstudio

COPY nodeRedFlows.R /home/rstudio/nodeRedFlows.R
# USER root

CMD ["/init"]

