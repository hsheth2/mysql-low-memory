# Low memory MySQL

MySQL is great, but with its default settings, it uses a lot of memory. This can be a problem when deploying it in a low-memory environment, such as a virtual server or a Docker container server.

This project defines a Dockerfile which replaces the config file of the default MySQL Docker image with one which uses less memory. These modifications come from the following sources:

 * http://www.tocker.ca/2014/03/10/configuring-mysql-to-use-minimal-memory.html
 * https://mariadb.com/de/node/579

This is a fork from https://github.com/alexanderkoller/low-memory-mysql It adds an automated build and push to the Docker Hub, and uses the standard mysql image rather than `mysql/mysql-server`. 

## Using
See https://hub.docker.com/r/hsheth2/mysql-low-memory. Works as a drop-in replacement for the standard mysql image.
