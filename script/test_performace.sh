#!/bin/bash

. ./config.properties

echo '' > performace_out

for filename in ./../sql/performance/performance*.sql
do
while read -r line
do
   sql="$line"
   start_time=$(($(date +%s%N)/1000000));
   echo $sql  >> performace_out
   echo $sql | mysql -u"$login" -p"$password" $database >> performace_out
   echo $sql
   echo "Execution time : $(expr $(($(date +%s%N)/1000000)) - $start_time)ms"
done < "$filename"

done
