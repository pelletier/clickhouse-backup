#!/bin/bash

echo "${DOCKER_PASSWORD}" | docker login -u alexakulov --password-stdin

docker push "alexakulov/clickhouse-backup:master"

if [ "$1" == "release" ]; then
    docker tag "alexakulov/clickhouse-backup:master" "alexakulov/clickhouse-backup:${TRAVIS_TAG//v}"
    docker tag "alexakulov/clickhouse-backup:master" "alexakulov/clickhouse-backup:latest"
    docker push "alexakulov/clickhouse-backup:${TRAVIS_TAG//v}"
    docker push "alexakulov/clickhouse-backup:latest"
fi
