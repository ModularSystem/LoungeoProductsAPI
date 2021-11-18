\c overview;

\COPY products FROM 'SDC_CSVs/product.csv' WITH DELIMITER ',' CSV HEADER;

\COPY styles FROM 'SDC_CSVs/styles.csv' WITH DELIMITER ',' CSV HEADER;

\COPY features FROM 'SDC_CSVs/features.csv' WITH DELIMITER ',' CSV HEADER;

\COPY photos FROM 'SDC_CSVs/photos.csv' WITH DELIMITER ',' CSV HEADER;
-- (photo_id, style_id, url, thumbnail_url)

\COPY relatedproducts FROM 'SDC_CSVs/related.csv' WITH DELIMITER ',' CSV HEADER;

\COPY skus FROM 'SDC_CSVs/skus.csv' WITH DELIMITER ',' CSV HEADER;

-- INSERT INTO photos_dic (url, thumbnail_url) SELECT DISTINCT url, thumbnail_url FROM photos;

-- UPDATE photos SET photo_isolate = photos_dic.photo_isolate FROM photos_dic WHERE photos.url = photos_dic.url AND photos.thumbnail_url = photos_dic.thumbnail_url;

-- ALTER photos DROP (url, thumbnail_url);