
FILE=/var/www/html/.exist

if  [ ! -f "$FILE" ]
then
	echo "Setting up wordpress"
	rm -rf /var/www/html/wp-config.php
	wp config create --dbname=$DB_NAME --dbuser=$WP_USER --dbpass=$WP_PASSWORD --dbhost="mariadb" --path="/var/www/html/" --allow-root --skip-check
	wp core install --url="localhost" --title="inception" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path="/var/www/html/" --allow-root
	wp user create testuser testuser@student.42.fr --role=author --user_pass="abc123" --allow-root
	touch /var/www/html/.exist
fi

echo "Wordpress setup done"
exec php-fpm7.3 -F -R
