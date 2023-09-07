mkdir -p /run/php
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html	
if [ ! -e /var/www/html/wp-config.php ]; then
	wp core download --path=/var/www/html --allow-root
	wp config create --path=/var/www/html --allow-root \
			--dbname=$SQL_DATABASE \
			--dbuser=$SQL_USER \
			--dbpass=$SQL_PASSWORD \
			--dbhost=mariadb:3306 --path='/var/www/html'
	wp core install --url=$DOMAIN_NAME --allow-root \
			--admin_user=$ADMIN_USER \
			--admin_password=$ADMIN_PASSWORD \
			--admin_email=$ADMIN_EMAIL \
			--title="Abdelhamid's Wordpress Site" 
	wp user create $USER $USER_EMAIL \
			--user_pass=$USER_PASSWORD \
			--role='editor' --allow-root
	wp theme install twentytwentytwo --activate --allow-root
fi
/usr/sbin/php-fpm7.4 -F
