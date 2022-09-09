from	debian:buster

run		apt-get update;\
		apt-get upgrade;\
		apt-get install -y nginx openssl -y

run		mkdir -p /etc/nginx/ssl/;\
		openssl req -newkey rsa:2048 -x509 -days 365 -nodes\
			-out /etc/nginx/ssl/lsuardi.crt\
			-keyout /etc/nginx/ssl/lsuardi.key\
			-subj "/C=FR/ST=France/L=Paris/O=Me/OU=42Paris/CN=localhost/emailAddress=lsuardi@student.42.fr"

add		conf/nginx.conf /etc/nginx/sites-available/default

cmd		[ "nginx", "-g", "daemon off;" ]
