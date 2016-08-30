DROP PROCEDURE IF EXISTS search_domain;

DELIMITER //

CREATE PROCEDURE search_domain
  (   limit_param  INT,
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


IF phone_fax<>'' THEN
  call
     search_by_phone(
      limit_param ,
      first_name  ,
      last_name   ,
      middle_name ,
      gender      ,
      country     ,
      city        ,
      state       ,
      zip         ,
      zip4        ,
      addr_number ,
      addr_predir ,
      addr_street ,
      addr_suffix ,
      phone_fax   ,
      email       ,
      domain_name );
ELSEIF email<>'' THEN
  call
     search_by_email(
      limit_param ,
      first_name  ,
      last_name   ,
      middle_name ,
      gender      ,
      country     ,
      city        ,
      state       ,
      zip         ,
      zip4        ,
      addr_number ,
      addr_predir ,
      addr_street ,
      addr_suffix ,
      phone_fax   ,
      email       ,
      domain_name );

ELSE
     call search_generic(
      limit_param ,
      first_name  ,
      last_name   ,
      middle_name ,
      gender      ,
      country     ,
      city        ,
      state       ,
      zip         ,
      zip4        ,
      addr_number ,
      addr_predir ,
      addr_street ,
      addr_suffix ,
      phone_fax   ,
      email       ,
      domain_name );

END IF;

END//

