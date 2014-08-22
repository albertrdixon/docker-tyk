#!/bin/sh
CONFIG=/etc/tyk/tyk.conf
[ -z "$DB_PORT_6379_TCP_ADDR" ] && { echo "Redis not linked"; exit 255; }
sed -i "s/REDIS_HOST/$DB_PORT_6379_TCP_ADDR/" $CONFIG

exec $@
