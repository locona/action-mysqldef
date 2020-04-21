#!/bin/bash

cd "$GITHUB_WORKSPACE" || exit 1

export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"

echo "MYSQL_HOST: ${INPUT_MYSQL_HOST}"
echo "MYSQL_PORT: ${INPUT_MYSQL_PORT}"
echo "MYSQL_USER: ${INPUT_MYSQL_USER}"
echo "MYSQL_PASSWORD: ${INPUT_MYSQL_PASSWORD}"
echo "MYSQL_DATABASE: ${INPUT_MYSQL_DATABASE}"
echo "SCHEMA_PATH: ${INPUT_SCHEMA_PATH}"

# ex) mysqldef -h 127.0.0.1 -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < schema/schema.sql
mysqldef -h ${INPUT_MYSQL_HOST} -u ${INPUT_MYSQL_USER} -p${INPUT_MYSQL_PASSWORD} -P ${INPUT_MYSQL_PORT} ${INPUT_MYSQL_DATABASE} < ${INPUT_SCHEMA_PATH}
