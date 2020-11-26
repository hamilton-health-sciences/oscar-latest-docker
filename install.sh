#!/bin/sh
./clone.sh

echo "Setting up database containers. This may take some time...."
docker-compose up -d db

echo "Initializing database"
docker-compose exec db ./code/populate-db.sh

echo "Bringing up tomcat"
docker-compose up -d tomcat_oscar

echo "OSCAR is set up at http://localhost:8091/oscar"
echo "You may have to restart the container http://localhost:8091/  (oscar/oscar)"
echo "Errors if any are more likely to be in the database import!"
echo "Thank You.."
echo "Visit our website for more info: http://nuchange.ca"