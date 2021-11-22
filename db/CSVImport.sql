\c overview;

-- Products
-- \COPY products FROM 'SDC_CSVs/product.csv' WITH DELIMITER ',' CSV HEADER NULL AS 'null';

-- --Styles
-- \COPY styles FROM 'SDC_CSVs/styles.csv' WITH DELIMITER ',' CSV HEADER NULL AS 'null';
-- CREATE INDEX ON styles (id);

-- -- Features
-- \COPY features FROM 'SDC_CSVs/features.csv' WITH DELIMITER ',' CSV HEADER NULL AS 'null';
-- CREATE INDEX ON features (id);

-- -- Related Products
-- \COPY relatedproducts FROM 'SDC_CSVs/related.csv' WITH DELIMITER ',' CSV HEADER NULL AS 'null';
-- CREATE INDEX ON relatedproducts (id);

-- Photos
\COPY photos FROM 'SDC_CSVs/photos.csv' WITH DELIMITER ',' CSV HEADER NULL AS 'null';
CREATE INDEX ON photos (style_id);


-- SKUS
\COPY skus FROM 'SDC_CSVs/skus.csv' WITH DELIMITER ',' CSV HEADER NULL AS 'null';
CREATE INDEX ON skus (style_id);

-- INSERT INTO photos_dic (url, thumbnail_url) SELECT DISTINCT url, thumbnail_url FROM photos;

-- UPDATE photos SET photo_isolate = photos_dic.photo_isolate FROM photos_dic WHERE photos.url = photos_dic.url AND photos.thumbnail_url = photos_dic.thumbnail_url;

-- ALTER photos DROP (url, thumbnail_url);