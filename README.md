# database utility

## Introduction
Utility designed to set up mysql v5.7 database, quickly, for use in development projects.


## Features
1. Create a docker container running a version of mysql 5.7
2. Initialize the database with sql
3. Ability to connect to db and query from command line
4. Ability to run sql scripts to modify data
5. Ability to dump database into sql file for backup, transfer or locally saving data

## Set-up Steps
1. run set-up script
set up script will create the following directories and files
./logs/
./.env 
./.config

2. Populate .env file with the following variables:
```
MYSQL_DATABASE=DEV_DB
MYSQL_ROOT_PASSWORD=password
MYSQL_USER=redranges
MYSQL_PASSWORD=password
DB_HOST='10.0.0.248'
HOST_PORT='3306'
CONTAINER_PORT='3306'
CONTAINER_NAME='TEST_CONTAINER'
```

3. Populate .config with the following variables:
```
LOG_DIR=./logs/
DOCKER_COMPOSE_LOGS_FILE_PATH=docker_compose_logs.log
DATA_SCRIPT_LOG_FILE=data_script_output.log
```

4. To create the container, run the start script. Inside of bash excute: 
`. start`
This will start docker container with mysql db running. You can use the other script to interact with the container and db.
Note, you may wish to modify the init.sql script in the data directory. This script will run the first time the start script is run




 
