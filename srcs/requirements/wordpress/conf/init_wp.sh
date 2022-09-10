
FILE=/var/www/html/.exist

echo "Waiting for mariadb ..."

while ! mariadb -h mariadb -P 3306 -u$WP_USER -p$WP_PASSWORD
do
	true
done

if  [ ! -f "$FILE" ]
then
	echo "Setting up wordpress"
	rm -rf /var/www/html/wp-config.php
	wp core config --dbname=$DB_NAME --dbuser=$WP_USER --dbpass=$WP_PASSWORD --dbhost=mariadb --path="/var/www/html/" --allow-root --skip-check
	wp core install --url="localhost" --title="inception" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root 2>err.log
	wp user create testuser testuser@student.42.fr --role=author --user_pass="abc123" --allow-root

	wp post delete 1 --force --allow-root
	wp post delete 2 --force --allow-root
	wp plugin delete hello --allow-root
	wp theme delete twentytwelve --allow-root
	wp theme delete twentythirteen --allow-root
	wp theme delete twentyfourteen --allow-root
	wp widget delete $(wp widget list sidebar-1 --format=ids) --allow-root

	touch /var/www/html/.exist
fi

echo "Wordpress setup done"
exec php-fpm7.3 -F -R
