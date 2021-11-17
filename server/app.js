const express = require('express');
const { addQuestion } = require('./models/overview');

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Get');
});

app.post('/', (req, res) => {
  console.log(req.body);
  res.send('Post');
});

app.post('/questions', (req, res) => {
  addQuestion();
});

module.exports = app;
