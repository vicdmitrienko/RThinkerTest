FROM openanalytics/r-base:4.0.5

LABEL version=1.0
LABEL maintainer="vicdmitrienko@gmail.com"
LABEL author="Victor Dmitrienko"

RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libxml2-dev \
    libcairo2-dev \
    r-base-core

# packages needed for basic shiny functionality
RUN R -e "install.packages(c('Rcpp', 'shiny', 'shinydashboard'), repos='https://cloud.r-project.org')"

# build Mediana package
COPY ThinkerTest /root/ThinkerTest
RUN cd /root && \
    sudo R CMD build ThinkerTest && \
    sudo R CMD INSTALL --build ThinkerTest_0.1.tar.gz

# set host and port
COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e", "ThinkerTest::TestApp()"]
