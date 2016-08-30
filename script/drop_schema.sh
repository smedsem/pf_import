#!/bin/bash

. ./config.properties

echo "drop database $database;" | mysql -u$login -p$password
echo "DONE"