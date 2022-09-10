from	debian:buster

run		apt-get update -y;\
		apt-get install -y mariadb-server mariadb-client gettext-base

add		conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
add		conf/init_db.sh /tmp
add		conf/init.sql /tmp

cmd		[ "sh", "/tmp/init_db.sh" ]
