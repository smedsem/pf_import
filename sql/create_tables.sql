CREATE TABLE CON_CREATION_LAST_UPDATED (
  rec_id       BIGINT NOT NULL,
  creationdate VARCHAR(19) DEFAULT NULL,
  lastupdated  DATETIME    DEFAULT NULL
)
  ENGINE = MyISAM;

CREATE TABLE CREATION_LAST_UPDATED (
  rec_id       BIGINT NOT NULL,
  creationdate VARCHAR(19) DEFAULT NULL,
  lastupdated  DATETIME    DEFAULT NULL
)
  ENGINE = MyISAM;

CREATE TABLE CON_REC_EMAIL (
  rec_id  BIGINT NOT NULL,
  ehandle VARCHAR(255) DEFAULT NULL,
  ehost   VARCHAR(255) DEFAULT NULL,
  email   VARCHAR(255) DEFAULT NULL
)
  ENGINE = MyISAM;


CREATE TABLE REC_EMAIL (
  rec_id  BIGINT NOT NULL,
  ehandle VARCHAR(255) DEFAULT NULL,
  ehost   VARCHAR(255) DEFAULT NULL,
  email   VARCHAR(255) DEFAULT NULL
)
  ENGINE = MyISAM;


CREATE TABLE CON_REC_FAX (
  rec_id             BIGINT NOT NULL,
  rec_fax_area_code  SMALLINT DEFAULT NULL,
  rec_fax_local_code SMALLINT DEFAULT NULL,
  rec_fax_number     SMALLINT DEFAULT NULL,
  rec_fax_ext        BIGINT   DEFAULT NULL
)
  ENGINE = MyISAM;

CREATE TABLE REC_FAX (
  rec_id             BIGINT NOT NULL,
  rec_fax_area_code  SMALLINT DEFAULT NULL,
  rec_fax_local_code SMALLINT DEFAULT NULL,
  rec_fax_number     SMALLINT DEFAULT NULL,
  rec_fax_ext        BIGINT   DEFAULT NULL
)
  ENGINE = MyISAM;

CREATE TABLE CON_REC_PHONE (
  rec_id               BIGINT NOT NULL,
  rec_phone_area_code  SMALLINT DEFAULT NULL,
  rec_phone_local_code SMALLINT DEFAULT NULL,
  rec_phone_number     SMALLINT DEFAULT NULL,
  rec_phone_ext        BIGINT   DEFAULT NULL
)
  ENGINE = MyISAM;

CREATE TABLE REC_PHONE (
  rec_id               BIGINT NOT NULL,
  rec_phone_area_code  SMALLINT DEFAULT NULL,
  rec_phone_local_code SMALLINT DEFAULT NULL,
  rec_phone_number     SMALLINT DEFAULT NULL,
  rec_phone_ext        BIGINT   DEFAULT NULL
)
  ENGINE = MyISAM;

CREATE TABLE REC_CONTACT (
  rec_id_bus BIGINT NOT NULL,
  rec_id_con BIGINT NOT NULL,
  title_id   TINYINT DEFAULT NULL
)

  ENGINE = MyISAM;


CREATE TABLE DETAIL_RECORD (
  rec_id	      BIGINT NOT NULL,
  rec_name            VARCHAR(150) DEFAULT NULL,
  rec_name_short      VARCHAR(150) DEFAULT NULL,
  rec_bus_type        TINYINT      DEFAULT NULL,
  rec_name_sal        CHAR(4)      DEFAULT NULL,
  rec_name_first_name VARCHAR(50)  DEFAULT NULL,
  rec_name_middle     VARCHAR(50)  DEFAULT NULL,
  rec_name_last_name  VARCHAR(50)  DEFAULT NULL,
  rec_name_sur        CHAR(4)      DEFAULT NULL,
  rec_name_gender     CHAR(1)      DEFAULT NULL,
  rec_addr_type       CHAR(4)      DEFAULT NULL,
  rec_addr_number     VARCHAR(20)  DEFAULT NULL,
  rec_addr_predir     VARCHAR(10)  DEFAULT NULL,
  rec_addr_street     VARCHAR(50)  DEFAULT NULL,
  rec_addr_suffix     CHAR(4)      DEFAULT NULL,
  rec_addr_postdir    CHAR(2)      DEFAULT NULL,
  rec_addr_unit       VARCHAR(10)  DEFAULT NULL,
  rec_addr_unit_num   VARCHAR(30)  DEFAULT NULL,
  rec_addr_attn       VARCHAR(100) DEFAULT NULL,
  rec_building        VARCHAR(50)  DEFAULT NULL,
  rec_city            VARCHAR(50)  DEFAULT NULL,
  rec_state           CHAR(5)      DEFAULT NULL,
  rec_zip             CHAR(5)      DEFAULT NULL,
  rec_zip4            CHAR(4)      DEFAULT NULL,
  rec_carrier_route   CHAR(4)      DEFAULT NULL,
  rec_delivery_point  CHAR(2)      DEFAULT NULL,
  rec_county          VARCHAR(100) DEFAULT NULL,
  rec_country         CHAR(2)      DEFAULT NULL
)
  ENGINE = MyISAM;

CREATE TABLE DOMAIN_NAMES (
  domain_name VARCHAR(70) DEFAULT NULL,
  rec_id      BIGINT NOT NULL,
  int_col1    TINYINT      DEFAULT NULL,
  int_col2    TINYINT      DEFAULT NULL
)
  ENGINE = MyISAM;


CREATE TABLE CON_DETAIL_RECORD (
  rec_id              BIGINT NOT NULL,
  rec_name            VARCHAR(50)  DEFAULT NULL,
  rec_name_short      VARCHAR(50)  DEFAULT NULL,
  rec_bus_type        TINYINT      DEFAULT NULL,
  rec_name_sal        CHAR(4)      DEFAULT NULL,
  rec_name_first_name VARCHAR(50)  DEFAULT NULL,
  rec_name_middle     VARCHAR(50)  DEFAULT NULL,
  rec_name_last_name  VARCHAR(50)  DEFAULT NULL,
  rec_name_sur        CHAR(4)      DEFAULT NULL,
  rec_name_gender     CHAR(1)      DEFAULT NULL,
  rec_addr_type       CHAR(1)      DEFAULT NULL,
  rec_addr_number     VARCHAR(20)  DEFAULT NULL,
  rec_addr_predir     CHAR(2)      DEFAULT NULL,
  rec_addr_street     VARCHAR(50)  DEFAULT NULL,
  rec_addr_suffix     CHAR(4)      DEFAULT NULL,
  rec_addr_postdir    CHAR(2)      DEFAULT NULL,
  rec_addr_unit       VARCHAR(10)  DEFAULT NULL,
  rec_addr_unit_num   VARCHAR(30)  DEFAULT NULL,
  rec_addr_attn       VARCHAR(100) DEFAULT NULL,
  rec_building        VARCHAR(50)  DEFAULT NULL,
  rec_city            VARCHAR(50)  DEFAULT NULL,
  rec_state           CHAR(2)      DEFAULT NULL,
  rec_zip             CHAR(5)      DEFAULT NULL,
  rec_zip4            CHAR(4)      DEFAULT NULL,
  rec_carrier_route   CHAR(4)      DEFAULT NULL,
  rec_delivery_point  CHAR(2)      DEFAULT NULL,
  rec_county          VARCHAR(100) DEFAULT NULL,
  rec_country         CHAR(2)      DEFAULT NULL
)
  ENGINE = MyISAM;


