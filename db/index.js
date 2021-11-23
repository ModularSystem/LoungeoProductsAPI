const { Pool } = require('pg');

const credentials = {
  user: 'noahlehman',
  host: '3.142.68.150',
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
