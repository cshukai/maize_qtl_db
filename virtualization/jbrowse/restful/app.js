const express = require('express');

// Creates an Express application using the top-level function
const app = express();
const port = 5001;

app.get('/distribution', function(request, response) {
        response.sendFile('/root/docker-jbrowse/restful/output.html');
});

// Make the app listen on port 3000
app.listen(port, function() {
  console.log('Server listening on http://localhost:' + port);
});