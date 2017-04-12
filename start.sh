docker build -t vnormatov/phpunit .
docker run --rm -it -v /home/normatovv/brunch:/data/:rw vnormatov/phpunit
