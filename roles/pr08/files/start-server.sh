#!/bin/bash
# cf. https://stackoverflow.com/questions/24544288/how-to-detect-if-docker-run-succeeded-programmatically

# Abort on error
set -e

if ! docker top pr08a2 &>/dev/null
then
    echo "Delete pr08a2 in case it still exists"
    (docker rm pr08a2 || true) > /dev/null 2> /dev/null
    echo "Start container"
    docker run -d -v /vagrant/roles/pr08/files/htmlpub:/var/www/html -p 0.0.0.0:20820:80 --name pr08a2 --rm php:7.2-apache > /dev/null 2> /dev/null
    exit 0
fi

echo "Container is already started"
exit 0
