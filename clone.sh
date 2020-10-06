#!/bin/bash
echo "Cloning oscar"
if [ -d "./oscar" ]; then
    echo "already cloned"
else
    git clone --depth 1 --single-branch --branch docker-master --config core.autocrlf=input git@github.com:hamilton-health-sciences/oscar.git oscar
fi


