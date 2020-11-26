#!/bin/bash

#cd /code
/code/wait-for-it.sh localhost:3306

# create the oscar_mcmaster database
cd /code/oscar/database/mysql
./createdatabase_on.sh root liyi oscar_mcmaster