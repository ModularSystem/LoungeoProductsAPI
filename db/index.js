const { Pool } = require('pg');

const credentials = {
  user: 'postgres',
  host: '3.142.68.150',
  database: 'overview',
  password: '1234',
  port: 5432,
};

const pool = new Pool(credentials);
// async function query() {
//   const pool = new Pool(credentials);
//   await pool.query('');
//   await pool.end();
// }

module.exports = pool;
