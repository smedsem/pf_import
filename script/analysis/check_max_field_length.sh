#!/bin/bash


echo 'Start analysis'

awk -F'\t' ' { for (i=1;i<=NF;i++) l[i]=((x=length($i))>l[i]?x:l[i])}       END {for (i in l) print "Column"i":",l[i]}' $1
