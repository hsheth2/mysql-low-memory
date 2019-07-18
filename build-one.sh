#!/bin/bash

username="hsheth2"
repo="mysql-low-memory"
build_dir="build"
version=$1

echo "Starting build of $version"
docker build --pull -t ${repo}:$version $build_dir/$version

docker_hub_tag="hsheth2/mysql-low-memory:$version"
#github_registry_tag="docker.pkg.github.com/hsheth2/${repo}/mysql-low-memory:$version"
docker tag ${repo}:$version $docker_hub_tag
#docker tag ${repo}:$version $github_registry_tag

docker push $docker_hub_tag
#docker push $github_registry_tag
