FROM rocker/geospatial:3.4.3
RUN apt-get update

# Imports and Suggests
RUN install2.r --error \
  covr \
  glue

# Internal use
RUN install2.r --error \
  lintr \
  usethis
