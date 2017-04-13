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
RUN apt-get --allow-unauthenticated install -y php5.6-mysql
RUN apt-get --allow-unauthenticated install -y php5.6-mbstring
RUN apt-get --allow-unauthenticated install -y php5.6-curl
RUN apt-get --allow-unauthenticated install -y php5.6-memcached
RUN apt-get --allow-unauthenticated install -y php5.6-memcache
WORKDIR /data
VOLUME /data
ADD php.ini /etc/php/5.6/cli/
#RUN ls -la

ENV DEBIAN_FRONTEND teletype
ENV TERM xterm
ENV HTTP_WS phpUnitTest

CMD /bin/bash && vendor/bin/paratest -p10 tests/models

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#RUN "php systemutils/mpAutoloaderClassMap/sucreatemap.php"
#RUN "php tests/phpunit-tc.php -c phpunitconfig.xml --coverage-text --coverage-html coverage"
#vendor/bin/paratest -p10 tests/models
