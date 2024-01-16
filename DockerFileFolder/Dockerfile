FROM nextcloud

EXPOSE 80:80/tcp

RUN apt-get update \
    && apt-get -y install xdebug wget imagemagick gnupg2 unzip ffmpeg
    
# Enable repo and install dlib
RUN echo "deb https://repo.delellis.com.ar bullseye bullseye" > /etc/apt/sources.list.d/20-pdlib.list \
  && wget -qO - https://repo.delellis.com.ar/repo.gpg.key | apt-key add -
RUN apt update \
  && apt install -y libdlib-dev

# Install pdlib extension
RUN wget https://github.com/goodspb/pdlib/archive/master.zip \
  && mkdir -p /usr/src/php/ext/ \
  && unzip -d /usr/src/php/ext/ master.zip \
  && rm master.zip
RUN docker-php-ext-install pdlib-master

# Install bz2 to uncompress models
RUN apt install -y libbz2-dev
RUN docker-php-ext-install bz2

# Increase memory limits
RUN echo memory_limit=2048M > /usr/local/etc/php/conf.d/memory-limit.ini
