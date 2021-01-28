FROM rocker/verse:4.0.3
MAINTAINER Christopher Grant <chrisgrant.datascience@gmail.com>

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip python3-dev python3-setuptools python3-pip apt-utils wget \
        ca-certificates apt-transport-https dirmngr gnupg software-properties-common  autoconf automake libtool \
        curl make g++ lsb-release unzip tzdata cython3 cython && \
    python3 -m pip install py4j websocket websockets && \
    ln -s /usr/local/bin/Rscript /usr/bin/Rscript && \
    apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R CMD javareconf && \
    echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"))' >> /etc/R/Rprofile.site && \
    Rscript -e "install.packages(c(\"microbenchmark\",\"websocket\", \"rjson\", \"RJSONIO\", \"jsonlite\", \"XML\", \"functional\", \"R.methodsS3\", \"caTools\", \"trelliscopejs\", \"flexdashboard\"), repos = 'http://cran.rstudio.com')"

RUN chown -R rstudio:rstudio /home/rstudio

COPY nodeRedFlows.R /home/rstudio/nodeRedFlows.R

CMD ["/init"]
