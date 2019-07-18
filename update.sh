#!/bin/bash

image=mysql

# Fetch all tags for the image
# Via https://stackoverflow.com/a/39454426/5004662
all_tags=$(wget -q https://registry.hub.docker.com/v1/repositories/${image}/tags -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}')
#echo "${all_tags}"

# Fetch current tags for the image
current_tags=$(curl https://raw.githubusercontent.com/docker-library/official-images/master/library/${image} 2>/dev/null | grep Tags | sed -e "s/^Tags: //" | tr ',' '\n' | tr -d ' ')
#echo "${current_tags}"

tags=${current_tags}

# Generate Dockerfiles
folder_prefix="build/mysql-low-memory-"
rm -r ${folder_prefix}*/ 2>/dev/null || true
for tag in $tags
do
	directory="${folder_prefix}${tag}"
	mkdir "$directory"

	cp low-memory.cnf $directory/
	cat <<EOF > $directory/Dockerfile
FROM ${image}:${tag}

COPY low-memory.cnf /etc/mysql/conf.d/
EOF
	echo "processed ${tag}"
done
