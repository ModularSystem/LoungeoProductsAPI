/* eslint-disable arrow-parens */
import http from 'k6/http';
import { sleep, check } from 'k6';

const url = 'http://localhost:8080';

export const options = {
  vus: 10,
  duration: '30s',
  out: 'csv=product_api_k6_results.csv',
  thresholds: {
    'http_req_duration{type:getItems}': ['p(95)<500'],
    'http_req_duration{type:getItem}': ['p(95)<500'],
    'http_req_duration{type:getStyles}': ['p(95)<500'],
    'http_req_duration{type:getRelated}': ['p(95)<500'],
  },
};

export default function () {
  const id = Math.round(Math.random() * 1000011);

  const getItems = http.get(`${url}/products`, { tags: { type: 'getItems' } });
  check(getItems, { 'status was 200': r => r.status = 200 });
  sleep(1);

  const getItem = http.get(`${url}/products/${id}`, { tags: { type: 'getItem' } });
  check(getItem, { 'status was 200': r => r.status = 200 });
  sleep(1);

  const getStyles = http.get(`${url}/products/${id}/styles`, { tags: { type: 'getStyles' } });
  check(getStyles, { 'status was 200': r => r.status = 200 });
  sleep(1);

  const getRelated = http.get(`${url}/products/${id}/related`, { tags: { type: 'getRelated' } });
  check(getRelated, { 'status was 200': r => r.status = 200 });
  sleep(1);
}
