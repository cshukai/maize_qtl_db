const express = require('express');

// Creates an Express application using the top-level function
const app = express();
const port = 5000;



app.get('/stats/global', function(request, response) {
  response.send('Hello, World!');
});

// Make the app listen on port 3000
app.listen(port, function() {
  console.log('Server listening on http://localhost:' + port);
});