FROM nextcloud

EXPOSE 80:80/tcp

RUN apt-get update \
    && apt-get -y install wget libbz2-dev imagemagick unzip ffmpeg
