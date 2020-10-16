#!/bin/bash

#cd /code
/code/wait-for-it.sh localhost:3306

# create the drugref2 database
/code/create-drugref-db.sh root liyi drugref2

# create the oscar_mcmaster database
cd /code/oscar/database/mysql
# ./createdatabase_bc.sh oscar oscar oscar_mcmaster
./createdatabase_on.sh root liyi oscar_mcmaster