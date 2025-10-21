#!/bin/bash
set -e

# Generate SQL file from template if it exists
if [ -f /entrypoint-initdb.d/init.sql.template ]; then
  envsubst < /entrypoint-initdb.d/init.sql.template > /docker-entrypoint-initdb.d/init.sql
  rm /entrypoint-initdb.d/init.sql.template
fi

# Execute the command (usually mysqld)
exec "$@"

