#!/bin/bash

. ./config.properties

# create database
echo "CREATE DATABASE $database;" | mysql -u"$login" -p"$password"

# create tables
sh ./run_sql_script.sh ../sql/create_tables.sql
 