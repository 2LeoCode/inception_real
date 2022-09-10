from	debian:buster

run		apt-get update -y;\
		apt-get install -y curl mariadb-client\
			php php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli\
			php7.3-common php7.3-json php7.3-opcache php7.3-readline\
			php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc\
			php-zip

run		mkdir -p /var/www/html;\
		cd /var/www/html

add		conf/php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf
add		conf/init_wp.sh /tmp

run		mkdir -p /var/run /run/php
run		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
run		chmod +x wp-cli.phar
run		mv wp-cli.phar /usr/local/bin/wp

workdir	/var/www/html
run		wp core download --locale=fr_FR --allow-root
run		chown -R www-data:www-data /var/www/html

cmd		[ "sh", "/tmp/init_wp.sh" ]
