DROP PROCEDURE IF EXISTS search_generic;

DELIMITER //


CREATE PROCEDURE search_generic
  (limit_param INT,
   first_name  CHAR(50),
   last_name   CHAR(50),
   middle_name CHAR(50),
   gender      CHAR(1),
   country     CHAR(2),
   city        CHAR(50),
   state       CHAR(5),
   zip         CHAR(5),
   zip4        CHAR(5),
   addr_number CHAR(20),
   addr_predir CHAR(10),
   addr_street CHAR(50),
   addr_suffix CHAR(4),
   phone_fax   CHAR(20),
   email       CHAR(255),
   domain_name CHAR(70)
  )

  BEGIN

    SELECT DISTINCT *
    FROM
      (
        (SELECT DISTINCT CON_DETAIL_RECORD.rec_id
         FROM CON_DETAIL_RECORD
           LEFT JOIN (CON_CREATION_LAST_UPDATED, CREATION_LAST_UPDATED, DOMAIN_NAMES)
             ON (CON_DETAIL_RECORD.rec_id = CON_CREATION_LAST_UPDATED.rec_id AND
                 CON_DETAIL_RECORD.rec_id = CREATION_LAST_UPDATED.rec_id AND
                 CON_DETAIL_RECORD.rec_id = DOMAIN_NAMES.rec_id)

         WHERE
           (first_name = '' OR CON_DETAIL_RECORD.rec_name_first_name = first_name)
           AND (last_name = '' OR CON_DETAIL_RECORD.rec_name_last_name = last_name)
           AND (middle_name = '' OR CON_DETAIL_RECORD.rec_name_middle = middle_name)
           AND (gender = '' OR CON_DETAIL_RECORD.rec_name_gender = gender)
           AND (country = '' OR CON_DETAIL_RECORD.rec_country = country)
           AND (city = '' OR CON_DETAIL_RECORD.rec_city = city)
           AND (state = '' OR CON_DETAIL_RECORD.rec_state = state)
           AND (zip = '' OR CON_DETAIL_RECORD.rec_zip = zip)
           AND (zip4 = '' OR CON_DETAIL_RECORD.rec_zip4 = zip4)
           AND (addr_number = '' OR CON_DETAIL_RECORD.rec_addr_number = addr_number)
           AND (addr_predir = '' OR CON_DETAIL_RECORD.rec_addr_predir = addr_predir)
           AND (addr_street = '' OR CON_DETAIL_RECORD.rec_addr_street = addr_street)
           AND (addr_suffix = '' OR CON_DETAIL_RECORD.rec_addr_suffix = addr_suffix)
           AND (domain_name = '' OR DOMAIN_NAMES.domain_name LIKE domain_name)

         LIMIT limit_param
        )

         UNION

         (

         SELECT DISTINCT REC_CONTACT.rec_id_con
         FROM DETAIL_RECORD

         JOIN REC_CONTACT
         ON DETAIL_RECORD.rec_id = REC_CONTACT.rec_id_bus

         LEFT JOIN (CREATION_LAST_UPDATED, DOMAIN_NAMES)
         ON (DETAIL_RECORD.rec_id = CREATION_LAST_UPDATED.rec_id AND
         DETAIL_RECORD.rec_id = DOMAIN_NAMES.rec_id)

         WHERE
         (first_name = '' OR DETAIL_RECORD.rec_name_first_name = first_name)
         AND (last_name = '' OR DETAIL_RECORD.rec_name_last_name = last_name)
         AND (middle_name = '' OR DETAIL_RECORD.rec_name_middle = middle_name)
         AND (gender = '' OR DETAIL_RECORD.rec_name_gender = gender)
         AND (country = '' OR DETAIL_RECORD.rec_country = country)
         AND (city = '' OR DETAIL_RECORD.rec_city = city)
         AND (state = '' OR DETAIL_RECORD.rec_state = state)
         AND (zip = '' OR DETAIL_RECORD.rec_zip = zip)
         AND (zip4 = '' OR DETAIL_RECORD.rec_zip4 = zip4)
         AND (addr_number = '' OR DETAIL_RECORD.rec_addr_number = addr_number)
         AND (addr_predir = '' OR DETAIL_RECORD.rec_addr_predir = addr_predir)
         AND (addr_street = '' OR DETAIL_RECORD.rec_addr_street = addr_street)
         AND (addr_suffix = '' OR DETAIL_RECORD.rec_addr_suffix = addr_suffix)
         AND (domain_name = '' OR DOMAIN_NAMES.domain_name LIKE domain_name)
         LIMIT limit_param
         )

      ) a1
    LIMIT limit_param;


  END//

