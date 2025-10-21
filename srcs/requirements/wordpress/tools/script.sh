#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USR --dbpass=$DB_PW --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=$DMN --title=Inception --admin_user=$WP_USR --admin_password=$WP_PP --admin_email=$WP_EML --allow-root
./wp-cli.phar user create $WP_USR_NOT_MOD $WP_EML_NOT_MOD --role=author --user_pass=$WP_PW_NOT_MODzxa --allow-root

exec "$@"
