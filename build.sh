#!/bin/bash

build_dir="build"

versions=$(ls $build_dir)
for version in $versions
do
	./build-one.sh "$version"
done
