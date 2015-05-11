# Dockerizing thunder xware
# xware version: Xware1.0.31 release date: 2014-08-27

FROM ubuntu:14.10
MAINTAINER yinheli <me@yinheli.com>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && apt-get install -y zlib1g-dev lib32z1 lib32ncurses5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /app

COPY thunder /app/
COPY start.sh /app/
VOLUME /app/TDDOWNLOAD

EXPOSE 9000
WORKDIR /app
RUN chmod +x start.sh
CMD ["./start.sh"]

