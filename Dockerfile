#
# A Dockerfile to create a MySQL container.
# Copyright(c) 2014 Joshua Goldie
# Provided under MIT license (http://opensource.org/licenses/MIT)
# 
# Based on http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container
# By @benhschwartz
# Used under CC Attrib 4.0 Intl (http://creativecommons.org/licenses/by/4.0)
#
FROM ubuntu:12.10

# Update the apt-sources
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -nfs /bin/true /sbin/initctl
RUN apt-get install -y mysql-server

# Fix connect address and set some configuration parameters
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
RUN sed -i '/^skip-external-locking/a\character-set-server=utf8' /etc/mysql/my.cnf
RUN sed -i '/^skip-external-locking/a\default-storage-engine=InnoDB' /etc/mysql/my.cnf
RUN sed -i '/^skip-external-locking/a\lower_case_table_names=1' /etc/mysql/my.cnf

# Startup script to do initial server configuration
ADD ./startup.sh /opt/startup.sh

# Make sure the port is visible to other containers
EXPOSE 3306

# Invoke the startup script when the container starts
CMD ["/bin/bash","/opt/startup.sh"]

