-- ---
-- Globals
-- ---
DROP DATABASE IF EXISTS overview;
CREATE DATABASE overview;
\c overview;

-- ---
-- Table 'Products'
--
-- ---

DROP TABLE IF EXISTS Products;

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

DROP TABLE IF EXISTS Styles;

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

DROP TABLE IF EXISTS Features;

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

DROP TABLE IF EXISTS Photos;

CREATE TABLE Photos (
  photo_id INTEGER NOT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  url VARCHAR(255) NULL DEFAULT NULL,
  thumbnail_url VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (photo_id)
);

-- ---
-- Table 'Related Products'
--
-- ---

DROP TABLE IF EXISTS RelatedProducts;

CREATE TABLE RelatedProducts (
  join_id INTEGER NOT NULL,
  id INTEGER NULL DEFAULT NULL,
  related_id INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (join_id)
);

-- ---
-- Table 'Skus'
--
-- ---

DROP TABLE IF EXISTS Skus;

CREATE TABLE Skus (
  size_id INTEGER NOT NULL,
  style_id INTEGER NULL DEFAULT NULL,
  size VARCHAR(255) NULL DEFAULT NULL,
  quantity INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (size_id)
);

-- ---
-- Foreign Keys
-- ---

-- ALTER TABLE Styles ADD FOREIGN KEY (id) REFERENCES Products (id);
-- ALTER TABLE Features ADD FOREIGN KEY (id) REFERENCES Products (id);
-- ALTER TABLE Photos ADD FOREIGN KEY (style_id) REFERENCES Styles (style_id);
-- ALTER TABLE RelatedProducts ADD FOREIGN KEY (id) REFERENCES Products (id);
-- ALTER TABLE Skus ADD FOREIGN KEY (style_id) REFERENCES Styles (style_id);