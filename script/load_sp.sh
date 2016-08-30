#!/bin/bash

 
sh ./run_sql_script.sh ../sql/sp/sp_main.sql

sh ./run_sql_script.sh ../sql/sp/sp_by_phone.sql

sh ./run_sql_script.sh ../sql/sp/sp_by_email.sql


sh ./run_sql_script.sh ../sql/sp/sp_original.sql

sh ./run_sql_script.sh ../sql/sp/sp_generic.sql
