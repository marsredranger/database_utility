# database utility

## Introduction
Utility designed to set up mysql v5.7 database, quickly, for use in development projects.


## Features
1. Create a docker container running a version of mysql 5.7
2. Initialize the database with sql
3. Ability to connect to db and query from command line
4. Ability to run sql scripts to modify data
5. Ability to dump database into sql file for backup, transfer or locally saving data

## DEPENDENCIES
1. docker
2. mysql

## Set-up Steps
1. run set-up script
set up script will create the following directories and files
./logs/
./.env 
./.config

2. Populate .env file with the following variables*, filling in values as needed for passwords and custom needs: 
```
MYSQL_DATABASE=<DATABASE_NAME>
MYSQL_ROOT_PASSWORD=<PASSWORD>
MYSQL_USER=<USERNAME>
MYSQL_PASSWORD=<PASSWORD>
DB_HOST= '<YOUR_IP_ADDRESS>'
HOST_PORT='3306'
CONTAINER_PORT='3306'
CONTAINER_NAME='TEST_CONTAINER'
```

* These are not intended to be best practices, but to allow user to quickly create a database. Please use at your own risk. 

3. Populate .config with the following variables:
```
LOG_DIR=./logs/
DOCKER_COMPOSE_LOGS_FILE_PATH=docker_compose_logs.log
DATA_SCRIPT_LOG_FILE=data_script_output.log
```

4. If you are using mac, you may need to modify docker-compose file with the platform, such that the file shold contain the contents below:
```
version: '3'
services:
  db_1:
    platform: linux/x86_64/v8
    image: percona:5.7
    container_name: ${CONTAINER_NAME}
    environment:
      - MYSQL_DATABASE=${MYSQL_DATABASE}
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
      - MYSQL_USER=${MYSQL_USER}
      - MYSQL_PASSWORD=${MYSQL_PASSWORD}
    volumes:
      - ./data:/docker-entrypoint-initdb.d
    ports:
      - ${HOST_PORT}:${CONTAINER_PORT}
    ulimits:
      nofile:
        soft: 20000
        hard: 20000

```

5. To create the container, run the start script. Inside of bash excute: 
`. start`
This will start docker container with mysql db running. You can use the other script to interact with the container and db.
Note, you may wish to modify the init.sql script in the data directory. This script will run the first time the start script is run




 
