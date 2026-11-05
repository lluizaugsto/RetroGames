import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:5257/api',
});

export default api;