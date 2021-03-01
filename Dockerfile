FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && apt -y install r-cran-shiny && apt -y clean

WORKDIR /app
COPY src/ /app
CMD Rscript -e "shiny::runApp('/app', port=8080, host='0.0.0.0')"
