const app = require('./app');

const port = 8080;
const postgresConfig = require('./db/postgresConfig');

if (require.main === module) {
  app.listen(port, () => {
    console.log(`Questions and Answers API running on ${port}`);
  });
}
postgresConfig();