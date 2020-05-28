#!/bin/bash

image=mysql

# Fetch all tags for the image
# Via https://stackoverflow.com/a/39454426/5004662
all_tags=$(wget -q https://registry.hub.docker.com/v1/repositories/${image}/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}')
#echo "${all_tags}"

# Fetch current tags for the image
current_tags=$(curl https://raw.githubusercontent.com/docker-library/official-images/master/library/${image} 2>/dev/null | grep Tags | sed -e "s/^Tags: //" | tr ',' '\n' | tr -d ' ')
#echo "${current_tags}"

set -x
tags=${current_tags}
echo $tags

# Build images
for tag in $tags
do
	./build-one.sh $tag
	echo "processed ${tag}"
done
