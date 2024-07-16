const express = require('express');
const app = express();
const port = 5000;

app.use(express.static('build/web')); // Replace 'build/web' with your web content directory

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});