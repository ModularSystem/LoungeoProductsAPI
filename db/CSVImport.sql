\c overview;

\COPY products FROM 'SDC_CSVs/product.csv' WITH DELIMITER ',' CSV HEADER;

\COPY styles FROM 'SDC_CSVs/styles.csv' WITH DELIMITER ',' CSV HEADER;

\COPY features FROM 'SDC_CSVs/features.csv' WITH DELIMITER ',' CSV HEADER;

\COPY photos FROM 'SDC_CSVs/photos.csv' WITH DELIMITER ',' CSV HEADER;

\COPY relatedproducts FROM 'SDC_CSVs/related.csv' WITH DELIMITER ',' CSV HEADER;

\COPY skus FROM 'SDC_CSVs/skus.csv' WITH DELIMITER ',' CSV HEADER;