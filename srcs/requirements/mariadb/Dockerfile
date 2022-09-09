from	debian:buster

run		apt-get update;\
		apt-get upgrade;\
		apt-get install -y mariadb-server mariadb-client

add		conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
add		conf/script.sh /tmp
add		conf/init.sql /tmp

cmd		[ "sh", "/tmp/script.sh" ]
