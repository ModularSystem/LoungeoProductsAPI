const { Pool } = require('pg');

const credentials = {
  user: 'postgres',
  host: 'localhost',
  database: 'overview',
  password: '',
  port: 5432,
};

const pool = new Pool(credentials);
// async function query() {
//   const pool = new Pool(credentials);
//   await pool.query('');
//   await pool.end();
// }

module.exports = pool;
