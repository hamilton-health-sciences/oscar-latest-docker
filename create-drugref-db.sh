#!/bin/bash

##CREATE DATABASE

USER=$1
PASSWORD=$2
DATABASE_NAME=$3

mysqladmin -u${USER} -p$PASSWORD create $DATABASE_NAME

echo "grant all on ${DATABASE_NAME}.* to ${USER}@localhost identified by \"$PASSWORD\"" |  mysql -u${USER} -p$PASSWORD  $DATABASE_NAME

echo updating character set to utf8
echo "alter database $DATABASE_NAME DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci" | mysql -u${USER} -p$PASSWORD  $DATABASE_NAME