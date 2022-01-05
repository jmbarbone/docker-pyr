FROM r-base:4.0.3
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

# python things
RUN apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    python3.9 \
    python3-pip \
    python3-setuptools \
    python3-dev
RUN pip3 install --upgrade pip

# r things
RUN apt-get install --assume-yes --no-upgrade \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libsodium-dev \
    libv8-dev \
    libmagick++-dev\
    libmariadb-dev \
    unixodbc-dev

# copy over envs
ENV PYTHONPATH "${PYTHONPATH}:/app"
ENV GITHUB_PAT "${GITHUB_PAT}"

WORKDIR /app

COPY py-requirements.txt app/py-requirements.txt
COPY r-pkgs.R app/r-pkgs.R

# installing python libraries
RUN pip3 install -r app/py-requirements.txt

# installing r libraries
RUN Rscript --vanilla app/r-pkgs.R
