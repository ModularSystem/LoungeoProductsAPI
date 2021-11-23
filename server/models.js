const pool = require('../db');

const getItems = (req, res) => {
  const count = Number(req.query.count) || 5;
  const page = Number(req.query.page - 1) * count || 0;
  pool.query(`SELECT * FROM products LIMIT ${count} OFFSET ${page}`, (error, results) => {
    if (error) {
      res.status(404).send(error);
    }
    res.status(200).send(results.rows);
  });
};

const getItem = (req, res) => {
  const id = Number(req.params.id);
  pool.query(`
  SELECT *, (
    SELECT json_agg(x) FROM (
      SELECT feature, value FROM features WHERE id = ${id}
      ) x
    ) features FROM products WHERE id = ${id}
    `, (error, results) => {
    if (error) {
      console.log(error);
      res.status(404).send(error);
    } else {
      console.log(results);
      res.status(200).send(results.rows[0]);
    }
  });
};

const getStyles = (req, res) => {
  const id = Number(req.params.id);
  pool.query(`
  SELECT style_id, style_name AS name, original_price, sale_price, default_style, (
    SELECT json_agg(x) FROM (
      SELECT url, thumbnail_url FROM photos WHERE styles.style_id = photos.style_id
    ) x
  ) photos, (
    SELECT json_agg(y) FROM (
      SELECT quantity, size FROM skus WHERE styles.style_id = skus.style_id
    ) y
  ) skus
  FROM styles WHERE id = 1`, (error, results) => {
    if (error) {
      res.status(404).send(error);
    }
    const resObj = {
      product_id: id,
      results: results.rows,
    };
    res.status(200).send(resObj);
  });
};

const getRelated = (req, res) => {
  const id = Number(req.params.id);
  pool.query(`SELECT array_agg(related_id) FROM relatedproducts WHERE id = ${id}`, (error, results) => {
    if (error) {
      res.status(404).send(error);
    }
    res.status(200).send(results.rows[0].array_agg);
  });
};

const getCart = (req, res) => {
  pool.query('SELECT * FROM cart', (error, results) => {
    if (error) {
      res.status(404).send(error);
    }
    res.status(200).send(results.rows);
  });
};

const postCart = (req, res) => {
  console.log(req.body);
  const skuId = req.body.sku_id;
  const { count } = req.body;
  pool.query(`INSERT INTO cart(sku_id, count) VALUES(${skuId}, ${count})`, (error) => {
    if (error) {
      res.status(404).send(error);
    }
    res.status(201).send('Cart updated successfully.');
  });
};

module.exports = {
  getItems,
  getItem,
  getStyles,
  getRelated,
  getCart,
  postCart,
};
