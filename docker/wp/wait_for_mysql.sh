#!/bin/bash

set -e

echo "wordpress container start"

until mysqladmin ping -h $MYSQL_HOST --silent
do
    >&2 echo -n "."
    sleep 1
done

>&2 echo "MySQL is up - executing command"
