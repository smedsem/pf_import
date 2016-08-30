DROP PROCEDURE IF EXISTS search_by_phone;


DELIMITER //

CREATE PROCEDURE search_by_phone
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


    DROP TEMPORARY TABLE IF EXISTS TMP_PHONE_RECID_TABLE;

    CREATE TEMPORARY TABLE TMP_PHONE_RECID_TABLE (
      rec_id BIGINT(20)
    );

    INSERT INTO TMP_PHONE_RECID_TABLE
      SELECT DISTINCT rec_id
      FROM CON_REC_PHONE rph
      WHERE rph.rec_phone_ext = phone_fax;

    INSERT INTO TMP_PHONE_RECID_TABLE
      SELECT DISTINCT rec_id
      FROM CON_REC_FAX rph
      WHERE rph.rec_fax_ext = phone_fax;

    INSERT INTO TMP_PHONE_RECID_TABLE
      SELECT DISTINCT rec_id
      FROM REC_FAX rph, REC_CONTACT rc
      WHERE rc.rec_id_bus = rph.rec_id AND
            rph.rec_fax_ext = phone_fax;


    INSERT INTO TMP_PHONE_RECID_TABLE
      SELECT DISTINCT rec_id
      FROM REC_PHONE rph, REC_CONTACT rc
      WHERE rc.rec_id_bus = rph.rec_id AND
            rph.rec_phone_ext = phone_fax;

    SELECT DISTINCT CON_DETAIL_RECORD.rec_id
    FROM CON_DETAIL_RECORD
      JOIN TMP_PHONE_RECID_TABLE
        ON CON_DETAIL_RECORD.rec_id = TMP_PHONE_RECID_TABLE.rec_id

      LEFT JOIN (CON_CREATION_LAST_UPDATED,
                 CON_REC_EMAIL,
                 CON_REC_FAX,
                 CON_REC_PHONE,
                 DOMAIN_NAMES,
                 REC_CONTACT,
                 DETAIL_RECORD,
                 CREATION_LAST_UPDATED,
                 REC_EMAIL,
                 REC_FAX,
                 REC_PHONE)
        ON (CON_DETAIL_RECORD.rec_id = CON_CREATION_LAST_UPDATED.rec_id AND
           CON_DETAIL_RECORD.rec_id = CON_REC_EMAIL.rec_id AND
           CON_DETAIL_RECORD.rec_id = CON_REC_FAX.rec_id AND
           CON_DETAIL_RECORD.rec_id = CON_REC_PHONE.rec_id AND
           CON_DETAIL_RECORD.rec_id = DOMAIN_NAMES.rec_id AND
           CON_DETAIL_RECORD.rec_id = REC_CONTACT.rec_id_con AND
           REC_CONTACT.rec_id_bus = DETAIL_RECORD.rec_id AND
           DETAIL_RECORD.rec_id = CREATION_LAST_UPDATED.rec_id AND
           DETAIL_RECORD.rec_id = REC_EMAIL.rec_id AND
           DETAIL_RECORD.rec_id = REC_FAX.rec_id AND
           DETAIL_RECORD.rec_id = REC_PHONE.rec_id)

    WHERE
      (first_name = '' OR CON_DETAIL_RECORD.rec_name_first_name = first_name OR
       DETAIL_RECORD.rec_name_first_name = first_name)
      AND (last_name = '' OR CON_DETAIL_RECORD.rec_name_last_name = last_name OR
           DETAIL_RECORD.rec_name_last_name = last_name)
      AND (middle_name = '' OR CON_DETAIL_RECORD.rec_name_middle = middle_name OR
           DETAIL_RECORD.rec_name_middle = middle_name)
      AND (gender = '' OR CON_DETAIL_RECORD.rec_name_gender = gender OR DETAIL_RECORD.rec_name_gender = gender)
      AND (country = '' OR CON_DETAIL_RECORD.rec_country = country OR DETAIL_RECORD.rec_country = country)
      AND (city = '' OR CON_DETAIL_RECORD.rec_city = city OR DETAIL_RECORD.rec_city = city)
      AND (state = '' OR CON_DETAIL_RECORD.rec_state = state OR DETAIL_RECORD.rec_state = state)
      AND (zip = '' OR CON_DETAIL_RECORD.rec_zip = zip OR DETAIL_RECORD.rec_zip = zip)
      AND (zip4 = '' OR CON_DETAIL_RECORD.rec_zip4 = zip4 OR DETAIL_RECORD.rec_zip4 = zip4)
      AND (addr_number = '' OR CON_DETAIL_RECORD.rec_addr_number = addr_number OR
           DETAIL_RECORD.rec_addr_number = addr_number)
      AND (addr_predir = '' OR CON_DETAIL_RECORD.rec_addr_predir = addr_predir OR
           DETAIL_RECORD.rec_addr_predir = addr_predir)
      AND (addr_street = '' OR CON_DETAIL_RECORD.rec_addr_street = addr_street OR
           DETAIL_RECORD.rec_addr_street = addr_street)
      AND (addr_suffix = '' OR CON_DETAIL_RECORD.rec_addr_suffix = addr_suffix OR
           DETAIL_RECORD.rec_addr_suffix = addr_suffix)
      AND (email = '' OR CON_REC_EMAIL.email = email OR REC_EMAIL.email = email)
      AND (domain_name = '' OR DOMAIN_NAMES.domain_name LIKE domain_name)

    LIMIT limit_param;


  END//

