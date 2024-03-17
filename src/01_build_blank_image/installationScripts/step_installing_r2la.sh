#!/bin/bash

echo "Create temporary directory ..."

mkdir ~/tmp

echo "Create temporary directory DONE/"

echo "Unziping to temporary directory ..."

# unzip ~/r2la.zip -d ~/tmp

echo "Unziping to temporary directory DONE!"

echo "Creating r2la directory ..."

mkdir /r2la

echo "Creating r2la directory DONE!"

echo ${R2LA_VERSION_NAME}

mv "~/tmp/${R2LA_VERSION_NAME}/" "/r2la"