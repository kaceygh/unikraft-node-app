const http = require('http');
const PORT = 8080;

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ status: 'ok', service: 'unikraft-node-app' }));
    return;
  }
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.write('Hello, World!\n');
  res.end();
});

server.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
