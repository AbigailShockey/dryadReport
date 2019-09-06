FROM rocker/verse

# metadata
LABEL base.image="rocker/verse"
LABEL version="1"

RUN R -e "install.packages('ape', repos = 'http://cran.us.r-project.org')" && \
  R -e "install.packages('tidytree', repos = 'http://cran.us.r-project.org')" && \
  R -e "install.packages('phangorn', repos = 'http://cran.us.r-project.org')" && \
  R -e "install.packages('BiocManager', repos = 'http://cran.us.r-project.org')" && \
  R -e "BiocManager::install('ggtree')" && \
  R -e "install.packages('devtools', repos = 'http://cran.us.r-project.org')" && \
  R -e "devtools::install_github('rlbarter/superheat')"

RUN mkdir /data
WORKDIR /data
