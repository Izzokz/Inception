#!/bin/bash
set -e

if [ -f /tmp/init.sql.template ]; then
  envsubst < /tmp/init.sql.template > /etc/mysql/init.sql
  rm /tmp/init.sql.template
fi

exec "$@"

