#!/bin/sh
set -e

cd /var/www/html

echo "Waiting for MariaDB..."
until php -r '
$host = getenv("DB_HOST");
$user = getenv("DB_ADMIN_USER");
$pass = getenv("DB_ADMIN_PASSWORD");
$db   = getenv("DB_NAME");
mysqli_report(MYSQLI_REPORT_OFF);
$mysqli = @mysqli_connect($host, $user, $pass, $db);
if (!$mysqli) { exit(1); } else { exit(0); }
'; do
  echo "MariaDB not ready yet, retrying..."
  sleep 2
done
echo "MariaDB is up."

if ! wp core is-installed --allow-root; then
  echo "WordPress not installed, running wp core install..."

  wp core install \
    --url="${WP_URL:-https://mniemaz.42.fr}" \
    --title="${WP_TITLE:-Inception mniemaz website}" \
    --admin_user="${WP_ADMIN_USER:-mniemaz}" \
    --admin_password="${WP_ADMIN_PASSWORD:-mniemaz}" \
    --admin_email="${WP_ADMIN_EMAIL:-mniemaz@mniemaz.com}" \
    --skip-email \
    --allow-root

  wp user create \
	"${WP_USER_LOGIN:-user}" \
	"${WP_USER_EMAIL:-user@example.com}" \
	--user_pass="${WP_USER_PASSWORD:-password}" \
	--role=author \
	--allow-root

  echo "WordPress installed."
else
  echo "WordPress already installed, skipping install."
fi

echo "Starting php-fpm..."
exec php-fpm83 -F
