#!/bin/bash

. ./config.properties

if [ ! -d $output_warnings_dir ]; then
  mkdir $output_warnings_dir
fi

echo "Start importing"
date 

echo "Disabling indeces"
#sh ./disable_index.sh

sh ./import_file.sh export_bus_rec_phone.tab REC_PHONE & \
sh ./import_file.sh export_bus_rec_fax.tab REC_FAX & \
sh ./import_file.sh export_bus_rec_email.tab REC_EMAIL & \
sh ./import_file.sh export_bus_rec_contact.tab REC_CONTACT & \
sh ./import_file.sh export_domain_names.tab DOMAIN_NAMES & \
sh ./import_file.sh export_bus_detail_record.tab DETAIL_RECORD & \
sh ./import_file.sh export_bus_creation_last_updated.tab CREATION_LAST_UPDATED & \
sh ./import_file.sh export_bus_con_rec_phone.tab CON_REC_PHONE & \
sh ./import_file.sh export_bus_con_rec_fax.tab CON_REC_FAX & \
sh ./import_file.sh export_bus_con_rec_email.tab CON_REC_EMAIL & \
sh ./import_file.sh export_bus_con_detail_record.tab CON_DETAIL_RECORD & \
sh ./import_file.sh export_bus_con_creation_last_updated.tab CON_CREATION_LAST_UPDATED 

echo "Enabling indeces"

#sh ./enable_index.sh
