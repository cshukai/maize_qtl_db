const express = require('express');

// Creates an Express application using the top-level function
const app = express();
const port = 5000;

app.get('/distribution', function(request, response) {
  response.send('Hello, World!');
});