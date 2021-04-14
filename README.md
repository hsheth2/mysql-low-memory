# MySQL Low Memory
![Update Docker Hub Images](https://github.com/hsheth2/mysql-low-memory/workflows/Update%20Docker%20Hub%20Images/badge.svg)

A MySQL Docker image with lower memory requirements. Good for low-memory environments, especially virtual servers. Note that running MySQL under these settings will likely impact performance in a non-trivial way.

### Usage
Just replace `mysql` with `hsheth2/mysql-low-memory` in your Dockerfile or docker-compose config. This image works as a drop-in replacement for the standard mysql image, and matches the original versions and tags.

See https://hub.docker.com/r/hsheth2/mysql-low-memory for details.

### Notes
We use GitHub Actions to update the Docker Hub images on a daily basis.

This project defines a Dockerfile which replaces the config file of the default MySQL Docker image with one which uses less memory. These modifications come from the following sources:

 * http://www.tocker.ca/2014/03/10/configuring-mysql-to-use-minimal-memory.html
 * https://mariadb.com/de/node/579

This is a fork from https://github.com/alexanderkoller/low-memory-mysql. It adds an automated build and push to the Docker Hub, and uses the standard `mysql` image rather than `mysql/mysql-server`. 
