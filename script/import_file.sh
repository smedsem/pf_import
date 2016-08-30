#!/bin/bash

. ./config.properties


#create warning directori if not exist
if [ ! -d $output_warnings_dir ]; then
  mkdir $output_warnings_dir
fi


start_line="LOAD DATA LOCAL INFILE '$input_data_source_dir/$1' INTO TABLE $2  FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n';"

echo $start_line

echo "set max_error_count=$max_error_count; $start_line" | mysql -u$login -p$password  $database --show-warnings > $output_warnings_dir/$1
echo "DONE $2"

date
