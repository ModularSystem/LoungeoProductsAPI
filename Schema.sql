-- ---
-- Globals
-- ---

-- SQLINES DEMO *** AUTO_VALUE_ON_ZERO";
-- SQLINES DEMO *** HECKS=0;

-- ---
-- Table 'Products'
--
-- ---

DROP TABLE IF EXISTS Products;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Products (
  product_id INTEGER NULL DEFAULT NULL,
  name VARCHAR(255) NULL DEFAULT NULL,
  slogan VARCHAR(255) NULL DEFAULT NULL,
  description VARCHAR(255) NULL DEFAULT NULL,
  category VARCHAR(255) NULL DEFAULT NULL,
  default_price VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (product_id)
);

-- ---
-- Table 'Styles'
--
-- ---

DROP TABLE IF EXISTS Styles;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE Styles (
  style_id INTEGER NOT NULL DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  style_name VARCHAR(255) NULL DEFAULT NULL,
  original_price VARCHAR(255) NULL DEFAULT NULL,
  sale_price VARCHAR(255) NULL DEFAULT NULL,
  default VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (style_id)
);

-- ---
-- Table 'Features'
--
-- ---

DROP TABLE IF EXISTS Features;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Features_seq;

CREATE SEQUENCE Features_seq;

CREATE TABLE Features (
  feature_id INTEGER NULL DEFAULT NEXTVAL ('Features_seq') DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NEXTVAL ('Features_seq') DEFAULT NULL,
  feature VARCHAR(255) NULL DEFAULT NULL,
  value VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (feature_id)
);

-- ---
-- Table 'Photos'
--
-- ---

DROP TABLE IF EXISTS Photos;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Photos_seq;

CREATE TABLE Photos (
  photo_id INTEGER NULL DEFAULT NEXTVAL ('Photos_seq') DEFAULT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  thumbnail_url VARCHAR(255) NULL DEFAULT NULL,
  url VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (photo_id)
);

-- ---
-- SQLINES DEMO *** oducts'
--
-- ---

DROP TABLE IF EXISTS Related Products;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Related Products_seq;

CREATE TABLE Related Products (
  join_id INTEGER NULL DEFAULT NEXTVAL ('Related Products_seq') DEFAULT NULL,
  product_id INTEGER NULL DEFAULT NULL,
  related_id INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (join_id)
);

-- ---
-- Table 'Skus'
--
-- ---

DROP TABLE IF EXISTS Skus;

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE SEQUENCE Skus_seq;

CREATE TABLE Skus (
  size_id INTEGER NULL DEFAULT NEXTVAL ('Skus_seq') DEFAULT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  size VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (size_id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE Styles ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);
ALTER TABLE Features ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);
ALTER TABLE Photos ADD FOREIGN KEY (style_id) REFERENCES Styles (style_id);
ALTER TABLE Related Products ADD FOREIGN KEY (product_id) REFERENCES Products (product_id);
ALTER TABLE Skus ADD FOREIGN KEY (style_id) REFERENCES Styles (style_id);

-- ---
-- Table Properties
-- ---

-- SQLINES DEMO *** ucts` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- SQLINES DEMO *** es` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- SQLINES DEMO *** ures` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- SQLINES DEMO *** os` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- SQLINES DEMO *** ted Products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- SQLINES DEMO *** ` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- SQLINES DEMO *** ucts` (`product_id`,`name`,`slogan`,`description`,`category`,`default_price`) VALUES
-- SQLINES DEMO *** ');
-- SQLINES DEMO *** es` (`style_id`,`product_id`,`style_name`,`original_price`,`sale_price`,`default`) VALUES
-- SQLINES DEMO *** ');
-- SQLINES DEMO *** ures` (`feature_id`,`product_id`,`feature`,`value`) VALUES
-- ('','','','');
-- SQLINES DEMO *** os` (`photo_id`,`style_id`,`thumbnail_url`,`url`) VALUES
-- ('','','','');
-- SQLINES DEMO *** ted Products` (`join_id`,`product_id`,`related_id`) VALUES
-- ('','','');
-- SQLINES DEMO *** ` (`size_id`,`style_id`,`quantity`,`size`) VALUES
-- ('','','','');