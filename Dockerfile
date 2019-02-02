FROM rocker/geospatial:3.5.2

RUN set -x && \
  apt-get update && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG GITHUB_PAT

RUN set -x && \
  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron

# Imports and Suggests
RUN set -x \
  install2.r --error \
    covr \
    glue

# Internal use
RUN set -x \
  install2.r --error \
    lintr \
    usethis && \
  rm -rf /tmp/downloaded_packages/ /tmp/*.rds
