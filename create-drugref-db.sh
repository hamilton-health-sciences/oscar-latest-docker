#!/bin/bash

##CREATE DATABASE

USER=$1
PASSWORD=$2
DATABASE_NAME=$3

echo creating the drugref2 database
mysqladmin -u${USER} -p$PASSWORD create $DATABASE_NAME

echo granting user permissions on drugref2
echo "grant all on ${DATABASE_NAME}.* to ${USER}@localhost identified by \"$PASSWORD\"" |  mysql -u${USER} -p$PASSWORD  $DATABASE_NAME

echo updating drugref2 character set to utf8
echo "alter database $DATABASE_NAME DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci" | mysql -u${USER} -p$PASSWORD  $DATABASE_NAME