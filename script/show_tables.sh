#!/bin/bash

. ./config.properties

echo "show tables;" | mysql -u"$login" -p"$password" $database
