-- ---
-- Globals
-- ---
dropdb IF EXISTS overview;
CREATE DATABASE overview;
\c overview;

-- ---
-- Table 'Products'
--
-- ---

DROP TABLE IF EXISTS Products CASCADE;

CREATE TABLE Products (
  id INTEGER NOT NULL,
  name VARCHAR(255) NULL DEFAULT NULL,
  slogan VARCHAR(255) NULL DEFAULT NULL,
  description VARCHAR(767) NULL DEFAULT NULL,
  category VARCHAR(255) NULL DEFAULT NULL,
  default_price VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'Styles'
--
-- ---

DROP TABLE IF EXISTS Styles CASCADE;

CREATE TABLE Styles (
  style_id INTEGER NOT NULL,
  id INTEGER NULL DEFAULT NULL,
  style_name VARCHAR(255) NULL DEFAULT NULL,
  sale_price VARCHAR(255) NULL DEFAULT NULL,
  original_price VARCHAR(255) NULL DEFAULT NULL,
  default_style BOOLEAN,
  PRIMARY KEY (style_id)
);

-- ---
-- Table 'Features'
--
-- ---

DROP TABLE IF EXISTS Features CASCADE;

CREATE TABLE Features (
  feature_id INTEGER NOT NULL,
  id INTEGER NULL DEFAULT NULL,
  feature VARCHAR(255) NULL DEFAULT NULL,
  value VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (feature_id)
);

-- ---
-- Table 'Photos'
--
-- ---

DROP TABLE IF EXISTS Photos CASCADE;

CREATE TABLE Photos (
  photo_id INTEGER NOT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  url VARCHAR(255) NULL DEFAULT NULL,
  thumbnail_url VARCHAR(255) NULL DEFAULT NULL,
  -- photo_isolate INTEGER DEFAULT NULL,
  PRIMARY KEY (photo_id)
);

-- ---
-- Table 'Photos Unique'
--
-- ---

-- DROP TABLE IF EXISTS photos_dic CASCADE;

-- CREATE TABLE photos_dic (
--   photo_isolate SERIAL PRIMARY KEY,
--   url VARCHAR(255) NULL DEFAULT NULL,
--   thumbnail_url VARCHAR(255) NULL DEFAULT NULL
-- );

-- ---
-- Table 'Related Products'
--
-- ---

DROP TABLE IF EXISTS RelatedProducts CASCADE;

CREATE TABLE RelatedProducts (
  join_id INTEGER NOT NULL,
  id INTEGER NOT NULL DEFAULT NULL,
  related_id INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (join_id)
);

-- ---
-- Table 'Skus'
--
-- ---

DROP TABLE IF EXISTS Skus CASCADE;

CREATE TABLE Skus (
  size_id INTEGER NOT NULL,
  style_id INTEGER NOT NULL,
  size VARCHAR(255) NULL DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (size_id)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE Features ADD FOREIGN KEY (id) REFERENCES Products (id);
ALTER TABLE RelatedProducts ADD FOREIGN KEY (id) REFERENCES Products (id);
ALTER TABLE Styles ADD FOREIGN KEY (id) REFERENCES Products (id);
ALTER TABLE Photos ADD FOREIGN KEY (style_id) REFERENCES Styles (style_id);
ALTER TABLE Skus ADD FOREIGN KEY (style_id) REFERENCES Styles (style_id);

-- ---
-- Foreign Keys
-- ---
