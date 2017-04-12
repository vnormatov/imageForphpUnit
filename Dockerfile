FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mc
RUN apt-get install -y sendmail
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get --allow-unauthenticated install -y php5.6
RUN apt-get --allow-unauthenticated install -y php5.6-dom
RUN apt-get install -y php5.6-mysql

WORKDIR /data
VOLUME /data
RUN ls -la
ENV DEBIAN_FRONTEND teletype
ENV TERM xterm
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
