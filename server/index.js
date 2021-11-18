const express = require('express');
const { getItems, getItem, getStyles, getRelated } = require('./models.js');

const app = express();
const PORT = 8080 || process.env.PORT;

app.use(express.static('client/dist'));

app.use(express.json());

app.get('/products', getItems);
app.get('/products/:id', getItem);
app.get('/products/:id/styles', getStyles);
app.get('/products/:id/related', getRelated);

// app.post()

app.listen(PORT, () => {
  console.log(`Server listening on port: ${PORT}`);
});
