#!/bin/sh
set -e

DATADIR=/var/lib/mysql

if [ ! -d "$DATADIR/mysql" ]; then
  echo "Database not found, initializing database..."
  mariadb-install-db --user=mysql --datadir="$DATADIR"

  echo "Starting temporary MariaDB server (local only)..."
  mariadbd --user=mysql --datadir="$DATADIR" --skip-networking &
  pid="$!"

  for i in $(seq 1 30); do
    if mariadb -uroot -e "SELECT 1" >/dev/null 2>&1; then
      break
    fi
    sleep 1
  done

  echo "Setting root password and creating database and user..."
  mariadb -uroot <<-EOSQL
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
    CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;
    CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
    GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

  echo "Stopping temporary MariaDB server..."
  kill "$pid" || true
  wait "$pid" 2>/dev/null || true
else
  echo "Database already exists, skipping initialization."
fi

echo "Starting MariaDB server (0.0.0.0:3306)..."
exec mariadbd --user=mysql --datadir="$DATADIR" --bind-address=0.0.0.0 --port=3306