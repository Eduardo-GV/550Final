FROM rocker/tidyverse AS base 

# I had to add the system dependencies below in order for the Matrix package to install successfully.
RUN apt-get update && apt-get install -y \
    build-essential \
    gfortran \
    libgfortran5 \
    liblapack-dev \
    libblas-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir data
RUN mkdir output 

COPY code code
COPY data data

COPY Makefile .
COPY Road_accidents_report.Rmd . 

COPY .Rprofile .
COPY renv.lock . 
RUN mkdir renv
COPY renv/activate.R renv 
COPY renv/settings.json renv

# Setting the cache for where packages will be stored
RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

RUN R -e 'options(repos = c(CRAN = "https://cloud.r-project.org")); renv::restore()'

RUN mkdir final_report

RUN apt-get update && apt-get install -y pandoc

CMD make && mv Road_accidents_report.html final_report/
