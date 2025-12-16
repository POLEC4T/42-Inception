#!/bin/sh
set -e

DATADIR=/var/lib/mysql
INIT_FILE=/docker-entrypoint-initdb.d/init.sql

: "${DB_ROOT_PASSWORD:?Required}"
: "${DB_NAME:?Required}"
: "${DB_ADMIN_USER:?Required}"
: "${DB_ADMIN_PASSWORD:?Required}"

if [ ! -d "$DATADIR/mysql" ]; then
	echo "Database not found, initializing database..."
	mariadb-install-db --user=mysql --datadir="$DATADIR"

	echo "Setting root password and creating database and user..."
	cat > "$INIT_FILE" <<-EOSQL
		CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
		GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
		CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
		CREATE USER IF NOT EXISTS '${DB_ADMIN_USER}'@'%' IDENTIFIED BY '${DB_ADMIN_PASSWORD}';
		GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_ADMIN_USER}'@'%';
		FLUSH PRIVILEGES;
	EOSQL

else
	echo "Database already exists, skipping initialization."
fi

echo "Starting MariaDB server (0.0.0.0:3306)..."

if [ ! -f "$INIT_FILE" ]; then
	trap "rm -f $INIT_FILE" EXIT 
	exec mariadbd --user=mysql --datadir="$DATADIR" --bind-address=0.0.0.0 --port=3306 --init-file="$INIT_FILE"
else
	exec mariadbd --user=mysql --datadir="$DATADIR" --bind-address=0.0.0.0 --port=3306
fi
