#!/bin/bash

version=$1
docker_hub_tag="hsheth2/mysql-low-memory:$version"

echo "Starting build of $version"
docker build \
    --pull \
    -t $docker_hub_tag \
    --build-arg MYSQL_VERSION=$version \
    .

#github_registry_tag="docker.pkg.github.com/hsheth2/${repo}/mysql-low-memory:$version"
#docker tag $docker_hub_tag $github_registry_tag

docker push $docker_hub_tag
#docker push $github_registry_tag
