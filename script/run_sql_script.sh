#!/bin/bash

. ./config.properties

echo 'Start executing script'

#cat "$1"

a=$(<$1)
#cat "$1"
echo "$a"

echo "$a" | mysql -u"$login" -p"$password" $database

