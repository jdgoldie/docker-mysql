#!/bin/bash

#
# If this is the first time the container is started, then the db needs initialization
# To rebuld the server clean, just stop the container, wipe the contents of data/mysql on the host 
# and restart.
#
# Copyright(c) 2014 Joshua Goldie
# Provided under MIT license (http://opensource.org/licenses/MIT)
# 
# Based on http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container
# By @benhschwartz (https://twitter.com/benhschwartz)
# Used under CC Attrib 4.0 Intl (http://creativecommons.org/licenses/by/4.0)
#
if [ ! -f /var/lib/mysql/ibdata1 ]; then

  mysql_install_db

  /usr/bin/mysqld_safe &
  sleep 10s

  # Drop anon users, set password for all root user
  mysql << EOF
  delete from mysql.user where user = '';
  create user 'root'@'%' identified by 'password';
  update mysql.user set password =  PASSWORD('password') where user = 'root';
  grant all on *.* to root@'%' with grant option;
  flush privileges;  
EOF

  killall mysqld
  sleep 10s

fi

/usr/bin/mysqld_safe