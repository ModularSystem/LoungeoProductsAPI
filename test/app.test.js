const { expect } = require('chai');
// const request = require('request')
const request = require('supertest');
const app = require('../server/app.js');

describe('testing tests', () => {
  it('should recognize mocha methods', () => {
    expect(1).to.equal(1);
    expect(1).to.not.equal(2);
  });
});

describe('testing server', () => {
  it('should get a response from server', () => request(app).get('/')
    .expect(200)
    .then((res) => {
      expect(res.statusCode).to.equal(200);
    }));
});
