#!/bin/bash

FILE=/var/lib/mysql/.db_create
if  [ ! -f "$FILE" ]
then
	echo "Creating DB"
	eval "echo \"$(cat /tmp/init.sql)\"" > /tmp/init_env.sql
#	envsubst < /tmp/init.sql > /tmp/init_env.sql
	service mysql start
	mysql -D mysql < /tmp/init_env.sql | true
	touch /var/lib/mysql/.db_create
	service mysql stop | true #echo -n ""
fi
echo "DB is already created"
exec mysqld_safe
